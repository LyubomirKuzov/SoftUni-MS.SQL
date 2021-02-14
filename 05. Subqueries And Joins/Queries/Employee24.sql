SELECT e.EmployeeID, e.FirstName,
	CASE
		WHEN DATEPART(YEAR, p.StartDate) >= 2005 THEN NULL
		ELSE p.Name
	END AS ProjectName
	FROM Employees e
	INNER JOIN EmployeesProjects ep ON e.EmployeeID = ep.EmployeeID
	INNER JOIN Projects p ON p.ProjectID = ep.ProjectID
		WHERE e.EmployeeID = 24