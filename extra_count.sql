-- beginninginventory 
select count(0) from bronze.BeginningInventory -- 206529
--endinventory
select count(0) from bronze.EndingInventory -- 2224489
-- sales
select count(0) from bronze.Sales -- 12 825 363
-- purchasesprices
select count(0) from bronze.PurchasePrices -- 12 261 --ok
-- purchasesfinal
select count(0) from bronze.PurchasesFinal -- 2372474
-- invoicepurchases
select count(0) from bronze.invoicePurchases-- 5543 -- ok



select count(0) from silver.Inventory  -- 431018
select count(0) from silver.purchaseprices -- 12261
select count(0) from silver.invoicepurchases
select count(0) from silver.sales
select count(0) from silver.purchases

select count(0) from gold.Dim_Product -- 256042
select count(0) from gold.Fact_Purchases -- 2372474
select count(0) from gold.Fact_Sales  -- 12825363
