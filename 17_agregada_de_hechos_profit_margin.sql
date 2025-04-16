CREATE TABLE gold.agg_Inventory_Summary (
    InventoryID NVARCHAR(100),
    Brand INT,
    TotalSalesDollars FLOAT,
    TotalSalesQuantity INT,
    TotalPurchaseDollars FLOAT,
    TotalPurchaseQuantity INT,
    Profit FLOAT,
    MarginPercent FLOAT,
    SystemSource NVARCHAR(100),
    CreateDate DATETIME,
    ModifiedDate DATETIME,
    UserProcess NVARCHAR(100),
    PRIMARY KEY (InventoryID)
);



INSERT INTO gold.agg_Inventory_Summary
SELECT 
    p.InventoryID,
    p.Brand,
    SUM(ISNULL(s.SalesDollars, 0)) AS TotalSalesDollars,
    SUM(ISNULL(s.Quantity, 0)) AS TotalSalesQuantity,
    SUM(p.Dollars) AS TotalPurchaseDollars,
    SUM(p.Quantity) AS TotalPurchaseQuantity,
    SUM(ISNULL(s.SalesDollars, 0)) - SUM(p.Dollars) AS Profit,
    CASE 
        WHEN SUM(ISNULL(s.SalesDollars, 0)) = 0 THEN NULL
        ELSE ROUND(
            (SUM(ISNULL(s.SalesDollars, 0)) - SUM(p.Dollars)) 
            / SUM(ISNULL(s.SalesDollars, 0)), 4)
    END AS MarginPercent,
    'pwc_analytics' AS SystemSource,
    GETDATE() AS CreateDate,
    NULL AS ModifiedDate,
    SYSTEM_USER AS UserProcess
FROM gold.Fact_Purchases p
LEFT JOIN gold.Fact_Sales s 
    ON p.InventoryID = s.InventoryID AND p.Brand = s.Brand
GROUP BY p.InventoryID, p.Brand;
