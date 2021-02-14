CREATE TRIGGER TR_PreventInsertingHigherLevelItems ON UserGameItems INSTEAD OF INSERT
AS
INSERT INTO UserGameItems(ItemId, UserGameId)
SELECT it.Id, ug.GameId
	FROM inserted AS i
		INNER JOIN UsersGames AS ug ON i.UserGameId = ug.GameId
		INNER JOIN Items AS it ON i.ItemId = it.Id
			WHERE ug.Level >= it.MinLevel



UPDATE UsersGames
	SET Cash += 50000
		FROM UsersGames AS ug
			INNER JOIN Users AS u ON ug.UserId = u.Id
			INNER JOIN Games AS g ON ug.GameId = g.Id
				WHERE u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos')
				AND g.Name = 'Bali'



CREATE PROC usp_BuyItemsForUser (@Username VARCHAR(MAX))
AS
BEGIN
	DECLARE @UserId INT = (SELECT Id FROM Users WHERE Username = @Username)

	DECLARE @GameId INT = (SELECT Id FROM Games WHERE Name = 'Bali')

	DECLARE @UserGameId INT = (SELECT Id FROM UsersGames WHERE UserId = @UserId AND GameId = @GameId)

	DECLARE @UserGameLevel INT = (SELECT [Level] FROM UsersGames WHERE Id = @UserGameId)

	DECLARE @IndexCounter INT = 251

	WHILE (@IndexCounter <= 539)
	BEGIN
		DECLARE @CurrentItemPrice DECIMAL(18,4) = (SELECT Price FROM Items WHERE Id = @IndexCounter)

		DECLARE @CurrentItemMinLevel INT = (SELECT [MinLevel] FROM Items WHERE Id = @IndexCounter)

		DECLARE @UserCash DECIMAL(18,4) = (SELECT Cash FROM UsersGames WHERE Id = @UserGameId)

		IF (@UserCash >= @CurrentItemPrice AND @UserGameLevel >= @CurrentItemMinLevel)
		BEGIN
			UPDATE UsersGames
				SET Cash -= @CurrentItemPrice	
					WHERE Id = @UserGameId

			INSERT INTO UserGameItems
				VALUES (@IndexCounter, @UserGameId)
		END

		SET @IndexCounter += 1

		IF (@IndexCounter > 299)
		BEGIN
			SET @IndexCounter = 501
		END
	END
END



SELECT u.Username,
       g.Name,
	   ug.Cash,
	   i.Name
	FROM Users AS u
		INNER JOIN UsersGames AS ug ON u.Id = ug.UserId
		INNER JOIN Games AS g ON ug.GameId = g.Id	
		INNER JOIN UserGameItems AS ugi ON ug.Id = ugi.UserGameId
		INNER JOIN Items AS i ON ugi.ItemId = i.Id
			WHERE g.Name = 'Bali'
				ORDER BY u.Username ASC, i.Name ASC