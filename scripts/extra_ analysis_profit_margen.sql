

select max(salesdate), min(SalesDate) from silver.sales -- max 2016-01-01 -- min 2016-12-31
select max(PODate), min(PODate) from silver.purchases -- max 2015-12-20 -- min 2016-12-23
select month(salesdate), count(0) from silver.sales
group by month(SalesDate)
order by month(SalesDate)

;

select s.inventoryid, s.brand, s.description, s.size, s.salesprice, s.salesquantity, s.SalesDollars 
, s.SalesDate
from silver.sales s
where s.InventoryId like '%34_PITMERDEN_3857%' and brand =3857 and month(s.SalesDate) = 12 and DAY(s.SalesDate)>29

 select s.Description, avg(s.salesprice) price, sum(s.salesquantity) qty, sum(s.SalesDollars) sum_dollars
from silver.sales s
where s.InventoryId like '%34_PITMERDEN_3857%' and brand =3857 
group by s.Description

select p.Description,avg(p.PurchasePrice) price, sum(p.Quantity) qty, sum(Dollars) sum_dollars
from silver.purchases p
where p.InventoryId like '%34_PITMERDEN_3857%' and brand =3857 
group by p.Description

select InventoryId,Store,Description,Size, PONumber,PODate, PurchasePrice, Quantity, Dollars
from silver.purchases p
where p.InventoryId like '%34_PITMERDEN_3857%' and brand =3857 
order by PODate


