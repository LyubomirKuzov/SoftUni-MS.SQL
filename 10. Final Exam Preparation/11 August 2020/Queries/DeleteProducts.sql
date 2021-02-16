CREATE TRIGGER tr_DeleteProducts
ON Products INSTEAD OF DELETE
AS
BEGIN
	DECLARE @deletedProducts INT = (SELECT p.Id FROM Products AS p 
										INNER JOIN deleted AS d ON d.Id = p.Id)

	DELETE FROM Feedbacks
		WHERE ProductId = @deletedProducts

	DELETE FROM ProductsIngredients 
		WHERE ProductId = @deletedProducts

	DELETE FROM Products
		WHERE Id = @deletedProducts
END

DELETE FROM Products
	WHERE Id = 7