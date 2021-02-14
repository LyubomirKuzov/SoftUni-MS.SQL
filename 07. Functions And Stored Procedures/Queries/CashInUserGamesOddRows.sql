CREATE FUNCTION ufn_CashInUsersGames (@GameName NVARCHAR(MAX))
	RETURNS TABLE
AS
	RETURN SELECT SUM(x1.Cash) AS SumCash
		FROM (SELECT g.Name,
					 ug.Cash,
					 ROW_NUMBER() OVER (PARTITION BY g.Name ORDER BY ug.Cash DESC) AS RowNumber
						FROM UsersGames AS ug
							INNER JOIN Games AS g ON ug.GameId = g.Id
								WHERE g.Name = @GameName) AS x1
			WHERE x1.RowNumber % 2 != 0