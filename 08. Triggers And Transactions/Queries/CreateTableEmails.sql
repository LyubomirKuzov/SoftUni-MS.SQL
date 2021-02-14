CREATE TABLE NotificationEmails
(
Id INT PRIMARY KEY IDENTITY,
Recipient INT FOREIGN KEY REFERENCES Accounts(Id),
[Subject] VARCHAR(MAX) NOT NULL,
Body VARCHAR(MAX) NOT NULL
)

CREATE TRIGGER TR_CreateEmailForNewInsertInLogs ON Logs FOR INSERT
AS
INSERT INTO NotificationEmails(Recipient, Subject, Body)
SELECT i.AccountID,
	   CONCAT('Balance change for account: ', CAST(i.AccountID AS NVARCHAR(MAX))),
	   CONCAT('On ', CAST(GETDATE() AS NVARCHAR(MAX)), ' your balance was changed from ', CAST(i.OldSum AS NVARCHAR(MAX)), ' to ', CAST(i.NewSum AS NVARCHAR(MAX)))
	FROM inserted AS i