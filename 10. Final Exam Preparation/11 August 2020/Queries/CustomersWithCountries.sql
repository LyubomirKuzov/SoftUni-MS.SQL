CREATE VIEW v_UserWithCountries
AS
SELECT CONCAT(cus.FirstName, ' ', cus.LastName) AS CustomerName,
	   cus.Age,
	   cus.Gender,
	   cou.Name AS CountryName
	FROM Customers AS cus
		INNER JOIN Countries AS cou ON cou.Id = cus.CountryId

SELECT TOP(5) *
	FROM v_UserWithCountries
		ORDER BY Age