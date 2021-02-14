SELECT SUM(x1.[Host Wizard Deposit] - x1.[Guest Wizard Deposit]) AS SumDifference
	FROM (
		SELECT FirstName AS [Host Wizard],
			DepositAmount AS [Host Wizard Deposit],
			LEAD(FirstName, 1) OVER (ORDER BY Id) AS [Guest Wizard],
			LEAD(DepositAmount, 1) OVER (ORDER BY Id) AS [Guest Wizard Deposit]
		FROM WizzardDeposits
		 ) AS x1