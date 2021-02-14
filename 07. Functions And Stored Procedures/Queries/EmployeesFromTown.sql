CREATE PROCEDURE usp_GetEmployeesFromTown (@TownName NVARCHAR(MAX))
AS
SELECT e.FirstName AS FirstName, e.LastName AS LastName
	FROM Employees AS e
		INNER JOIN Addresses AS a ON e.AddressID = a.AddressID
		INNER JOIN Towns AS t ON a.TownID = t.TownID
			WHERE t.Name = @TownName