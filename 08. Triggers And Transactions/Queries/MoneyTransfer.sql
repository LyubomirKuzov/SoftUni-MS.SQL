CREATE PROC usp_TransferMoney(@SenderId int, @ReceiverId int, @Amount money)
AS
BEGIN
    BEGIN TRANSACTION
        IF @Amount > 0
            BEGIN
                EXEC usp_WithdrawMoney @SenderId, @Amount;
                EXEC usp_DepositMoney @ReceiverId, @Amount;
            END
    COMMIT
END