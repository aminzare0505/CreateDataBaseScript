select p.[name] [Name],s.[name] SchemaName  from sys.procedures p
inner join sys.schemas s on s.schema_id=p.schema_id
where s.principal_id=1 AND p.[name] NOT IN('GetFunctions','GetSchemas','GetProcedures','GetSynonyms','GetTables','GetTableScript','GetViews')
