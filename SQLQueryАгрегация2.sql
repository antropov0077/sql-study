SELECT Avg (UnitPrice), Count (*), Min (UnitPrice),
		Sum (UnitsInStock), Sum (UnitsOnOrder),
		Sum (UnitsInStock + UnitsOnOrder),
		Sum (UnitsInStock) + Sum (UnitsOnOrder)
FROM Products
WHERE CategoryID = 1