SELECT s.Name AS Name,
	   AVG(ss.Grade) AS AverageGrade
	FROM StudentsSubjects AS ss
		INNER JOIN Subjects AS s ON s.Id = ss.SubjectId
		GROUP BY SubjectId, s.Name
			ORDER BY ss.SubjectId