SELECT x1.Mechanic,
	   x1.[Average Days]
	FROM (SELECT CONCAT(m.FirstName, ' ', m.LastName) AS Mechanic,
	   AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate)) AS [Average Days]
	FROM Jobs AS j
		INNER JOIN Mechanics AS m ON m.MechanicId = j.MechanicId
		GROUP BY m.FirstName, m.LastName) AS x1
		INNER JOIN Mechanics AS m ON CONCAT(m.FirstName, ' ', m.LastName) = x1.Mechanic
			ORDER BY m.MechanicId