-- �������� ��������� �������� ������ ��������?
SELECT EmployeeID, Count (DISTINCT CustomerID)
FROM Orders
WHERE ShipCountry = 'France'
GROUP BY EmployeeID, ShipCountry

-- ����� �������� ������� ������ ���� ������� � ����� ������?
SELECT TOP (1) WITH TIES EmployeeID, Count (DISTINCT ShipCity)
FROM Orders
GROUP BY EmployeeID, ShipCountry
ORDER BY Count (DISTINCT ShipCity) DESC

-- ����� ���������� ������������ � ������������� ���������� ��������� � ������� ������?
SELECT TOP (1) WITH TIES CustomerID
FROM Orders
GROUP BY CustomerID, Year (OrderDate), Month (OrderDate)
ORDER BY Count (DISTINCT EmployeeID) DESC