-- Сколько товаров в каждой категории?
SELECT CategoryID, CategoryName,
		(
		SELECT Count (*)
		FROM Products
		WHERE CategoryID = Categories.CategoryID
		)
FROM Categories

-- Сколько заказов сделал каждый продавец?
SELECT FirstName + ' ' + LastName AS Name,
	(
	SELECT Count (*)
	FROM Orders
	WHERE EmployeeID = Employees.EmployeeID
	) AS Total
FROM Employees

-- Сколько заказов сделал каждый покупатель?
SELECT ContactName AS Name,
	(
	SELECT Count (*)
	FROM Orders
	WHERE CustomerID = Customers.CustomerID
	)
FROM Customers