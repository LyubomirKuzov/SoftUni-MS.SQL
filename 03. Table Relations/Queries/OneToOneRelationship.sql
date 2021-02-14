CREATE TABLE Passports
(
PassportID INT PRIMARY KEY IDENTITY(101, 1),
PassportNumber CHAR(8) NOT NULL
)

CREATE TABLE Persons
(
PersonID INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(40) NOT NULL,
Salary DECIMAL(8,2) NOT NULL,
PassportID INT UNIQUE NOT NULL

CONSTRAINT FK_Persons_Passports
	FOREIGN KEY (PassportID)
		REFERENCES Passports(PassportID)
)

INSERT INTO Passports (PassportNumber)
	VALUES
		('N34FG21B'),
		('K65LO4R7'),
		('ZE657QP2')

INSERT INTO Persons (FirstName, Salary, PassportID)
	VALUES
		('Roberto', 43300.00 ,102),
		('Tom', 56100.00, 103),
		('Yana', 60200.00, 101)