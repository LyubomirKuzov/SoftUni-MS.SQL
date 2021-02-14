CREATE TABLE Logs
(
LogID INT NOT NULL IDENTITY,
AccountID INT FOREIGN KEY REFERENCES Accounts(Id),
OldSum DECIMAL(15,2) NOT NULL,
NewSum DECIMAL(15,2) NOT NULL
)

CREATE TRIGGER T_AddToLogsOnAccountsUpdate ON Accounts FOR UPDATE
AS
INSERT INTO Logs(AccountID, OldSum, NewSum)
SELECT i.Id, d.Balance, i.Balance
	FROM inserted AS i
		JOIN deleted AS d ON i.Id = d.Id
			WHERE i.Balance != d.Balance


