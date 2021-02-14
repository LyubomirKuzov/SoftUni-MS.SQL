SELECT TOP(5) a.CountryName,
       ISNULL(a.PeakName, '(no highest peak)') AS [Highest Peak Name], 
	   ISNULL(a.Elevation, 0) AS [Highest Peak Elevation],
	   ISNULL(a.MountainRange, '(no mountain)') AS [Mountain]
	FROM (
		SELECT c.CountryName,
			   p.PeakName,
			   p.Elevation, 
			   m.MountainRange,
			   DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY p.Elevation DESC) AS PeakRank
			FROM Countries AS c
			LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
			LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
			LEFT JOIN Peaks AS p ON m.Id = p.MountainId
		 ) AS a
		WHERE a.PeakRank = 1
			ORDER BY a.CountryName ASC, [Highest Peak Name] ASC 