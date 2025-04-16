truncate table silver.sales
INSERT INTO silver.sales (
    InventoryId,
    Store,
    Brand,
    Description,
    Size,
    SalesQuantity,
    SalesDollars,
    SalesPrice,
    SalesDate,
    Volume,
    Classification,
    ExciseTax,
    VendorNo,
    VendorName
)
SELECT
    InventoryId,
    Store,
    Brand,
    Description,
    Size,                            
    SalesQuantity,
    SalesDollars,
    SalesPrice,
    CAST(SalesDate AS DATE),         
    Volume,                          
    Classification,
    ExciseTax,
    VendorNo,
    VendorName
FROM bronze.sales;



