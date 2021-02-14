SELECT *
	FROM (SELECT u.Username,
	   g.Name AS Game,
	   COUNT(i.Id) AS [Items Count],
	   SUM(i.Price) AS [Items Price]
	FROM Users AS u
		INNER JOIN UsersGames AS ug ON u.Id = ug.UserId
		INNER JOIN Games AS g ON ug.GameId = g.Id
		INNER JOIN UserGameItems AS ugi ON ug.Id = ugi.UserGameId
		INNER JOIN Items AS i ON ugi.ItemId = i.Id
			GROUP BY u.Username, g.Name) AS x1
		WHERE x1.[Items Count] >= 10
			ORDER BY x1.[Items Count] DESC, x1.[Items Price] DESC, x1.Username ASC