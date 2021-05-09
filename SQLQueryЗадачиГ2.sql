-- � ����� ������ ��������� ������ ����� �������?
SELECT TOP (1) WITH TIES ShipCountry--, Count (*)
FROM Orders
GROUP BY ShipCountry
ORDER BY Count (*) DESC

-- ����� �������� �������� ������ �� ���������� �������, ����������� �
-- ������� ������ � ���� � ��� �� �����?
SELECT TOP (1) WITH TIES EmployeeID, Month (OrderDate), Count (*)
FROM Orders
GROUP BY EmployeeID, ShipCity, Year (OrderDate), Month (OrderDate) -- ���������� �� ��������, ����, ������
ORDER BY Count (*) DESC