SELECT p.PeakName,
	   m.MountainRange,
	   cou.CountryName,
	   con.ContinentName
	FROM Peaks AS p
		INNER JOIN Mountains AS m ON m.Id = p.MountainId
		INNER JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
		INNER JOIN Countries AS cou ON cou.CountryCode = mc.CountryCode
		INNER JOIN Continents AS con ON con.ContinentCode = cou.ContinentCode
			ORDER BY p.PeakName ASC, cou.CountryName ASC