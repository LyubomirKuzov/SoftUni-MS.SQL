UPDATE Countries
	SET CountryName='Burma'
		WHERE CountryName = 'Myanmar'



INSERT INTO Monasteries(Name, CountryCode)
	VALUES ('Hanga Abbey', (SELECT Countries.CountryCode
								FROM Countries
									WHERE CountryName = 'Tanzania'))



INSERT INTO Monasteries(Name, CountryCode)
	VALUES ('Myin-Tin-Daik', (SELECT Countries.CountryCode
								FROM Countries
									WHERE CountryName = 'Myanmar'))



SELECT con.ContinentName,
       cou.CountryName ,
       ISNULL (COUNT(m.Id),0) AS MonasteriesCount
	FROM Continents AS con
		JOIN Countries AS cou on con.ContinentCode = cou.ContinentCode AND cou.IsDeleted = 0
		LEFT JOIN Monasteries m on cou.CountryCode = m.CountryCode
			GROUP BY con.ContinentName, cou.CountryName
				ORDER BY MonasteriesCount DESC, cou.CountryName