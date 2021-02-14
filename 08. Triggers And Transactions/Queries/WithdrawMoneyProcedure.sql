CREATE PROCEDURE usp_WithdrawMoney (@AccoundID INT, @MoneyAmount DECIMAL(15,4))
AS
IF ((@AccoundID IN (SELECT Id FROM Accounts)) AND (@MoneyAmount > 0))
BEGIN
UPDATE Accounts
	SET Balance -= @MoneyAmount
		WHERE Id = @AccoundID
END