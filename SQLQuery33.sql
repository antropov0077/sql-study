-- Найти продавцов с пропиской из городов, с которыми торговали в 1997 году
SELECT FirstName + ' ' + LastName
FROM Employees
WHERE City IN	( -- IN вхождение в множество (найти продавцов с пропиской из городов, с которыми торговали в 1997 году)
				SELECT ShipCity
				FROM Orders
				WHERE Year (OrderDate) = 1997   -- Города в которые отправляли в 1997
				)
-------------------------------------------------
SELECT *
FROM	(
		SELECT FirstName + ' ' + LastName AS Name,
				(
				SELECT Count (DISTINCT ShipCountry) -- Количество уникальных стран
				FROM Orders
				WHERE EmployeeID = Employees.EmployeeID
				) AS Total
		FROM Employees  -- Внутренний селект секции FROM, 3 условия: не должно быть сортировки,
		) AS MyTable            -- столбцы должны иметь имена, у таблицы должно быть название.
WHERE Total > 20

-- Какие продавцы (EmployeeID) в 1997м году продали более 5000 штук товаров?
SELECT	EmployeeID, Sum (Total) -- Суммируем по кол-ву в полученой таблице
FROM	(
		SELECT EmployeeID,
			(
			SELECT Sum (Quantity) -- Суммируем кол-во заказов из..
			FROM [Order Details]       -- таблицы [Order Details]
			WHERE OrderID = Orders.OrderID -- Индивидуально для каждого заказа
			) AS Total -- Столбцы названы
		FROM Orders
		WHERE Year (OrderDate) = 1997
		) AS MyTable  -- Таблица названа, нет сортировки
GROUP BY	EmployeeID  -- Группируем во внешнем запросе
HAVING		Sum (Total) > 5000  -- Фильтр