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
