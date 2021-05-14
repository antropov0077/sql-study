-- Сколько заказов сделал каждый покупатель в 1997 году?
SELECT ContactName,
	(
	SELECT Count (*)
	FROM Orders
	WHERE CustomerID = Customers.CustomerID
		AND Year (OrderDate) = 1997
	)
FROM Customers

-- Посчитать выручку с каждого товара
SELECT ProductName,
	(
	SELECT Round (Sum (UnitPrice * Quantity * (1 - Discount)), 2) -- Round ((...),2) - округление, 2 знака после запятой
	FROM [Order Details]
	WHERE ProductID = Products.ProductID
	)
FROM Products

-- Придумать и решить. Должна иметь смысл. Только с HAVINGом.
-- Как зовут покупателей, которые совершали больше трех заказов у одного продавца?
SELECT	(
		SELECT ContactName
		FROM Customers
		WHERE CustomerID = Orders.CustomerID
		) AS Name, Count (*) AS Orders
FROM Orders
GROUP BY CustomerID, EmployeeID
HAVING Count (*) > 4