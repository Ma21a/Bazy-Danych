USE AdventureWorks2022;

IF OBJECT_ID('dbo.PrintFibonacciSequence', 'P') IS NOT NULL
    DROP PROCEDURE dbo.PrintFibonacciSequence;
GO
IF OBJECT_ID('dbo.Fibonacci', 'FN') IS NOT NULL
    DROP FUNCTION dbo.Fibonacci;
GO

CREATE FUNCTION dbo.Fibonacci(@n INT) RETURNS INT
AS
BEGIN
    DECLARE @result INT;

    IF @n = 0
        SET @result = 0;
    ELSE IF @n = 1
        SET @result = 1;
    ELSE
        SET @result = dbo.Fibonacci(@n - 1) + dbo.Fibonacci(@n - 2);

    RETURN @result;
END;
GO

CREATE PROCEDURE dbo.PrintFibonacciSequence @n INT
AS
BEGIN
    DECLARE @FibonacciSequence TABLE (FibValue INT);

    INSERT INTO @FibonacciSequence
    SELECT dbo.Fibonacci(n)
    FROM (SELECT TOP (@n) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) - 1 AS n FROM sys.objects) AS Numbers;

    SELECT FibValue
    FROM @FibonacciSequence;
END;
GO

EXEC dbo.PrintFibonacciSequence @n = 10;



IF OBJECT_ID('ChangeNames', 'TR') IS NOT NULL
    DROP TRIGGER ChangeNames;
GO

CREATE TRIGGER ChangeNames
ON Person.Person
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

   UPDATE p
    SET p.LastName = UPPER(i.LastName)
    FROM Person.Person p
    INNER JOIN inserted i ON p.PersonType = i.PersonType;
END;
GO


USE AdventureWorks2022;
GO

CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(TaxRate)
    BEGIN
        DECLARE @OldTaxRate DECIMAL(8, 4);
        DECLARE @NewTaxRate DECIMAL(8, 4);

        SELECT @OldTaxRate = TaxRate FROM deleted;
        SELECT @NewTaxRate = TaxRate FROM inserted;

        IF ABS(@NewTaxRate - @OldTaxRate) > 0.30
        BEGIN
        RAISERROR ('Not allowed to change TaxRate more than 30%.',16,1)
        ROLLBACK
        END
    END
END;
