CREATE PROCEDURE usp_DepositMoney (@AccountID INT, @MoneyAmound DECIMAL(15,4))
AS
IF ((@AccountID IN (SELECT Id FROM Accounts)) AND (@MoneyAmound > 0))
BEGIN
UPDATE Accounts
	SET Balance += @MoneyAmound
		WHERE Id = @AccountID
END