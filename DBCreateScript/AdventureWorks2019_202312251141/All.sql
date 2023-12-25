USE [CopyOfAdventureWorks2019]
GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'HumanResources')
BEGIN
EXEC('CREATE SCHEMA  HumanResources')
END

GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'Person')
BEGIN
EXEC('CREATE SCHEMA  Person')
END

GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'Production')
BEGIN
EXEC('CREATE SCHEMA  Production')
END

GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'Purchasing')
BEGIN
EXEC('CREATE SCHEMA  Purchasing')
END

GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'Sales')
BEGIN
EXEC('CREATE SCHEMA  Sales')
END

GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'Person1')
BEGIN
EXEC('CREATE SCHEMA  Person1')
END

GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'Person2')
BEGIN
EXEC('CREATE SCHEMA  Person2')
END

GO
IF NOT EXISTS(SELECT * FROM sys.schemas WHERE name = 'Person3')
BEGIN
EXEC('CREATE SCHEMA  Person3')
END

GO

USE [CopyOfAdventureWorks2019]
GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[AWBuildVersion]')) DROP Table [dbo].[AWBuildVersion]
GO
CREATE TABLE [dbo].[AWBuildVersion](	  [SystemInformationID] TINYINT NOT NULL IDENTITY(1,1)	, [Database Version] NVARCHAR(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [VersionDate] DATETIME NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_AWBuildVersion_SystemInformationID] PRIMARY KEY ([SystemInformationID] ASC))

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[DatabaseLog]')) DROP Table [dbo].[DatabaseLog]
GO
CREATE TABLE [dbo].[DatabaseLog](	  [DatabaseLogID] INT NOT NULL IDENTITY(1,1)	, [PostTime] DATETIME NOT NULL	, [DatabaseUser] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Event] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Schema] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [Object] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [TSQL] NVARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [XmlEvent] XML NOT NULL	, CONSTRAINT [PK_DatabaseLog_DatabaseLogID] PRIMARY KEY ([DatabaseLogID] ASC))

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[DatabaseLog1]')) DROP Table [dbo].[DatabaseLog1]
GO
CREATE TABLE [dbo].[DatabaseLog1](	  [DatabaseLogID] INT NOT NULL IDENTITY(1,1)	, [PostTime] DATETIME NOT NULL	, [DatabaseUser] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Event] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Schema] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [Object] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [TSQL] NVARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [XmlEvent] XML NOT NULL	, CONSTRAINT [PK_DatabaseLog1_DatabaseLogID] PRIMARY KEY ([DatabaseLogID] ASC))

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[ErrorLog]')) DROP Table [dbo].[ErrorLog]
GO
CREATE TABLE [dbo].[ErrorLog](	  [ErrorLogID] INT NOT NULL IDENTITY(1,1)	, [ErrorTime] DATETIME NOT NULL DEFAULT(getdate())	, [UserName] SYSNAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ErrorNumber] INT NOT NULL	, [ErrorSeverity] INT NULL	, [ErrorState] INT NULL	, [ErrorProcedure] NVARCHAR(126) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [ErrorLine] INT NULL	, [ErrorMessage] NVARCHAR(4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, CONSTRAINT [PK_ErrorLog_ErrorLogID] PRIMARY KEY ([ErrorLogID] ASC))

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[kasjhfd]')) DROP Table [dbo].[kasjhfd]
GO
CREATE TABLE [dbo].[kasjhfd](	  [CountryRegionCode] NVARCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[Payroll]')) DROP Table [dbo].[Payroll]
GO
CREATE TABLE [dbo].[Payroll](	  [ID] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [OrganID] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [LawID] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[dbo].[Payroll2]')) DROP Table [dbo].[Payroll2]
GO
CREATE TABLE [dbo].[Payroll2](	  [ID] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [OrganID] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [LawID] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[Department]')) DROP Table [HumanResources].[Department]
GO
CREATE TABLE [HumanResources].[Department](	  [DepartmentID] SMALLINT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [GroupName] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Department_DepartmentID] PRIMARY KEY ([DepartmentID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_Department_Name] ON [HumanResources].[Department] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[Employee]')) DROP Table [HumanResources].[Employee]
GO
CREATE TABLE [HumanResources].[Employee](	  [BusinessEntityID] INT NOT NULL	, [NationalIDNumber] NVARCHAR(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [LoginID] NVARCHAR(256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [OrganizationNode] HIERARCHYID NULL	, [OrganizationLevel] AS ([OrganizationNode].[GetLevel]())	, [JobTitle] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [BirthDate] DATE NOT NULL	, [MaritalStatus] NCHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Gender] NCHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [HireDate] DATE NOT NULL	, [SalariedFlag] FLAG NOT NULL DEFAULT((1))	, [VacationHours] SMALLINT NOT NULL DEFAULT((0))	, [SickLeaveHours] SMALLINT NOT NULL DEFAULT((0))	, [CurrentFlag] FLAG NOT NULL DEFAULT((1))	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Employee_BusinessEntityID] PRIMARY KEY ([BusinessEntityID] ASC))ALTER TABLE [HumanResources].[Employee] WITH CHECK ADD CONSTRAINT [FK_Employee_Person_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])ALTER TABLE [HumanResources].[Employee] CHECK CONSTRAINT [FK_Employee_Person_BusinessEntityID]CREATE NONCLUSTERED INDEX [IX_Employee_OrganizationNode] ON [HumanResources].[Employee] ([OrganizationNode] ASC)CREATE NONCLUSTERED INDEX [IX_Employee_OrganizationLevel_OrganizationNode] ON [HumanResources].[Employee] ([OrganizationLevel] ASC, [OrganizationNode] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_LoginID] ON [HumanResources].[Employee] ([LoginID] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_NationalIDNumber] ON [HumanResources].[Employee] ([NationalIDNumber] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Employee_rowguid] ON [HumanResources].[Employee] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[EmployeeDepartmentHistory]')) DROP Table [HumanResources].[EmployeeDepartmentHistory]
GO
CREATE TABLE [HumanResources].[EmployeeDepartmentHistory](	  [BusinessEntityID] INT NOT NULL	, [DepartmentID] SMALLINT NOT NULL	, [ShiftID] TINYINT NOT NULL	, [StartDate] DATE NOT NULL	, [EndDate] DATE NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] PRIMARY KEY ([BusinessEntityID] ASC, [DepartmentID] ASC, [ShiftID] ASC, [StartDate] ASC))ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] WITH CHECK ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID] FOREIGN KEY([ShiftID]) REFERENCES [HumanResources].[Shift] ([ShiftID])ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID]ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] WITH CHECK ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID] FOREIGN KEY([DepartmentID]) REFERENCES [HumanResources].[Department] ([DepartmentID])ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID]ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] WITH CHECK ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] CHECK CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID]CREATE NONCLUSTERED INDEX [IX_EmployeeDepartmentHistory_DepartmentID] ON [HumanResources].[EmployeeDepartmentHistory] ([DepartmentID] ASC)CREATE NONCLUSTERED INDEX [IX_EmployeeDepartmentHistory_ShiftID] ON [HumanResources].[EmployeeDepartmentHistory] ([ShiftID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[EmployeePayHistory]')) DROP Table [HumanResources].[EmployeePayHistory]
GO
CREATE TABLE [HumanResources].[EmployeePayHistory](	  [BusinessEntityID] INT NOT NULL	, [RateChangeDate] DATETIME NOT NULL	, [Rate] MONEY NOT NULL	, [PayFrequency] TINYINT NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_EmployeePayHistory_BusinessEntityID_RateChangeDate] PRIMARY KEY ([BusinessEntityID] ASC, [RateChangeDate] ASC))ALTER TABLE [HumanResources].[EmployeePayHistory] WITH CHECK ADD CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])ALTER TABLE [HumanResources].[EmployeePayHistory] CHECK CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[JobCandidate]')) DROP Table [HumanResources].[JobCandidate]
GO
CREATE TABLE [HumanResources].[JobCandidate](	  [JobCandidateID] INT NOT NULL IDENTITY(1,1)	, [BusinessEntityID] INT NULL	, [Resume] XML NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY ([JobCandidateID] ASC))ALTER TABLE [HumanResources].[JobCandidate] WITH CHECK ADD CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])ALTER TABLE [HumanResources].[JobCandidate] CHECK CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID]CREATE NONCLUSTERED INDEX [IX_JobCandidate_BusinessEntityID] ON [HumanResources].[JobCandidate] ([BusinessEntityID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[HumanResources].[Shift]')) DROP Table [HumanResources].[Shift]
GO
CREATE TABLE [HumanResources].[Shift](	  [ShiftID] TINYINT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [StartTime] TIME NOT NULL	, [EndTime] TIME NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Shift_ShiftID] PRIMARY KEY ([ShiftID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_Shift_Name] ON [HumanResources].[Shift] ([Name] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Shift_StartTime_EndTime] ON [HumanResources].[Shift] ([StartTime] ASC, [EndTime] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[Address]')) DROP Table [Person].[Address]
GO
CREATE TABLE [Person].[Address](	  [AddressID] INT NOT NULL IDENTITY(1,1)	, [AddressLine1] NVARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [AddressLine2] NVARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [City] NVARCHAR(30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [StateProvinceID] INT NOT NULL	, [PostalCode] NVARCHAR(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [SpatialLocation] GEOGRAPHY NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Address_AddressID] PRIMARY KEY ([AddressID] ASC))ALTER TABLE [Person].[Address] WITH CHECK ADD CONSTRAINT [FK_Address_StateProvince_StateProvinceID] FOREIGN KEY([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])ALTER TABLE [Person].[Address] CHECK CONSTRAINT [FK_Address_StateProvince_StateProvinceID]CREATE UNIQUE NONCLUSTERED INDEX [AK_Address_rowguid] ON [Person].[Address] ([rowguid] ASC)CREATE UNIQUE NONCLUSTERED INDEX [IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode] ON [Person].[Address] ([AddressLine1] ASC, [AddressLine2] ASC, [City] ASC, [StateProvinceID] ASC, [PostalCode] ASC)CREATE NONCLUSTERED INDEX [IX_Address_StateProvinceID] ON [Person].[Address] ([StateProvinceID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[AddressType]')) DROP Table [Person].[AddressType]
GO
CREATE TABLE [Person].[AddressType](	  [AddressTypeID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_AddressType_AddressTypeID] PRIMARY KEY ([AddressTypeID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_rowguid] ON [Person].[AddressType] ([rowguid] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_AddressType_Name] ON [Person].[AddressType] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[BusinessEntity]')) DROP Table [Person].[BusinessEntity]
GO
CREATE TABLE [Person].[BusinessEntity](	  [BusinessEntityID] INT NOT NULL IDENTITY(1,1)	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_BusinessEntity_BusinessEntityID] PRIMARY KEY ([BusinessEntityID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntity_rowguid] ON [Person].[BusinessEntity] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[BusinessEntityAddress]')) DROP Table [Person].[BusinessEntityAddress]
GO
CREATE TABLE [Person].[BusinessEntityAddress](	  [BusinessEntityID] INT NOT NULL	, [AddressID] INT NOT NULL	, [AddressTypeID] INT NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_BusinessEntityAddress_BusinessEntityID_AddressID_AddressTypeID] PRIMARY KEY ([BusinessEntityID] ASC, [AddressID] ASC, [AddressTypeID] ASC))ALTER TABLE [Person].[BusinessEntityAddress] WITH CHECK ADD CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID] FOREIGN KEY([AddressID]) REFERENCES [Person].[Address] ([AddressID])ALTER TABLE [Person].[BusinessEntityAddress] CHECK CONSTRAINT [FK_BusinessEntityAddress_Address_AddressID]ALTER TABLE [Person].[BusinessEntityAddress] WITH CHECK ADD CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID] FOREIGN KEY([AddressTypeID]) REFERENCES [Person].[AddressType] ([AddressTypeID])ALTER TABLE [Person].[BusinessEntityAddress] CHECK CONSTRAINT [FK_BusinessEntityAddress_AddressType_AddressTypeID]ALTER TABLE [Person].[BusinessEntityAddress] WITH CHECK ADD CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])ALTER TABLE [Person].[BusinessEntityAddress] CHECK CONSTRAINT [FK_BusinessEntityAddress_BusinessEntity_BusinessEntityID]CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntityAddress_rowguid] ON [Person].[BusinessEntityAddress] ([rowguid] ASC)CREATE NONCLUSTERED INDEX [IX_BusinessEntityAddress_AddressID] ON [Person].[BusinessEntityAddress] ([AddressID] ASC)CREATE NONCLUSTERED INDEX [IX_BusinessEntityAddress_AddressTypeID] ON [Person].[BusinessEntityAddress] ([AddressTypeID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[BusinessEntityContact]')) DROP Table [Person].[BusinessEntityContact]
GO
CREATE TABLE [Person].[BusinessEntityContact](	  [BusinessEntityID] INT NOT NULL	, [PersonID] INT NOT NULL	, [ContactTypeID] INT NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_BusinessEntityContact_BusinessEntityID_PersonID_ContactTypeID] PRIMARY KEY ([BusinessEntityID] ASC, [PersonID] ASC, [ContactTypeID] ASC))ALTER TABLE [Person].[BusinessEntityContact] WITH CHECK ADD CONSTRAINT [FK_BusinessEntityContact_Person_PersonID] FOREIGN KEY([PersonID]) REFERENCES [Person].[Person] ([BusinessEntityID])ALTER TABLE [Person].[BusinessEntityContact] CHECK CONSTRAINT [FK_BusinessEntityContact_Person_PersonID]ALTER TABLE [Person].[BusinessEntityContact] WITH CHECK ADD CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])ALTER TABLE [Person].[BusinessEntityContact] CHECK CONSTRAINT [FK_BusinessEntityContact_BusinessEntity_BusinessEntityID]ALTER TABLE [Person].[BusinessEntityContact] WITH CHECK ADD CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID] FOREIGN KEY([ContactTypeID]) REFERENCES [Person].[ContactType] ([ContactTypeID])ALTER TABLE [Person].[BusinessEntityContact] CHECK CONSTRAINT [FK_BusinessEntityContact_ContactType_ContactTypeID]CREATE UNIQUE NONCLUSTERED INDEX [AK_BusinessEntityContact_rowguid] ON [Person].[BusinessEntityContact] ([rowguid] ASC)CREATE NONCLUSTERED INDEX [IX_BusinessEntityContact_PersonID] ON [Person].[BusinessEntityContact] ([PersonID] ASC)CREATE NONCLUSTERED INDEX [IX_BusinessEntityContact_ContactTypeID] ON [Person].[BusinessEntityContact] ([ContactTypeID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[ContactType]')) DROP Table [Person].[ContactType]
GO
CREATE TABLE [Person].[ContactType](	  [ContactTypeID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ContactType_ContactTypeID] PRIMARY KEY ([ContactTypeID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_ContactType_Name] ON [Person].[ContactType] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[CountryRegion]')) DROP Table [Person].[CountryRegion]
GO
CREATE TABLE [Person].[CountryRegion](	  [CountryRegionCode] NVARCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_CountryRegion_CountryRegionCode] PRIMARY KEY ([CountryRegionCode] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_CountryRegion_Name] ON [Person].[CountryRegion] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[CountryRegion1]')) DROP Table [Person].[CountryRegion1]
GO
CREATE TABLE [Person].[CountryRegion1](	  [CountryRegionCode] NVARCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[EmailAddress]')) DROP Table [Person].[EmailAddress]
GO
CREATE TABLE [Person].[EmailAddress](	  [BusinessEntityID] INT NOT NULL	, [EmailAddressID] INT NOT NULL IDENTITY(1,1)	, [EmailAddress] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_EmailAddress_BusinessEntityID_EmailAddressID] PRIMARY KEY ([BusinessEntityID] ASC, [EmailAddressID] ASC))ALTER TABLE [Person].[EmailAddress] WITH CHECK ADD CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])ALTER TABLE [Person].[EmailAddress] CHECK CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID]CREATE NONCLUSTERED INDEX [IX_EmailAddress_EmailAddress] ON [Person].[EmailAddress] ([EmailAddress] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[Password]')) DROP Table [Person].[Password]
GO
CREATE TABLE [Person].[Password](	  [BusinessEntityID] INT NOT NULL	, [PasswordHash] VARCHAR(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [PasswordSalt] VARCHAR(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Password_BusinessEntityID] PRIMARY KEY ([BusinessEntityID] ASC))ALTER TABLE [Person].[Password] WITH CHECK ADD CONSTRAINT [FK_Password_Person_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])ALTER TABLE [Person].[Password] CHECK CONSTRAINT [FK_Password_Person_BusinessEntityID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[Person]')) DROP Table [Person].[Person]
GO
CREATE TABLE [Person].[Person](	  [BusinessEntityID] INT NOT NULL	, [PersonType] NCHAR(2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [NameStyle] NAMESTYLE NOT NULL DEFAULT((0))	, [Title] NVARCHAR(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [FirstName] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [MiddleName] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [LastName] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Suffix] NVARCHAR(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [EmailPromotion] INT NOT NULL DEFAULT((0))	, [AdditionalContactInfo] XML NULL	, [Demographics] XML NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY ([BusinessEntityID] ASC))ALTER TABLE [Person].[Person] WITH CHECK ADD CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])ALTER TABLE [Person].[Person] CHECK CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID]CREATE NONCLUSTERED INDEX [IX_Person_LastName_FirstName_MiddleName] ON [Person].[Person] ([LastName] ASC, [FirstName] ASC, [MiddleName] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Person_rowguid] ON [Person].[Person] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[PersonPhone]')) DROP Table [Person].[PersonPhone]
GO
CREATE TABLE [Person].[PersonPhone](	  [BusinessEntityID] INT NOT NULL	, [PhoneNumber] PHONE COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [PhoneNumberTypeID] INT NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_PersonPhone_BusinessEntityID_PhoneNumber_PhoneNumberTypeID] PRIMARY KEY ([BusinessEntityID] ASC, [PhoneNumber] ASC, [PhoneNumberTypeID] ASC))ALTER TABLE [Person].[PersonPhone] WITH CHECK ADD CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])ALTER TABLE [Person].[PersonPhone] CHECK CONSTRAINT [FK_PersonPhone_Person_BusinessEntityID]ALTER TABLE [Person].[PersonPhone] WITH CHECK ADD CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID] FOREIGN KEY([PhoneNumberTypeID]) REFERENCES [Person].[PhoneNumberType] ([PhoneNumberTypeID])ALTER TABLE [Person].[PersonPhone] CHECK CONSTRAINT [FK_PersonPhone_PhoneNumberType_PhoneNumberTypeID]CREATE NONCLUSTERED INDEX [IX_PersonPhone_PhoneNumber] ON [Person].[PersonPhone] ([PhoneNumber] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[PhoneNumberType]')) DROP Table [Person].[PhoneNumberType]
GO
CREATE TABLE [Person].[PhoneNumberType](	  [PhoneNumberTypeID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_PhoneNumberType_PhoneNumberTypeID] PRIMARY KEY ([PhoneNumberTypeID] ASC))

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Person].[StateProvince]')) DROP Table [Person].[StateProvince]
GO
CREATE TABLE [Person].[StateProvince](	  [StateProvinceID] INT NOT NULL IDENTITY(1,1)	, [StateProvinceCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [CountryRegionCode] NVARCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [IsOnlyStateProvinceFlag] FLAG NOT NULL DEFAULT((1))	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [TerritoryID] INT NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_StateProvince_StateProvinceID] PRIMARY KEY ([StateProvinceID] ASC))ALTER TABLE [Person].[StateProvince] WITH CHECK ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID] FOREIGN KEY([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])ALTER TABLE [Person].[StateProvince] CHECK CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID]ALTER TABLE [Person].[StateProvince] WITH CHECK ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode] FOREIGN KEY([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])ALTER TABLE [Person].[StateProvince] CHECK CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode]CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_Name] ON [Person].[StateProvince] ([Name] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode] ON [Person].[StateProvince] ([StateProvinceCode] ASC, [CountryRegionCode] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_StateProvince_rowguid] ON [Person].[StateProvince] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[BillOfMaterials]')) DROP Table [Production].[BillOfMaterials]
GO
CREATE TABLE [Production].[BillOfMaterials](	  [BillOfMaterialsID] INT NOT NULL IDENTITY(1,1)	, [ProductAssemblyID] INT NULL	, [ComponentID] INT NOT NULL	, [StartDate] DATETIME NOT NULL DEFAULT(getdate())	, [EndDate] DATETIME NULL	, [UnitMeasureCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [BOMLevel] SMALLINT NOT NULL	, [PerAssemblyQty] DECIMAL(8,2) NOT NULL DEFAULT((1.00))	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_BillOfMaterials_BillOfMaterialsID] PRIMARY KEY ([BillOfMaterialsID] ASC))ALTER TABLE [Production].[BillOfMaterials] WITH CHECK ADD CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID] FOREIGN KEY([ProductAssemblyID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]ALTER TABLE [Production].[BillOfMaterials] WITH CHECK ADD CONSTRAINT [FK_BillOfMaterials_Product_ComponentID] FOREIGN KEY([ComponentID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]ALTER TABLE [Production].[BillOfMaterials] WITH CHECK ADD CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode] FOREIGN KEY([UnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]CREATE NONCLUSTERED INDEX [IX_BillOfMaterials_UnitMeasureCode] ON [Production].[BillOfMaterials] ([UnitMeasureCode] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Culture]')) DROP Table [Production].[Culture]
GO
CREATE TABLE [Production].[Culture](	  [CultureID] NCHAR(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Culture_CultureID] PRIMARY KEY ([CultureID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_Culture_Name] ON [Production].[Culture] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Document]')) DROP Table [Production].[Document]
GO
CREATE TABLE [Production].[Document](	  [DocumentNode] HIERARCHYID NOT NULL	, [DocumentLevel] AS ([DocumentNode].[GetLevel]())	, [Title] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Owner] INT NOT NULL	, [FolderFlag] BIT NOT NULL DEFAULT((0))	, [FileName] NVARCHAR(400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [FileExtension] NVARCHAR(8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Revision] NCHAR(5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ChangeNumber] INT NOT NULL DEFAULT((0))	, [Status] TINYINT NOT NULL	, [DocumentSummary] NVARCHAR(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [Document] VARBINARY(MAX) NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Document_DocumentNode] PRIMARY KEY ([DocumentNode] ASC))ALTER TABLE [Production].[Document] WITH CHECK ADD CONSTRAINT [FK_Document_Employee_Owner] FOREIGN KEY([Owner]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])ALTER TABLE [Production].[Document] CHECK CONSTRAINT [FK_Document_Employee_Owner]CREATE UNIQUE NONCLUSTERED INDEX [UQ__Document__F73921F7C5112C2E] ON [Production].[Document] ([rowguid] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Document_DocumentLevel_DocumentNode] ON [Production].[Document] ([DocumentLevel] ASC, [DocumentNode] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Document_rowguid] ON [Production].[Document] ([rowguid] ASC)CREATE NONCLUSTERED INDEX [IX_Document_FileName_Revision] ON [Production].[Document] ([FileName] ASC, [Revision] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Illustration]')) DROP Table [Production].[Illustration]
GO
CREATE TABLE [Production].[Illustration](	  [IllustrationID] INT NOT NULL IDENTITY(1,1)	, [Diagram] XML NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Illustration_IllustrationID] PRIMARY KEY ([IllustrationID] ASC))

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Location]')) DROP Table [Production].[Location]
GO
CREATE TABLE [Production].[Location](	  [LocationID] SMALLINT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [CostRate] SMALLMONEY NOT NULL DEFAULT((0.00))	, [Availability] DECIMAL(8,2) NOT NULL DEFAULT((0.00))	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Location_LocationID] PRIMARY KEY ([LocationID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_Location_Name] ON [Production].[Location] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[Product]')) DROP Table [Production].[Product]
GO
CREATE TABLE [Production].[Product](	  [ProductID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ProductNumber] NVARCHAR(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [MakeFlag] FLAG NOT NULL DEFAULT((1))	, [FinishedGoodsFlag] FLAG NOT NULL DEFAULT((1))	, [Color] NVARCHAR(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [SafetyStockLevel] SMALLINT NOT NULL	, [ReorderPoint] SMALLINT NOT NULL	, [StandardCost] MONEY NOT NULL	, [ListPrice] MONEY NOT NULL	, [Size] NVARCHAR(5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [SizeUnitMeasureCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [WeightUnitMeasureCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [Weight] DECIMAL(8,2) NULL	, [DaysToManufacture] INT NOT NULL	, [ProductLine] NCHAR(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [Class] NCHAR(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [Style] NCHAR(2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [ProductSubcategoryID] INT NULL	, [ProductModelID] INT NULL	, [SellStartDate] DATETIME NOT NULL	, [SellEndDate] DATETIME NULL	, [DiscontinuedDate] DATETIME NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Product_ProductID] PRIMARY KEY ([ProductID] ASC))ALTER TABLE [Production].[Product] WITH CHECK ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID] FOREIGN KEY([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID])ALTER TABLE [Production].[Product] CHECK CONSTRAINT [FK_Product_ProductModel_ProductModelID]ALTER TABLE [Production].[Product] WITH CHECK ADD CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID] FOREIGN KEY([ProductSubcategoryID]) REFERENCES [Production].[ProductSubcategory] ([ProductSubcategoryID])ALTER TABLE [Production].[Product] CHECK CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID]ALTER TABLE [Production].[Product] WITH CHECK ADD CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode] FOREIGN KEY([SizeUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])ALTER TABLE [Production].[Product] CHECK CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode]ALTER TABLE [Production].[Product] WITH CHECK ADD CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode] FOREIGN KEY([WeightUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])ALTER TABLE [Production].[Product] CHECK CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode]CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_ProductNumber] ON [Production].[Product] ([ProductNumber] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_Name] ON [Production].[Product] ([Name] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Product_rowguid] ON [Production].[Product] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductCategory]')) DROP Table [Production].[ProductCategory]
GO
CREATE TABLE [Production].[ProductCategory](	  [ProductCategoryID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductCategory_ProductCategoryID] PRIMARY KEY ([ProductCategoryID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_Name] ON [Production].[ProductCategory] ([Name] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductCategory_rowguid] ON [Production].[ProductCategory] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductCostHistory]')) DROP Table [Production].[ProductCostHistory]
GO
CREATE TABLE [Production].[ProductCostHistory](	  [ProductID] INT NOT NULL	, [StartDate] DATETIME NOT NULL	, [EndDate] DATETIME NULL	, [StandardCost] MONEY NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductCostHistory_ProductID_StartDate] PRIMARY KEY ([ProductID] ASC, [StartDate] ASC))ALTER TABLE [Production].[ProductCostHistory] WITH CHECK ADD CONSTRAINT [FK_ProductCostHistory_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product_ProductID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductDescription]')) DROP Table [Production].[ProductDescription]
GO
CREATE TABLE [Production].[ProductDescription](	  [ProductDescriptionID] INT NOT NULL IDENTITY(1,1)	, [Description] NVARCHAR(400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductDescription_ProductDescriptionID] PRIMARY KEY ([ProductDescriptionID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductDescription_rowguid] ON [Production].[ProductDescription] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductDocument]')) DROP Table [Production].[ProductDocument]
GO
CREATE TABLE [Production].[ProductDocument](	  [ProductID] INT NOT NULL	, [DocumentNode] HIERARCHYID NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductDocument_ProductID_DocumentNode] PRIMARY KEY ([ProductID] ASC, [DocumentNode] ASC))ALTER TABLE [Production].[ProductDocument] WITH CHECK ADD CONSTRAINT [FK_ProductDocument_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[ProductDocument] CHECK CONSTRAINT [FK_ProductDocument_Product_ProductID]ALTER TABLE [Production].[ProductDocument] WITH CHECK ADD CONSTRAINT [FK_ProductDocument_Document_DocumentNode] FOREIGN KEY([DocumentNode]) REFERENCES [Production].[Document] ([DocumentNode])ALTER TABLE [Production].[ProductDocument] CHECK CONSTRAINT [FK_ProductDocument_Document_DocumentNode]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductInventory]')) DROP Table [Production].[ProductInventory]
GO
CREATE TABLE [Production].[ProductInventory](	  [ProductID] INT NOT NULL	, [LocationID] SMALLINT NOT NULL	, [Shelf] NVARCHAR(10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Bin] TINYINT NOT NULL	, [Quantity] SMALLINT NOT NULL DEFAULT((0))	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductInventory_ProductID_LocationID] PRIMARY KEY ([ProductID] ASC, [LocationID] ASC))ALTER TABLE [Production].[ProductInventory] WITH CHECK ADD CONSTRAINT [FK_ProductInventory_Location_LocationID] FOREIGN KEY([LocationID]) REFERENCES [Production].[Location] ([LocationID])ALTER TABLE [Production].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Location_LocationID]ALTER TABLE [Production].[ProductInventory] WITH CHECK ADD CONSTRAINT [FK_ProductInventory_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[ProductInventory] CHECK CONSTRAINT [FK_ProductInventory_Product_ProductID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductListPriceHistory]')) DROP Table [Production].[ProductListPriceHistory]
GO
CREATE TABLE [Production].[ProductListPriceHistory](	  [ProductID] INT NOT NULL	, [StartDate] DATETIME NOT NULL	, [EndDate] DATETIME NULL	, [ListPrice] MONEY NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductListPriceHistory_ProductID_StartDate] PRIMARY KEY ([ProductID] ASC, [StartDate] ASC))ALTER TABLE [Production].[ProductListPriceHistory] WITH CHECK ADD CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[ProductListPriceHistory] CHECK CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductModel]')) DROP Table [Production].[ProductModel]
GO
CREATE TABLE [Production].[ProductModel](	  [ProductModelID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [CatalogDescription] XML NULL	, [Instructions] XML NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY ([ProductModelID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_Name] ON [Production].[ProductModel] ([Name] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductModel_rowguid] ON [Production].[ProductModel] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductModelIllustration]')) DROP Table [Production].[ProductModelIllustration]
GO
CREATE TABLE [Production].[ProductModelIllustration](	  [ProductModelID] INT NOT NULL	, [IllustrationID] INT NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductModelIllustration_ProductModelID_IllustrationID] PRIMARY KEY ([ProductModelID] ASC, [IllustrationID] ASC))ALTER TABLE [Production].[ProductModelIllustration] WITH CHECK ADD CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID] FOREIGN KEY([IllustrationID]) REFERENCES [Production].[Illustration] ([IllustrationID])ALTER TABLE [Production].[ProductModelIllustration] CHECK CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID]ALTER TABLE [Production].[ProductModelIllustration] WITH CHECK ADD CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID] FOREIGN KEY([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID])ALTER TABLE [Production].[ProductModelIllustration] CHECK CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductModelProductDescriptionCulture]')) DROP Table [Production].[ProductModelProductDescriptionCulture]
GO
CREATE TABLE [Production].[ProductModelProductDescriptionCulture](	  [ProductModelID] INT NOT NULL	, [ProductDescriptionID] INT NOT NULL	, [CultureID] NCHAR(6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductModelProductDescriptionCulture_ProductModelID_ProductDescriptionID_CultureID] PRIMARY KEY ([ProductModelID] ASC, [ProductDescriptionID] ASC, [CultureID] ASC))ALTER TABLE [Production].[ProductModelProductDescriptionCulture] WITH CHECK ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID] FOREIGN KEY([ProductDescriptionID]) REFERENCES [Production].[ProductDescription] ([ProductDescriptionID])ALTER TABLE [Production].[ProductModelProductDescriptionCulture] CHECK CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductDescription_ProductDescriptionID]ALTER TABLE [Production].[ProductModelProductDescriptionCulture] WITH CHECK ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID] FOREIGN KEY([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID])ALTER TABLE [Production].[ProductModelProductDescriptionCulture] CHECK CONSTRAINT [FK_ProductModelProductDescriptionCulture_ProductModel_ProductModelID]ALTER TABLE [Production].[ProductModelProductDescriptionCulture] WITH CHECK ADD CONSTRAINT [FK_ProductModelProductDescriptionCulture_Culture_CultureID] FOREIGN KEY([CultureID]) REFERENCES [Production].[Culture] ([CultureID])ALTER TABLE [Production].[ProductModelProductDescriptionCulture] CHECK CONSTRAINT [FK_ProductModelProductDescriptionCulture_Culture_CultureID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductPhoto]')) DROP Table [Production].[ProductPhoto]
GO
CREATE TABLE [Production].[ProductPhoto](	  [ProductPhotoID] INT NOT NULL IDENTITY(1,1)	, [ThumbNailPhoto] VARBINARY(MAX) NULL	, [ThumbnailPhotoFileName] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [LargePhoto] VARBINARY(MAX) NULL	, [LargePhotoFileName] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductPhoto_ProductPhotoID] PRIMARY KEY ([ProductPhotoID] ASC))

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductProductPhoto]')) DROP Table [Production].[ProductProductPhoto]
GO
CREATE TABLE [Production].[ProductProductPhoto](	  [ProductID] INT NOT NULL	, [ProductPhotoID] INT NOT NULL	, [Primary] FLAG NOT NULL DEFAULT((0))	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductProductPhoto_ProductID_ProductPhotoID] PRIMARY KEY ([ProductID] ASC, [ProductPhotoID] ASC))ALTER TABLE [Production].[ProductProductPhoto] WITH CHECK ADD CONSTRAINT [FK_ProductProductPhoto_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[ProductProductPhoto] CHECK CONSTRAINT [FK_ProductProductPhoto_Product_ProductID]ALTER TABLE [Production].[ProductProductPhoto] WITH CHECK ADD CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID] FOREIGN KEY([ProductPhotoID]) REFERENCES [Production].[ProductPhoto] ([ProductPhotoID])ALTER TABLE [Production].[ProductProductPhoto] CHECK CONSTRAINT [FK_ProductProductPhoto_ProductPhoto_ProductPhotoID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductReview]')) DROP Table [Production].[ProductReview]
GO
CREATE TABLE [Production].[ProductReview](	  [ProductReviewID] INT NOT NULL IDENTITY(1,1)	, [ProductID] INT NOT NULL	, [ReviewerName] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ReviewDate] DATETIME NOT NULL DEFAULT(getdate())	, [EmailAddress] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Rating] INT NOT NULL	, [Comments] NVARCHAR(3850) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductReview_ProductReviewID] PRIMARY KEY ([ProductReviewID] ASC))ALTER TABLE [Production].[ProductReview] WITH CHECK ADD CONSTRAINT [FK_ProductReview_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[ProductReview] CHECK CONSTRAINT [FK_ProductReview_Product_ProductID]CREATE NONCLUSTERED INDEX [IX_ProductReview_ProductID_Name] ON [Production].[ProductReview] ([ProductID] ASC, [ReviewerName] ASC)INCLUDE ([Comments])

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ProductSubcategory]')) DROP Table [Production].[ProductSubcategory]
GO
CREATE TABLE [Production].[ProductSubcategory](	  [ProductSubcategoryID] INT NOT NULL IDENTITY(1,1)	, [ProductCategoryID] INT NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductSubcategory_ProductSubcategoryID] PRIMARY KEY ([ProductSubcategoryID] ASC))ALTER TABLE [Production].[ProductSubcategory] WITH CHECK ADD CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID] FOREIGN KEY([ProductCategoryID]) REFERENCES [Production].[ProductCategory] ([ProductCategoryID])ALTER TABLE [Production].[ProductSubcategory] CHECK CONSTRAINT [FK_ProductSubcategory_ProductCategory_ProductCategoryID]CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductSubcategory_Name] ON [Production].[ProductSubcategory] ([Name] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_ProductSubcategory_rowguid] ON [Production].[ProductSubcategory] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[ScrapReason]')) DROP Table [Production].[ScrapReason]
GO
CREATE TABLE [Production].[ScrapReason](	  [ScrapReasonID] SMALLINT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ScrapReason_ScrapReasonID] PRIMARY KEY ([ScrapReasonID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_ScrapReason_Name] ON [Production].[ScrapReason] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[TransactionHistory]')) DROP Table [Production].[TransactionHistory]
GO
CREATE TABLE [Production].[TransactionHistory](	  [TransactionID] INT NOT NULL IDENTITY(*,1)	, [ProductID] INT NOT NULL	, [ReferenceOrderID] INT NOT NULL	, [ReferenceOrderLineID] INT NOT NULL DEFAULT((0))	, [TransactionDate] DATETIME NOT NULL DEFAULT(getdate())	, [TransactionType] NCHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Quantity] INT NOT NULL	, [ActualCost] MONEY NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_TransactionHistory_TransactionID] PRIMARY KEY ([TransactionID] ASC))ALTER TABLE [Production].[TransactionHistory] WITH CHECK ADD CONSTRAINT [FK_TransactionHistory_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[TransactionHistory] CHECK CONSTRAINT [FK_TransactionHistory_Product_ProductID]CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ProductID] ON [Production].[TransactionHistory] ([ProductID] ASC)CREATE NONCLUSTERED INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineID] ON [Production].[TransactionHistory] ([ReferenceOrderID] ASC, [ReferenceOrderLineID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[TransactionHistoryArchive]')) DROP Table [Production].[TransactionHistoryArchive]
GO
CREATE TABLE [Production].[TransactionHistoryArchive](	  [TransactionID] INT NOT NULL	, [ProductID] INT NOT NULL	, [ReferenceOrderID] INT NOT NULL	, [ReferenceOrderLineID] INT NOT NULL DEFAULT((0))	, [TransactionDate] DATETIME NOT NULL DEFAULT(getdate())	, [TransactionType] NCHAR(1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Quantity] INT NOT NULL	, [ActualCost] MONEY NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_TransactionHistoryArchive_TransactionID] PRIMARY KEY ([TransactionID] ASC))CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ProductID] ON [Production].[TransactionHistoryArchive] ([ProductID] ASC)CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID] ON [Production].[TransactionHistoryArchive] ([ReferenceOrderID] ASC, [ReferenceOrderLineID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[UnitMeasure]')) DROP Table [Production].[UnitMeasure]
GO
CREATE TABLE [Production].[UnitMeasure](	  [UnitMeasureCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_UnitMeasure_UnitMeasureCode] PRIMARY KEY ([UnitMeasureCode] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_UnitMeasure_Name] ON [Production].[UnitMeasure] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[WorkOrder]')) DROP Table [Production].[WorkOrder]
GO
CREATE TABLE [Production].[WorkOrder](	  [WorkOrderID] INT NOT NULL IDENTITY(1,1)	, [ProductID] INT NOT NULL	, [OrderQty] INT NOT NULL	, [StockedQty] AS (isnull([OrderQty]-[ScrappedQty],(0)))	, [ScrappedQty] SMALLINT NOT NULL	, [StartDate] DATETIME NOT NULL	, [EndDate] DATETIME NULL	, [DueDate] DATETIME NOT NULL	, [ScrapReasonID] SMALLINT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_WorkOrder_WorkOrderID] PRIMARY KEY ([WorkOrderID] ASC))ALTER TABLE [Production].[WorkOrder] WITH CHECK ADD CONSTRAINT [FK_WorkOrder_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Production].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_Product_ProductID]ALTER TABLE [Production].[WorkOrder] WITH CHECK ADD CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID] FOREIGN KEY([ScrapReasonID]) REFERENCES [Production].[ScrapReason] ([ScrapReasonID])ALTER TABLE [Production].[WorkOrder] CHECK CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID]CREATE NONCLUSTERED INDEX [IX_WorkOrder_ScrapReasonID] ON [Production].[WorkOrder] ([ScrapReasonID] ASC)CREATE NONCLUSTERED INDEX [IX_WorkOrder_ProductID] ON [Production].[WorkOrder] ([ProductID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Production].[WorkOrderRouting]')) DROP Table [Production].[WorkOrderRouting]
GO
CREATE TABLE [Production].[WorkOrderRouting](	  [WorkOrderID] INT NOT NULL	, [ProductID] INT NOT NULL	, [OperationSequence] SMALLINT NOT NULL	, [LocationID] SMALLINT NOT NULL	, [ScheduledStartDate] DATETIME NOT NULL	, [ScheduledEndDate] DATETIME NOT NULL	, [ActualStartDate] DATETIME NULL	, [ActualEndDate] DATETIME NULL	, [ActualResourceHrs] DECIMAL(9,4) NULL	, [PlannedCost] MONEY NOT NULL	, [ActualCost] MONEY NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence] PRIMARY KEY ([WorkOrderID] ASC, [ProductID] ASC, [OperationSequence] ASC))ALTER TABLE [Production].[WorkOrderRouting] WITH CHECK ADD CONSTRAINT [FK_WorkOrderRouting_Location_LocationID] FOREIGN KEY([LocationID]) REFERENCES [Production].[Location] ([LocationID])ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]ALTER TABLE [Production].[WorkOrderRouting] WITH CHECK ADD CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID] FOREIGN KEY([WorkOrderID]) REFERENCES [Production].[WorkOrder] ([WorkOrderID])ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]CREATE NONCLUSTERED INDEX [IX_WorkOrderRouting_ProductID] ON [Production].[WorkOrderRouting] ([ProductID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[ProductVendor]')) DROP Table [Purchasing].[ProductVendor]
GO
CREATE TABLE [Purchasing].[ProductVendor](	  [ProductID] INT NOT NULL	, [BusinessEntityID] INT NOT NULL	, [AverageLeadTime] INT NOT NULL	, [StandardPrice] MONEY NOT NULL	, [LastReceiptCost] MONEY NULL	, [LastReceiptDate] DATETIME NULL	, [MinOrderQty] INT NOT NULL	, [MaxOrderQty] INT NOT NULL	, [OnOrderQty] INT NULL	, [UnitMeasureCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ProductVendor_ProductID_BusinessEntityID] PRIMARY KEY ([ProductID] ASC, [BusinessEntityID] ASC))ALTER TABLE [Purchasing].[ProductVendor] WITH CHECK ADD CONSTRAINT [FK_ProductVendor_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_Product_ProductID]ALTER TABLE [Purchasing].[ProductVendor] WITH CHECK ADD CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode] FOREIGN KEY([UnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode]ALTER TABLE [Purchasing].[ProductVendor] WITH CHECK ADD CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Purchasing].[Vendor] ([BusinessEntityID])ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID]CREATE NONCLUSTERED INDEX [IX_ProductVendor_UnitMeasureCode] ON [Purchasing].[ProductVendor] ([UnitMeasureCode] ASC)CREATE NONCLUSTERED INDEX [IX_ProductVendor_BusinessEntityID] ON [Purchasing].[ProductVendor] ([BusinessEntityID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[PurchaseOrderDetail]')) DROP Table [Purchasing].[PurchaseOrderDetail]
GO
CREATE TABLE [Purchasing].[PurchaseOrderDetail](	  [PurchaseOrderID] INT NOT NULL	, [PurchaseOrderDetailID] INT NOT NULL IDENTITY(1,1)	, [DueDate] DATETIME NOT NULL	, [OrderQty] SMALLINT NOT NULL	, [ProductID] INT NOT NULL	, [UnitPrice] MONEY NOT NULL	, [LineTotal] AS (isnull([OrderQty]*[UnitPrice],(0.00)))	, [ReceivedQty] DECIMAL(8,2) NOT NULL	, [RejectedQty] DECIMAL(8,2) NOT NULL	, [StockedQty] AS (isnull([ReceivedQty]-[RejectedQty],(0.00)))	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_PurchaseOrderDetail_PurchaseOrderID_PurchaseOrderDetailID] PRIMARY KEY ([PurchaseOrderID] ASC, [PurchaseOrderDetailID] ASC))ALTER TABLE [Purchasing].[PurchaseOrderDetail] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Purchasing].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_Product_ProductID]ALTER TABLE [Purchasing].[PurchaseOrderDetail] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID] FOREIGN KEY([PurchaseOrderID]) REFERENCES [Purchasing].[PurchaseOrderHeader] ([PurchaseOrderID])ALTER TABLE [Purchasing].[PurchaseOrderDetail] CHECK CONSTRAINT [FK_PurchaseOrderDetail_PurchaseOrderHeader_PurchaseOrderID]CREATE NONCLUSTERED INDEX [IX_PurchaseOrderDetail_ProductID] ON [Purchasing].[PurchaseOrderDetail] ([ProductID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[PurchaseOrderHeader]')) DROP Table [Purchasing].[PurchaseOrderHeader]
GO
CREATE TABLE [Purchasing].[PurchaseOrderHeader](	  [PurchaseOrderID] INT NOT NULL IDENTITY(1,1)	, [RevisionNumber] TINYINT NOT NULL DEFAULT((0))	, [Status] TINYINT NOT NULL DEFAULT((1))	, [EmployeeID] INT NOT NULL	, [VendorID] INT NOT NULL	, [ShipMethodID] INT NOT NULL	, [OrderDate] DATETIME NOT NULL DEFAULT(getdate())	, [ShipDate] DATETIME NULL	, [SubTotal] MONEY NOT NULL DEFAULT((0.00))	, [TaxAmt] MONEY NOT NULL DEFAULT((0.00))	, [Freight] MONEY NOT NULL DEFAULT((0.00))	, [TotalDue] AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0)))	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_PurchaseOrderHeader_PurchaseOrderID] PRIMARY KEY ([PurchaseOrderID] ASC))ALTER TABLE [Purchasing].[PurchaseOrderHeader] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID] FOREIGN KEY([ShipMethodID]) REFERENCES [Purchasing].[ShipMethod] ([ShipMethodID])ALTER TABLE [Purchasing].[PurchaseOrderHeader] CHECK CONSTRAINT [FK_PurchaseOrderHeader_ShipMethod_ShipMethodID]ALTER TABLE [Purchasing].[PurchaseOrderHeader] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID] FOREIGN KEY([VendorID]) REFERENCES [Purchasing].[Vendor] ([BusinessEntityID])ALTER TABLE [Purchasing].[PurchaseOrderHeader] CHECK CONSTRAINT [FK_PurchaseOrderHeader_Vendor_VendorID]ALTER TABLE [Purchasing].[PurchaseOrderHeader] WITH CHECK ADD CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID] FOREIGN KEY([EmployeeID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])ALTER TABLE [Purchasing].[PurchaseOrderHeader] CHECK CONSTRAINT [FK_PurchaseOrderHeader_Employee_EmployeeID]CREATE NONCLUSTERED INDEX [IX_PurchaseOrderHeader_VendorID] ON [Purchasing].[PurchaseOrderHeader] ([VendorID] ASC)CREATE NONCLUSTERED INDEX [IX_PurchaseOrderHeader_EmployeeID] ON [Purchasing].[PurchaseOrderHeader] ([EmployeeID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[ShipMethod]')) DROP Table [Purchasing].[ShipMethod]
GO
CREATE TABLE [Purchasing].[ShipMethod](	  [ShipMethodID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ShipBase] MONEY NOT NULL DEFAULT((0.00))	, [ShipRate] MONEY NOT NULL DEFAULT((0.00))	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ShipMethod_ShipMethodID] PRIMARY KEY ([ShipMethodID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_Name] ON [Purchasing].[ShipMethod] ([Name] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_ShipMethod_rowguid] ON [Purchasing].[ShipMethod] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Purchasing].[Vendor]')) DROP Table [Purchasing].[Vendor]
GO
CREATE TABLE [Purchasing].[Vendor](	  [BusinessEntityID] INT NOT NULL	, [AccountNumber] ACCOUNTNUMBER COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [CreditRating] TINYINT NOT NULL	, [PreferredVendorStatus] FLAG NOT NULL DEFAULT((1))	, [ActiveFlag] FLAG NOT NULL DEFAULT((1))	, [PurchasingWebServiceURL] NVARCHAR(1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Vendor_BusinessEntityID] PRIMARY KEY ([BusinessEntityID] ASC))ALTER TABLE [Purchasing].[Vendor] WITH CHECK ADD CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])ALTER TABLE [Purchasing].[Vendor] CHECK CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]CREATE UNIQUE NONCLUSTERED INDEX [AK_Vendor_AccountNumber] ON [Purchasing].[Vendor] ([AccountNumber] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[CountryRegionCurrency]')) DROP Table [Sales].[CountryRegionCurrency]
GO
CREATE TABLE [Sales].[CountryRegionCurrency](	  [CountryRegionCode] NVARCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [CurrencyCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode] PRIMARY KEY ([CountryRegionCode] ASC, [CurrencyCode] ASC))ALTER TABLE [Sales].[CountryRegionCurrency] WITH CHECK ADD CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode] FOREIGN KEY([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])ALTER TABLE [Sales].[CountryRegionCurrency] CHECK CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]ALTER TABLE [Sales].[CountryRegionCurrency] WITH CHECK ADD CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode] FOREIGN KEY([CurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode])ALTER TABLE [Sales].[CountryRegionCurrency] CHECK CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode]CREATE NONCLUSTERED INDEX [IX_CountryRegionCurrency_CurrencyCode] ON [Sales].[CountryRegionCurrency] ([CurrencyCode] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[CreditCard]')) DROP Table [Sales].[CreditCard]
GO
CREATE TABLE [Sales].[CreditCard](	  [CreditCardID] INT NOT NULL IDENTITY(1,1)	, [CardType] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [CardNumber] NVARCHAR(25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ExpMonth] TINYINT NOT NULL	, [ExpYear] SMALLINT NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_CreditCard_CreditCardID] PRIMARY KEY ([CreditCardID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_CreditCard_CardNumber] ON [Sales].[CreditCard] ([CardNumber] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[Currency]')) DROP Table [Sales].[Currency]
GO
CREATE TABLE [Sales].[Currency](	  [CurrencyCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Currency_CurrencyCode] PRIMARY KEY ([CurrencyCode] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_Currency_Name] ON [Sales].[Currency] ([Name] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[CurrencyRate]')) DROP Table [Sales].[CurrencyRate]
GO
CREATE TABLE [Sales].[CurrencyRate](	  [CurrencyRateID] INT NOT NULL IDENTITY(1,1)	, [CurrencyRateDate] DATETIME NOT NULL	, [FromCurrencyCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ToCurrencyCode] NCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [AverageRate] MONEY NOT NULL	, [EndOfDayRate] MONEY NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_CurrencyRate_CurrencyRateID] PRIMARY KEY ([CurrencyRateID] ASC))ALTER TABLE [Sales].[CurrencyRate] WITH CHECK ADD CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode] FOREIGN KEY([FromCurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode])ALTER TABLE [Sales].[CurrencyRate] CHECK CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]ALTER TABLE [Sales].[CurrencyRate] WITH CHECK ADD CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode] FOREIGN KEY([ToCurrencyCode]) REFERENCES [Sales].[Currency] ([CurrencyCode])ALTER TABLE [Sales].[CurrencyRate] CHECK CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]CREATE UNIQUE NONCLUSTERED INDEX [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode] ON [Sales].[CurrencyRate] ([CurrencyRateDate] ASC, [FromCurrencyCode] ASC, [ToCurrencyCode] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[Customer]')) DROP Table [Sales].[Customer]
GO
CREATE TABLE [Sales].[Customer](	  [CustomerID] INT NOT NULL IDENTITY(1,1)	, [PersonID] INT NULL	, [StoreID] INT NULL	, [TerritoryID] INT NULL	, [AccountNumber] AS (isnull('AW'+[dbo].[ufnLeadingZeros]([CustomerID]),''))	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY ([CustomerID] ASC))ALTER TABLE [Sales].[Customer] WITH CHECK ADD CONSTRAINT [FK_Customer_Person_PersonID] FOREIGN KEY([PersonID]) REFERENCES [Person].[Person] ([BusinessEntityID])ALTER TABLE [Sales].[Customer] CHECK CONSTRAINT [FK_Customer_Person_PersonID]ALTER TABLE [Sales].[Customer] WITH CHECK ADD CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID] FOREIGN KEY([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])ALTER TABLE [Sales].[Customer] CHECK CONSTRAINT [FK_Customer_SalesTerritory_TerritoryID]ALTER TABLE [Sales].[Customer] WITH CHECK ADD CONSTRAINT [FK_Customer_Store_StoreID] FOREIGN KEY([StoreID]) REFERENCES [Sales].[Store] ([BusinessEntityID])ALTER TABLE [Sales].[Customer] CHECK CONSTRAINT [FK_Customer_Store_StoreID]CREATE UNIQUE NONCLUSTERED INDEX [AK_Customer_rowguid] ON [Sales].[Customer] ([rowguid] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_Customer_AccountNumber] ON [Sales].[Customer] ([AccountNumber] ASC)CREATE NONCLUSTERED INDEX [IX_Customer_TerritoryID] ON [Sales].[Customer] ([TerritoryID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[PersonCreditCard]')) DROP Table [Sales].[PersonCreditCard]
GO
CREATE TABLE [Sales].[PersonCreditCard](	  [BusinessEntityID] INT NOT NULL	, [CreditCardID] INT NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_PersonCreditCard_BusinessEntityID_CreditCardID] PRIMARY KEY ([BusinessEntityID] ASC, [CreditCardID] ASC))ALTER TABLE [Sales].[PersonCreditCard] WITH CHECK ADD CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])ALTER TABLE [Sales].[PersonCreditCard] CHECK CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID]ALTER TABLE [Sales].[PersonCreditCard] WITH CHECK ADD CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID] FOREIGN KEY([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID])ALTER TABLE [Sales].[PersonCreditCard] CHECK CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesOrderDetail]')) DROP Table [Sales].[SalesOrderDetail]
GO
CREATE TABLE [Sales].[SalesOrderDetail](	  [SalesOrderID] INT NOT NULL	, [SalesOrderDetailID] INT NOT NULL IDENTITY(1,1)	, [CarrierTrackingNumber] NVARCHAR(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [OrderQty] SMALLINT NOT NULL	, [ProductID] INT NOT NULL	, [SpecialOfferID] INT NOT NULL	, [UnitPrice] MONEY NOT NULL	, [UnitPriceDiscount] MONEY NOT NULL DEFAULT((0.0))	, [LineTotal] AS (isnull(([UnitPrice]*((1.0)-[UnitPriceDiscount]))*[OrderQty],(0.0)))	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] PRIMARY KEY ([SalesOrderID] ASC, [SalesOrderDetailID] ASC))ALTER TABLE [Sales].[SalesOrderDetail] WITH CHECK ADD CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID] FOREIGN KEY([ProductID], [SpecialOfferID]) REFERENCES [Sales].[SpecialOfferProduct] ([ProductID], [SpecialOfferID])ALTER TABLE [Sales].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID]ALTER TABLE [Sales].[SalesOrderDetail] WITH CHECK ADD CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID] FOREIGN KEY([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader] ([SalesOrderID]) ON DELETE CASCADEALTER TABLE [Sales].[SalesOrderDetail] CHECK CONSTRAINT [FK_SalesOrderDetail_SalesOrderHeader_SalesOrderID]CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderDetail_rowguid] ON [Sales].[SalesOrderDetail] ([rowguid] ASC)CREATE NONCLUSTERED INDEX [IX_SalesOrderDetail_ProductID] ON [Sales].[SalesOrderDetail] ([ProductID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesOrderHeader]')) DROP Table [Sales].[SalesOrderHeader]
GO
CREATE TABLE [Sales].[SalesOrderHeader](	  [SalesOrderID] INT NOT NULL IDENTITY(1,1)	, [RevisionNumber] TINYINT NOT NULL DEFAULT((0))	, [OrderDate] DATETIME NOT NULL DEFAULT(getdate())	, [DueDate] DATETIME NOT NULL	, [ShipDate] DATETIME NULL	, [Status] TINYINT NOT NULL DEFAULT((1))	, [OnlineOrderFlag] FLAG NOT NULL DEFAULT((1))	, [SalesOrderNumber] AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***'))	, [PurchaseOrderNumber] ORDERNUMBER COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [AccountNumber] ACCOUNTNUMBER COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [CustomerID] INT NOT NULL	, [SalesPersonID] INT NULL	, [TerritoryID] INT NULL	, [BillToAddressID] INT NOT NULL	, [ShipToAddressID] INT NOT NULL	, [ShipMethodID] INT NOT NULL	, [CreditCardID] INT NULL	, [CreditCardApprovalCode] VARCHAR(15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [CurrencyRateID] INT NULL	, [SubTotal] MONEY NOT NULL DEFAULT((0.00))	, [TaxAmt] MONEY NOT NULL DEFAULT((0.00))	, [Freight] MONEY NOT NULL DEFAULT((0.00))	, [TotalDue] AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0)))	, [Comment] NVARCHAR(128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY ([SalesOrderID] ASC))ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID] FOREIGN KEY([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_SalesPerson_SalesPersonID]ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID] FOREIGN KEY([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_SalesTerritory_TerritoryID]ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID] FOREIGN KEY([ShipMethodID]) REFERENCES [Purchasing].[ShipMethod] ([ShipMethodID])ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_ShipMethod_ShipMethodID]ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID] FOREIGN KEY([BillToAddressID]) REFERENCES [Person].[Address] ([AddressID])ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_Address_BillToAddressID]ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID] FOREIGN KEY([ShipToAddressID]) REFERENCES [Person].[Address] ([AddressID])ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_Address_ShipToAddressID]ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID] FOREIGN KEY([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID])ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_CreditCard_CreditCardID]ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID] FOREIGN KEY([CurrencyRateID]) REFERENCES [Sales].[CurrencyRate] ([CurrencyRateID])ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_CurrencyRate_CurrencyRateID]ALTER TABLE [Sales].[SalesOrderHeader] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] FOREIGN KEY([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID])ALTER TABLE [Sales].[SalesOrderHeader] CHECK CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID]CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_rowguid] ON [Sales].[SalesOrderHeader] ([rowguid] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesOrderHeader_SalesOrderNumber] ON [Sales].[SalesOrderHeader] ([SalesOrderNumber] ASC)CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID] ON [Sales].[SalesOrderHeader] ([CustomerID] ASC)CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_SalesPersonID] ON [Sales].[SalesOrderHeader] ([SalesPersonID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesOrderHeaderSalesReason]')) DROP Table [Sales].[SalesOrderHeaderSalesReason]
GO
CREATE TABLE [Sales].[SalesOrderHeaderSalesReason](	  [SalesOrderID] INT NOT NULL	, [SalesReasonID] INT NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesOrderHeaderSalesReason_SalesOrderID_SalesReasonID] PRIMARY KEY ([SalesOrderID] ASC, [SalesReasonID] ASC))ALTER TABLE [Sales].[SalesOrderHeaderSalesReason] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID] FOREIGN KEY([SalesReasonID]) REFERENCES [Sales].[SalesReason] ([SalesReasonID])ALTER TABLE [Sales].[SalesOrderHeaderSalesReason] CHECK CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesReason_SalesReasonID]ALTER TABLE [Sales].[SalesOrderHeaderSalesReason] WITH CHECK ADD CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID] FOREIGN KEY([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader] ([SalesOrderID]) ON DELETE CASCADEALTER TABLE [Sales].[SalesOrderHeaderSalesReason] CHECK CONSTRAINT [FK_SalesOrderHeaderSalesReason_SalesOrderHeader_SalesOrderID]

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesPerson]')) DROP Table [Sales].[SalesPerson]
GO
CREATE TABLE [Sales].[SalesPerson](	  [BusinessEntityID] INT NOT NULL	, [TerritoryID] INT NULL	, [SalesQuota] MONEY NULL	, [Bonus] MONEY NOT NULL DEFAULT((0.00))	, [CommissionPct] SMALLMONEY NOT NULL DEFAULT((0.00))	, [SalesYTD] MONEY NOT NULL DEFAULT((0.00))	, [SalesLastYear] MONEY NOT NULL DEFAULT((0.00))	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesPerson_BusinessEntityID] PRIMARY KEY ([BusinessEntityID] ASC))ALTER TABLE [Sales].[SalesPerson] WITH CHECK ADD CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID] FOREIGN KEY([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])ALTER TABLE [Sales].[SalesPerson] CHECK CONSTRAINT [FK_SalesPerson_SalesTerritory_TerritoryID]ALTER TABLE [Sales].[SalesPerson] WITH CHECK ADD CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])ALTER TABLE [Sales].[SalesPerson] CHECK CONSTRAINT [FK_SalesPerson_Employee_BusinessEntityID]CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPerson_rowguid] ON [Sales].[SalesPerson] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesPersonQuotaHistory]')) DROP Table [Sales].[SalesPersonQuotaHistory]
GO
CREATE TABLE [Sales].[SalesPersonQuotaHistory](	  [BusinessEntityID] INT NOT NULL	, [QuotaDate] DATETIME NOT NULL	, [SalesQuota] MONEY NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] PRIMARY KEY ([BusinessEntityID] ASC, [QuotaDate] ASC))ALTER TABLE [Sales].[SalesPersonQuotaHistory] WITH CHECK ADD CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])ALTER TABLE [Sales].[SalesPersonQuotaHistory] CHECK CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPersonQuotaHistory_rowguid] ON [Sales].[SalesPersonQuotaHistory] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesReason]')) DROP Table [Sales].[SalesReason]
GO
CREATE TABLE [Sales].[SalesReason](	  [SalesReasonID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ReasonType] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesReason_SalesReasonID] PRIMARY KEY ([SalesReasonID] ASC))

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesTaxRate]')) DROP Table [Sales].[SalesTaxRate]
GO
CREATE TABLE [Sales].[SalesTaxRate](	  [SalesTaxRateID] INT NOT NULL IDENTITY(1,1)	, [StateProvinceID] INT NOT NULL	, [TaxType] TINYINT NOT NULL	, [TaxRate] SMALLMONEY NOT NULL DEFAULT((0.00))	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesTaxRate_SalesTaxRateID] PRIMARY KEY ([SalesTaxRateID] ASC))ALTER TABLE [Sales].[SalesTaxRate] WITH CHECK ADD CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID] FOREIGN KEY([StateProvinceID]) REFERENCES [Person].[StateProvince] ([StateProvinceID])ALTER TABLE [Sales].[SalesTaxRate] CHECK CONSTRAINT [FK_SalesTaxRate_StateProvince_StateProvinceID]CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTaxRate_StateProvinceID_TaxType] ON [Sales].[SalesTaxRate] ([StateProvinceID] ASC, [TaxType] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTaxRate_rowguid] ON [Sales].[SalesTaxRate] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesTerritory]')) DROP Table [Sales].[SalesTerritory]
GO
CREATE TABLE [Sales].[SalesTerritory](	  [TerritoryID] INT NOT NULL IDENTITY(1,1)	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [CountryRegionCode] NVARCHAR(3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Group] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [SalesYTD] MONEY NOT NULL DEFAULT((0.00))	, [SalesLastYear] MONEY NOT NULL DEFAULT((0.00))	, [CostYTD] MONEY NOT NULL DEFAULT((0.00))	, [CostLastYear] MONEY NOT NULL DEFAULT((0.00))	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesTerritory_TerritoryID] PRIMARY KEY ([TerritoryID] ASC))ALTER TABLE [Sales].[SalesTerritory] WITH CHECK ADD CONSTRAINT [FK_SalesTerritory_CountryRegion_CountryRegionCode] FOREIGN KEY([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])ALTER TABLE [Sales].[SalesTerritory] CHECK CONSTRAINT [FK_SalesTerritory_CountryRegion_CountryRegionCode]CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritory_Name] ON [Sales].[SalesTerritory] ([Name] ASC)CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritory_rowguid] ON [Sales].[SalesTerritory] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SalesTerritoryHistory]')) DROP Table [Sales].[SalesTerritoryHistory]
GO
CREATE TABLE [Sales].[SalesTerritoryHistory](	  [BusinessEntityID] INT NOT NULL	, [TerritoryID] INT NOT NULL	, [StartDate] DATETIME NOT NULL	, [EndDate] DATETIME NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SalesTerritoryHistory_BusinessEntityID_StartDate_TerritoryID] PRIMARY KEY ([BusinessEntityID] ASC, [TerritoryID] ASC, [StartDate] ASC))ALTER TABLE [Sales].[SalesTerritoryHistory] WITH CHECK ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])ALTER TABLE [Sales].[SalesTerritoryHistory] CHECK CONSTRAINT [FK_SalesTerritoryHistory_SalesPerson_BusinessEntityID]ALTER TABLE [Sales].[SalesTerritoryHistory] WITH CHECK ADD CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID] FOREIGN KEY([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])ALTER TABLE [Sales].[SalesTerritoryHistory] CHECK CONSTRAINT [FK_SalesTerritoryHistory_SalesTerritory_TerritoryID]CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesTerritoryHistory_rowguid] ON [Sales].[SalesTerritoryHistory] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[ShoppingCartItem]')) DROP Table [Sales].[ShoppingCartItem]
GO
CREATE TABLE [Sales].[ShoppingCartItem](	  [ShoppingCartItemID] INT NOT NULL IDENTITY(1,1)	, [ShoppingCartID] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Quantity] INT NOT NULL DEFAULT((1))	, [ProductID] INT NOT NULL	, [DateCreated] DATETIME NOT NULL DEFAULT(getdate())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_ShoppingCartItem_ShoppingCartItemID] PRIMARY KEY ([ShoppingCartItemID] ASC))ALTER TABLE [Sales].[ShoppingCartItem] WITH CHECK ADD CONSTRAINT [FK_ShoppingCartItem_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Sales].[ShoppingCartItem] CHECK CONSTRAINT [FK_ShoppingCartItem_Product_ProductID]CREATE NONCLUSTERED INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID] ON [Sales].[ShoppingCartItem] ([ShoppingCartID] ASC, [ProductID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SpecialOffer]')) DROP Table [Sales].[SpecialOffer]
GO
CREATE TABLE [Sales].[SpecialOffer](	  [SpecialOfferID] INT NOT NULL IDENTITY(1,1)	, [Description] NVARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [DiscountPct] SMALLMONEY NOT NULL DEFAULT((0.00))	, [Type] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [Category] NVARCHAR(50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [StartDate] DATETIME NOT NULL	, [EndDate] DATETIME NOT NULL	, [MinQty] INT NOT NULL DEFAULT((0))	, [MaxQty] INT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SpecialOffer_SpecialOfferID] PRIMARY KEY ([SpecialOfferID] ASC))CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOffer_rowguid] ON [Sales].[SpecialOffer] ([rowguid] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[SpecialOfferProduct]')) DROP Table [Sales].[SpecialOfferProduct]
GO
CREATE TABLE [Sales].[SpecialOfferProduct](	  [SpecialOfferID] INT NOT NULL	, [ProductID] INT NOT NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_SpecialOfferProduct_SpecialOfferID_ProductID] PRIMARY KEY ([SpecialOfferID] ASC, [ProductID] ASC))ALTER TABLE [Sales].[SpecialOfferProduct] WITH CHECK ADD CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID] FOREIGN KEY([ProductID]) REFERENCES [Production].[Product] ([ProductID])ALTER TABLE [Sales].[SpecialOfferProduct] CHECK CONSTRAINT [FK_SpecialOfferProduct_Product_ProductID]ALTER TABLE [Sales].[SpecialOfferProduct] WITH CHECK ADD CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID] FOREIGN KEY([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer] ([SpecialOfferID])ALTER TABLE [Sales].[SpecialOfferProduct] CHECK CONSTRAINT [FK_SpecialOfferProduct_SpecialOffer_SpecialOfferID]CREATE UNIQUE NONCLUSTERED INDEX [AK_SpecialOfferProduct_rowguid] ON [Sales].[SpecialOfferProduct] ([rowguid] ASC)CREATE NONCLUSTERED INDEX [IX_SpecialOfferProduct_ProductID] ON [Sales].[SpecialOfferProduct] ([ProductID] ASC)

GO
IF EXISTS(SELECT 1 FROM sys.Tables WHERE[object_id] = OBJECT_ID('[Sales].[Store]')) DROP Table [Sales].[Store]
GO
CREATE TABLE [Sales].[Store](	  [BusinessEntityID] INT NOT NULL	, [Name] NAME COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL	, [SalesPersonID] INT NULL	, [Demographics] XML NULL	, [rowguid] UNIQUEIDENTIFIER NOT NULL DEFAULT(newid())	, [ModifiedDate] DATETIME NOT NULL DEFAULT(getdate())	, CONSTRAINT [PK_Store_BusinessEntityID] PRIMARY KEY ([BusinessEntityID] ASC))ALTER TABLE [Sales].[Store] WITH CHECK ADD CONSTRAINT [FK_Store_SalesPerson_SalesPersonID] FOREIGN KEY([SalesPersonID]) REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])ALTER TABLE [Sales].[Store] CHECK CONSTRAINT [FK_Store_SalesPerson_SalesPersonID]ALTER TABLE [Sales].[Store] WITH CHECK ADD CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID] FOREIGN KEY([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])ALTER TABLE [Sales].[Store] CHECK CONSTRAINT [FK_Store_BusinessEntity_BusinessEntityID]CREATE UNIQUE NONCLUSTERED INDEX [AK_Store_rowguid] ON [Sales].[Store] ([rowguid] ASC)CREATE NONCLUSTERED INDEX [IX_Store_SalesPersonID] ON [Sales].[Store] ([SalesPersonID] ASC)

GO

USE [CopyOfAdventureWorks2019]
GO
IF EXISTS(SELECT 1 FROM sys.synonyms  WHERE[object_id] = OBJECT_ID('[HumanResources].[Action]')) DROP SYNONYM [HumanResources].[Action]
GO
CREATE SYNONYM [HumanResources].[Action] FOR 

GO

USE [CopyOfAdventureWorks2019]
GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[dbo].[TestForIndex]')) DROP VIEW [dbo].[TestForIndex]
GO
create   view TestForIndex

with schemabinding

as

SELECT [BusinessEntityID]

      ,[EmailAddressID]

      ,[EmailAddress]

      

  FROM [Person].[EmailAddress]

  LEFT JOIN [Sales].[SpecialOfferProduct] s ON [BusinessEntityID]= s.ProductID


GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[HumanResources].[vEmployee]')) DROP VIEW [HumanResources].[vEmployee]
GO




CREATE VIEW [HumanResources].[vEmployee] 



AS 



SELECT 



    e.[BusinessEntityID]



    ,p.[Title]



    ,p.[FirstName]



    ,p.[MiddleName]



    ,p.[LastName]



    ,p.[Suffix]



    ,e.[JobTitle]  



    ,pp.[PhoneNumber]



    ,pnt.[Name] AS [PhoneNumberType]



    ,ea.[EmailAddress]



    ,p.[EmailPromotion]



    ,a.[AddressLine1]



    ,a.[AddressLine2]



    ,a.[City]



    ,sp.[Name] AS [StateProvinceName] 



    ,a.[PostalCode]



    ,cr.[Name] AS [CountryRegionName] 



    ,p.[AdditionalContactInfo]



FROM [HumanResources].[Employee] e



	INNER JOIN [Person].[Person] p



	ON p.[BusinessEntityID] = e.[BusinessEntityID]



    INNER JOIN [Person].[BusinessEntityAddress] bea 



    ON bea.[BusinessEntityID] = e.[BusinessEntityID] 



    INNER JOIN [Person].[Address] a 



    ON a.[AddressID] = bea.[AddressID]



    INNER JOIN [Person].[StateProvince] sp 



    ON sp.[StateProvinceID] = a.[StateProvinceID]



    INNER JOIN [Person].[CountryRegion] cr 



    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]



    LEFT OUTER JOIN [Person].[PersonPhone] pp



    ON pp.BusinessEntityID = p.[BusinessEntityID]



    LEFT OUTER JOIN [Person].[PhoneNumberType] pnt



    ON pp.[PhoneNumberTypeID] = pnt.[PhoneNumberTypeID]



    LEFT OUTER JOIN [Person].[EmailAddress] ea



    ON p.[BusinessEntityID] = ea.[BusinessEntityID];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[HumanResources].[vEmployeeDepartment]')) DROP VIEW [HumanResources].[vEmployeeDepartment]
GO




CREATE VIEW [HumanResources].[vEmployeeDepartment] 



AS 



SELECT 



    e.[BusinessEntityID] 



    ,p.[Title] 



    ,p.[FirstName] 



    ,p.[MiddleName] 



    ,p.[LastName] 



    ,p.[Suffix] 



    ,e.[JobTitle]



    ,d.[Name] AS [Department] 



    ,d.[GroupName] 



    ,edh.[StartDate] 



FROM [HumanResources].[Employee] e



	INNER JOIN [Person].[Person] p



	ON p.[BusinessEntityID] = e.[BusinessEntityID]



    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 



    ON e.[BusinessEntityID] = edh.[BusinessEntityID] 



    INNER JOIN [HumanResources].[Department] d 



    ON edh.[DepartmentID] = d.[DepartmentID] 



WHERE edh.EndDate IS NULL






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[HumanResources].[vEmployeeDepartmentHistory]')) DROP VIEW [HumanResources].[vEmployeeDepartmentHistory]
GO




CREATE VIEW [HumanResources].[vEmployeeDepartmentHistory] 



AS 



SELECT 



    e.[BusinessEntityID] 



    ,p.[Title] 



    ,p.[FirstName] 



    ,p.[MiddleName] 



    ,p.[LastName] 



    ,p.[Suffix] 



    ,s.[Name] AS [Shift]



    ,d.[Name] AS [Department] 



    ,d.[GroupName] 



    ,edh.[StartDate] 



    ,edh.[EndDate]



FROM [HumanResources].[Employee] e



	INNER JOIN [Person].[Person] p



	ON p.[BusinessEntityID] = e.[BusinessEntityID]



    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 



    ON e.[BusinessEntityID] = edh.[BusinessEntityID] 



    INNER JOIN [HumanResources].[Department] d 



    ON edh.[DepartmentID] = d.[DepartmentID] 



    INNER JOIN [HumanResources].[Shift] s



    ON s.[ShiftID] = edh.[ShiftID];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[HumanResources].[vJobCandidate]')) DROP VIEW [HumanResources].[vJobCandidate]
GO




CREATE VIEW [HumanResources].[vJobCandidate] 



AS 



SELECT 



    jc.[JobCandidateID] 



    ,jc.[BusinessEntityID] 



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (/Resume/Name/Name.Prefix)[1]', 'nvarchar(30)') AS [Name.Prefix] 



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";



        (/Resume/Name/Name.First)[1]', 'nvarchar(30)') AS [Name.First] 



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (/Resume/Name/Name.Middle)[1]', 'nvarchar(30)') AS [Name.Middle] 



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (/Resume/Name/Name.Last)[1]', 'nvarchar(30)') AS [Name.Last] 



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (/Resume/Name/Name.Suffix)[1]', 'nvarchar(30)') AS [Name.Suffix] 



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (/Resume/Skills)[1]', 'nvarchar(max)') AS [Skills] 



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Address/Addr.Type)[1]', 'nvarchar(30)') AS [Addr.Type]



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Address/Addr.Location/Location/Loc.CountryRegion)[1]', 'nvarchar(100)') AS [Addr.Loc.CountryRegion]



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Address/Addr.Location/Location/Loc.State)[1]', 'nvarchar(100)') AS [Addr.Loc.State]



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Address/Addr.Location/Location/Loc.City)[1]', 'nvarchar(100)') AS [Addr.Loc.City]



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Address/Addr.PostalCode)[1]', 'nvarchar(20)') AS [Addr.PostalCode]



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (/Resume/EMail)[1]', 'nvarchar(max)') AS [EMail] 



    ,[Resume].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (/Resume/WebSite)[1]', 'nvarchar(max)') AS [WebSite] 



    ,jc.[ModifiedDate] 



FROM [HumanResources].[JobCandidate] jc 



CROSS APPLY jc.[Resume].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



    /Resume') AS Resume(ref);






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[HumanResources].[vJobCandidateEducation]')) DROP VIEW [HumanResources].[vJobCandidateEducation]
GO




CREATE VIEW [HumanResources].[vJobCandidateEducation] 



AS 



SELECT 



    jc.[JobCandidateID] 



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.Level)[1]', 'nvarchar(max)') AS [Edu.Level]



    ,CONVERT(datetime, REPLACE([Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.StartDate)[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [Edu.StartDate] 



    ,CONVERT(datetime, REPLACE([Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.EndDate)[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [Edu.EndDate] 



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.Degree)[1]', 'nvarchar(50)') AS [Edu.Degree]



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.Major)[1]', 'nvarchar(50)') AS [Edu.Major]



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.Minor)[1]', 'nvarchar(50)') AS [Edu.Minor]



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.GPA)[1]', 'nvarchar(5)') AS [Edu.GPA]



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.GPAScale)[1]', 'nvarchar(5)') AS [Edu.GPAScale]



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.School)[1]', 'nvarchar(100)') AS [Edu.School]



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.Location/Location/Loc.CountryRegion)[1]', 'nvarchar(100)') AS [Edu.Loc.CountryRegion]



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.Location/Location/Loc.State)[1]', 'nvarchar(100)') AS [Edu.Loc.State]



    ,[Education].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Edu.Location/Location/Loc.City)[1]', 'nvarchar(100)') AS [Edu.Loc.City]



FROM [HumanResources].[JobCandidate] jc 



CROSS APPLY jc.[Resume].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



    /Resume/Education') AS [Education](ref);






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[HumanResources].[vJobCandidateEmployment]')) DROP VIEW [HumanResources].[vJobCandidateEmployment]
GO




CREATE VIEW [HumanResources].[vJobCandidateEmployment] 



AS 



SELECT 



    jc.[JobCandidateID] 



    ,CONVERT(datetime, REPLACE([Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.StartDate)[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [Emp.StartDate] 



    ,CONVERT(datetime, REPLACE([Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.EndDate)[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [Emp.EndDate] 



    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.OrgName)[1]', 'nvarchar(100)') AS [Emp.OrgName]



    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.JobTitle)[1]', 'nvarchar(100)') AS [Emp.JobTitle]



    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.Responsibility)[1]', 'nvarchar(max)') AS [Emp.Responsibility]



    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.FunctionCategory)[1]', 'nvarchar(max)') AS [Emp.FunctionCategory]



    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.IndustryCategory)[1]', 'nvarchar(max)') AS [Emp.IndustryCategory]



    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.Location/Location/Loc.CountryRegion)[1]', 'nvarchar(max)') AS [Emp.Loc.CountryRegion]



    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.Location/Location/Loc.State)[1]', 'nvarchar(max)') AS [Emp.Loc.State]



    ,[Employment].ref.value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



        (Emp.Location/Location/Loc.City)[1]', 'nvarchar(max)') AS [Emp.Loc.City]



FROM [HumanResources].[JobCandidate] jc 



CROSS APPLY jc.[Resume].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 



    /Resume/Employment') AS Employment(ref);






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Person].[vAdditionalContactInfo]')) DROP VIEW [Person].[vAdditionalContactInfo]
GO




CREATE VIEW [Person].[vAdditionalContactInfo] 



AS 



SELECT 



    [BusinessEntityID] 



    ,[FirstName]



    ,[MiddleName]



    ,[LastName]



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:telephoneNumber)[1]/act:number', 'nvarchar(50)') AS [TelephoneNumber] 



    ,LTRIM(RTRIM([ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:telephoneNumber/act:SpecialInstructions/text())[1]', 'nvarchar(max)'))) AS [TelephoneSpecialInstructions] 



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes";



        (act:homePostalAddress/act:Street)[1]', 'nvarchar(50)') AS [Street] 



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:homePostalAddress/act:City)[1]', 'nvarchar(50)') AS [City] 



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:homePostalAddress/act:StateProvince)[1]', 'nvarchar(50)') AS [StateProvince] 



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:homePostalAddress/act:PostalCode)[1]', 'nvarchar(50)') AS [PostalCode] 



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:homePostalAddress/act:CountryRegion)[1]', 'nvarchar(50)') AS [CountryRegion] 



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:homePostalAddress/act:SpecialInstructions/text())[1]', 'nvarchar(max)') AS [HomeAddressSpecialInstructions] 



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:eMail/act:eMailAddress)[1]', 'nvarchar(128)') AS [EMailAddress] 



    ,LTRIM(RTRIM([ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:eMail/act:SpecialInstructions/text())[1]', 'nvarchar(max)'))) AS [EMailSpecialInstructions] 



    ,[ContactInfo].ref.value(N'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



        declare namespace act="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactTypes"; 



        (act:eMail/act:SpecialInstructions/act:telephoneNumber/act:number)[1]', 'nvarchar(50)') AS [EMailTelephoneNumber] 



    ,[rowguid] 


    ,[ModifiedDate]



FROM [Person].[Person]



OUTER APPLY [AdditionalContactInfo].nodes(



    'declare namespace ci="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ContactInfo"; 



    /ci:AdditionalContactInfo') AS ContactInfo(ref) 



WHERE [AdditionalContactInfo] IS NOT NULL;






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Person].[vStateProvinceCountryRegion]')) DROP VIEW [Person].[vStateProvinceCountryRegion]
GO




CREATE VIEW [Person].[vStateProvinceCountryRegion] 



WITH SCHEMABINDING 



AS 



SELECT 



    sp.[StateProvinceID] 



    ,sp.[StateProvinceCode] 



    ,sp.[IsOnlyStateProvinceFlag] 



    ,sp.[Name] AS [StateProvinceName] 



    ,sp.[TerritoryID] 



    ,cr.[CountryRegionCode] 



    ,cr.[Name] AS [CountryRegionName]



FROM [Person].[StateProvince] sp 



    INNER JOIN [Person].[CountryRegion] cr 



    ON sp.[CountryRegionCode] = cr.[CountryRegionCode];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Production].[vProductAndDescription]')) DROP VIEW [Production].[vProductAndDescription]
GO




CREATE VIEW [Production].[vProductAndDescription] 



WITH SCHEMABINDING 



AS 



-- View (indexed or standard) to display products and product descriptions by language.



SELECT 



    p.[ProductID] 



    ,p.[Name] 



    ,pm.[Name] AS [ProductModel] 



    ,pmx.[CultureID] 



    ,pd.[Description] 



FROM [Production].[Product] p 



    INNER JOIN [Production].[ProductModel] pm 



    ON p.[ProductModelID] = pm.[ProductModelID] 



    INNER JOIN [Production].[ProductModelProductDescriptionCulture] pmx 



    ON pm.[ProductModelID] = pmx.[ProductModelID] 



    INNER JOIN [Production].[ProductDescription] pd 



    ON pmx.[ProductDescriptionID] = pd.[ProductDescriptionID];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Production].[vProductModelCatalogDescription]')) DROP VIEW [Production].[vProductModelCatalogDescription]
GO




CREATE VIEW [Production].[vProductModelCatalogDescription] 



AS 



SELECT 



    [ProductModelID] 



    ,[Name] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace html="http://www.w3.org/1999/xhtml"; 



        (/p1:ProductDescription/p1:Summary/html:p)[1]', 'nvarchar(max)') AS [Summary] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Manufacturer/p1:Name)[1]', 'nvarchar(max)') AS [Manufacturer] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Manufacturer/p1:Copyright)[1]', 'nvarchar(30)') AS [Copyright] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Manufacturer/p1:ProductURL)[1]', 'nvarchar(256)') AS [ProductURL] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wm="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"; 



        (/p1:ProductDescription/p1:Features/wm:Warranty/wm:WarrantyPeriod)[1]', 'nvarchar(256)') AS [WarrantyPeriod] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wm="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"; 



        (/p1:ProductDescription/p1:Features/wm:Warranty/wm:Description)[1]', 'nvarchar(256)') AS [WarrantyDescription] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wm="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"; 



        (/p1:ProductDescription/p1:Features/wm:Maintenance/wm:NoOfYears)[1]', 'nvarchar(256)') AS [NoOfYears] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wm="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelWarrAndMain"; 



        (/p1:ProductDescription/p1:Features/wm:Maintenance/wm:Description)[1]', 'nvarchar(256)') AS [MaintenanceDescription] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 



        (/p1:ProductDescription/p1:Features/wf:wheel)[1]', 'nvarchar(256)') AS [Wheel] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 



        (/p1:ProductDescription/p1:Features/wf:saddle)[1]', 'nvarchar(256)') AS [Saddle] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 



        (/p1:ProductDescription/p1:Features/wf:pedal)[1]', 'nvarchar(256)') AS [Pedal] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 



        (/p1:ProductDescription/p1:Features/wf:BikeFrame)[1]', 'nvarchar(max)') AS [BikeFrame] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        declare namespace wf="http://www.adventure-works.com/schemas/OtherFeatures"; 



        (/p1:ProductDescription/p1:Features/wf:crankset)[1]', 'nvarchar(256)') AS [Crankset] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Picture/p1:Angle)[1]', 'nvarchar(256)') AS [PictureAngle] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Picture/p1:Size)[1]', 'nvarchar(256)') AS [PictureSize] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Picture/p1:ProductPhotoID)[1]', 'nvarchar(256)') AS [ProductPhotoID] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Specifications/Material)[1]', 'nvarchar(256)') AS [Material] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Specifications/Color)[1]', 'nvarchar(256)') AS [Color] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Specifications/ProductLine)[1]', 'nvarchar(256)') AS [ProductLine] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Specifications/Style)[1]', 'nvarchar(256)') AS [Style] 



    ,[CatalogDescription].value(N'declare namespace p1="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelDescription"; 



        (/p1:ProductDescription/p1:Specifications/RiderExperience)[1]', 'nvarchar(1024)') AS [RiderExperience] 



    ,[rowguid] 



    ,[ModifiedDate]



FROM [Production].[ProductModel] 



WHERE [CatalogDescription] IS NOT NULL;






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Production].[vProductModelInstructions]')) DROP VIEW [Production].[vProductModelInstructions]
GO




CREATE VIEW [Production].[vProductModelInstructions] 



AS 



SELECT 



    [ProductModelID] 



    ,[Name] 



    ,[Instructions].value(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 



        (/root/text())[1]', 'nvarchar(max)') AS [Instructions] 



    ,[MfgInstructions].ref.value('@LocationID[1]', 'int') AS [LocationID] 



    ,[MfgInstructions].ref.value('@SetupHours[1]', 'decimal(9, 4)') AS [SetupHours] 



    ,[MfgInstructions].ref.value('@MachineHours[1]', 'decimal(9, 4)') AS [MachineHours] 



    ,[MfgInstructions].ref.value('@LaborHours[1]', 'decimal(9, 4)') AS [LaborHours] 



    ,[MfgInstructions].ref.value('@LotSize[1]', 'int') AS [LotSize] 



    ,[Steps].ref.value('string(.)[1]', 'nvarchar(1024)') AS [Step] 



    ,[rowguid] 



    ,[ModifiedDate]



FROM [Production].[ProductModel] 



CROSS APPLY [Instructions].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 



    /root/Location') MfgInstructions(ref)



CROSS APPLY [MfgInstructions].ref.nodes('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/ProductModelManuInstructions"; 



    step') Steps(ref);






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Purchasing].[vVendorWithAddresses]')) DROP VIEW [Purchasing].[vVendorWithAddresses]
GO




CREATE VIEW [Purchasing].[vVendorWithAddresses] AS 



SELECT 



    v.[BusinessEntityID]



    ,v.[Name]



    ,at.[Name] AS [AddressType]



    ,a.[AddressLine1] 



    ,a.[AddressLine2] 



    ,a.[City] 



    ,sp.[Name] AS [StateProvinceName] 



    ,a.[PostalCode] 



    ,cr.[Name] AS [CountryRegionName] 



FROM [Purchasing].[Vendor] v



    INNER JOIN [Person].[BusinessEntityAddress] bea 



    ON bea.[BusinessEntityID] = v.[BusinessEntityID] 



    INNER JOIN [Person].[Address] a 



    ON a.[AddressID] = bea.[AddressID]



    INNER JOIN [Person].[StateProvince] sp 



    ON sp.[StateProvinceID] = a.[StateProvinceID]



    INNER JOIN [Person].[CountryRegion] cr 



    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]



    INNER JOIN [Person].[AddressType] at 



    ON at.[AddressTypeID] = bea.[AddressTypeID];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Purchasing].[vVendorWithContacts]')) DROP VIEW [Purchasing].[vVendorWithContacts]
GO




CREATE VIEW [Purchasing].[vVendorWithContacts] AS 



SELECT 



    v.[BusinessEntityID]



    ,v.[Name]



    ,ct.[Name] AS [ContactType] 



    ,p.[Title] 



    ,p.[FirstName] 



    ,p.[MiddleName] 



    ,p.[LastName] 



    ,p.[Suffix] 



    ,pp.[PhoneNumber] 



	,pnt.[Name] AS [PhoneNumberType]



    ,ea.[EmailAddress] 



    ,p.[EmailPromotion] 



FROM [Purchasing].[Vendor] v



    INNER JOIN [Person].[BusinessEntityContact] bec 



    ON bec.[BusinessEntityID] = v.[BusinessEntityID]



	INNER JOIN [Person].ContactType ct



	ON ct.[ContactTypeID] = bec.[ContactTypeID]



	INNER JOIN [Person].[Person] p



	ON p.[BusinessEntityID] = bec.[PersonID]



	LEFT OUTER JOIN [Person].[EmailAddress] ea



	ON ea.[BusinessEntityID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[PersonPhone] pp



	ON pp.[BusinessEntityID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt



	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Sales].[vIndividualCustomer]')) DROP VIEW [Sales].[vIndividualCustomer]
GO




CREATE VIEW [Sales].[vIndividualCustomer] 



AS 



SELECT 



    p.[BusinessEntityID]



    ,p.[Title]



    ,p.[FirstName]



    ,p.[MiddleName]



    ,p.[LastName]



    ,p.[Suffix]



    ,pp.[PhoneNumber]



	,pnt.[Name] AS [PhoneNumberType]



    ,ea.[EmailAddress]



    ,p.[EmailPromotion]



    ,at.[Name] AS [AddressType]



    ,a.[AddressLine1]



    ,a.[AddressLine2]



    ,a.[City]



    ,[StateProvinceName] = sp.[Name]



    ,a.[PostalCode]



    ,[CountryRegionName] = cr.[Name]



    ,p.[Demographics]



FROM [Person].[Person] p



    INNER JOIN [Person].[BusinessEntityAddress] bea 



    ON bea.[BusinessEntityID] = p.[BusinessEntityID] 



    INNER JOIN [Person].[Address] a 



    ON a.[AddressID] = bea.[AddressID]



    INNER JOIN [Person].[StateProvince] sp 



    ON sp.[StateProvinceID] = a.[StateProvinceID]



    INNER JOIN [Person].[CountryRegion] cr 



    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]



    INNER JOIN [Person].[AddressType] at 



    ON at.[AddressTypeID] = bea.[AddressTypeID]



	INNER JOIN [Sales].[Customer] c



	ON c.[PersonID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[EmailAddress] ea



	ON ea.[BusinessEntityID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[PersonPhone] pp



	ON pp.[BusinessEntityID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt



	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID]



WHERE c.StoreID IS NULL;






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Sales].[vPersonDemographics]')) DROP VIEW [Sales].[vPersonDemographics]
GO




CREATE VIEW [Sales].[vPersonDemographics] 



AS 



SELECT 



    p.[BusinessEntityID] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        TotalPurchaseYTD[1]', 'money') AS [TotalPurchaseYTD] 



    ,CONVERT(datetime, REPLACE([IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        DateFirstPurchase[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [DateFirstPurchase] 



    ,CONVERT(datetime, REPLACE([IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        BirthDate[1]', 'nvarchar(20)') ,'Z', ''), 101) AS [BirthDate] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        MaritalStatus[1]', 'nvarchar(1)') AS [MaritalStatus] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        YearlyIncome[1]', 'nvarchar(30)') AS [YearlyIncome] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        Gender[1]', 'nvarchar(1)') AS [Gender] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        TotalChildren[1]', 'integer') AS [TotalChildren] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        NumberChildrenAtHome[1]', 'integer') AS [NumberChildrenAtHome] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        Education[1]', 'nvarchar(30)') AS [Education] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        Occupation[1]', 'nvarchar(30)') AS [Occupation] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        HomeOwnerFlag[1]', 'bit') AS [HomeOwnerFlag] 



    ,[IndividualSurvey].[ref].[value](N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



        NumberCarsOwned[1]', 'integer') AS [NumberCarsOwned] 



FROM [Person].[Person] p 



CROSS APPLY p.[Demographics].nodes(N'declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"; 



    /IndividualSurvey') AS [IndividualSurvey](ref) 



WHERE [Demographics] IS NOT NULL;






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Sales].[vSalesPerson]')) DROP VIEW [Sales].[vSalesPerson]
GO




CREATE VIEW [Sales].[vSalesPerson] 



AS 



SELECT 



    s.[BusinessEntityID]



    ,p.[Title]



    ,p.[FirstName]



    ,p.[MiddleName]



    ,p.[LastName]



    ,p.[Suffix]



    ,e.[JobTitle]



    ,pp.[PhoneNumber]



	,pnt.[Name] AS [PhoneNumberType]



    ,ea.[EmailAddress]



    ,p.[EmailPromotion]



    ,a.[AddressLine1]



    ,a.[AddressLine2]



    ,a.[City]



    ,[StateProvinceName] = sp.[Name]



    ,a.[PostalCode]



    ,[CountryRegionName] = cr.[Name]



    ,[TerritoryName] = st.[Name]



    ,[TerritoryGroup] = st.[Group]



    ,s.[SalesQuota]



    ,s.[SalesYTD]



    ,s.[SalesLastYear]



FROM [Sales].[SalesPerson] s



    INNER JOIN [HumanResources].[Employee] e 



    ON e.[BusinessEntityID] = s.[BusinessEntityID]



	INNER JOIN [Person].[Person] p



	ON p.[BusinessEntityID] = s.[BusinessEntityID]



    INNER JOIN [Person].[BusinessEntityAddress] bea 



    ON bea.[BusinessEntityID] = s.[BusinessEntityID] 



    INNER JOIN [Person].[Address] a 



    ON a.[AddressID] = bea.[AddressID]



    INNER JOIN [Person].[StateProvince] sp 



    ON sp.[StateProvinceID] = a.[StateProvinceID]



    INNER JOIN [Person].[CountryRegion] cr 



    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]



    LEFT OUTER JOIN [Sales].[SalesTerritory] st 



    ON st.[TerritoryID] = s.[TerritoryID]



	LEFT OUTER JOIN [Person].[EmailAddress] ea



	ON ea.[BusinessEntityID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[PersonPhone] pp



	ON pp.[BusinessEntityID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt



	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Sales].[vSalesPersonSalesByFiscalYears]')) DROP VIEW [Sales].[vSalesPersonSalesByFiscalYears]
GO




CREATE VIEW [Sales].[vSalesPersonSalesByFiscalYears] 



AS 



SELECT 



    pvt.[SalesPersonID]



    ,pvt.[FullName]



    ,pvt.[JobTitle]



    ,pvt.[SalesTerritory]



    ,pvt.[2002]



    ,pvt.[2003]



    ,pvt.[2004] 



FROM (SELECT 



        soh.[SalesPersonID]



        ,p.[FirstName] + ' ' + COALESCE(p.[MiddleName], '') + ' ' + p.[LastName] AS [FullName]



        ,e.[JobTitle]



        ,st.[Name] AS [SalesTerritory]



        ,soh.[SubTotal]



        ,YEAR(DATEADD(m, 6, soh.[OrderDate])) AS [FiscalYear] 



    FROM [Sales].[SalesPerson] sp 



        INNER JOIN [Sales].[SalesOrderHeader] soh 



        ON sp.[BusinessEntityID] = soh.[SalesPersonID]



        INNER JOIN [Sales].[SalesTerritory] st 



        ON sp.[TerritoryID] = st.[TerritoryID] 



        INNER JOIN [HumanResources].[Employee] e 



        ON soh.[SalesPersonID] = e.[BusinessEntityID] 



		INNER JOIN [Person].[Person] p



		ON p.[BusinessEntityID] = sp.[BusinessEntityID]



	 ) AS soh 



PIVOT 



(



    SUM([SubTotal]) 



    FOR [FiscalYear] 



    IN ([2002], [2003], [2004])



) AS pvt;






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Sales].[vStoreWithAddresses]')) DROP VIEW [Sales].[vStoreWithAddresses]
GO




CREATE VIEW [Sales].[vStoreWithAddresses] AS 



SELECT 



    s.[BusinessEntityID] 



    ,s.[Name] 



    ,at.[Name] AS [AddressType]



    ,a.[AddressLine1] 



    ,a.[AddressLine2] 



    ,a.[City] 



    ,sp.[Name] AS [StateProvinceName] 



    ,a.[PostalCode] 



    ,cr.[Name] AS [CountryRegionName] 



FROM [Sales].[Store] s



    INNER JOIN [Person].[BusinessEntityAddress] bea 



    ON bea.[BusinessEntityID] = s.[BusinessEntityID] 



    INNER JOIN [Person].[Address] a 



    ON a.[AddressID] = bea.[AddressID]



    INNER JOIN [Person].[StateProvince] sp 



    ON sp.[StateProvinceID] = a.[StateProvinceID]



    INNER JOIN [Person].[CountryRegion] cr 



    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]



    INNER JOIN [Person].[AddressType] at 



    ON at.[AddressTypeID] = bea.[AddressTypeID];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Sales].[vStoreWithContacts]')) DROP VIEW [Sales].[vStoreWithContacts]
GO




CREATE VIEW [Sales].[vStoreWithContacts] AS 



SELECT 



    s.[BusinessEntityID] 



    ,s.[Name] 



    ,ct.[Name] AS [ContactType] 



    ,p.[Title] 



    ,p.[FirstName] 



    ,p.[MiddleName] 



    ,p.[LastName] 



    ,p.[Suffix] 



    ,pp.[PhoneNumber] 



	,pnt.[Name] AS [PhoneNumberType]



    ,ea.[EmailAddress] 



    ,p.[EmailPromotion] 



FROM [Sales].[Store] s



    INNER JOIN [Person].[BusinessEntityContact] bec 



    ON bec.[BusinessEntityID] = s.[BusinessEntityID]



	INNER JOIN [Person].[ContactType] ct



	ON ct.[ContactTypeID] = bec.[ContactTypeID]



	INNER JOIN [Person].[Person] p



	ON p.[BusinessEntityID] = bec.[PersonID]



	LEFT OUTER JOIN [Person].[EmailAddress] ea



	ON ea.[BusinessEntityID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[PersonPhone] pp



	ON pp.[BusinessEntityID] = p.[BusinessEntityID]



	LEFT OUTER JOIN [Person].[PhoneNumberType] pnt



	ON pnt.[PhoneNumberTypeID] = pp.[PhoneNumberTypeID];






GO
IF EXISTS(SELECT 1 FROM sys.views  WHERE[object_id] = OBJECT_ID('[Sales].[vStoreWithDemographics]')) DROP VIEW [Sales].[vStoreWithDemographics]
GO




CREATE VIEW [Sales].[vStoreWithDemographics] AS 



SELECT 



    s.[BusinessEntityID] 



    ,s.[Name] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/AnnualSales)[1]', 'money') AS [AnnualSales] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/AnnualRevenue)[1]', 'money') AS [AnnualRevenue] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/BankName)[1]', 'nvarchar(50)') AS [BankName] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/BusinessType)[1]', 'nvarchar(5)') AS [BusinessType] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/YearOpened)[1]', 'integer') AS [YearOpened] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/Specialty)[1]', 'nvarchar(50)') AS [Specialty] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/SquareFeet)[1]', 'integer') AS [SquareFeet] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/Brands)[1]', 'nvarchar(30)') AS [Brands] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/Internet)[1]', 'nvarchar(30)') AS [Internet] 



    ,s.[Demographics].value('declare default element namespace "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/StoreSurvey"; 



        (/StoreSurvey/NumberEmployees)[1]', 'integer') AS [NumberEmployees] 



FROM [Sales].[Store] s;






GO

USE [CopyOfAdventureWorks2019]
GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetAccountingStartDate]
GO


CREATE FUNCTION [dbo].[ufnGetAccountingStartDate]()

RETURNS [datetime] 

AS 

BEGIN

    RETURN CONVERT(datetime, '20030701', 112);

END;


GO
DROP FUNCTION IF EXISTS [dbo].[ufnLeadingZeros]
GO


CREATE FUNCTION [dbo].[ufnLeadingZeros](

    @Value int

) 

RETURNS varchar(8) 

WITH SCHEMABINDING 

AS 

BEGIN

    DECLARE @ReturnValue varchar(8);



    SET @ReturnValue = CONVERT(varchar(8), @Value);

    SET @ReturnValue = REPLICATE('0', 8 - DATALENGTH(@ReturnValue)) + @ReturnValue;



    RETURN (@ReturnValue);

END;


GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetAccountingEndDate]
GO




CREATE FUNCTION [dbo].[ufnGetAccountingEndDate]()



RETURNS [datetime] 



AS 



BEGIN



    RETURN DATEADD(millisecond, -2, CONVERT(datetime, '20040701', 112));



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetProductDealerPrice]
GO












CREATE FUNCTION [dbo].[ufnGetProductDealerPrice](@ProductID [int], @OrderDate [datetime])



RETURNS [money] 



AS 



-- Returns the dealer price for the product on a specific date.



BEGIN



    DECLARE @DealerPrice money;



    DECLARE @DealerDiscount money;







    SET @DealerDiscount = 0.60  -- 60% of list price







    SELECT @DealerPrice = plph.[ListPrice] * @DealerDiscount 



    FROM [Production].[Product] p 



        INNER JOIN [Production].[ProductListPriceHistory] plph 



        ON p.[ProductID] = plph.[ProductID] 



            AND p.[ProductID] = @ProductID 



            AND @OrderDate BETWEEN plph.[StartDate] AND COALESCE(plph.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!







    RETURN @DealerPrice;



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetProductListPrice]
GO




CREATE FUNCTION [dbo].[ufnGetProductListPrice](@ProductID [int], @OrderDate [datetime])



RETURNS [money] 



AS 



BEGIN



    DECLARE @ListPrice money;







    SELECT @ListPrice = plph.[ListPrice] 



    FROM [Production].[Product] p 



        INNER JOIN [Production].[ProductListPriceHistory] plph 



        ON p.[ProductID] = plph.[ProductID] 



            AND p.[ProductID] = @ProductID 



            AND @OrderDate BETWEEN plph.[StartDate] AND COALESCE(plph.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!







    RETURN @ListPrice;



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetProductStandardCost]
GO




CREATE FUNCTION [dbo].[ufnGetProductStandardCost](@ProductID [int], @OrderDate [datetime])



RETURNS [money] 



AS 



-- Returns the standard cost for the product on a specific date.



BEGIN



    DECLARE @StandardCost money;







    SELECT @StandardCost = pch.[StandardCost] 



    FROM [Production].[Product] p 



        INNER JOIN [Production].[ProductCostHistory] pch 



        ON p.[ProductID] = pch.[ProductID] 



            AND p.[ProductID] = @ProductID 



            AND @OrderDate BETWEEN pch.[StartDate] AND COALESCE(pch.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!







    RETURN @StandardCost;



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetStock]
GO




CREATE FUNCTION [dbo].[ufnGetStock](@ProductID [int])



RETURNS [int] 



AS 



-- Returns the stock level for the product. This function is used internally only



BEGIN



    DECLARE @ret int;



    



    SELECT @ret = SUM(p.[Quantity]) 



    FROM [Production].[ProductInventory] p 



    WHERE p.[ProductID] = @ProductID 



        AND p.[LocationID] = '6'; -- Only look at inventory in the misc storage



    



    IF (@ret IS NULL) 



        SET @ret = 0



    



    RETURN @ret



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetDocumentStatusText]
GO




CREATE FUNCTION [dbo].[ufnGetDocumentStatusText](@Status [tinyint])



RETURNS [nvarchar](16) 



AS 



-- Returns the sales order status text representation for the status value.



BEGIN



    DECLARE @ret [nvarchar](16);







    SET @ret = 



        CASE @Status



            WHEN 1 THEN N'Pending approval'



            WHEN 2 THEN N'Approved'



            WHEN 3 THEN N'Obsolete'



            ELSE N'** Invalid **'



        END;



    



    RETURN @ret



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetPurchaseOrderStatusText]
GO




CREATE FUNCTION [dbo].[ufnGetPurchaseOrderStatusText](@Status [tinyint])



RETURNS [nvarchar](15) 



AS 



-- Returns the sales order status text representation for the status value.



BEGIN



    DECLARE @ret [nvarchar](15);







    SET @ret = 



        CASE @Status



            WHEN 1 THEN 'Pending'



            WHEN 2 THEN 'Approved'



            WHEN 3 THEN 'Rejected'



            WHEN 4 THEN 'Complete'



            ELSE '** Invalid **'



        END;



    



    RETURN @ret



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetSalesOrderStatusText]
GO




CREATE FUNCTION [dbo].[ufnGetSalesOrderStatusText](@Status [tinyint])



RETURNS [nvarchar](15) 



AS 



-- Returns the sales order status text representation for the status value.



BEGIN



    DECLARE @ret [nvarchar](15);







    SET @ret = 



        CASE @Status



            WHEN 1 THEN 'In process'



            WHEN 2 THEN 'Approved'



            WHEN 3 THEN 'Backordered'



            WHEN 4 THEN 'Rejected'



            WHEN 5 THEN 'Shipped'



            WHEN 6 THEN 'Cancelled'



            ELSE '** Invalid **'



        END;



    



    RETURN @ret



END;






GO

USE [CopyOfAdventureWorks2019]
GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[GetSynonym]')) DROP PROCEDURE [dbo].[GetSynonym]
GO
Create   PROC GetSynonym

AS

select sy.name [Name],sc.name [SchemaName],sy.base_object_name [Refrence] from sys.synonyms sy

inner join sys.schemas sc on sc.schema_id=sy.schema_id


GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[regression]')) DROP PROCEDURE [dbo].[regression]
GO
CREATE   PROCEDURE [dbo].[regression]

AS BEGIN



ALTER DATABASE SCOPED CONFIGURATION CLEAR PROCEDURE_CACHE;

BEGIN

       declare @packagetypeid int = 0;

EXEC sp_executesql N'select avg([UnitPrice]*[OrderQty])

from Sales.SalesOrderDetail

where ProductID= @packagetypeid', N'@packagetypeid int', @packagetypeid =@packagetypeid;

END

END

GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[spGetSchema]')) DROP PROCEDURE [dbo].[spGetSchema]
GO
CREATE   PROC spGetSchema 

AS

BEGIN

select [name] [Name],'' AS SchemaName from sys.schemas

where principal_id=1 and name<>'dbo'



END


GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[spGetTableScript]')) DROP PROCEDURE [dbo].[spGetTableScript]
GO
CREATE   PROC spGetTableScript

@ObjectName nvarchar(500)

AS

BEGIN

DECLARE @temptable_objectid INT = OBJECT_ID(@ObjectName);





DECLARE 

      @object_name SYSNAME

    , @object_id INT



SELECT  

      @object_name = '[' + s.name + '].[' + o.name + ']'

    , @object_id = o.[object_id]

FROM sys.objects o WITH (NOWAIT)

JOIN sys.schemas s WITH (NOWAIT) ON o.[schema_id] = s.[schema_id]

WHERE object_id = @temptable_objectid



DECLARE @SQL NVARCHAR(MAX) = ''



;WITH index_column AS 

(

    SELECT 

          ic.[object_id]

        , ic.index_id

        , ic.is_descending_key

        , ic.is_included_column

        , c.name

    FROM sys.index_columns ic WITH (NOWAIT)

    JOIN sys.columns c WITH (NOWAIT) ON ic.[object_id] = c.[object_id] AND ic.column_id = c.column_id

    WHERE ic.[object_id] = @object_id

),

fk_columns AS 

(

     SELECT 

          k.constraint_object_id

        , cname = c.name

        , rcname = rc.name

    FROM sys.foreign_key_columns k WITH (NOWAIT)

    JOIN sys.columns rc WITH (NOWAIT) ON rc.[object_id] = k.referenced_object_id AND rc.column_id = k.referenced_column_id 

    JOIN sys.columns c WITH (NOWAIT) ON c.[object_id] = k.parent_object_id AND c.column_id = k.parent_column_id

    WHERE k.parent_object_id = @object_id

)

SELECT @SQL = 'CREATE TABLE ' + @object_name + CHAR(13) + '(' + CHAR(13) + STUFF((

    SELECT CHAR(9) + ', [' + c.name + '] ' + 

        CASE WHEN c.is_computed = 1

            THEN 'AS ' + cc.[definition] 

            ELSE UPPER(tp.name) + 

                CASE WHEN tp.name IN ('varchar', 'char', 'varbinary', 'binary', 'text')

                       THEN '(' + CASE WHEN c.max_length = -1 THEN 'MAX' ELSE CAST(c.max_length AS VARCHAR(5)) END + ')'

                     WHEN tp.name IN ('nvarchar', 'nchar', 'ntext')

                       THEN '(' + CASE WHEN c.max_length = -1 THEN 'MAX' ELSE CAST(c.max_length / 2 AS VARCHAR(5)) END + ')'

                     WHEN tp.name IN ('datetime2', 'time2', 'datetimeoffset') 

                       THEN '(' + CAST(c.scale AS VARCHAR(5)) + ')'

                     WHEN tp.name = 'decimal' 

                       THEN '(' + CAST(c.[precision] AS VARCHAR(5)) + ',' + CAST(c.scale AS VARCHAR(5)) + ')'

                    ELSE ''

                END +

                CASE WHEN c.collation_name IS NOT NULL THEN ' COLLATE ' + c.collation_name ELSE '' END +

                CASE WHEN c.is_nullable = 1 THEN ' NULL' ELSE ' NOT NULL' END +

                CASE WHEN dc.[definition] IS NOT NULL THEN ' DEFAULT' + dc.[definition] ELSE '' END + 

                CASE WHEN ic.is_identity = 1 THEN ' IDENTITY(' + CAST(ISNULL(ic.seed_value, '0') AS CHAR(1)) + ',' + CAST(ISNULL(ic.increment_value, '1') AS CHAR(1)) + ')' ELSE '' END 

        END + CHAR(13)

    FROM sys.columns c WITH (NOWAIT)

    JOIN sys.types tp WITH (NOWAIT) ON c.user_type_id = tp.user_type_id

    LEFT JOIN sys.computed_columns cc WITH (NOWAIT) ON c.[object_id] = cc.[object_id] AND c.column_id = cc.column_id

    LEFT JOIN sys.default_constraints dc WITH (NOWAIT) ON c.default_object_id != 0 AND c.[object_id] = dc.parent_object_id AND c.column_id = dc.parent_column_id

    LEFT JOIN sys.identity_columns ic WITH (NOWAIT) ON c.is_identity = 1 AND c.[object_id] = ic.[object_id] AND c.column_id = ic.column_id

    WHERE c.[object_id] = @object_id

    ORDER BY c.column_id

    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, CHAR(9) + ' ')

    + ISNULL((SELECT CHAR(9) + ', CONSTRAINT [' + k.name + '] PRIMARY KEY (' + 

                    (SELECT STUFF((

                         SELECT ', [' + c.name + '] ' + CASE WHEN ic.is_descending_key = 1 THEN 'DESC' ELSE 'ASC' END

                         FROM sys.index_columns ic WITH (NOWAIT)

                         JOIN sys.columns c WITH (NOWAIT) ON c.[object_id] = ic.[object_id] AND c.column_id = ic.column_id

                         WHERE ic.is_included_column = 0

                             AND ic.[object_id] = k.parent_object_id 

                             AND ic.index_id = k.unique_index_id     

                         FOR XML PATH(N''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ''))

            + ')' + CHAR(13)

            FROM sys.key_constraints k WITH (NOWAIT)

            WHERE k.parent_object_id = @object_id 

                AND k.[type] = 'PK'), '') + ')'  + CHAR(13)

    + ISNULL((SELECT (

        SELECT CHAR(13) +

             'ALTER TABLE ' + @object_name + ' WITH' 

            + CASE WHEN fk.is_not_trusted = 1 

                THEN ' NOCHECK' 

                ELSE ' CHECK' 

              END + 

              ' ADD CONSTRAINT [' + fk.name  + '] FOREIGN KEY(' 

              + STUFF((

                SELECT ', [' + k.cname + ']'

                FROM fk_columns k

                WHERE k.constraint_object_id = fk.[object_id]

                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')

               + ')' +

              ' REFERENCES [' + SCHEMA_NAME(ro.[schema_id]) + '].[' + ro.name + '] ('

              + STUFF((

                SELECT ', [' + k.rcname + ']'

                FROM fk_columns k

                WHERE k.constraint_object_id = fk.[object_id]

                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')

               + ')'

            + CASE 

                WHEN fk.delete_referential_action = 1 THEN ' ON DELETE CASCADE' 

                WHEN fk.delete_referential_action = 2 THEN ' ON DELETE SET NULL'

                WHEN fk.delete_referential_action = 3 THEN ' ON DELETE SET DEFAULT' 

                ELSE '' 

              END

            + CASE 

                WHEN fk.update_referential_action = 1 THEN ' ON UPDATE CASCADE'

                WHEN fk.update_referential_action = 2 THEN ' ON UPDATE SET NULL'

                WHEN fk.update_referential_action = 3 THEN ' ON UPDATE SET DEFAULT'  

                ELSE '' 

              END 

            + CHAR(13) + 'ALTER TABLE ' + @object_name + ' CHECK CONSTRAINT [' + fk.name  + ']' + CHAR(13)

        FROM sys.foreign_keys fk WITH (NOWAIT)

        JOIN sys.objects ro WITH (NOWAIT) ON ro.[object_id] = fk.referenced_object_id

        WHERE fk.parent_object_id = @object_id

        FOR XML PATH(N''), TYPE).value('.', 'NVARCHAR(MAX)')), '')

    + ISNULL(((SELECT

         CHAR(13) + 'CREATE' + CASE WHEN i.is_unique = 1 THEN ' UNIQUE' ELSE '' END 

                + ' NONCLUSTERED INDEX [' + i.name + '] ON ' + @object_name + ' (' +

                STUFF((

                SELECT ', [' + c.name + ']' + CASE WHEN c.is_descending_key = 1 THEN ' DESC' ELSE ' ASC' END

                FROM index_column c

                WHERE c.is_included_column = 0

                    AND c.index_id = i.index_id

                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') + ')'  

                + ISNULL(CHAR(13) + 'INCLUDE (' + 

                    STUFF((

                    SELECT ', [' + c.name + ']'

                    FROM index_column c

                    WHERE c.is_included_column = 1

                        AND c.index_id = i.index_id

                    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') + ')', '')  + CHAR(13)

        FROM sys.indexes i WITH (NOWAIT)

        WHERE i.[object_id] = @object_id

            AND i.is_primary_key = 0

            AND i.[type] = 2

        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)')

    ), '')



SELECT @SQL AS [Text]

END

GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[spTestClass]')) DROP PROCEDURE [dbo].[spTestClass]
GO
create    proc spTestClass





@ID int,















@ID1 smallint,















@ID2 datetime,















@ID3 nvarchar(50)















as















Begin















SELECT TOP (1000) [SalesOrderID]















      ,[SalesOrderDetailID]















      ,[CarrierTrackingNumber]















      ,[OrderQty] 















      ,case when [ProductID]=776 then 'Ok' else 'NO' END Hello















      ,[SpecialOfferID]















      ,[UnitPrice]















      ,[UnitPriceDiscount]















      ,[LineTotal]















      ,[rowguid] 















      ,[ModifiedDate]















  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]































  SELECT 















       [LineTotal] [LineTotal1]















      ,[rowguid]  [rowguid1]















      ,[ModifiedDate] [ModifiedDate1]















  FROM [AdventureWorks2019].[Sales].[SalesOrderDetail]















  end














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[sptestplan]')) DROP PROCEDURE [dbo].[sptestplan]
GO
create   proc sptestplan







as







SELECT 







      [FirstName]







      ,[MiddleName]







      ,[LastName]







      







  FROM [AdventureWorks2019].[Person].[Person]







  where [PersonType]='EM'










GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[spTestTableJson]')) DROP PROCEDURE [dbo].[spTestTableJson]
GO
/****** Script for SelectTopNRows command from SSMS  ******/







create   PROC spTestTableJson







@TestType nvarchar(MAX)







AS







;WITH cte as 







(







            SELECT  ID







			FROM OPENJSON(@TestType)







			WITH(







				ID int







			)







)







SELECT  [OrderID]







      ,[ProductID]







      ,[UnitPrice]







      ,[Quantity]







      ,[Discount]







  FROM [dbo].[Order Details] c







  inner join cte  on cte.ID=c.[ProductID]










GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[USP_DetailedTablesStorageReport]')) DROP PROCEDURE [dbo].[USP_DetailedTablesStorageReport]
GO
-- ==================================================================================







CREATE PROCEDURE dbo.USP_DetailedTablesStorageReport







AS







BEGIN







   SET NOCOUNT OFF;







 







   DECLARE @SQLstring VARCHAR (300);







   --Create a Temporary Table to store report







   DECLARE @StorageRepTable TABLE (







      [Table_Name] VARCHAR (80)







      ,RowCnt INT







      ,TableSize VARCHAR(80)







      ,DataSpaceUsed VARCHAR(80)







      ,IndexSpaceUsed VARCHAR(80)







      ,Unused_Space VARCHAR(80)







      );







 







   --Create the Dynamic TSQL String







   SET @SQLstring = 'sp_msforeachtable ''sp_spaceused "?"''';







 







   --Populate Temporary Report Table







   INSERT INTO @StorageRepTable







   EXEC (@SQLstring);







 







   -- Sorting the report result 







   SELECT *







   FROM @StorageRepTable







   ORDER BY Table_Name;







 







   SET NOCOUNT ON;







END














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[uspGetBillOfMaterials]')) DROP PROCEDURE [dbo].[uspGetBillOfMaterials]
GO








CREATE PROCEDURE [dbo].[uspGetBillOfMaterials]







    @StartProductID [int],







    @CheckDate [datetime]







AS







BEGIN







    SET NOCOUNT ON;















    -- Use recursive query to generate a multi-level Bill of Material (i.e. all level 1 







    -- components of a level 0 assembly, all level 2 components of a level 1 assembly)







    -- The CheckDate eliminates any components that are no longer used in the product on this date.







    WITH [BOM_cte]([ProductAssemblyID], [ComponentID], [ComponentDesc], [PerAssemblyQty], [StandardCost], [ListPrice], [BOMLevel], [RecursionLevel]) -- CTE name and columns







    AS (







        SELECT b.[ProductAssemblyID], b.[ComponentID], p.[Name], b.[PerAssemblyQty], p.[StandardCost], p.[ListPrice], b.[BOMLevel], 0 -- Get the initial list of components for the bike assembly







        FROM [Production].[BillOfMaterials] b







            INNER JOIN [Production].[Product] p 







            ON b.[ComponentID] = p.[ProductID] 







        WHERE b.[ProductAssemblyID] = @StartProductID 







            AND @CheckDate >= b.[StartDate] 







            AND @CheckDate <= ISNULL(b.[EndDate], @CheckDate)







        UNION ALL







        SELECT b.[ProductAssemblyID], b.[ComponentID], p.[Name], b.[PerAssemblyQty], p.[StandardCost], p.[ListPrice], b.[BOMLevel], [RecursionLevel] + 1 -- Join recursive member to anchor







        FROM [BOM_cte] cte







            INNER JOIN [Production].[BillOfMaterials] b 







            ON b.[ProductAssemblyID] = cte.[ComponentID]







            INNER JOIN [Production].[Product] p 







            ON b.[ComponentID] = p.[ProductID] 







        WHERE @CheckDate >= b.[StartDate] 







            AND @CheckDate <= ISNULL(b.[EndDate], @CheckDate)







        )







    -- Outer select from the CTE







    SELECT b.[ProductAssemblyID], b.[ComponentID], b.[ComponentDesc], SUM(b.[PerAssemblyQty]) AS [TotalQuantity] , b.[StandardCost], b.[ListPrice], b.[BOMLevel], b.[RecursionLevel]







    FROM [BOM_cte] b







    GROUP BY b.[ComponentID], b.[ComponentDesc], b.[ProductAssemblyID], b.[BOMLevel], b.[RecursionLevel], b.[StandardCost], b.[ListPrice]







    ORDER BY b.[BOMLevel], b.[ProductAssemblyID], b.[ComponentID]







    OPTION (MAXRECURSION 25) 







END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[uspGetEmployeeManagers]')) DROP PROCEDURE [dbo].[uspGetEmployeeManagers]
GO








CREATE PROCEDURE [dbo].[uspGetEmployeeManagers]







    @BusinessEntityID [int]







AS







BEGIN







    SET NOCOUNT ON;















    -- Use recursive query to list out all Employees required for a particular Manager







    WITH [EMP_cte]([BusinessEntityID], [OrganizationNode], [FirstName], [LastName], [JobTitle], [RecursionLevel]) -- CTE name and columns







    AS (







        SELECT e.[BusinessEntityID], e.[OrganizationNode], p.[FirstName], p.[LastName], e.[JobTitle], 0 -- Get the initial Employee







        FROM [HumanResources].[Employee] e 







			INNER JOIN [Person].[Person] as p







			ON p.[BusinessEntityID] = e.[BusinessEntityID]







        WHERE e.[BusinessEntityID] = @BusinessEntityID







        UNION ALL







        SELECT e.[BusinessEntityID], e.[OrganizationNode], p.[FirstName], p.[LastName], e.[JobTitle], [RecursionLevel] + 1 -- Join recursive member to anchor







        FROM [HumanResources].[Employee] e 







            INNER JOIN [EMP_cte]







            ON e.[OrganizationNode] = [EMP_cte].[OrganizationNode].GetAncestor(1)







            INNER JOIN [Person].[Person] p 







            ON p.[BusinessEntityID] = e.[BusinessEntityID]







    )







    -- Join back to Employee to return the manager name 







    SELECT [EMP_cte].[RecursionLevel], [EMP_cte].[BusinessEntityID], [EMP_cte].[FirstName], [EMP_cte].[LastName], 







        [EMP_cte].[OrganizationNode].ToString() AS [OrganizationNode], p.[FirstName] AS 'ManagerFirstName', p.[LastName] AS 'ManagerLastName'  -- Outer select from the CTE







    FROM [EMP_cte] 







        INNER JOIN [HumanResources].[Employee] e 







        ON [EMP_cte].[OrganizationNode].GetAncestor(1) = e.[OrganizationNode]







        INNER JOIN [Person].[Person] p 







        ON p.[BusinessEntityID] = e.[BusinessEntityID]







    ORDER BY [RecursionLevel], [EMP_cte].[OrganizationNode].ToString()







    OPTION (MAXRECURSION 25) 







END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[uspGetManagerEmployees]')) DROP PROCEDURE [dbo].[uspGetManagerEmployees]
GO








CREATE PROCEDURE [dbo].[uspGetManagerEmployees]







    @BusinessEntityID [int]







AS







BEGIN







    SET NOCOUNT ON;















    -- Use recursive query to list out all Employees required for a particular Manager







    WITH [EMP_cte]([BusinessEntityID], [OrganizationNode], [FirstName], [LastName], [RecursionLevel]) -- CTE name and columns







    AS (







        SELECT e.[BusinessEntityID], e.[OrganizationNode], p.[FirstName], p.[LastName], 0 -- Get the initial list of Employees for Manager n







        FROM [HumanResources].[Employee] e 







			INNER JOIN [Person].[Person] p 







			ON p.[BusinessEntityID] = e.[BusinessEntityID]







        WHERE e.[BusinessEntityID] = @BusinessEntityID







        UNION ALL







        SELECT e.[BusinessEntityID], e.[OrganizationNode], p.[FirstName], p.[LastName], [RecursionLevel] + 1 -- Join recursive member to anchor







        FROM [HumanResources].[Employee] e 







            INNER JOIN [EMP_cte]







            ON e.[OrganizationNode].GetAncestor(1) = [EMP_cte].[OrganizationNode]







			INNER JOIN [Person].[Person] p 







			ON p.[BusinessEntityID] = e.[BusinessEntityID]







        )







    -- Join back to Employee to return the manager name 







    SELECT [EMP_cte].[RecursionLevel], [EMP_cte].[OrganizationNode].ToString() as [OrganizationNode], p.[FirstName] AS 'ManagerFirstName', p.[LastName] AS 'ManagerLastName',







        [EMP_cte].[BusinessEntityID], [EMP_cte].[FirstName], [EMP_cte].[LastName] -- Outer select from the CTE







    FROM [EMP_cte] 







        INNER JOIN [HumanResources].[Employee] e 







        ON [EMP_cte].[OrganizationNode].GetAncestor(1) = e.[OrganizationNode]







			INNER JOIN [Person].[Person] p 







			ON p.[BusinessEntityID] = e.[BusinessEntityID]







    ORDER BY [RecursionLevel], [EMP_cte].[OrganizationNode].ToString()







    OPTION (MAXRECURSION 25) 







END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[uspGetWhereUsedProductID]')) DROP PROCEDURE [dbo].[uspGetWhereUsedProductID]
GO








CREATE PROCEDURE [dbo].[uspGetWhereUsedProductID]







    @StartProductID [int],







    @CheckDate [datetime]







AS







BEGIN







    SET NOCOUNT ON;















    --Use recursive query to generate a multi-level Bill of Material (i.e. all level 1 components of a level 0 assembly, all level 2 components of a level 1 assembly)







    WITH [BOM_cte]([ProductAssemblyID], [ComponentID], [ComponentDesc], [PerAssemblyQty], [StandardCost], [ListPrice], [BOMLevel], [RecursionLevel]) -- CTE name and columns







    AS (







        SELECT b.[ProductAssemblyID], b.[ComponentID], p.[Name], b.[PerAssemblyQty], p.[StandardCost], p.[ListPrice], b.[BOMLevel], 0 -- Get the initial list of components for the bike assembly







        FROM [Production].[BillOfMaterials] b







            INNER JOIN [Production].[Product] p 







            ON b.[ProductAssemblyID] = p.[ProductID] 







        WHERE b.[ComponentID] = @StartProductID 







            AND @CheckDate >= b.[StartDate] 







            AND @CheckDate <= ISNULL(b.[EndDate], @CheckDate)







        UNION ALL







        SELECT b.[ProductAssemblyID], b.[ComponentID], p.[Name], b.[PerAssemblyQty], p.[StandardCost], p.[ListPrice], b.[BOMLevel], [RecursionLevel] + 1 -- Join recursive member to anchor







        FROM [BOM_cte] cte







            INNER JOIN [Production].[BillOfMaterials] b 







            ON cte.[ProductAssemblyID] = b.[ComponentID]







            INNER JOIN [Production].[Product] p 







            ON b.[ProductAssemblyID] = p.[ProductID] 







        WHERE @CheckDate >= b.[StartDate] 







            AND @CheckDate <= ISNULL(b.[EndDate], @CheckDate)







        )







    -- Outer select from the CTE







    SELECT b.[ProductAssemblyID], b.[ComponentID], b.[ComponentDesc], SUM(b.[PerAssemblyQty]) AS [TotalQuantity] , b.[StandardCost], b.[ListPrice], b.[BOMLevel], b.[RecursionLevel]







    FROM [BOM_cte] b







    GROUP BY b.[ComponentID], b.[ComponentDesc], b.[ProductAssemblyID], b.[BOMLevel], b.[RecursionLevel], b.[StandardCost], b.[ListPrice]







    ORDER BY b.[BOMLevel], b.[ProductAssemblyID], b.[ComponentID]







    OPTION (MAXRECURSION 25) 







END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[uspLogError]')) DROP PROCEDURE [dbo].[uspLogError]
GO








-- uspLogError logs error information in the ErrorLog table about the 







-- error that caused execution to jump to the CATCH block of a 







-- TRY...CATCH construct. This should be executed from within the scope 







-- of a CATCH block otherwise it will return without inserting error 







-- information. 







CREATE PROCEDURE [dbo].[uspLogError] 







    @ErrorLogID [int] = 0 OUTPUT -- contains the ErrorLogID of the row inserted







AS                               -- by uspLogError in the ErrorLog table







BEGIN







    SET NOCOUNT ON;















    -- Output parameter value of 0 indicates that error 







    -- information was not logged







    SET @ErrorLogID = 0;















    BEGIN TRY







        -- Return if there is no error information to log







        IF ERROR_NUMBER() IS NULL







            RETURN;















        -- Return if inside an uncommittable transaction.







        -- Data insertion/modification is not allowed when 







        -- a transaction is in an uncommittable state.







        IF XACT_STATE() = -1







        BEGIN







            PRINT 'Cannot log error since the current transaction is in an uncommittable state. ' 







                + 'Rollback the transaction before executing uspLogError in order to successfully log error information.';







            RETURN;







        END















        INSERT [dbo].[ErrorLog] 







            (







            [UserName], 







            [ErrorNumber], 







            [ErrorSeverity], 







            [ErrorState], 







            [ErrorProcedure], 







            [ErrorLine], 







            [ErrorMessage]







            ) 







        VALUES 







            (







            CONVERT(sysname, CURRENT_USER), 







            ERROR_NUMBER(),







            ERROR_SEVERITY(),







            ERROR_STATE(),







            ERROR_PROCEDURE(),







            ERROR_LINE(),







            ERROR_MESSAGE()







            );















        -- Pass back the ErrorLogID of the row inserted







        SET @ErrorLogID = @@IDENTITY;







    END TRY







    BEGIN CATCH







        PRINT 'An error occurred in stored procedure uspLogError: ';







        EXECUTE [dbo].[uspPrintError];







        RETURN -1;







    END CATCH







END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[uspPrintError]')) DROP PROCEDURE [dbo].[uspPrintError]
GO








-- uspPrintError prints error information about the error that caused 







-- execution to jump to the CATCH block of a TRY...CATCH construct. 







-- Should be executed from within the scope of a CATCH block otherwise 







-- it will return without printing any error information.







CREATE PROCEDURE [dbo].[uspPrintError] 







AS







BEGIN







    SET NOCOUNT ON;















    -- Print error information. 







    PRINT 'Error ' + CONVERT(varchar(50), ERROR_NUMBER()) +







          ', Severity ' + CONVERT(varchar(5), ERROR_SEVERITY()) +







          ', State ' + CONVERT(varchar(5), ERROR_STATE()) + 







          ', Procedure ' + ISNULL(ERROR_PROCEDURE(), '-') + 







          ', Line ' + CONVERT(varchar(5), ERROR_LINE());







    PRINT ERROR_MESSAGE();







END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[dbo].[uspSearchCandidateResumes]')) DROP PROCEDURE [dbo].[uspSearchCandidateResumes]
GO








--A stored procedure which demonstrates integrated full text search















CREATE PROCEDURE [dbo].[uspSearchCandidateResumes]







    @searchString [nvarchar](1000),   







    @useInflectional [bit]=0,







    @useThesaurus [bit]=0,







    @language[int]=0























WITH EXECUTE AS CALLER







AS







BEGIN







    SET NOCOUNT ON;















      DECLARE @string nvarchar(1050)







      --setting the lcid to the default instance LCID if needed







      IF @language = NULL OR @language = 0 







      BEGIN 







            SELECT @language =CONVERT(int, serverproperty('lcid'))  







      END







      















            --FREETEXTTABLE case as inflectional and Thesaurus were required







      IF @useThesaurus = 1 AND @useInflectional = 1  







        BEGIN







                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 







                        INNER JOIN FREETEXTTABLE([HumanResources].[JobCandidate],*, @searchString,LANGUAGE @language) AS KEY_TBL







                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]







            END















      ELSE IF @useThesaurus = 1







            BEGIN







                  SELECT @string ='FORMSOF(THESAURUS,"'+@searchString +'"'+')'      







                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 







                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*, @string,LANGUAGE @language) AS KEY_TBL







                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]







        END















      ELSE IF @useInflectional = 1







            BEGIN







                  SELECT @string ='FORMSOF(INFLECTIONAL,"'+@searchString +'"'+')'







                  SELECT FT_TBL.[JobCandidateID], KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 







                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*, @string,LANGUAGE @language) AS KEY_TBL







                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]







        END







  







      ELSE --base case, plain CONTAINSTABLE







            BEGIN







                  SELECT @string='"'+@searchString +'"'







                  SELECT FT_TBL.[JobCandidateID],KEY_TBL.[RANK] FROM [HumanResources].[JobCandidate] AS FT_TBL 







                        INNER JOIN CONTAINSTABLE([HumanResources].[JobCandidate],*,@string,LANGUAGE @language) AS KEY_TBL







                   ON  FT_TBL.[JobCandidateID] =KEY_TBL.[KEY]







            END















END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[HumanResources].[uspUpdateEmployeeHireInfo]')) DROP PROCEDURE [HumanResources].[uspUpdateEmployeeHireInfo]
GO








CREATE PROCEDURE [HumanResources].[uspUpdateEmployeeHireInfo]







    @BusinessEntityID [int], 







    @JobTitle [nvarchar](50), 







    @HireDate [datetime], 







    @RateChangeDate [datetime], 







    @Rate [money], 







    @PayFrequency [tinyint], 







    @CurrentFlag [dbo].[Flag] 







WITH EXECUTE AS CALLER







AS







BEGIN







    SET NOCOUNT ON;















    BEGIN TRY







        BEGIN TRANSACTION;















        UPDATE [HumanResources].[Employee] 







        SET [JobTitle] = @JobTitle 







            ,[HireDate] = @HireDate 







            ,[CurrentFlag] = @CurrentFlag 







        WHERE [BusinessEntityID] = @BusinessEntityID;















        INSERT INTO [HumanResources].[EmployeePayHistory] 







            ([BusinessEntityID]







            ,[RateChangeDate]







            ,[Rate]







            ,[PayFrequency]) 







        VALUES (@BusinessEntityID, @RateChangeDate, @Rate, @PayFrequency);















        COMMIT TRANSACTION;







    END TRY







    BEGIN CATCH







        -- Rollback any active or uncommittable transactions before







        -- inserting information in the ErrorLog







        IF @@TRANCOUNT > 0







        BEGIN







            ROLLBACK TRANSACTION;







        END















        EXECUTE [dbo].[uspLogError];







    END CATCH;







END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[HumanResources].[uspUpdateEmployeeLogin]')) DROP PROCEDURE [HumanResources].[uspUpdateEmployeeLogin]
GO








CREATE PROCEDURE [HumanResources].[uspUpdateEmployeeLogin]







    @BusinessEntityID [int], 







    @OrganizationNode [hierarchyid],







    @LoginID [nvarchar](256),







    @JobTitle [nvarchar](50),







    @HireDate [datetime],







    @CurrentFlag [dbo].[Flag]







WITH EXECUTE AS CALLER







AS







BEGIN







    SET NOCOUNT ON;















    BEGIN TRY







        UPDATE [HumanResources].[Employee] 







        SET [OrganizationNode] = @OrganizationNode 







            ,[LoginID] = @LoginID 







            ,[JobTitle] = @JobTitle 







            ,[HireDate] = @HireDate 







            ,[CurrentFlag] = @CurrentFlag 







        WHERE [BusinessEntityID] = @BusinessEntityID;







    END TRY







    BEGIN CATCH







        EXECUTE [dbo].[uspLogError];







    END CATCH;







END;














GO
IF EXISTS(SELECT 1 FROM sys.Procedures WHERE[object_id] = OBJECT_ID('[HumanResources].[uspUpdateEmployeePersonalInfo]')) DROP PROCEDURE [HumanResources].[uspUpdateEmployeePersonalInfo]
GO








CREATE PROCEDURE [HumanResources].[uspUpdateEmployeePersonalInfo]







    @BusinessEntityID [int], 







    @NationalIDNumber [nvarchar](15), 







    @BirthDate [datetime], 







    @MaritalStatus [nchar](1), 







    @Gender [nchar](1)







WITH EXECUTE AS CALLER







AS







BEGIN







    SET NOCOUNT ON;















    BEGIN TRY







        UPDATE [HumanResources].[Employee] 







        SET [NationalIDNumber] = @NationalIDNumber 







            ,[BirthDate] = @BirthDate 







            ,[MaritalStatus] = @MaritalStatus 







            ,[Gender] = @Gender 







        WHERE [BusinessEntityID] = @BusinessEntityID;







    END TRY







    BEGIN CATCH







        EXECUTE [dbo].[uspLogError];







    END CATCH;







END;














GO

