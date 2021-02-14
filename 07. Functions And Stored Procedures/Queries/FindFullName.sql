CREATE PROCEDURE usp_GetHoldersFullName
AS
SELECT CONCAT(ah.FirstName, ' ', ah.LastName) AS [Full Name]
	FROM AccountHolders AS ah