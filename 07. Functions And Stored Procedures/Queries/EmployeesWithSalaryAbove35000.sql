CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
SELECT e.FirstName AS FirstName, e.LastName AS LastName
	FROM Employees AS e
		WHERE e.Salary > 35000