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
