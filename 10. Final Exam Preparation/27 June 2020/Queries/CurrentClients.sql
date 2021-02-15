SELECT CONCAT(c.FirstName, ' ', c.LastName) AS Client,
	   DATEDIFF(DAY, j.IssueDate, '2017.04.24') AS [Days going],
	   j.Status AS Status
	FROM Jobs AS j
		INNER JOIN Clients AS c ON c.ClientId = j.ClientId
			WHERE j.Status != 'Finished'
				ORDER BY [Days going] DESC, c.ClientId