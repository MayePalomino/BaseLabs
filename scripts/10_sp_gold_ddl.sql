
-- Dimensión Fecha
drop table if exists gold.dim_date
CREATE TABLE gold.Dim_Date (
    Fecha      INT PRIMARY KEY,    -- YYYYMMDD
    FechaCompleta   DATE,
    Anio            INT,
    Mes             INT,
    NombreMes       NVARCHAR(20),
    Trimestre       INT
);
-- Dimensión Producto
DROP TABLE IF EXISTS gold.Dim_Product;
GO

CREATE TABLE gold.Dim_Product (
    InventoryID     NVARCHAR(100) PRIMARY KEY,
    Brand           INT,
    Description     NVARCHAR(200),
    Size            NVARCHAR(50),

    -- Campos de control
    SystemSource    VARCHAR(50),
    CreateDate      DATETIME DEFAULT GETDATE(),
    ModifiedDate    DATETIME,
    ModifiedBy      VARCHAR(100)
);



-- Dimensión Vendor
DROP TABLE IF EXISTS gold.Dim_Vendor;
CREATE TABLE gold.Dim_Vendor (
    VendorIDW       INT IDENTITY(1,1) PRIMARY KEY,
    VendorNumber    INT,
    VendorName      NVARCHAR(200),
    SystemSource    NVARCHAR(100),
    CreateDate      DATETIME DEFAULT GETDATE(),
    ModifiedDate    DATETIME NULL,
    UserSource      NVARCHAR(100)
);


-- Dimensión Store
DROP TABLE IF EXISTS gold.Dim_Store;
CREATE TABLE gold.Dim_Store (
    StoreIDW        INT IDENTITY(1,1) PRIMARY KEY,
    Store           INT,
    SystemSource    NVARCHAR(100),
    CreateDate      DATETIME DEFAULT GETDATE(),
    ModifiedDate    DATETIME NULL,
    UserSource      NVARCHAR(100)
);


-- Hechos de Compras

DROP TABLE IF EXISTS gold.Fact_Purchases;
GO

CREATE TABLE gold.Fact_Purchases (
    PurchaseIDW     INT IDENTITY(1,1) PRIMARY KEY,
    InventoryID     NVARCHAR(100),
    Brand           INT,
    Description     NVARCHAR(200),
    Size            NVARCHAR(50),
    StoreIDW        INT,
    DateIDW         INT,
    Quantity        INT,
    PurchasePrice   DECIMAL(10,2),
    TotalCost       DECIMAL(12,2),

    -- Campos de control
    SystemSource    VARCHAR(50),
    CreateDate      DATETIME DEFAULT GETDATE(),
    ModifiedDate    DATETIME,
    ModifiedBy      VARCHAR(100)
);

DROP TABLE IF EXISTS gold.Fact_Sales;
GO


-- Hechos de Ventas


CREATE TABLE gold.Fact_Sales (
    SalesIDW        INT IDENTITY(1,1) PRIMARY KEY,
    InventoryID     NVARCHAR(100),
    Brand           INT,
    Description     NVARCHAR(200),
    Size            NVARCHAR(50),
	ProductIDW		INT,
    StoreIDW        INT,
    DateIDW         INT,
    Quantity        INT,
    SalesPrice      DECIMAL(10,2),
    SalesDollars    DECIMAL(12,2),

    -- Campos de control
    SystemSource    VARCHAR(50),
    CreateDate      DATETIME DEFAULT GETDATE(),
    ModifiedDate    DATETIME,
    ModifiedBy      VARCHAR(100)
);

select top 10* from gold.Fact_Sales