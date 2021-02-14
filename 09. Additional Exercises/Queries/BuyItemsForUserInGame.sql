DECLARE @UserId INT = (SELECT Id FROM Users WHERE Username = 'Alex')
DECLARE @GameId INT = (SELECT Id FROM Games WHERE Name = 'Edinburgh')
DECLARE @UsersGamesId INT = (SELECT Id FROM UsersGames WHERE UserId = @UserId AND GameId = @GameId)
DECLARE @ItemsTotalPrice DECIMAL(18,4) = (SELECT SUM(Price) FROM Items WHERE Id IN (SELECT i.Id FROM Items AS i
			WHERE i.Name IN ('Blackguard', 'Bottomless Potion of Amplification', 'Eye of Etlich (Diablo III)', 'Gem of Efficacious Toxin', 'Golden Gorget of Leoric', 'Hellfire Amulet')))

INSERT INTO UserGameItems
	SELECT i.Id, @UsersGamesId
		FROM Items AS i
			WHERE i.Name IN ('Blackguard', 'Bottomless Potion of Amplification', 'Eye of Etlich (Diablo III)', 'Gem of Efficacious Toxin', 'Golden Gorget of Leoric', 'Hellfire Amulet')

UPDATE UsersGames
	SET Cash -= @ItemsTotalPrice
		WHERE Id = @UsersGamesId

SELECT u.Username,
	   g.Name,
	   ug.Cash,
	   i.Name
	FROM Users AS u
		INNER JOIN UsersGames AS ug ON ug.UserId = u.Id
		INNER JOIN Games AS g ON g.Id = ug.GameId
		INNER JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
		INNER JOIN Items AS i ON i.Id = ugi.ItemId
			WHERE g.Name = 'Edinburgh'
				ORDER BY i.Name ASC