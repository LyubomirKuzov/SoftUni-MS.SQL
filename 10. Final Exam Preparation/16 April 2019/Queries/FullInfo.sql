SELECT CONCAT(p.FirstName, ' ', p.LastName) AS [Full Name],
	   pl.Name AS [Plane Name],
	   CONCAT(f.Origin, ' - ', f.Destination) AS Trip,
	   lt.Type AS LuggageType
	FROM Passengers AS p
		INNER JOIN Tickets AS t ON t.PassengerId = p.Id
		INNER JOIN Flights AS f ON f.Id = t.FlightId
		INNER JOIN Planes AS pl ON pl.Id = f.PlaneId
		INNER JOIN Luggages AS l ON l.Id = t.LuggageId
		INNER JOIN LuggageTypes AS lt ON lt.Id = l.LuggageTypeId
			ORDER BY [Full Name], [Plane Name], f.Origin, f.Destination, LuggageType