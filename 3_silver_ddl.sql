CREATE TABLE silver.purchaseprices (
    Brand           INT,
    Description     NVARCHAR(200),
    Price           FLOAT,
    Size            NVARCHAR(50),
    Volume          NVARCHAR(50),
    Classification  INT,
    PurchasePrice   FLOAT,
    VendorNum       INT,, ya 
    VendorName      NVARCHAR(200)
);
select * from silver.purchaseprices

drop table if exists silver.sales
CREATE TABLE silver.sales (
    InventoryId     NVARCHAR(100),
    Store           INT,
    Brand           INT,
    Description     NVARCHAR(200),
    Size            nvarchar(100),              -- Convertido a número para análisis
    Volume          nvarchar(100),              -- Limpio de varchar a INT
    SalesQuantity   INT,
    SalesDollars    FLOAT,
    SalesPrice      FLOAT,
    SalesDate       DATE,             -- tipo fecha
    Classification  INT,
    ExciseTax       FLOAT,
    VendorNo        INT,
    VendorName      NVARCHAR(200)
);

CREATE TABLE silver.purchases (
    InventoryId     NVARCHAR(100),
    Store           INT,
    Brand           INT,
    Description     NVARCHAR(200),
    Size            NVARCHAR(50),
    PurchaseQuantity INT,
    PurchasePrice   FLOAT,
    Dollars         FLOAT,
    PurchaseDate    DATE,
    VendorNo        INT,
    VendorName      NVARCHAR(200)
);

DROP TABLE IF EXISTS silver.Inventory;
GO

CREATE TABLE silver.Inventory (
    InventoryID     NVARCHAR(100),
    Store           INT,
    Brand           INT,
    Description     NVARCHAR(200),
    Size            NVARCHAR(50),
    onHand          INT,
    Price           DECIMAL(10,2),
    InventoryDate   DATE,
    InventoryType   VARCHAR(20),
	Rown			int,
    SystemSource    VARCHAR(50)
);


CREATE TABLE silver.invoicepurchases (
    VendorNumber   INT,
    VendorName     NVARCHAR(200),
    InvoiceDate    DATE,
    PONumber       INT,
    PODate         DATE,
    PayDate        DATE,
    Quantity       INT,
    Dollars        FLOAT,
    Freight        FLOAT,
    Approval       NVARCHAR(100)
);
