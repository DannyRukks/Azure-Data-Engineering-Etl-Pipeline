CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Determination1@';

-- Give synapse blob data contributor role assignment over the container

-- Create the Credential
CREATE DATABASE SCOPED CREDENTIAL SalesCredential
WITH IDENTITY = 'Managed Identity';

-- Create the data sources
CREATE EXTERNAL DATA SOURCE SalesDataSources
WITH (
    LOCATION = 'abfss://rawsales@esepracticestorage.dfs.core.windows.net',
    CREDENTIAL = SalesCredential
);

-- Create view for date table
CREATE VIEW dbo.vw_Calendar 
AS
SELECT *
FROM 
OPENROWSET(
    BULK 'Gold/Calendar.delta/',
    FORMAT = 'DELTA',
    DATA_SOURCE = 'SalesDataSources'
) AS [Calendar];
GO
DROP view vw_Territories;

-- Create view for Customers table
CREATE VIEW vw_Customers AS
SELECT *
FROM OPENROWSET(
    BULK 'Gold/Customers.delta/',
    FORMAT = 'DELTA',
    DATA_SOURCE = 'SalesDataSources'
) AS Customers;
GO

-- Create view for product categories table
CREATE VIEW vw_Product_Categories AS
SELECT *
FROM OPENROWSET(
    BULK 'Gold/Product_Categories.delta/',
    FORMAT = 'DELTA',
    DATA_SOURCE = 'SalesDataSources'
) AS Product_Categories;
GO

-- Create view for product sub categories table
CREATE VIEW vw_Product_Subcategories AS
SELECT *
FROM OPENROWSET(
    BULK 'Gold/Product_Subcategories.delta/',
    FORMAT = 'DELTA',
    DATA_SOURCE = 'SalesDataSources'
) AS Product_Subcategories;
GO

-- Create view for products table
CREATE VIEW vw_Products AS
SELECT *
FROM OPENROWSET(
    BULK 'Gold/Products.delta/',
    FORMAT = 'DELTA',
    DATA_SOURCE = 'SalesDataSources'
) AS Products;
GO

-- Create view for Returns table
CREATE VIEW vw_Returns AS
SELECT *
FROM OPENROWSET(
    BULK 'Gold/Returns.delta/',
    FORMAT = 'DELTA',
    DATA_SOURCE = 'SalesDataSources'
) AS Returns;
GO

-- Create view for Sales table
CREATE VIEW vw_Sales AS
SELECT *
FROM OPENROWSET(
    BULK 'Gold/Sales.delta/',
    FORMAT = 'DELTA',
    DATA_SOURCE = 'SalesDataSources'
) AS Sales;
GO

-- Create view for territories table
CREATE VIEW vw_Territories AS
SELECT *
FROM OPENROWSET(
    BULK 'Gold/Territories.delta/',
    FORMAT = 'DELTA',
    DATA_SOURCE = 'SalesDataSources'
) AS Territories;



