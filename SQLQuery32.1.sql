-- Какие продавцы обслужили нескольких клиентов из одного города?
SELECT DISTINCT EmployeeID--, Count (DISTINCT CustomerID)
FROM Orders
GROUP BY EmployeeID, ShipCity
HAVING Count (DISTINCT CustomerID) > 1

-- На каких товарах мы "недополучили" из-за скидок больше 1000?
SELECT ProductName
FROM Products
WHERE	(
	SELECT Sum (UnitPrice * Quantity * Discount) -- Цена * Колличество * Скидка
	FROM [Order Details]
	WHERE ProductID = Products.ProductID
		) > 1000
ORDER BY (     -- Если захотим отсортировать
	SELECT Sum (UnitPrice * Quantity * Discount) -- Цена * Колличество * Скидка
	FROM [Order Details]
	WHERE ProductID = Products.ProductID
		) DESC

-- Как зовут покупателя, который сделал больше всех заказов в 1997м?
SELECT TOP (1) WITH TIES ContactName
FROM Customers
ORDER BY (
	SELECT Count (*)
	FROM Orders
	WHERE CustomerID = Customers.CustomerID
		AND Year (OrderDate) = 1997
	 	 ) DESC

-- Как зовут продавцов, которые в 1997м году работали минимум с 10 странами?
SELECT FirstName + ' ' + LastName
FROM Employees
WHERE	(
		SELECT Count (DISTINCT ShipCountry) -- Количество уникальных стран
		FROM Orders
		WHERE EmployeeID = Employees.EmployeeID
			AND Year (OrderDate) = 1997
		) > 10