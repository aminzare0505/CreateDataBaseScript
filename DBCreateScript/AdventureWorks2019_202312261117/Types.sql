USE [CopyOfAdventureWorks2019]
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'AccountNumber' AND ss.name = N'dbo') 
CREATE TYPE [dbo].[AccountNumber] FROM nvarchar(30); 
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Flag' AND ss.name = N'dbo') 
CREATE TYPE [dbo].[Flag] FROM bit NOT NULL; 
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'NameStyle' AND ss.name = N'dbo') 
CREATE TYPE [dbo].[NameStyle] FROM bit NOT NULL; 
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Name' AND ss.name = N'dbo') 
CREATE TYPE [dbo].[Name] FROM nvarchar(100); 
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'OrderNumber' AND ss.name = N'dbo') 
CREATE TYPE [dbo].[OrderNumber] FROM nvarchar(50); 
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'Phone' AND ss.name = N'dbo') 
CREATE TYPE [dbo].[Phone] FROM nvarchar(50); 
GO
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'test' AND ss.name = N'dbo') 
CREATE TYPE [dbo].[test] AS TABLE (   
      [Id] [int] NULL
,[Names] [nvarchar] NULL
,[LastNames] [Name] NULL
  
 ); 
GO
