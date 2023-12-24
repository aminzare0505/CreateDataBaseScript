select t.[name] [Name],s.[name] SchemaName from sys.tables t
inner join sys.schemas s on s.schema_id=t.schema_id
where s.principal_id=1 
