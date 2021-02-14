SELECT x1.DepartmentID, x1.MaxSalary
	FROM (
		SELECT DepartmentID, MAX(Salary) AS MaxSalary
		FROM Employees
		GROUP BY DepartmentID
		 ) AS x1
	WHERE x1.MaxSalary NOT BETWEEN 30000 AND 70000