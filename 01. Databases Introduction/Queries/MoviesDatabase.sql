CREATE DATABASE Movies

USE Movies

CREATE TABLE Directors
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
DirectorName VARCHAR(MAX) NOT NULL,
Notes VARCHAR(MAX)
)

CREATE TABLE Genres
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
GenreName VARCHAR(MAX) NOT NULL,
Notes VARCHAR(MAX)
)

CREATE TABLE Categories
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
CategoryName VARCHAR(MAX) NOT NULL,
Notes VARCHAR(MAX)
)

CREATE TABLE Movies
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Title VARCHAR(MAX) NOT NULL,
DirectorId INT FOREIGN KEY REFERENCES Directors(Id) NOT NULL,
CopyrightYear DATE,
[Length] TIME,
GenreId INT FOREIGN KEY REFERENCES Genres(Id) NOT NULL,
CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
Rating DECIMAL(3,1),
Notes NVARCHAR(MAX)
)

INSERT INTO Directors (DirectorName, Notes)
	VALUES
		('Steve', 'gagsagasg'),		
		('Philip', NULL),		
		('Ivan', 'gkk')	,	
		('Gosho', NULL),		
		('Petko', 'gkggjkkgg')

INSERT INTO Genres (GenreName, Notes)
	VALUES
		('Drama', 'agsagasgsa'),
		('Action', 'gasgasgas'),
		('Comedy', NULL),
		('Fantasy', NULL),
		('Ancient', NULL)

INSERT INTO Categories (CategoryName, Notes)
	VALUES
	('Drama', 'agsagasgsa'),
	('Action', 'gasgasgas'),
	('Comedy', NULL),
	('Fantasy', NULL),
	('Ancient', NULL)

INSERT INTO Movies (Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes)
	VALUES	
	('Lord of the rings', 2, NULL, '02:32:44', 4, 2, 10.0, NULL),
	('Star wars', 3, '02-12-1995', '01:42:32', 2, 3, 9.0, 'asasgaga'),
	('Harry potter', 1, '03-05-2000', '04:12:23', 5, 1, 7.7, NULL),
	('Pirates of the caribbean', 4 ,'02-14-2005', '02:24:21', 2, 3, 8.0, 'fgsagasgasgas'),
	('Fast and furious', 3, NULL, '02:52:23', 1, 4, 5.5, NULL)

SELECT * FROM Directors
SELECT * FROM Categories
SELECT * FROM Genres
SELECT * FROM Movies
