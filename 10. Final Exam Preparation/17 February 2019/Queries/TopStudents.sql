SELECT TOP(10) s.FirstName AS FirstName,
	   s.LastName AS LastName,
	   FORMAT(AVG(se.Grade), 'N2') AS MaxGrade
	FROM StudentsExams AS se
		INNER JOIN Students AS s ON s.Id = se.StudentId
			GROUP BY s.FirstName, s.LastName
				ORDER BY MaxGrade DESC, FirstName, LastName