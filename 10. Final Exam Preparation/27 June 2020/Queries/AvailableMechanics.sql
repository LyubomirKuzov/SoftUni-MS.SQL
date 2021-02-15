SELECT m.FirstName + ' ' + m.LastName
    FROM Mechanics AS m
             LEFT JOIN Jobs j
                       ON m.MechanicId = j.MechanicId
    WHERE j.Status = 'Finished' OR j.JobId IS NULL
		ORDER BY m.MechanicId