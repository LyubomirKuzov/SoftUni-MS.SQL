SELECT t.Id AS Id,
	   CASE
			WHEN a.MiddleName IS NULL THEN CONCAT(a.FirstName, ' ', a.LastName)
			ELSE CONCAT(a.FirstName, ' ', a.MiddleName, ' ', a.LastName)
	   END AS [Full Name],
	   ca.Name AS [From],
	   ch.Name AS [To],
	   CASE
			WHEN t.CancelDate IS NOT NULL THEN 'Canceled'
			ELSE CAST(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate) AS VARCHAR(MAX)) + ' days'
	   END AS Duration
	FROM Trips AS t
		INNER JOIN AccountsTrips AS act ON act.TripId = t.Id
		INNER JOIN Accounts AS a ON a.Id = act.AccountId
		INNER JOIN Cities AS ca ON ca.Id = a.CityId
		INNER JOIN Rooms AS r ON r.Id = t.RoomId
		INNER JOIN Hotels AS h ON h.Id = r.HotelId
		INNER JOIN Cities AS ch ON ch.Id = h.CityId
			ORDER BY [Full Name], Id