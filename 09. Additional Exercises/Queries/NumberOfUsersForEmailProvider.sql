SELECT x1.EmailProvider,
	   COUNT(*) AS [Number Of Users]
	FROM (SELECT SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email)) AS EmailProvider
			FROM Users) AS x1
		GROUP BY x1.EmailProvider
			ORDER BY [Number Of Users] DESC, EmailProvider ASC
		