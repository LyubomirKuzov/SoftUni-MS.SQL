CREATE PROC usp_SwitchRoom (@tripId INT, @targetRoomId INT)
AS
BEGIN
	IF ((SELECT TOP(1) h.Id FROM Trips AS t
		INNER JOIN Rooms AS r ON r.Id = t.RoomId
		INNER JOIN Hotels AS h ON h.Id = r.HotelId
		WHERE t.Id = @tripId) != (SELECT HotelId FROM Rooms WHERE Id = @targetRoomId))
	BEGIN
		THROW 50001, 'Target room is in another hotel!', 1
	END

	DECLARE @accountsForTrip INT = (SELECT COUNT(*) FROM AccountsTrips WHERE TripId = @tripId)
	DECLARE @bedsInRoom INT = (SELECT Beds FROM Rooms WHERE Id = @targetRoomId)

	IF (@bedsInRoom < @accountsForTrip)
	BEGIN
		THROW 50002, 'Not enough beds in target room!', 1
	END

	UPDATE Trips
		SET RoomId = @targetRoomId
			WHERE Id = @tripId
END