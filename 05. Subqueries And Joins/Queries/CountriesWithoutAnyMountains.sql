SELECT SUM(a.Count) AS Count
	FROM (
		SELECT COUNT(*) AS Count
			FROM Countries AS c
			LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
				WHERE mc.MountainId IS NULL	
					GROUP BY c.CountryName
		 ) AS a