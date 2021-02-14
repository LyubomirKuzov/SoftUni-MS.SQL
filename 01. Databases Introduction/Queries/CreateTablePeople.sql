CREATE TABLE People
(
Id int IDENTITY(1, 1) PRIMARY KEY,
[Name] NVARCHAR(200) NOT NULL,
Picture VARBINARY(MAX),
Height DECIMAL(3,2),
[Weight] DECIMAL(5,2),
Gender CHAR(1) NOT NULL,
Birthdate DATE NOT NULL,
Biography NVARCHAR(max)
)

INSERT INTO People ([Name], Picture, Height, [Weight], Gender, Birthdate, Biography)
VALUES
('Pesho', 2000, 1.73, 150.00, 'm', '09-15-1999', 'Gamer'),
('Gosho', 2000, 1.80, 90.00, 'm', '09-15-1999', 'Fan'),
('Marin', 4000, 1.51, 124.50, 'm', '09-15-1999', 'Boxer'),
('Jivko', 1500, 1.87, 80.50, 'm', '09-15-1999', NULL),
('Ivan', 1000, NULL, NULL, 'm', '09-15-1999', 'Streamer')
