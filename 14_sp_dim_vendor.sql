INSERT INTO gold.Dim_Vendor (
    VendorNumber, VendorName,
    SystemSource, CreateDate, ModifiedDate, UserSource
)
SELECT DISTINCT
    VendorNum,
    VendorName,
    'silver.purchaseprices' AS SystemSource,
    GETDATE() AS CreateDate,
    NULL AS ModifiedDate,
    SYSTEM_USER AS UserSource
FROM silver.purchaseprices;
