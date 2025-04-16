select * from INFORMATION_SCHEMA.TABLES

select top 10 * from bronze.invoicepurchases
select top 10 * from bronze.purchaseprices
select top 10 * from bronze.purchasesfinal
select top 10 * from bronze.sales
select top 10 * from bronze.beginninginventory
select top 10 * from bronze.endinginventory

-- ************************************************************
-- cleaning sales
-- ************************************************************
UPDATE [bronze].Sales
SET size = REPLACE(size, '"', '')
WHERE size LIKE '%"%'  

UPDATE [bronze].Sales
SET SalesDate = REPLACE(SalesDate, '"', '')
WHERE SalesDate LIKE '%"%'  


UPDATE [bronze].Sales
SET VendorName = REPLACE(VendorName, '"', '')
WHERE VendorName LIKE '%"%' 



-- ************************************************************
-- cleaning begininginventory
-- ************************************************************
UPDATE [bronze].BeginningInventory
SET InventoryId = REPLACE(InventoryId, '"', '')
WHERE InventoryId LIKE '%"%'  

UPDATE [bronze].BeginningInventory
SET City = REPLACE(City, '"', '')
WHERE City LIKE '%"%'  

UPDATE [bronze].BeginningInventory
SET Description = REPLACE(Description, '"', '')
WHERE Description LIKE '%"%'  

UPDATE [bronze].BeginningInventory
SET Size = REPLACE(Size, '"', '')
WHERE Size LIKE '%"%'  

-- ************************************************************
-- cleaning endinventory
-- ************************************************************
UPDATE [bronze].EndingInventory
SET InventoryId = REPLACE(InventoryId, '"', '')
WHERE InventoryId LIKE '%"%'  

UPDATE [bronze].EndingInventory
SET City = REPLACE(City, '"', '')
WHERE City LIKE '%"%'  

UPDATE [bronze].EndingInventory
SET Description = REPLACE(Description, '"', '')
WHERE Description LIKE '%"%'  

UPDATE [bronze].EndingInventory
SET Size = REPLACE(Size, '"', '')
WHERE Size LIKE '%"%'  


-- ************************************************************
-- cleaning purchasesprices
-- ************************************************************
UPDATE [bronze].PurchasePrices
SET Description = REPLACE(Description, '"', '')
WHERE Description LIKE '%"%'  


UPDATE [bronze].PurchasePrices
SET size = REPLACE(size, '"', '')
WHERE size LIKE '%"%'  

UPDATE [bronze].PurchasePrices
SET Volume = REPLACE(Volume, '"', '')
WHERE Volume LIKE '%"%' 