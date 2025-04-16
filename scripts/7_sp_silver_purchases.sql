truncate table silver.purchases
INSERT INTO silver.purchases (
    InventoryId,
    Store,
    Brand,
    Description,
    Size,
    VendorNumber,
    VendorName,
    PONumber,
    PODate,
    ReceivingDate,
    InvoiceDate,
    PayDate,
    PurchasePrice,
    Quantity,
    Dollars,
    Classification
)
SELECT
    InventoryId,
    Store,
    Brand,
    Description,
    Size,
    VendorNumber,
    VendorName,
    PONumber,
    PODate,
    ReceivingDate,
    InvoiceDate,
    PayDate,
    PurchasePrice,
    Quantity,
    Dollars,
    Classification
FROM bronze.PurchasesFinal;



