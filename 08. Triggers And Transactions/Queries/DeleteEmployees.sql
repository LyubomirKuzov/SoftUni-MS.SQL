CREATE TRIGGER TR_InsertDeletedEmployees ON Employees AFTER DELETE
AS
BEGIN
INSERT INTO Deleted_Employees
	SELECT d.FirstName,
		   d.LastName,
		   d.MiddleName,
		   d.JobTitle,
		   d.DepartmentID,
		   d.Salary
		FROM deleted AS d
END

CREATE TABLE Deleted_Employees
(
EmployeeId INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(MAX) NOT NULL,
LastName VARCHAR(MAX) NOT NULL,
MiddleName VARCHAR(MAX),
JobTitle VARCHAR(MAX) NOT NULL,
DepartmentId INT NOT NULL,
Salary MONEY NOT NULL
)