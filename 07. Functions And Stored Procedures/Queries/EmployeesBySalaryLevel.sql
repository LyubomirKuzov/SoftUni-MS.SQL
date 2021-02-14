CREATE PROCEDURE usp_EmployeesBySalaryLevel (@SalaryLevel NVARCHAR(MAX))
AS
SELECT e.FirstName AS [First Name],
	   e.LastName AS [Last Name]
	FROM Employees AS e
		WHERE dbo.ufn_GetSalaryLevel(e.Salary) = @SalaryLevel