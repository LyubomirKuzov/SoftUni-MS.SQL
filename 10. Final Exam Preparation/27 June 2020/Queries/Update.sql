UPDATE Jobs
	SET MechanicId = (SELECT MechanicId FROM Mechanics WHERE FirstName = 'Ryan' AND LastName = 'Harnos'),
		Status = 'In Progress'
		WHERE Status = 'Pending'