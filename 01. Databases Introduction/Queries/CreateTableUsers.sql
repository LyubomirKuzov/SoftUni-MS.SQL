CREATE TABLE Users
(
Id int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
Username VARCHAR(30) NOT NULL,
[Password] VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(MAX),
LastLoginTime DATE,
IsDeleted BIT NOT NULL
)

INSERT INTO Users (Username, [Password], ProfilePicture, LastLoginTime, IsDeleted)
VALUES
('Pesho1', '12421512', 2000, '08-12-2007', 0),
('G0sho', '511251', NULL, '04-12-2008', 1),
('Mar1n', '51fsa', NULL, NULL, 0),
('JivkoOo', '5125afsas', NULL, '06-04-2012', 1),
('1van', '51521fsafa', NULL, NULL, 1)