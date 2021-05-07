SELECT TOP (11) ProductName, UnitPrice -- Топ (n) значений
FROM Products
ORDER BY UnitPrice DESC -- Сортировка по убыванию
----------------------------------------------------------
SELECT TOP (11) WITH TIES -- WITH TIES - добавляет позицию в топ при равном значении
	   ProductName, UnitPrice -- Топ (n) значений
FROM Products
ORDER BY UnitPrice DESC -- Сортировка по убыванию