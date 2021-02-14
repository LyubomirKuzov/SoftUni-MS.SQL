SELECT s.FirstName,
	   s.LastName,
	   COUNT(*) AS TeachersCount
	FROM StudentsTeachers AS st
		INNER JOIN Students AS s ON s.Id = st.StudentId
			GROUP BY s.FirstName, s.LastName