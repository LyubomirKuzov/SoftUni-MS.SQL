SELECT TOP(50) e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName, CONCAT(m.FirstName, ' ', m.LastName) AS ManagerName, d.Name AS DepartmentName
	FROM Employees e
	INNER JOIN Employees m ON e.ManagerID = m.EmployeeID
	INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
		ORDER BY e.EmployeeID