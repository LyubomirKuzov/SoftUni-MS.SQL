CREATE PROC usp_PlaceOrder(@jobId INT, @partSerialNumber VARCHAR(50), @quantity INT)
AS
BEGIN
	IF((SELECT j.Status
		FROM Jobs AS j
		WHERE j.JobId = @jobId) = 'Finished')
	BEGIN
		THROW 50011, 'This job is not active!', 1
	END

	IF(@quantity <= 0)
	BEGIN
		THROW 50012, 'Part quantity must be more than zero!', 1
	END

	DECLARE @job INT = (SELECT j.JobId FROM Jobs AS j WHERE j.JobId = @jobId)

	IF(@job IS NULL)
	BEGIN
		THROW 50013, 'Job not found!', 1
	END

	DECLARE @part INT = (SELECT p.PartId FROM Parts AS p WHERE p.SerialNumber = @partSerialNumber)

	IF(@part IS NULL)
	BEGIN
		THROW 50014, 'Part not found!', 1
	END

	IF((SELECT o.OrderId FROM Orders AS o WHERE o.JobId = @jobId AND o.IssueDate IS NULL) IS NULL)
	BEGIN
		INSERT INTO Orders(JobId, IssueDate, Delivered)
			VALUES
				(@jobId, NULL, 0)
	END

	DECLARE @order INT = (SELECT o.OrderId FROM Orders AS o WHERE o.JobId = @jobId AND o.IssueDate IS NULL)

	DECLARE @orderPartsQuantity INT = (SELECT op.Quantity FROM OrderParts AS op WHERE op.OrderId = @order
									   AND op.PartId = @part)

	IF(@orderPartsQuantity IS NULL)
	BEGIN
		INSERT INTO OrderParts(OrderId, PartId, Quantity)
			VALUES
				(@order, @part, @quantity)
	END

	ELSE
	BEGIN
		UPDATE OrderParts
			SET Quantity += @quantity
				WHERE PartId = @part AND OrderId = @order
	END
END

DECLARE @err_msg AS NVARCHAR(MAX)
BEGIN TRY
  EXEC usp_PlaceOrder 1, 'ZeroQuantity', 0
END TRY

BEGIN CATCH
  SET @err_msg = ERROR_MESSAGE();
  SELECT @err_msg
END CATCH