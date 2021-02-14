SELECT x1.FlightId AS FlightId,
	   SUM(x1.Price) AS Price
	FROM (SELECT f.Id AS FlightId,
	   t.Price AS Price
	FROM Flights AS f
		INNER JOIN Tickets AS t ON t.FlightId = f.Id) AS x1
		GROUP BY x1.FlightId
			ORDER BY Price DESC, FlightId ASC
		