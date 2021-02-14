SELECT g.Name AS Game,
	   gt.Name AS [Game Type],
	   u.Username AS Username,
	   ug.Level AS Level,
	   ug.Cash AS Cash,
	   c.Name AS Character
	FROM Users AS u
		INNER JOIN UsersGames AS ug ON u.Id = ug.UserId
		INNER JOIN Games AS g ON ug.GameId = g.Id
		INNER JOIN GameTypes AS gt ON g.GameTypeId = gt.Id
		INNER JOIN Characters AS c ON ug.CharacterId = c.Id
			ORDER BY ug.Level DESC, u.Username ASC, g.Name ASC