-- Сколько денег заработал каждый продавец?
SELECT FirstName + ' ' + LastName,
	(
	SELECT	Sum (UnitPrice * Quantity * (1 - Discount))
	FROM	[Order Details]
	WHERE	OrderID IN (
						SELECT OrderID
						FROM Orders
						WHERE EmployeeID = Employees.EmployeeID
						)
	)
FROM Employees

-- Какие продавцы в 1997м году продали более 50 разнвых товаров?
SELECT	FirstName + ' ' + LastName,		-- 1. Хочу получить список продавцов
		(
		SELECT	Count (DISTINCT ProductID)    -- 2. Считаем кол-во уникальных товаров из...
		FROM	[Order Details]				  -- 2. ...ближайшей таблицы
		WHERE	OrderID IN	(				  -- 3. Считаем товары, которые входят в некоторые продажи, сделанные одним продавцом
							SELECT	OrderID   -- 4. Список номеров заказов из...
							FROM	Orders	  -- 4. ... таблицы с заказами
							WHERE	EmployeeID = Employees.EmployeeID --5. Нужны заказы для конкретного продавца
								AND Year (OrderDate) = 1997  -- 6. Учитываем год
							)
		) 
FROM	Employees                    -- 1. Хочу получить список продавцов
WHERE	(							 -- 7. Выводить столбец не надо, по нему надо фильтровать, по этому убираем его из SELECT в WHERE
		SELECT	Count (DISTINCT ProductID)
		FROM	[Order Details]
		WHERE	OrderID IN	(
							SELECT	OrderID
							FROM	Orders
							WHERE	EmployeeID = Employees.EmployeeID
								AND Year (OrderDate) = 1997
							)
		) > 50      -- 8. По условию задачи, должно быть более 50

