USE [CopyOfAdventureWorks2019]
GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[DatabaseLog]')) DROP Table [dbo].[DatabaseLog]
GO
CREATE TABLE [dbo].[DatabaseLog]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[DatabaseLog1]')) DROP Table [dbo].[DatabaseLog1]
GO
CREATE TABLE [dbo].[DatabaseLog1]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[ErrorLog]')) DROP Table [dbo].[ErrorLog]
GO
CREATE TABLE [dbo].[ErrorLog]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[kasjhfd]')) DROP Table [dbo].[kasjhfd]
GO
CREATE TABLE [dbo].[kasjhfd]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[Payroll]')) DROP Table [dbo].[Payroll]
GO
CREATE TABLE [dbo].[Payroll]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[Payroll2]')) DROP Table [dbo].[Payroll2]
GO
CREATE TABLE [dbo].[Payroll2]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[Department]')) DROP Table [HumanResources].[Department]
GO
CREATE TABLE [HumanResources].[Department]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[Employee]')) DROP Table [HumanResources].[Employee]
GO
CREATE TABLE [HumanResources].[Employee]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[EmployeeDepartmentHistory]')) DROP Table [HumanResources].[EmployeeDepartmentHistory]
GO
CREATE TABLE [HumanResources].[EmployeeDepartmentHistory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[EmployeePayHistory]')) DROP Table [HumanResources].[EmployeePayHistory]
GO
CREATE TABLE [HumanResources].[EmployeePayHistory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[JobCandidate]')) DROP Table [HumanResources].[JobCandidate]
GO
CREATE TABLE [HumanResources].[JobCandidate]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[Shift]')) DROP Table [HumanResources].[Shift]
GO
CREATE TABLE [HumanResources].[Shift]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[Address]')) DROP Table [Person].[Address]
GO
CREATE TABLE [Person].[Address]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[AddressType]')) DROP Table [Person].[AddressType]
GO
CREATE TABLE [Person].[AddressType]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[BusinessEntity]')) DROP Table [Person].[BusinessEntity]
GO
CREATE TABLE [Person].[BusinessEntity]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[BusinessEntityAddress]')) DROP Table [Person].[BusinessEntityAddress]
GO
CREATE TABLE [Person].[BusinessEntityAddress]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[BusinessEntityContact]')) DROP Table [Person].[BusinessEntityContact]
GO
CREATE TABLE [Person].[BusinessEntityContact]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[ContactType]')) DROP Table [Person].[ContactType]
GO
CREATE TABLE [Person].[ContactType]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[CountryRegion]')) DROP Table [Person].[CountryRegion]
GO
CREATE TABLE [Person].[CountryRegion]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[CountryRegion1]')) DROP Table [Person].[CountryRegion1]
GO
CREATE TABLE [Person].[CountryRegion1]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[EmailAddress]')) DROP Table [Person].[EmailAddress]
GO
CREATE TABLE [Person].[EmailAddress]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[Password]')) DROP Table [Person].[Password]
GO
CREATE TABLE [Person].[Password]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[Person]')) DROP Table [Person].[Person]
GO
CREATE TABLE [Person].[Person]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[PersonPhone]')) DROP Table [Person].[PersonPhone]
GO
CREATE TABLE [Person].[PersonPhone]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[PhoneNumberType]')) DROP Table [Person].[PhoneNumberType]
GO
CREATE TABLE [Person].[PhoneNumberType]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[StateProvince]')) DROP Table [Person].[StateProvince]
GO
CREATE TABLE [Person].[StateProvince]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[BillOfMaterials]')) DROP Table [Production].[BillOfMaterials]
GO
CREATE TABLE [Production].[BillOfMaterials]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Culture]')) DROP Table [Production].[Culture]
GO
CREATE TABLE [Production].[Culture]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Document]')) DROP Table [Production].[Document]
GO
CREATE TABLE [Production].[Document]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Illustration]')) DROP Table [Production].[Illustration]
GO
CREATE TABLE [Production].[Illustration]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Location]')) DROP Table [Production].[Location]
GO
CREATE TABLE [Production].[Location]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Product]')) DROP Table [Production].[Product]
GO
CREATE TABLE [Production].[Product]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductCategory]')) DROP Table [Production].[ProductCategory]
GO
CREATE TABLE [Production].[ProductCategory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductCostHistory]')) DROP Table [Production].[ProductCostHistory]
GO
CREATE TABLE [Production].[ProductCostHistory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductDescription]')) DROP Table [Production].[ProductDescription]
GO
CREATE TABLE [Production].[ProductDescription]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductDocument]')) DROP Table [Production].[ProductDocument]
GO
CREATE TABLE [Production].[ProductDocument]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductInventory]')) DROP Table [Production].[ProductInventory]
GO
CREATE TABLE [Production].[ProductInventory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductListPriceHistory]')) DROP Table [Production].[ProductListPriceHistory]
GO
CREATE TABLE [Production].[ProductListPriceHistory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductModel]')) DROP Table [Production].[ProductModel]
GO
CREATE TABLE [Production].[ProductModel]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductModelIllustration]')) DROP Table [Production].[ProductModelIllustration]
GO
CREATE TABLE [Production].[ProductModelIllustration]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductModelProductDescriptionCulture]')) DROP Table [Production].[ProductModelProductDescriptionCulture]
GO
CREATE TABLE [Production].[ProductModelProductDescriptionCulture]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductPhoto]')) DROP Table [Production].[ProductPhoto]
GO
CREATE TABLE [Production].[ProductPhoto]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductProductPhoto]')) DROP Table [Production].[ProductProductPhoto]
GO
CREATE TABLE [Production].[ProductProductPhoto]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductReview]')) DROP Table [Production].[ProductReview]
GO
CREATE TABLE [Production].[ProductReview]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductSubcategory]')) DROP Table [Production].[ProductSubcategory]
GO
CREATE TABLE [Production].[ProductSubcategory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ScrapReason]')) DROP Table [Production].[ScrapReason]
GO
CREATE TABLE [Production].[ScrapReason]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[TransactionHistory]')) DROP Table [Production].[TransactionHistory]
GO
CREATE TABLE [Production].[TransactionHistory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[TransactionHistoryArchive]')) DROP Table [Production].[TransactionHistoryArchive]
GO
CREATE TABLE [Production].[TransactionHistoryArchive]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[UnitMeasure]')) DROP Table [Production].[UnitMeasure]
GO
CREATE TABLE [Production].[UnitMeasure]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[WorkOrder]')) DROP Table [Production].[WorkOrder]
GO
CREATE TABLE [Production].[WorkOrder]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[WorkOrderRouting]')) DROP Table [Production].[WorkOrderRouting]
GO
CREATE TABLE [Production].[WorkOrderRouting]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[ProductVendor]')) DROP Table [Purchasing].[ProductVendor]
GO
CREATE TABLE [Purchasing].[ProductVendor]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[PurchaseOrderDetail]')) DROP Table [Purchasing].[PurchaseOrderDetail]
GO
CREATE TABLE [Purchasing].[PurchaseOrderDetail]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[PurchaseOrderHeader]')) DROP Table [Purchasing].[PurchaseOrderHeader]
GO
CREATE TABLE [Purchasing].[PurchaseOrderHeader]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[ShipMethod]')) DROP Table [Purchasing].[ShipMethod]
GO
CREATE TABLE [Purchasing].[ShipMethod]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[Vendor]')) DROP Table [Purchasing].[Vendor]
GO
CREATE TABLE [Purchasing].[Vendor]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[CountryRegionCurrency]')) DROP Table [Sales].[CountryRegionCurrency]
GO
CREATE TABLE [Sales].[CountryRegionCurrency]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[CreditCard]')) DROP Table [Sales].[CreditCard]
GO
CREATE TABLE [Sales].[CreditCard]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[Currency]')) DROP Table [Sales].[Currency]
GO
CREATE TABLE [Sales].[Currency]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[CurrencyRate]')) DROP Table [Sales].[CurrencyRate]
GO
CREATE TABLE [Sales].[CurrencyRate]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[Customer]')) DROP Table [Sales].[Customer]
GO
CREATE TABLE [Sales].[Customer]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[PersonCreditCard]')) DROP Table [Sales].[PersonCreditCard]
GO
CREATE TABLE [Sales].[PersonCreditCard]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesOrderDetail]')) DROP Table [Sales].[SalesOrderDetail]
GO
CREATE TABLE [Sales].[SalesOrderDetail]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesOrderHeader]')) DROP Table [Sales].[SalesOrderHeader]
GO
CREATE TABLE [Sales].[SalesOrderHeader]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesOrderHeaderSalesReason]')) DROP Table [Sales].[SalesOrderHeaderSalesReason]
GO
CREATE TABLE [Sales].[SalesOrderHeaderSalesReason]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesPerson]')) DROP Table [Sales].[SalesPerson]
GO
CREATE TABLE [Sales].[SalesPerson]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesPersonQuotaHistory]')) DROP Table [Sales].[SalesPersonQuotaHistory]
GO
CREATE TABLE [Sales].[SalesPersonQuotaHistory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesReason]')) DROP Table [Sales].[SalesReason]
GO
CREATE TABLE [Sales].[SalesReason]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesTaxRate]')) DROP Table [Sales].[SalesTaxRate]
GO
CREATE TABLE [Sales].[SalesTaxRate]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesTerritory]')) DROP Table [Sales].[SalesTerritory]
GO
CREATE TABLE [Sales].[SalesTerritory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesTerritoryHistory]')) DROP Table [Sales].[SalesTerritoryHistory]
GO
CREATE TABLE [Sales].[SalesTerritoryHistory]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[ShoppingCartItem]')) DROP Table [Sales].[ShoppingCartItem]
GO
CREATE TABLE [Sales].[ShoppingCartItem]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SpecialOffer]')) DROP Table [Sales].[SpecialOffer]
GO
CREATE TABLE [Sales].[SpecialOffer]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SpecialOfferProduct]')) DROP Table [Sales].[SpecialOfferProduct]
GO
CREATE TABLE [Sales].[SpecialOfferProduct]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[Store]')) DROP Table [Sales].[Store]
GO
CREATE TABLE [Sales].[Store]

GO