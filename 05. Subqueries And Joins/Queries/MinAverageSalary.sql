SELECT TOP(1) AVG(Salary) AS MinAverageSalary
	FROM Employees e
		GROUP BY e.DepartmentID
			ORDER BY MinAverageSalary