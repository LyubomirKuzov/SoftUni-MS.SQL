SELECT TOP(5) e.EmployeeID, e.JobTitle, e.AddressID, a.AddressText
	FROM Employees e
	LEFT JOIN Addresses a ON e.AddressID = a.AddressID
		ORDER BY a.AddressID