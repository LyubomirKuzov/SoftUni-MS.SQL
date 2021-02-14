CREATE DATABASE Hotel

CREATE TABLE Employees
(
Id INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Title VARCHAR(20),
Notes VARCHAR(MAX)
)

CREATE TABLE Customers
(
AccountNumber INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
EmergencyName VARCHAR(20) NOT NULL,
EmergencyNumber VARCHAR(20) NOT NULL,
Notes VARCHAR(MAX)
)

CREATE TABLE RoomStatus
(
RoomStatus VARCHAR(50) PRIMARY KEY NOT NULL,
Notes VARCHAR(MAX) 
)

CREATE TABLE RoomTypes
(
RoomType VARCHAR(50) PRIMARY KEY NOT NULL,
Notes VARCHAR(MAX)
)

CREATE TABLE BedTypes
(
BedType VARCHAR(50) PRIMARY KEY NOT NULL,
Notes VARCHAR(MAX)
)

CREATE TABLE Rooms
(
RoomNumber INT PRIMARY KEY,
RoomType VARCHAR(50) NOT NULL,
BedType VARCHAR(50) NOT NULL,
Rate DECIMAL(3,1) NOT NULL,
RoomStatus VARCHAR(50) NOT NULL,
Notes VARCHAR(MAX)

CONSTRAINT FK_Rooms_RoomTypes
	FOREIGN KEY (RoomType)
		REFERENCES RoomTypes(RoomType),

CONSTRAINT FK_Rooms_BedTypes
	FOREIGN KEY (BedType)
		REFERENCES BedTypes(BedType),

CONSTRAINT FK_Rooms_RoomStatus
	FOREIGN KEY (RoomStatus)
		REFERENCES RoomStatus(RoomStatus)
)

CREATE TABLE Payments
(
Id INT IDENTITY(1,1) PRIMARY KEY,
EmployeeId INT NOT NULL,
PaymentDate DATE NOT NULL,
AccountNumber INT NOT NULL,
FirstDateOccupied DATE NOT NULL,
LastDateOccupied DATE NOT NULL,
TotalDays AS DATEDIFF(DAY, FirstDateOccupied, LastDateOccupied),
AmountCharged DECIMAL(7,2) NOT NULL,
TaxRate DECIMAL(7,2) NOT NULL,
TaxAmount DECIMAL(7,2) NOT NULL,
PaymentTotal DECIMAL(7, 2) NOT NULL,
Notes VARCHAR(MAX)

CONSTRAINT FK_Payments_Employees
	FOREIGN KEY (EmployeeId)
		REFERENCES Employees(Id),

CONSTRAINT FK_Payments_Customers
	FOREIGN KEY (AccountNumber)
		REFERENCES Customers(AccountNumber)
)

CREATE TABLE Occupancies
(
Id INT IDENTITY(1,1) PRIMARY KEY,
EmployeeId INT NOT NULL,
DateOccupied DATE NOT NULL,
AccountNumber INT NOT NULL,
RoomNumber INT NOT NULL,
RateApplied DECIMAL(7,2) NOT NULL,
PhoneCharge DECIMAL(7,2),
Notes VARCHAR(MAX)

CONSTRAINT FK_Occupancies_Employees
	FOREIGN KEY (EmployeeId)
		REFERENCES Employees(Id),

CONSTRAINT FK_Occupancies_Customers
	FOREIGN KEY (AccountNumber)
		REFERENCES Customers(AccountNumber),

CONSTRAINT FK_Occupancies_Rooms
		FOREIGN KEY (RoomNumber)
			REFERENCES Rooms(RoomNumber)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
	VALUES
	('Ivan', 'Ivanov', 'Worker', NULL),	
	('Gisho', 'Goshev', 'Worker', 'Some notes'),	
	('Petko', 'Petkov', 'Worker', NULL)

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
	VALUES
	('Pesho', 'Peshev', '1252421425', 'Emergency name', '1255512535', 'Some notes'),
	('Ivanko', 'Vankov', '1252421425', 'Emergency name', '1255512535', 'Some notes'),
	('Mitko', 'Mitkov', '1252421425', 'Emergency name', '1255512535', 'Note')

INSERT INTO RoomStatus(RoomStatus, Notes)
	VALUES
	('Free', NULL),
	('Cleaning', NULL),
	('Taken', 'Not free!')

INSERT INTO RoomTypes(RoomType, Notes)
	VALUES
	('Small', NULL),
	('Average', NULL),
	('Big', 'Huge room!')

INSERT INTO BedTypes(BedType, Notes)
	VALUES
	('Wooden', NULL),
	('Normal', NULL),
	('Luxury', NULL)

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
	VALUES
	(1, 'Small', 'Wooden', 4.0, 'Free', NULL),
	(2, 'Average', 'Normal', 7.0, 'Taken', NULL),
	(3, 'Big', 'Luxury', 9.8, 'Cleaning', NULL)

INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
	VALUES
	(1, '10-10-2019', 1, '10-10-2020', '10-11-2020', 5000.00, 5.5, 50.15, 6500.00, NULL),
	(2, '10-10-2019', 2, '10-10-2020', '10-11-2020', 5000.00, 5.5, 50.15, 6500.00, NULL),
	(3, '10-10-2019', 3, '10-10-2020', '10-11-2020', 5000.00, 5.5, 50.15, 6500.00, NULL)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
	VALUES
	(1, '2020-12-15', 1, 1, 1000.50, 1500.50, 'The note'),	
	(2, '2020-12-15', 2, 2, 1000.50, 1500.50, NULL),
	(3, '2020-12-15', 3, 3, 1000.50, 1500.50, 'The note')

SELECT * FROM Employees
SELECT * FROM Customers
SELECT * FROM RoomStatus
SELECT * FROM RoomTypes
SELECT * FROM BedTypes
SELECT * FROM Rooms
SELECT * FROM Payments
SELECT * FROM Occupancies