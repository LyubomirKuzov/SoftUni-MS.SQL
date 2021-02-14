DECLARE @Username NVARCHAR(max) = 'Stamat'
DECLARE @GameName NVARCHAR(max) = 'Safflower'

DECLARE @UserId INT = (SELECT Id FROM Users WHERE Username = @Username)
DECLARE @GameId INT = (SELECT Id FROM Games WHERE Name = @GameName)
DECLARE @UserMoney MONEY = (SELECT Cash FROM UsersGames WHERE UserId = @UserId AND GameId = @GameId)
DECLARE @UserGameId INT = (SELECT Id FROM UsersGames WHERE UserId = @UserId AND GameId = @GameId)
DECLARE @ItemsTotalPrice MONEY = 0

BEGIN TRANSACTION
SET @ItemsTotalPrice = (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN 11 AND 12)
 
IF(@UserMoney - @ItemsTotalPrice >= 0)
	BEGIN
		INSERT INTO UserGameItems
			SELECT i.Id, @UserGameId 
				FROM Items AS i
					WHERE i.Id IN (SELECT Id FROM Items WHERE MinLevel BETWEEN 11 AND 12)
 
        UPDATE UsersGames
			SET Cash -= @ItemsTotalPrice
				WHERE GameId = @GameId AND UserId = @UserId
        COMMIT
    END

ELSE
	BEGIN
		ROLLBACK
	END
 
SET @UserMoney = (SELECT Cash FROM UsersGames WHERE UserId = @userID AND GameId = @gameID)

BEGIN TRANSACTION
SET @ItemsTotalPrice = (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN 19 AND 21)
 
IF(@UserMoney - @ItemsTotalPrice >= 0)
	BEGIN
		INSERT INTO UserGameItems
			SELECT i.Id, @UserGameId 
				FROM Items AS i
					WHERE i.Id IN (SELECT Id FROM Items WHERE MinLevel BETWEEN 19 AND 21)
 
        UPDATE UsersGames
			SET Cash -= @ItemsTotalPrice
				WHERE GameId = @GameId AND UserId = @UserId
        COMMIT
    END

ELSE
	BEGIN
		ROLLBACK
	END
 
SELECT Name AS [Item Name]
    FROM Items
		WHERE Id IN (SELECT ItemId FROM UserGameItems WHERE UserGameId = @UserGameId)
			ORDER BY [Item Name]