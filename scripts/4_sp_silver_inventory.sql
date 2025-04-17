-- Desde BeginningInventory
truncate table silver.inventory

MERGE silver.Inventory AS t
USING (
    SELECT *
    FROM (
        SELECT 
            InventoryId,
            Store,
            Brand,
            Description,
            Size,
            onHand,
            Price,
            CAST(starDate AS DATE) AS InventoryDate,
            'Inicio' AS InventoryType,
            'bronze.BeginningInventory' AS SystemSource,
            ROW_NUMBER() OVER (
                PARTITION BY InventoryId
                ORDER BY starDate DESC
            ) AS rn
        FROM bronze.BeginningInventory
    ) AS sub
    WHERE rn = 1
) AS s
ON UPPER(LTRIM(RTRIM(t.InventoryID))) = UPPER(LTRIM(RTRIM(s.InventoryID)))
   
WHEN MATCHED  AND s.InventoryDate > ISNULL(t.InventoryDate, '1900-01-01') then
    UPDATE SET 
        t.Store = s.Store,
        t.Brand = s.Brand,
        t.Description = s.Description,
        t.Size = s.Size,
        t.onHand = s.onHand,
        t.Price = s.Price,
        t.InventoryDate = s.InventoryDate,
        t.InventoryType = s.InventoryType,
        t.SystemSource = s.SystemSource
WHEN NOT MATCHED THEN
    INSERT (
        InventoryID, Store, Brand, Description, Size,
        onHand, Price, InventoryDate, InventoryType, SystemSource
    )
    VALUES (
        s.InventoryID, s.Store, s.Brand, s.Description, s.Size,
        s.onHand, s.Price, s.InventoryDate, s.InventoryType, s.SystemSource
    );

	MERGE silver.Inventory AS t
USING (
    SELECT *
    FROM (
        SELECT 
            InventoryId,
            Store,
            Brand,
            Description,
            Size,
            onHand,
            Price,
            CAST(endDate AS DATE) AS InventoryDate,
            'Fin' AS InventoryType,
            'bronze.EndingInventory' AS SystemSource,
            ROW_NUMBER() OVER (
                PARTITION BY InventoryId
                ORDER BY endDate DESC
            ) AS rn
        FROM bronze.EndingInventory
    ) AS sub
    WHERE rn = 1
) AS s
ON LTRIM(RTRIM(t.InventoryID)) = LTRIM(RTRIM(s.InventoryID))   
WHEN MATCHED   AND s.InventoryDate > ISNULL(t.InventoryDate, '1900-01-01') then
    UPDATE SET 
        t.Store = s.Store,
        t.Brand = s.Brand,
        t.Description = s.Description,
        t.Size = s.Size,
        t.onHand = s.onHand,
        t.Price = s.Price,
        t.InventoryDate = s.InventoryDate,
        t.InventoryType = s.InventoryType,
        t.SystemSource = s.SystemSource
WHEN NOT MATCHED THEN
    INSERT (
        InventoryID, Store, Brand, Description, Size,
        onHand, Price, InventoryDate, InventoryType, SystemSource
    )
    VALUES (
        s.InventoryID, s.Store, s.Brand, s.Description, s.Size,
        s.onHand, s.Price, s.InventoryDate, s.InventoryType, s.SystemSource
    );


MERGE silver.Inventory AS t
USING (
    SELECT *
    FROM (
        SELECT 
            InventoryId,
            Store,
            Brand,
            Description,
            Size,
            PurchasePrice AS Price,
            CAST(PODate AS DATE) AS InventoryDate,
            'Compra' AS InventoryType,
            'bronze.PurchasesFinal' AS SystemSource,
            ROW_NUMBER() OVER (
                PARTITION BY InventoryId
                ORDER BY PODate DESC
            ) AS rn
        FROM bronze.PurchasesFinal
    ) AS sub
    WHERE rn = 1 
) AS s
ON UPPER(LTRIM(RTRIM(t.InventoryID))) = UPPER(LTRIM(RTRIM(s.InventoryID)))      
WHEN MATCHED  AND s.InventoryDate > ISNULL(t.InventoryDate, '1900-01-01') THEN
    UPDATE SET 
        t.Store = s.Store,
        t.Brand = s.Brand,
        t.Description = s.Description,
        t.Size = s.Size,
        t.Price = s.Price,
        t.InventoryDate = s.InventoryDate,
        t.InventoryType = s.InventoryType,
        t.SystemSource = s.SystemSource
WHEN NOT MATCHED THEN
    INSERT (
        InventoryID, Store, Brand, Description, Size,
        Price, InventoryDate, InventoryType, SystemSource
    )
    VALUES (
        s.InventoryID, s.Store, s.Brand, s.Description, s.Size,
        s.Price, s.InventoryDate, s.InventoryType, s.SystemSource
    );

 
