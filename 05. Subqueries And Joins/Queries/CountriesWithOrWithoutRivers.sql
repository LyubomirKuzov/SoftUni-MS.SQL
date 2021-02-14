SELECT TOP(5) c.CountryName, r.RiverName
	FROM Countries c
		LEFT JOIN CountriesRivers rc ON c.CountryCode = rc.CountryCode
		LEFT JOIN Rivers r ON rc.RiverId = r.Id
			WHERE c.ContinentCode = 'AF'
				ORDER BY c.CountryName ASC