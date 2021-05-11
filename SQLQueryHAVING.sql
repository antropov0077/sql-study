SELECT	Type, Avg (Price)
FROM	Titles
GROUP BY Type
HAVING	Avg (Price) > 15
	AND Type = 'popular_comp'

-- � ����� ������� ��������� ����� ���� ��������?
SELECT City--, Count (*)
FROM Customers
GROUP BY City
HAVING Count (*) > 5

-- ����� �������� ������ ��������� ������ ���� ������� � ����� ������?
SELECT DISTINCT EmployeeID--, Count (DISTINCT ShipCity)
FROM Orders
GROUP BY EmployeeID, ShipCountry
HAVING Count (DISTINCT ShipCity) > 5

-- � ����� ���������� ������������ ���� ������ ������ 50?
SELECT CategoryID--, Max (UnitPrice)
FROM Products
GROUP BY CategoryID
HAVING Max (UnitPrice) > 50

SELECT DISTINCT CategoryID--, Max (UnitPrice)
FROM Products
WHERE UnitPrice > 50