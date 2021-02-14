SELECT * 
	FROM Towns
		WHERE [Name] LIKE '[^RDB]%'
			ORDER BY [Name] ASC