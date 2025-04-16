-- Desde BeginningInventory
INSERT INTO silver.Inventory (
    InventoryID, Store, Brand, Description, Size,
    onHand, Price, InventoryDate, InventoryType, SystemSource
)
SELECT 
    InventoryId,
    Store,
    Brand,
    Description,
    Size,
    onHand,
    Price,
    CAST(starDate AS DATE),
    'Inicio',
    'bronze.BeginningInventory'
FROM bronze.BeginningInventory;

-- Desde EndingInventory
INSERT INTO silver.Inventory (
    InventoryID, Store, Brand, Description, Size,
    onHand, Price, InventoryDate, InventoryType, SystemSource
)
SELECT 
    InventoryId,
    Store,
    Brand,
    Description,
    Size,
    onHand,
    Price,
    CAST(endDate AS DATE),
    'Fin',
    'bronze.EndingInventory'
FROM bronze.EndingInventory;

-- Asignar rown = 1 para el inventario más reciente por InventoryID
-- ALTER table silver.inventory add rown int
WITH numerados AS (
    SELECT *,
        ROW_NUMBER() OVER (
            PARTITION BY InventoryID 
            ORDER BY InventoryDate DESC
        ) AS fila
    FROM silver.Inventory
)
UPDATE s
SET rown = n.fila
FROM silver.Inventory s
JOIN numerados n
  ON s.InventoryID = n.InventoryID
 AND s.InventoryDate = n.InventoryDate
 AND s.Store = n.Store
 AND s.Price = n.Price;

 