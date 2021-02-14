CREATE PROC usp_ChangeJourneyPurpose (@journeyId INT, @newPurpose VARCHAR(11))
AS
BEGIN
	IF (@journeyId NOT IN (SELECT Id FROM Journeys))
	BEGIN
		THROW 50001, 'The journey does not exist!', 1
	END

	ELSE IF (@newPurpose = (SELECT Purpose FROM Journeys WHERE Id = @journeyId))
	BEGIN
		THROW 50002, 'You cannot change the purpose!', 1
	END

	UPDATE Journeys
		SET Purpose = @newPurpose
			WHERE Id = @journeyId
END