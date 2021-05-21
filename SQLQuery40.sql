-- Для каждой категории найти 2 самых дорогих товара
SELECT	CategoryName, ProductName
FROM	Categories C
			CROSS APPLY
		(
		SELECT	 TOP (2) WITH TIES ProductID, ProductName, UnitPrice
		FROM	 Products
		WHERE	 CategoryID = C.CategoryID
		ORDER BY UnitPrice DESC
		) P

-- Для каждого продавца (ФИО) найти 3 его любимых страны.
SELECT	FirstName + ' ' + LastName, ShipCountry
FROM	Employees E 
			OUTER APPLY
		(
		SELECT	 TOP (3) WITH TIES ShipCountry, Count (*) AS Total	-- Узнаем сколько сколько заказов за каждой, обязательно надо назвать страной
		FROM	 Orders
		WHERE	 EmployeeID = E.EmployeeID
		GROUP BY ShipCountry	-- Группируем новый список
		ORDER BY Total DESC
		) C