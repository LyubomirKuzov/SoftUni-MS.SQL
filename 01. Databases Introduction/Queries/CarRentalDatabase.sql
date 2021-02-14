CREATE DATABASE CarRental

USE CarRental

CREATE TABLE Categories
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
CategoryName VARCHAR(MAX) NOT NULL,
DailyRate DECIMAL(4,2) NOT NULL,
WeeklyRate DECIMAL(5,2) NOT NULL,
MonthlyRate DECIMAL(6,2) NOT NULL,
WeekendRate DECIMAL(4,2) NOT NULL
)

CREATE TABLE Cars 
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
PlateNumber VARCHAR(8) NOT NULL,
Manufacturer VARCHAR(20) NOT NULL,
Model VARCHAR(20) NOT NULL,
CarYear DATE NOT NULL,
CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
Doors TINYINT NOT NULL,
Picture VARBINARY(MAX),
Condition VARCHAR(MAX),
Available BIT NOT NULL
)

CREATE TABLE Employees
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20) NOT NULL,
Title VARCHAR(30),
Notes VARCHAR(MAX)
)

CREATE TABLE Customers
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
DriverLicenseNumber VARCHAR(20) NOT NULL,
FullName VARCHAR(50) NOT NULL,
Adress VARCHAR(MAX) NOT NULL,
City VARCHAR(30) NOT NULL,
ZIPCode INT NOT NULL,
Notes VARCHAR(MAX)
)

CREATE TABLE RentalOrders
(
Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
CustomerId INT FOREIGN KEY REFERENCES Customers(Id) NOT NULL,
CarId INT FOREIGN KEY REFERENCES Cars(Id) NOT NULL,
TankLevel VARCHAR(20) NOT NULL,
KilometrageStart INT NOT NULL,
KilometrageEnd INT NOT NULL,
TotalKilometrage INT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
TotalDays INT NOT NULL,
RateApplied DECIMAL(3,1) NOT NULL,
TaxRate DECIMAL(6,2) NOT NULL,
OrderStatus VARCHAR(20) NOT NULL,
Notes VARCHAR(MAX)
)

INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
	VALUES	
	('Combi', 20.00, 100.00, 1000.00, 50.00),
	('Sedan', 20.00, 100.00, 1000.00, 50.00),
	('SUV', 20.00, 100.00, 1000.00, 50.00)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
	VALUES
	('sf2412fs', 'Audi', 'A3', '05-15-2006', 1, 2, NULL, 'New', 1),
	('fs9808ss', 'BMW', '335', '05-20-2006', 2, 4, 2000, 'New', 0),
	('ss8098fa', 'Mercedes', 'CLS', '05-25-2006', 3, 2, NULL, 'Second Hand', 1)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
	VALUES	
	('Ivan', 'Petkov', 'Car Seller', NULL),
	('Petko', 'Ivanov', 'Car Seller', 'I am seller!'),	
	('Joro', 'Bekama', 'Car Seller', NULL)

INSERT INTO Customers (DriverLicenseNumber, FullName, Adress, City, ZIPCode, Notes)
	VALUES
	('21gsag14', 'Ivan Hristov', 'Adress', 'Varna', 4000, NULL),	
	('42jlhl24', 'Ivo Andonov', 'Adress', 'Sofia', 3000, 'Some notes'),	
	('124lhk42', 'Ivanko Dimitrichkov', 'Adress', 'City', 5000, NULL)

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
	VALUES
	(1, 1, 1, 'Full', 0, 300, 300, '01-01-2020', '01-20-2020', 20, 9.0, 1000.00, 'Delivered', 'Some Notes'),
	(2, 2, 3, 'Half Full', 0, 300, 300, '01-01-2020', '01-20-2020', 20, 9.0, 1000.00, 'Delivered', 'Some Notes'),
	(3, 3, 3, 'Full', 0, 300, 300, '01-01-2020', '01-20-2020', 20, 9.0, 1000.00, 'Delivered', 'Some Notes')

SELECT * FROM Categories
SELECT * FROM Cars
SELECT * FROM Employees
SELECT * FROM Customers
SELECT * FROM RentalOrders