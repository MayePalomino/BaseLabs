SELECT 'Dim_Product' AS Tabla, COUNT(*) AS Registros FROM gold.Dim_Product
UNION ALL
SELECT 'Dim_Vendor', COUNT(*) FROM gold.Dim_Vendor
UNION ALL
SELECT 'Dim_Store', COUNT(*) FROM gold.Dim_Store
UNION ALL
SELECT 'Dim_Date', COUNT(*) FROM gold.Dim_Date
UNION ALL
SELECT 'Fact_Sales', COUNT(*) FROM gold.Fact_Sales
UNION ALL
SELECT 'Fact_Purchases', COUNT(*) FROM gold.Fact_Purchases;


-- Productos no encontrados en inventario
select distinct s.inventoryid sales_id, p.inventoryid prodid
from silver.sales s
left join gold.dim_product p on s.inventoryid = p.inventoryid
where p.inventoryid is null
order by s.inventoryid



SELECT * FROM silver.sales S
WHERE NOT EXISTS (
    SELECT 1 FROM gold.Dim_Product DP
    WHERE S.Brand = DP.Brand AND S.Description = DP.Description AND S.Size = DP.Size
);

-- Fechas no encontradas
SELECT DISTINCT CAST(SalesDate AS DATE) AS FechaFaltante
FROM silver.sales
WHERE CAST(SalesDate AS DATE) NOT IN (SELECT FechaCompleta FROM gold.Dim_Date);


-- 

-- Total de ventas por año  -- 2016	453625648.579999
SELECT D.Anio, SUM(F.SalesDollars) AS TotalVentas
FROM gold.Fact_Sales F
JOIN gold.Dim_Date D ON F.dateidw = D.fecha
GROUP BY D.Anio
ORDER BY D.Anio;

-- Total de compras por año
SELECT D.Anio, SUM(F.TotalDollars) AS TotalCompras
FROM gold.Fact_Purchases F
JOIN gold.Dim_Date D ON F.DateIDW = D.fecha
GROUP BY D.Anio
ORDER BY D.Anio;

select 6911094.89133388+315715088.83

select count(0) from silver.sales
select count(0) from gold.fact_sales

select distinct InventoryId
-- from bronze.BeginningInventory
from bronze.sales
where InventoryId like '%1_HARDERSFIELD_1068%'


select top 10* from silver.sales

select top 10* from gold.fact_sales
