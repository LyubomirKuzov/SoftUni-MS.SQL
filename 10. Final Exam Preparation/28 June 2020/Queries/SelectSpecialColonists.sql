SELECT x1.JobDuringJourney,
	   x1.FullName,
	   x1.JobRank
	FROM (SELECT	tc.JobDuringJourney,
		CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
		DENSE_RANK() OVER (PARTITION BY tc.JobDuringJourney ORDER BY c.BirthDate ASC) AS JobRank
	FROM Colonists AS c
		INNER JOIN TravelCards AS tc ON tc.ColonistId = c.Id) AS x1
		WHERE x1.JobRank = 2