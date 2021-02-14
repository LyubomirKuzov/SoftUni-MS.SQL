SELECT COUNT(c.Id)
	FROM Colonists AS c
		INNER JOIN TravelCards AS tc ON tc.ColonistId = c.Id
		INNER JOIN Journeys AS j ON j.Id = tc.JourneyId
			WHERE j.Purpose = 'Technical'