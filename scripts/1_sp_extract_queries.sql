
-- ****************** 1. begininginventory ***************************
create schema bronze
drop table if exists bronze.beginninginventory

CREATE TABLE bronze.BeginningInventory (
    InventoryId nvarchar(50) not  null
	, Store int null
	, City nvarchar(50)null
	, Brand int null
	, Description nvarchar(200) null
	, Size nvarchar(50) null
	, onHand int null
	, Price float null
	, starDate date	 null
);
go

BULK INSERT bronze.BeginningInventory
FROM 'C:\Users\mariela\2025\baselabs\BegInvFINAL12312016.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
    -- CODEPAGE = 'ACP'
);
go



-- ****************** 2. endinvfinal ***************************
drop table  if exists bronze.endingInventory
CREATE TABLE bronze.EndingInventory (
    InventoryId nvarchar(50) null
	, Store int null
	, City nvarchar(100)   null
	, Brand int null
	, Description nvarchar(200) null
	, Size nvarchar(50) null
	, onHand int null
	, Price float null
	, endDate varchar(20) null
);
go

BULK INSERT bronze.EndingInventory
FROM 'C:\Users\mariela\2025\baselabs\EndInvFINAL12312016.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
    -- TABLOCK
    -- CODEPAGE = 'ACP'
);
go
select * from bronze.endinginventory


-- ****************** 3. PurchasePrices ***************************
drop table if exists bronze.PurchasePrices;
CREATE TABLE bronze.PurchasePrices (
	brand int
	, Description nvarchar(200) null
	, Price float null
	, Size nvarchar(50) null
	, Volume nvarchar(20) null
	, Classification int null
	, PurchasePrice float null
	, VendorNum int null
	, VendorName nvarchar(200) null
)
go

BULK INSERT bronze.PurchasePrices
FROM 'C:\Users\mariela\2025\baselabs\2017PurchasePricesDec.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
go
select * from bronze.Purchaseprices

-- ****************** 4  Sales ***************************
drop table if exists bronze.sales;
CREATE TABLE bronze.Sales (
    InventoryId nvarchar(50)
	, Store int null
	, Brand int null
	, Description nvarchar(200) null
	, Size nvarchar(20) null
	, SalesQuantity int null
	, SalesDollars float null
	, SalesPrice float null
	, SalesDate varchar(max) null
	, Volume varchar(max) null
	, Classification int null
	, ExciseTax float null
	, VendorNo int null
	, VendorName nvarchar(200)
);

select * from bronze.sales
BULK INSERT bronze.Sales
FROM 'C:\Users\mariela\2025\baselabs\SalesFINAL12312016.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
--    CODEPAGE = '65001',  -- UTF-8
--    TABLOCK
);

go
select top 10* from bronze.sales

-- ****************** 5. InvoicePurchases12312016 *************************** se cargo con wizard
drop table if exists bronze.invoicePurchases
CREATE TABLE bronze.invoicePurchases (
    VendorNum int NULL
    , VendorName NVARCHAR(200) NULL
    , InvoiceDate date NULL  
    , PONumber int null
	, PODate date null
	, PayDate date null
	, Quantity int null
	, Dollars float null
	, Freight float null
	, Approval nvarchar (100)
);
go

BULK INSERT bronze.invoicePurchases
FROM 'C:\Users\mariela\2025\baselabs\InvoicePurchases12312016.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
    -- CODEPAGE = 'ACP'
);
--select * into bronze.invoicePurchases from invoicePurchases12312016
select * from bronze.invoicePurchases
go

-- ****************** 6. Purchasesfinal ***************************
drop table if exists bronze.PurchasesFinal;
CREATE TABLE bronze.PurchasesFinal (
	InventoryId nvarchar(200) null
	, Store int null
	, Brand int null
	, Description nvarchar(200) null
	, Size nvarchar(20) null
	, VendorNum int null
	, VendorName nvarchar(max) null
	, PONumber int null
	, PODate date null
	, ReceivingDate date null
	, InvoiceDate date null
	, PayDate date null
	, PurchasePrice float null
	, Quantity int null
	, Dollars float null
	, Classification int null
)
go
BULK INSERT bronze.PurchasesFinal
FROM 'C:\Users\mariela\2025\baselabs\PurchasesFinal12312016.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
select * from bronze.PurchasesFinal -- 2 372 474

