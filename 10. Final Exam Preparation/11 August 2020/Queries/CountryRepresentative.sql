SELECT CountryName,
	   DistributorName
	FROM (SELECT c.Name AS CountryName,
	   d.Name AS DistributorName,
	   DENSE_RANK() OVER (PARTITION BY c.Name ORDER BY COUNT(i.Id) DESC) AS Ranking
	FROM Countries AS c 
		INNER JOIN Distributors AS d ON d.CountryId = c.Id
		LEFT JOIN Ingredients AS i ON i.DistributorId = d.Id
			GROUP BY c.Name, d.Name) AS x1
		WHERE Ranking = 1
			ORDER BY CountryName, DistributorName