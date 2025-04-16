-- Crear tabla Dim_Date
drop table if exists gold.dim_date
CREATE TABLE gold.Dim_Date (
    Fecha      INT PRIMARY KEY,    -- YYYYMMDD
    FechaCompleta   DATE,
    Anio            INT,
    Mes             INT,
    NombreMes       NVARCHAR(20),
    Trimestre       INT
);


WITH SecuenciaFechas AS (
    SELECT CAST('2010-01-01' AS DATE) AS Fecha
    UNION ALL
    SELECT DATEADD(DAY, 1, Fecha)
    FROM SecuenciaFechas
    WHERE Fecha < '2025-12-31'
)
INSERT INTO gold.Dim_Date (
    Fecha, FechaCompleta, Anio, Mes, NombreMes, Trimestre,
    SystemSource, CreateDate, ModifiedDate, UserSource
)
SELECT
    CAST(CONVERT(VARCHAR(8), Fecha, 112) AS INT),
    Fecha,
    YEAR(Fecha),
    MONTH(Fecha),
    DATENAME(MONTH, Fecha),
    DATEPART(QUARTER, Fecha),
    'calendar_generator' AS SystemSource,
    GETDATE() AS CreateDate,
    NULL AS ModifiedDate,
    SYSTEM_USER AS UserSource
FROM SecuenciaFechas
OPTION (MAXRECURSION 0);



