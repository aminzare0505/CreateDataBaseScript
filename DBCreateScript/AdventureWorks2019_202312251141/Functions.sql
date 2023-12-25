USE [CopyOfAdventureWorks2019]
GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetAccountingStartDate]
GO


CREATE FUNCTION [dbo].[ufnGetAccountingStartDate]()

RETURNS [datetime] 

AS 

BEGIN

    RETURN CONVERT(datetime, '20030701', 112);

END;


GO
DROP FUNCTION IF EXISTS [dbo].[ufnLeadingZeros]
GO


CREATE FUNCTION [dbo].[ufnLeadingZeros](

    @Value int

) 

RETURNS varchar(8) 

WITH SCHEMABINDING 

AS 

BEGIN

    DECLARE @ReturnValue varchar(8);



    SET @ReturnValue = CONVERT(varchar(8), @Value);

    SET @ReturnValue = REPLICATE('0', 8 - DATALENGTH(@ReturnValue)) + @ReturnValue;



    RETURN (@ReturnValue);

END;


GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetAccountingEndDate]
GO




CREATE FUNCTION [dbo].[ufnGetAccountingEndDate]()



RETURNS [datetime] 



AS 



BEGIN



    RETURN DATEADD(millisecond, -2, CONVERT(datetime, '20040701', 112));



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetProductDealerPrice]
GO












CREATE FUNCTION [dbo].[ufnGetProductDealerPrice](@ProductID [int], @OrderDate [datetime])



RETURNS [money] 



AS 



-- Returns the dealer price for the product on a specific date.



BEGIN



    DECLARE @DealerPrice money;



    DECLARE @DealerDiscount money;







    SET @DealerDiscount = 0.60  -- 60% of list price







    SELECT @DealerPrice = plph.[ListPrice] * @DealerDiscount 



    FROM [Production].[Product] p 



        INNER JOIN [Production].[ProductListPriceHistory] plph 



        ON p.[ProductID] = plph.[ProductID] 



            AND p.[ProductID] = @ProductID 



            AND @OrderDate BETWEEN plph.[StartDate] AND COALESCE(plph.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!







    RETURN @DealerPrice;



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetProductListPrice]
GO




CREATE FUNCTION [dbo].[ufnGetProductListPrice](@ProductID [int], @OrderDate [datetime])



RETURNS [money] 



AS 



BEGIN



    DECLARE @ListPrice money;







    SELECT @ListPrice = plph.[ListPrice] 



    FROM [Production].[Product] p 



        INNER JOIN [Production].[ProductListPriceHistory] plph 



        ON p.[ProductID] = plph.[ProductID] 



            AND p.[ProductID] = @ProductID 



            AND @OrderDate BETWEEN plph.[StartDate] AND COALESCE(plph.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!







    RETURN @ListPrice;



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetProductStandardCost]
GO




CREATE FUNCTION [dbo].[ufnGetProductStandardCost](@ProductID [int], @OrderDate [datetime])



RETURNS [money] 



AS 



-- Returns the standard cost for the product on a specific date.



BEGIN



    DECLARE @StandardCost money;







    SELECT @StandardCost = pch.[StandardCost] 



    FROM [Production].[Product] p 



        INNER JOIN [Production].[ProductCostHistory] pch 



        ON p.[ProductID] = pch.[ProductID] 



            AND p.[ProductID] = @ProductID 



            AND @OrderDate BETWEEN pch.[StartDate] AND COALESCE(pch.[EndDate], CONVERT(datetime, '99991231', 112)); -- Make sure we get all the prices!







    RETURN @StandardCost;



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetStock]
GO




CREATE FUNCTION [dbo].[ufnGetStock](@ProductID [int])



RETURNS [int] 



AS 



-- Returns the stock level for the product. This function is used internally only



BEGIN



    DECLARE @ret int;



    



    SELECT @ret = SUM(p.[Quantity]) 



    FROM [Production].[ProductInventory] p 



    WHERE p.[ProductID] = @ProductID 



        AND p.[LocationID] = '6'; -- Only look at inventory in the misc storage



    



    IF (@ret IS NULL) 



        SET @ret = 0



    



    RETURN @ret



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetDocumentStatusText]
GO




CREATE FUNCTION [dbo].[ufnGetDocumentStatusText](@Status [tinyint])



RETURNS [nvarchar](16) 



AS 



-- Returns the sales order status text representation for the status value.



BEGIN



    DECLARE @ret [nvarchar](16);







    SET @ret = 



        CASE @Status



            WHEN 1 THEN N'Pending approval'



            WHEN 2 THEN N'Approved'



            WHEN 3 THEN N'Obsolete'



            ELSE N'** Invalid **'



        END;



    



    RETURN @ret



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetPurchaseOrderStatusText]
GO




CREATE FUNCTION [dbo].[ufnGetPurchaseOrderStatusText](@Status [tinyint])



RETURNS [nvarchar](15) 



AS 



-- Returns the sales order status text representation for the status value.



BEGIN



    DECLARE @ret [nvarchar](15);







    SET @ret = 



        CASE @Status



            WHEN 1 THEN 'Pending'



            WHEN 2 THEN 'Approved'



            WHEN 3 THEN 'Rejected'



            WHEN 4 THEN 'Complete'



            ELSE '** Invalid **'



        END;



    



    RETURN @ret



END;






GO
DROP FUNCTION IF EXISTS [dbo].[ufnGetSalesOrderStatusText]
GO




CREATE FUNCTION [dbo].[ufnGetSalesOrderStatusText](@Status [tinyint])



RETURNS [nvarchar](15) 



AS 



-- Returns the sales order status text representation for the status value.



BEGIN



    DECLARE @ret [nvarchar](15);







    SET @ret = 



        CASE @Status



            WHEN 1 THEN 'In process'



            WHEN 2 THEN 'Approved'



            WHEN 3 THEN 'Backordered'



            WHEN 4 THEN 'Rejected'



            WHEN 5 THEN 'Shipped'



            WHEN 6 THEN 'Cancelled'



            ELSE '** Invalid **'



        END;



    



    RETURN @ret



END;






GO
