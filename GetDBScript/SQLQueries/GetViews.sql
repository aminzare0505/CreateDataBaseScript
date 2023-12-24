select v.name [Name],s.[name] SchemaName from sys.views v
inner join sys.schemas s on s.schema_id=v.schema_id
where s.principal_id=1 