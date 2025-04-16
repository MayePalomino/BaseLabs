
INSERT INTO gold.Fact_Purchases (
    InventoryID, Brand, Description, Size,
    StoreIDW, DateIDW, Quantity, PurchasePrice, Dollars,
    SystemSource
)
SELECT 
    p.InventoryId,
    pr.Brand,
    pr.Description,
    pr.Size,
    st.StoreIDW,
    dt.Fecha,
    p.Quantity,
    p.PurchasePrice,
    p.Dollars,
    'silver.purchases'	
	-- select count(0)
FROM silver.purchases p
left JOIN gold.Dim_Product pr  -- 2372474
  ON p.InventoryId = pr.InventoryId 
JOIN gold.Dim_Store st
  ON p.Store = st.Store
JOIN gold.Dim_Date dt
  ON CAST(p.PODate AS DATE) = dt.FechaCompleta



