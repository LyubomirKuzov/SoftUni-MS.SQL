SELECT cur.CurrencyCode AS CurrencyCode,
	   cur.Description AS Currency,
	   COUNT(cou.CountryCode) AS NumberOfCountries
	FROM Currencies AS cur
		LEFT JOIN Countries AS cou ON cou.CurrencyCode = cur.CurrencyCode	
			GROUP BY cur.CurrencyCode, cur.Description
				ORDER BY NumberOfCountries DESC, Currency ASC