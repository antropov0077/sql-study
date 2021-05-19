-- INNER JOIN
-- Сколько заказов сделал каждый продавец в 1997м году?
SELECT	 E.FirstName + ' ' + E.LastName, Count (*)
FROM	 Employees E INNER JOIN Orders O
		 ON	E.EmployeeID = O.EmployeeID
WHERE	 Year (OrderDate) = 1997
GROUP BY E.FirstName + ' ' + E.LastName

-- Какой покупатель (ФИО) в 1997м году потратил больше всех денег на напитки ("Beverages")?
SELECT	 TOP (1) C.ContactName--, Sum(OD.UnitPrice * Quantity * (1 - Discount))
FROM	 Customers C INNER JOIN Orders O
			ON	C.CustomerID = O.CustomerID -- конкретный покупатель
		 INNER JOIN [Order Details] OD
			ON	O.OrderID = OD.OrderID	-- сделал конкретный для него заказ
		 INNER JOIN Products P
			ON	OD.ProductID = P.ProductID	-- конкретный товар
		 INNER JOIN Categories Cat
			ON	P.CategoryID = Cat.CategoryID	-- из конкретной категории
WHERE	 Cat.CategoryName = 'Beverages'
	AND  Year (O.OrderDate) = 1997
GROUP BY C.ContactName
ORDER BY Sum(OD.UnitPrice * Quantity * (1 - Discount)) DESC

-- Какой покупатель (ФИО) приобрел самый широкий ассортимент товаров?
SELECT	 TOP (1) WITH TIES ContactName--, Count (DISTINCT P.ProductID)
FROM	 Customers C INNER JOIN Orders O
			ON C.CustomerID = O.CustomerID
		 INNER JOIN [Order Details] OD
			ON O.OrderID = OD.OrderID
		 INNER JOIN Products P
			ON OD.ProductID = P.ProductID
GROUP BY ContactName
ORDER BY Count (DISTINCT P.ProductID) DESC

-- Сколько заказов сделал каждый покупатель(ФИО)?
SELECT	 ContactName, Count (DISTINCT OrderID)
FROM	 Customers C LEFT JOIN Orders O
			ON C.CustomerID = O.CustomerID
GROUP BY ContactName
ORDER BY Count (DISTINCT OrderID)

-- Сколько заказов оформил каждый продавец (ФИО) в Париж?
SELECT	 FirstName + ' ' + LastName, Count (DISTINCT O.OrderID)
FROM	 Employees E LEFT JOIN Orders O
			ON E.EmployeeID = O.EmployeeID
		 AND   ShipCity = 'Paris'
GROUP BY FirstName + ' ' + LastName

SELECT	FirstName + ' ' + LastName,
		(
		SELECT	Count (*)
		FROM	Orders
		WHERE	EmployeeID = Employees.EmployeeID
			AND ShipCity = 'Paris'
		)
FROM	Employees