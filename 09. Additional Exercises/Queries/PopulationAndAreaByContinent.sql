SELECT con.ContinentName,
	   SUM(CAST(cou.AreaInSqKm AS BIGINT)) AS CountriesArea,
       SUM(CAST(cou.Population AS BIGINT))  AS CountriesPopulation
	FROM Continents AS con
		LEFT JOIN Countries cou on con.ContinentCode = cou.ContinentCode
			GROUP BY con.ContinentName
				ORDER BY CountriesPopulation DESC