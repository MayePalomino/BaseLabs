
truncate table silver.purchasaeprices
INSERT INTO silver.purchaseprices (
    Brand,
    Description,
    Price,
    Size,
    Volume,
    Classification,
    PurchasePrice,
    VendorNum,
    VendorName
)
SELECT
    Brand,
    Description,
    Price,
    Size,
    Volume,
    Classification,
    PurchasePrice,
    VendorNum,
    VendorName
FROM bronze.PurchasePrices;
