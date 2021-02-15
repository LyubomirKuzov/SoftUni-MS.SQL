SELECT p.PartId,
	   p.Description,
	   pn.Quantity,
	   p.StockQty,
	   IIF(o.Delivered = 0, op.Quantity, 0)
	FROM Parts AS p
		LEFT JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
		LEFT JOIN OrderParts AS op ON op.PartId = p.PartId
		LEFT JOIN Orders AS o ON o.OrderId = op.OrderId
		LEFT JOIN Jobs AS j ON j.JobId = pn.JobId
			WHERE (j.Status != 'Delivered') AND (p.StockQty + IIF(o.Delivered = 0, op.Quantity, 0)) < pn.Quantity
				ORDER BY p.PartId