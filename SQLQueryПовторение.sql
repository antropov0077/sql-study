-- Какой продавец оформил первый заказ в Бразилию в 1997м году?

SELECT TOP (1) WITH TIES EmployeeID
FROM Orders
WHERE Year (OrderDate) = 1997
	AND ShipCountry = 'Brazil'
ORDER BY OrderDate ASC