SELECT	ProductName, UnitPrice, 'товар' -- Сурогатный столбец, чтоб понять из какой таблицы строка
FROM	Products
	UNION ALL
SELECT	Title, Price, 'книга'	-- Сурогатный столбец, чтоб понять из какой таблицы строка
FROM	Pubs..Titles	-- Pubs.. -обращение к другой базе

	ORDER BY UnitPrice ASC