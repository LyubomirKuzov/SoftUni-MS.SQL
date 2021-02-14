CREATE PROC usp_AssignProject (@employeeId INT, @projectId INT)
AS
BEGIN
BEGIN TRANSACTION
	DECLARE @projectsCount INT = (SELECT COUNT(*) FROM EmployeesProjects WHERE EmployeeID = @employeeId)

	IF (@projectsCount >= 3)
	BEGIN
		RAISERROR('The employee has too many projects!',16,1)
		ROLLBACK
	END

	INSERT INTO EmployeesProjects
		VALUES (@employeeId, @projectId)
COMMIT
END