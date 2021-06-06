SELECT	 ShipCountry, Year (OrderDate), Count (*)
FROM	 Orders
GROUP BY ShipCountry, Year (OrderDate)

-- Сводная таблица (PIVOT)
SELECT	 ShipCountry, [1996], [1997], [1998]
FROM	 (
		 SELECT	ShipCountry, Year (OrderDate) MyYear, OrderID
		 FROM	Orders
		 ) MyTable
PIVOT	 (  -- группировка по 2-м критериям (раскладывает по 2-м осям)
		 Count (OrderID) FOR MyYear IN ([1996], [1997], [1998])
		 ) MyReport
--WHERE [1998] > [1997] -- если надо что-то отсортировать
ORDER BY ShipCountry

-- Подытоги (WITH ROLLUP, WITH CUBE - давно, CROUPING SETS)
SELECT	 ShipCountry, Year (OrderDate), Count (*)
FROM	 Orders
GROUP BY ShipCountry, Year (OrderDate) WITH ROLLUP -- Добавляет прмежуточные и конечные итоги
-----
SELECT	 ShipCountry, Year (OrderDate), Count (*)
FROM	 Orders
GROUP BY Year (OrderDate), ShipCountry WITH ROLLUP -- Важен порядок, по которому будет группироваться и подводиться подытог
-----
SELECT	 ShipCountry, Year (OrderDate), Count (*)
FROM	 Orders
GROUP BY Year (OrderDate), ShipCountry WITH CUBE -- Все подытоги в разные стороны
-----
SELECT	 Year (OrderDate), ShipCountry, EmployeeID, Count (*)
FROM	 Orders
GROUP BY GROUPING SETS	(   -- Если нужны какие-то подытоги с указанием группирующих наборов
						(Year (OrderDate), ShipCountry, EmployeeID), -- подытог
						(Year (OrderDate)), -- подытог по каждому году
						(ShipCountry), -- подытог по стране
						(Year (OrderDate), ShipCountry) -- подытог по коминации год/страна
						)

-- Ранжирование (Row_Number, Rank, Dense_Rank, nTile)
SELECT	 ProductName, UnitPrice,
		 Row_Number () OVER ( -- Ранжирование (обязательно с OVER), просто нумерует строки
							ORDER BY UnitPrice DESC -- указываем подядок номерации
		 ),
		 Rank () OVER ( -- работает как Row_Number, но не присваивает следующий номер, если нет разницы в цене
		 ORDER BY UnitPrice DESC -- указываем подядок номерации
		 ),
		 Dense_Rank () OVER ( -- работает как Rank, но НЕ пропускает следующий номер после повторного
		 ORDER BY UnitPrice DESC -- указываем подядок номерации
		 ),
		 nTile (3) OVER ( -- обязательно указать параметр (..), кол-во секций, на который результат будет порезан по цене
		 ORDER BY UnitPrice DESC -- указываем подядок номерации
		 )
FROM	 Products
ORDER BY UnitPrice DESC -- Порядок сортировки

-- 
SELECT	 ProductName, CategoryID, UnitPrice,
		 nTile (3) OVER (
							PARTITION BY CategoryID -- секционирование по какому-то критерию
							ORDER BY UnitPrice DESC
							)
FROM	 Products
ORDER BY CategoryID, UnitPrice DESC
--
SELECT	 *
FROM	(
		SELECT	 ProductName, UnitPrice,
				Row_Number () OVER	(
									ORDER BY UnitPrice DESC
									) AS Num
		FROM	 Products
		) MyScroller
WHERE	Num BETWEEN 21 AND 30 -- МЕЖДУ 21 И 30

-- Постраничный вывод (OFFSET, FETCH)
SELECT		ProductName, UnitPrice
FROM		Products
ORDER BY	UnitPrice DESC
			OFFSET	20 ROWS
			FETCH	NEXT 10 ROWS ONLY -- вывод с 2 по 3 страницы

-- Функции смещения (Lag, Lead) (Упорядочивание)
SELECT	ProductName, UnitPrice,
		Lag (UnitPrice) OVER	( -- Предыдущий
								ORDER BY UnitPrice DESC
								),
		Lead (UnitPrice) OVER	( -- Следующий
								ORDER BY UnitPrice DESC
								)
FROM	Products
ORDER BY UnitPrice DESC
-- Насколько каждый товар дешевле предыдущего
SELECT	ProductName, UnitPrice,
		Lag (UnitPrice) OVER	( 
								ORDER BY UnitPrice DESC
								) - UnitPrice
FROM	Products
ORDER BY UnitPrice DESC
--
SELECT	OrderID, OrderDate,
		Freight,
		(Lag (Freight) OVER (ORDER BY OrderDate) + 
		Freight + 
		Lead (Freight) OVER (ORDER BY OrderDate)) / 3
FROM	Orders
ORDER BY OrderDate

-- Оконная агрегация
SELECT	OrderID, Freight,
		Sum (Freight) OVER (
							ORDER BY OrderID ASC
							ROWS BETWEEN
								UNBOUNDED PRECEDING -- все предыдущие по отношению к текущей строке
								AND
								CURRENT ROW
							),
		Avg (Freight) OVER	(
							 ORDER BY OrderID ASC
							 ROWS BETWEEN
								30 PRECEDING
							AND
								3 FOLLOWING
							)
FROM	Orders

-- -- В какие месяцы наблюдался рост выручки по сравнению с предыдущим месяцем более чем на 10%
SELECT	*
FROM	(
         SELECT Year (OrderDate) AS 'Year', Month(OrderDate) AS 'Month',
		 Sum(UnitPrice * Quantity * ( 1 - Discount)) AS 'Billing',
         Sum(UnitPrice * Quantity * ( 1-Discount))
         /
         Lag (Sum(UnitPrice * Quantity * (1- Discount))) 
			OVER	(
                    ORDER BY Year(OrderDate), Month(OrderDate) ASC
               		) AS Growth

         FROM Orders O INNER JOIN [Order Details] OD
         ON O.OrderID = OD.OrderID
         GROUP BY Year(OrderDate), Month(OrderDate)
        )MyTable
WHERE Growth > 1 + 0.1