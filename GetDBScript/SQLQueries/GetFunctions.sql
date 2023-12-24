SELECT   
    OBJECT_NAME(o.object_id) AS [Name],
	s.[name] SchemaName
FROM sys.objects o 
inner join sys.schemas s on s.schema_id=o.schema_id
WHERE type='FN'