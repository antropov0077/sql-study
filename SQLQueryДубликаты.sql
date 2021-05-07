SELECT DISTINCT City -- DISTINCT - устраняет дубликаты строки
FROM Customers

-- В какие города оформлял заказы продавец №1 в 1997 году?
SELECT DISTINCT ShipCity
FROM Orders
WHERE Year (OrderDate) = 1997
	AND EmployeeID = 1
