SELECT a.Id AS AccountId,
	   CONCAT(FirstName, ' ', LastName) AS FullName,
	   MAX(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS LongestTrip,
	   MIN(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS ShortestTrip
	FROM Trips AS t
		INNER JOIN AccountsTrips AS ac ON ac.TripId = t.Id
		INNER JOIN Accounts AS a ON a.Id = ac.AccountId
			WHERE a.MiddleName IS NULL AND t.CancelDate IS NULL
				GROUP BY a.Id, a.FirstName, a.LastName
					ORDER BY LongestTrip DESC, ShortestTrip