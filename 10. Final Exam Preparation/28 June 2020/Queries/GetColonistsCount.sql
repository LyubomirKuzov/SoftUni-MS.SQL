CREATE FUNCTION dbo.udf_GetColonistsCount(@planetName VARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @colonistsCount INT = (SELECT COUNT(c.Id)
		FROM Journeys AS j
			INNER JOIN Spaceports AS sp ON sp.Id = j.DestinationSpaceportId
			INNER JOIN Planets AS p ON p.Id = sp.PlanetId
			INNER JOIN TravelCards AS tc ON tc.JourneyId = j.Id
			INNER JOIN Colonists AS c ON c.Id = tc.ColonistId
				WHERE p.Name = @planetName)

	RETURN @colonistsCount
END