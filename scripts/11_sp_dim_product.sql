/******************************************************************/
-- Se utiliza un merge en esta dimensión para controlar la unicidad de registros en esta dimensión
-- Criterio 1: el campo identificador: inventoryid
-- Criterio 2: Si se encuentra una versión más reciente del producto en el siguiente inventariio, se actualizan los datos brand, description, sice, etc.
-- De lo contrario se inserta un nuevo producto
/******************************************************************/
MERGE gold.Dim_Product AS t
USING (
    SELECT *
    FROM silver.Inventory
    WHERE rown = 1
) AS s
ON LTRIM(RTRIM(t.InventoryID)) = LTRIM(RTRIM(s.InventoryID))

WHEN MATCHED AND s.InventoryDate > ISNULL(t.ModifiedDate, '1900-01-01') THEN
    UPDATE SET 
        t.Brand = s.Brand,
        t.Description = s.Description,
        t.Size = s.Size,
        t.ModifiedDate = s.InventoryDate,
        t.SystemSource = s.SystemSource

WHEN NOT MATCHED THEN 
    INSERT (InventoryID, Brand, Description, Size, CreateDate, ModifiedDate, SystemSource)
    VALUES (
        s.InventoryID,
        s.Brand,
        s.Description,
        s.Size,
        s.InventoryDate,
        s.InventoryDate,
        s.SystemSource
    );

