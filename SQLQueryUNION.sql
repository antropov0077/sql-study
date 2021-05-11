(
SELECT	FirstName + ' ' + LastName AS Name, City
FROM	Employees
	UNION  -- Объединяет таблицы, показывает все списком
SELECT	ContactName, City
FROM	Customers
)
ORDER BY City
--------------------------------------------
SELECT	City
FROM	Employees
	UNION	-- По умолчанию - исключающий, одновременно применяет DISTINCT
SELECT	City
FROM	Customers
--------------------------------------------
SELECT	City
FROM	Employees
	UNION ALL	-- Не исключает повторения
SELECT	City
FROM	Customers