SELECT c.FirstName,
	   c.Age,
	   c.PhoneNumber
	FROM Customers AS c
		WHERE (c.Age >= 21 AND c.FirstName LIKE('%an%'))
			  OR (c.PhoneNumber LIKE('%38') AND c.CountryId != (SELECT c.Id FROM Countries AS c WHERE c.Name = 'Greece'))
			  ORDER BY c.FirstName, c.Age DESC