SELECT	Type, Avg (Price)
FROM	Titles
GROUP BY Type
HAVING	Avg (Price) > 15
	AND Type = 'popular_comp'

-- ¬ каких городах прописано более п€ти клиентов?
SELECT City--, Count (*)
FROM Customers
GROUP BY City
HAVING Count (*) > 5

--  акие продавцы сумели обслужить больше п€ти городов в одной стране?
SELECT DISTINCT EmployeeID--, Count (DISTINCT ShipCity)
FROM Orders
GROUP BY EmployeeID, ShipCountry
HAVING Count (DISTINCT ShipCity) > 5

-- ¬ каких категори€х максимальна€ цена товара больше 50?
SELECT CategoryID--, Max (UnitPrice)
FROM Products
GROUP BY CategoryID
HAVING Max (UnitPrice) > 50

SELECT DISTINCT CategoryID--, Max (UnitPrice)
FROM Products
WHERE UnitPrice > 50