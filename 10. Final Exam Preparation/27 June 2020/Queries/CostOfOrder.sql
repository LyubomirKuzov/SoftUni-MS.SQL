CREATE FUNCTION udf_GetCost(@jobId INT)
RETURNS DECIMAL(18,2)
BEGIN
	DECLARE @sum DECIMAL(18,2) = (SELECT SUM(p.Price)
									FROM Parts AS p
										INNER JOIN OrderParts AS op ON op.PartId = p.PartId
										INNER JOIN Orders AS o ON o.OrderId = op.OrderId
										INNER JOIN Jobs AS j ON j.JobId = o.JobId
											WHERE j.JobId = @jobId)

	IF(@sum IS NULL)
	BEGIN
		SET @sum = 0
	END

	RETURN @sum
END
