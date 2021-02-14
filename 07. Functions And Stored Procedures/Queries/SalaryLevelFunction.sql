CREATE FUNCTION ufn_GetSalaryLevel (@Salary DECIMAL(18,4)) 
	RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @Result NVARCHAR(MAX)

	IF (@Salary < 30000)
	BEGIN
		SET @Result = 'Low'
	END

	ELSE IF (@Salary <= 50000)
	BEGIN
		SET @Result = 'Average'
	END

	ELSE
	BEGIN
		SET @Result = 'High'
	END

	RETURN @Result
END