SELECT c.Id AS id,
	   CONCAT(c.FirstName, ' ', c.LastName) AS full_name
	FROM Colonists AS c
		INNER JOIN TravelCards AS t ON t.ColonistId = c.Id
			WHERE t.JobDuringJourney = 'Pilot'
				ORDER BY c.Id