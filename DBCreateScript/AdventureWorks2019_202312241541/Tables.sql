IF EXISTS(SELECT 1 FROM sys.synonyms  WHERE[object_id] = OBJECT_ID('[HumanResources].[Action]')) DROP synonyms [HumanResources].[Action]
GO
CREATE SYNONYM [HumanResources].[Action] FOR [Administrator].[dbo].[ScriptDetail]

GO
