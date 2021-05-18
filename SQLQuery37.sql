SELECT	E1.FirstName + ' ' + E1.LastName,
		E2.FirstName + ' ' + E2.LastName
FROM	Employees AS E1 CROSS JOIN Employees AS E2  -- Придумать синонимы, чтобы сервер их отличал (AS ...)
WHERE	E1.TitleOfCourtesy = 'Mr.'
  AND	E2.TitleOfCourtesy = 'Ms.'

-- Сколько товаров в каждой категории?
SELECT	 Categories.CategoryID, CategoryName,	-- Выводим номер и имя категории
		 Count (*), Avg (UnitPrice)				-- Количество товаров в каждой категории, можно сразу посчитать цены и т.д.
FROM	 Categories CROSS JOIN Products		-- Нужен список категорий и кол-во товаров, берем эти таблицы
WHERE	 Categories.CategoryID = Products.CategoryID	-- Нужно оставить пары, которые сочитаются, слева категории, справа товар из этой категории
GROUP BY Categories.CategoryID, CategoryName	-- Переходим с списку категорий ID и Name

-- Сколько заказов сделал каждый продавец?
SELECT	 E.FirstName + ' ' + E.LastName, Count (*)
FROM	 Employees E CROSS JOIN Orders O
WHERE    E.EmployeeID = O.EmployeeID
GROUP BY E.FirstName + ' ' + E.LastName

-- Сколько денег мы заработали на каждом товаре? -- С какого товара самая большая выручка?
SELECT	 TOP (1) P.ProductName, Sum (OD.UnitPrice * Quantity * (1 - Discount)) AS Total
FROM	 Products P CROSS JOIN [Order Details] OD
WHERE	 P.ProductID = OD.ProductID
GROUP BY P.ProductName
ORDER BY Total DESC

-- Какие продавцы (ФИО) обсужили больше 20 покупателей в 1997м году?
SELECT	 E.FirstName + ' ' + LastName--, Count (DISTINCT CustomerID)
FROM	 Employees E CROSS JOIN Orders O
WHERE	 E.EmployeeID = O.EmployeeID
	AND  Year (OrderDate) = 1997
GROUP BY E.FirstName + ' ' + LastName
HAVING	 Count (DISTINCT CustomerID) > 20

-- Какие покупатели (ФИО) обслуживались в 1997м году у продавца №1?
SELECT	 DISTINCT C.ContactName
FROM	 Customers C CROSS JOIN Orders O
WHERE	 C.CustomerID = O.CustomerID
	AND	 Year (OrderDate) = 1997
	AND	 EmployeeID = 1