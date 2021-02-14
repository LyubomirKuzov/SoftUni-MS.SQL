CREATE FUNCTION udf_GetAvailableRoom (@hotelId INT, @date DATE, @people INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @result VARCHAR(MAX)

	DECLARE @bestRoomId INT = (SELECT TOP(1) r.Id
							  FROM Rooms AS r
							  INNER JOIN Trips AS t ON t.RoomId = r.Id
							  WHERE (r.HotelId = @hotelId) 
							  AND (@date NOT BETWEEN t.ArrivalDate AND t.ReturnDate)
							  AND (t.CancelDate IS NULL)
							  AND (r.Beds >= @people)
							  AND YEAR(@Date) = YEAR(t.ArrivalDate)
							  ORDER BY r.Price DESC)

	IF (@bestRoomId IS NULL)
	BEGIN
		SET @result = 'No rooms available'
	END

	ELSE
	BEGIN
		DECLARE @hotelBaseRate DECIMAL(18,2) = (SELECT BaseRate FROM Hotels WHERE Id = @hotelId)
		DECLARE @roomPrice DECIMAL(18,2) = (SELECT Price FROM Rooms WHERE Id = @bestRoomId)
		DECLARE @roomType NVARCHAR(MAX) = (SELECT Type FROM Rooms WHERE Id = @bestRoomId)
		DECLARE @roomBedsCount INT = (SELECT Beds FROM Rooms WHERE Id = @bestRoomId)

		DECLARE @totalPrice DECIMAL(18,2) = (@hotelBaseRate + @roomPrice) * @people

		SET @result = CONCAT('Room ', CAST(@bestRoomId AS NVARCHAR(MAX)), ': ', @roomType, ' (', CAST(@roomBedsCount AS NVARCHAR(MAX)), ' beds) - $', CAST(@totalPrice AS NVARCHAR(MAX)))
	END

	RETURN @result
END