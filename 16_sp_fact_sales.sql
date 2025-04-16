/*************************************************/
-- Se encuentra que no todos los productos vendidos se encuentran en el inventario por lo que se utiliza un left, para no perder registros de ventas
-- Finding out not all of the items on fact_sales, are registered on inventory, so this is appropiate to use "left join" in order not to lose information
--
--
/*************************************************/

INSERT INTO gold.Fact_Sales (
    InventoryID, Brand, Description, Size,
    StoreIDW, DateIDW, Quantity, SalesPrice, SalesDollars,
    SystemSource
)
SELECT 
	s.InventoryId,
    pr.Brand,
    pr.Description,
    pr.Size,
    ds.StoreIDW,
    dd.Fecha,
    s.SalesQuantity,
    s.SalesPrice,
    s.SalesDollars,
    'silver.sales'
	-- select count(0)  -- 12 542 363
FROM silver.sales s
inner JOIN gold.Dim_Product pr  
  ON s.InventoryId = pr.InventoryId 
 -- AND s.Brand = pr.Brand  AND s.Description = pr.Description   AND s.Size = pr.Size
LEFT JOIN gold.Dim_Vendor dv  
  ON s.VendorNo = dv.VendorNumber AND dv.active = 1
JOIN gold.Dim_Store ds
  ON s.Store = ds.Store
JOIN gold.Dim_Date dd
  ON CAST(s.SalesDate AS DATE) = dd.FechaCompleta
  

