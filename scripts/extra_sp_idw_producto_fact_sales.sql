-- update from join, en caso empezar a utilizar ProductIDW

update gold.Fact_Sales set ProductIDW = p.ProductIDW
from gold.fact_sales s -- 12 825 363
inner join gold.dim_product p  -- 12 427 306
	on s.inventoryid = p.inventoryid and s.brand=p.brand and s.description = p.description 
	and s.size = p.size