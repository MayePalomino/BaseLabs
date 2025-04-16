INSERT INTO gold.Dim_Store (
    Store,
    SystemSource, CreateDate, ModifiedDate, UserSource
)
SELECT DISTINCT
    Store,
    'silver.sales' AS SystemSource,
    GETDATE() AS CreateDate,
    NULL AS ModifiedDate,
    SYSTEM_USER AS UserSource
FROM silver.sales;

select top 10* from gold.fact_sales