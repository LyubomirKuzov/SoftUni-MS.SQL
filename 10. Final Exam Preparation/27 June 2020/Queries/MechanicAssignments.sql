SELECT CONCAT(m.FirstName, ' ', m.LastName) AS Mechanic,
	   j.Status AS Status,
	   j.IssueDate AS IssueDate
	FROM Mechanics AS m
		INNER JOIN Jobs AS j ON j.MechanicId = m.MechanicId
			ORDER BY m.MechanicId, j.IssueDate, j.JobId