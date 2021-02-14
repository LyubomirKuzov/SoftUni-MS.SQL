SELECT a.Id AS Id,
	   a.Email AS Email,
	   ca.Name AS City,
	   COUNT(*) AS Trips
	FROM Accounts AS a	
		INNER JOIN Cities AS ca ON ca.Id = a.CityId
		INNER JOIN AccountsTrips AS act ON act.AccountId = a.Id
		INNER JOIN Trips AS t ON t.Id = act.TripId
		INNER JOIN Rooms AS r ON r.Id = t.RoomId
		INNER JOIN Hotels AS h ON h.Id = r.HotelId
		INNER JOIN Cities AS ch ON ch.Id = h.CityId
			WHERE ca.Id = ch.Id	
				GROUP BY a.Id, a.Email, ca.Name
					ORDER BY Trips DESC, Id