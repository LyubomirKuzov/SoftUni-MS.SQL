SELECT cou.CountryName,
	   con.ContinentName,
	   ISNULL(COUNT(r.Id), 0) AS RiversCount,
	   ISNULL(SUM(r.Length), 0) AS TotalLength
	FROM Countries AS cou
		INNER JOIN Continents AS con ON con.ContinentCode = cou.ContinentCode
		LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = cou.CountryCode
		LEFT JOIN Rivers AS r ON r.Id = cr.RiverId	
			GROUP BY cou.CountryName, con.ContinentName
				ORDER BY RiversCount DESC, TotalLength DESC, cou.CountryName ASC