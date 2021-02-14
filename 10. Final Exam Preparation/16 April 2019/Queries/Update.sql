UPDATE Tickets
	SET Price *= 1.13
		FROM Tickets AS t
			INNER JOIN Flights AS f ON f.Id = t.FlightId
				WHERE f.Destination = 'Carlsbad'