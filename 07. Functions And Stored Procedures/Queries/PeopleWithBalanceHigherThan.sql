CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@Money DECIMAL(20,4))
AS
SELECT x1.FirstName, x1.LastName
	FROM (SELECT ah.FirstName, ah.LastName, SUM(a.Balance) AS TotalBalance
			FROM AccountHolders AS ah
				INNER JOIN Accounts AS a ON ah.Id = a.AccountHolderId
					GROUP BY ah.FirstName, ah.LastName) AS x1
		WHERE x1.TotalBalance > @Money
			ORDER BY x1.FirstName, x1.LastName