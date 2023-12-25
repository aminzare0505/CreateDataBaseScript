
select sy.name [Name],sc.name [SchemaName],sy.base_object_name [Refrence] from sys.synonyms sy
inner join sys.schemas sc on sc.schema_id=sy.schema_id
