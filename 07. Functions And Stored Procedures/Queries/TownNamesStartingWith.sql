CREATE PROCEDURE usp_GetTownsStartingWith (@StartText VARCHAR(MAX))
AS
SELECT t.Name AS Town
	FROM Towns AS t	
		WHERE t.Name LIKE (@StartText + '%')