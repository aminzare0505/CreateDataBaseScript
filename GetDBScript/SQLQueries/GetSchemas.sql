select [name] [Name],'' AS SchemaName from sys.schemas
where principal_id=1 and name<>'dbo'
