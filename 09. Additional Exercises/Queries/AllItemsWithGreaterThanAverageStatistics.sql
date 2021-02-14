SELECT I.Name,
	   I.Price, 
	   I.MinLevel, 
	   S.Strength, 
	   S.Defence, 
	   S.Speed, 
	   S.Luck,
	   S.Mind
	FROM Items AS i
		INNER JOIN [Statistics] AS s ON s.Id = i.StatisticId
			WHERE s.Mind > (SELECT AVG(Mind) FROM [Statistics])
			AND s.Luck > (SELECT AVG(Luck) FROM [Statistics])
			AND s.Speed > (SELECT AVG(Speed) FROM [Statistics])