SELECT b.ContinentCode, b.CurrencyCode, b.CurrencyCount AS CurrencyUsage
	FROM (
		SELECT a.ContinentCode,
			   a.CurrencyCode,
			   a.CurrencyCount,
			   DENSE_RANK() OVER (PARTITION BY a.ContinentCode ORDER BY a.CurrencyCount DESC) AS CurrencyRank
			FROM (
				SELECT c.ContinentCode, c.CurrencyCode, COUNT(*) AS CurrencyCount
					FROM Countries AS c
						GROUP BY c.ContinentCode, c.CurrencyCode
				 ) AS a
			WHERE a.CurrencyCount > 1
		 ) AS b
	WHERE b.CurrencyRank = 1
		ORDER BY b.ContinentCode