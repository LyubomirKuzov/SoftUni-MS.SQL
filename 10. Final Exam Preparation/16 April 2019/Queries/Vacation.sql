CREATE FUNCTION udf_CalculateTickets (@origin VARCHAR(MAX), @destination VARCHAR(MAX), @peopleCount INT)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @result VARCHAR(MAX)

	IF (@peopleCount <= 0)
	BEGIN
		SET @result = 'Invalid people count!'
	END

	ELSE IF (@origin NOT IN (SELECT Origin FROM Flights) OR @destination NOT IN (SELECT Destination FROM Flights))
	BEGIN
		SET @result = 'Invalid flight!'
	END

	ELSE
	BEGIN
		DECLARE @flightPrice DECIMAL(18,2) = (SELECT t.Price FROM Flights AS f
											  INNER JOIN Tickets AS t ON t.FlightId = f.Id
											  WHERE f.Origin = @origin AND f.Destination = @destination)

		SET @flightPrice *= @peopleCount
		SET @result = CONCAT('Total price ', CAST(@flightPrice AS VARCHAR(MAX)))
	END

	RETURN @result
END
		