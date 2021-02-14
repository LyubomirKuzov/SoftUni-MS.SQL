SELECT x2.DepartmentID, x2.Salary
	FROM (
		SELECT x1.DepartmentID, Salary, DENSE_RANK() OVER (PARTITION BY x1.DepartmentID ORDER BY x1.Salary DESC) AS RankedSalary
			FROM (
				SELECT DepartmentID, Salary
				FROM Employees
				GROUP BY DepartmentID, Salary
				 ) AS x1
		 ) AS x2
		WHERE x2.RankedSalary = 3