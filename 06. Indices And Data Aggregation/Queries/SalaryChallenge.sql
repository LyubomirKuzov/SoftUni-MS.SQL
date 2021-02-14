SELECT TOP(10) e.FirstName, e.LastName, e.DepartmentID
	FROM (
		SELECT DepartmentID, AVG(Salary) AS AverageSalary
			FROM Employees
				GROUP BY DepartmentID
		 ) AS x1
		 INNER JOIN Employees AS e ON x1.DepartmentID = e.DepartmentID
			WHERE e.Salary > x1.AverageSalary
				ORDER BY e.DepartmentID