SELECT p.FirstName AS [First Name], 
	   p.LastName AS [Last Name],
	   p.Age AS Age
	FROM Passengers AS p
		LEFT JOIN Tickets AS t ON t.PassengerId = p.Id
		LEFT JOIN Flights AS f ON f.Id = t.FlightId
			WHERE t.FlightId IS NULL
				ORDER BY Age DESC, [First Name] ASC, [Last Name] ASC