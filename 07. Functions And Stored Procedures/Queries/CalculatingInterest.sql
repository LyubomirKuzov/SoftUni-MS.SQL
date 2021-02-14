CREATE PROCEDURE usp_CalculateFutureValueForAccount (@AccountID INT, @InterestRate FLOAT)
AS
BEGIN
SELECT a.Id AS [Account ID],
	   ac.FirstName AS [First Name],
	   ac.LastName AS [Last Name],
	   a.Balance AS [Current Balance],
	   dbo.ufn_CalculateFutureValue(a.Balance, @InterestRate, 5) AS [Balance in 5 years]
	FROM Accounts AS a
		INNER JOIN AccountHolders AS ac ON a.AccountHolderId = ac.Id	
			WHERE a.Id = @AccountID
END