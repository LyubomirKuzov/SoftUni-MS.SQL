SELECT CONCAT(p.FirstName, ' ', p.LastName) AS [Full Name],
	   f.Origin AS Origin,
	   f.Destination AS Destination
	FROM Passengers AS p
		INNER JOIN Tickets AS t ON t.PassengerId = p.Id
		INNER JOIN Flights AS f ON f.Id = t.FlightId
			ORDER BY [Full Name] ASC, Origin ASC, Destination ASC