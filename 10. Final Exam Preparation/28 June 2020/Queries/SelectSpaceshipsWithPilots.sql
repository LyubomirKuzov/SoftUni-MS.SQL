SELECT s.Name,
	   s.Manufacturer
	FROM Spaceships AS s
		INNER JOIN Journeys AS j ON j.SpaceshipId = s.Id
		INNER JOIN TravelCards AS tc ON tc.JourneyId = j.Id
		INNER JOIN Colonists AS c ON c.Id = tc.ColonistId
			WHERE DATEDIFF(YEAR, c.BirthDate, '2019.01.01') < 30 AND tc.JobDuringJourney = 'Pilot'
				ORDER BY s.Name