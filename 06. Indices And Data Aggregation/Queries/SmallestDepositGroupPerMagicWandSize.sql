SELECT TOP(2) x1.DepositGroup
	FROM (
		SELECT DepositGroup, AVG(MagicWandSize) AS AvgWandSize
			FROM WizzardDeposits
				GROUP BY DepositGroup
		 ) AS x1
			ORDER BY x1.AvgWandSize ASC
