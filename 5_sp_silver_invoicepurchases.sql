truncate table silver.invoicepurchases
INSERT INTO silver.invoicepurchases (
    VendorNumber,
    VendorName,
    InvoiceDate,
    PONumber,
    PODate,
    PayDate,
    Quantity,
    Dollars,
    Freight,
    Approval
)
SELECT
    VendorNumber,
    VendorName,
    InvoiceDate,
    PONumber,
    PODate,
    PayDate,
    Quantity,
    Dollars,
    Freight,
    Approval
FROM bronze.InvoicePurchases;
