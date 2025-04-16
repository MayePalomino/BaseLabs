-- asignar idw
select top 10* from silver.sales
select top 10* from gold.dim_product
-- inventoryid, brand, descriptio, size, volumen

-- inventoryid 
-- creando llave de warehouse, pero por lo evaluado en timeline, no es viable implementar esta característica en esta version, se trabajaría con los ids existentes

update silver.sales
set productidw = p.productidw
from silver.sales s 
inner join gold.dim_product p on trim(s.InventoryId) = trim(p.InventoryId) and s.brand = p.brand and trim(s.description) = trim(p.description)
