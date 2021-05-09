-- ������� ������� � ������ ���������?
SELECT TOP (1) WITH TIES CategoryID --, Count (*)
FROM Products
GROUP BY CategoryID
ORDER BY Count (*) DESC

-- ������� ������� �������� � ������ ���� ������ ��������?
SELECT Year (OrderDate), EmployeeID, Count (*) -- ������� ���, �������� � ���-�� �������
FROM Orders
GROUP BY Year (OrderDate), EmployeeID -- ���������� �� ���������� ���/��������
ORDER BY EmployeeID, Year (OrderDate) -- ��������� �� ���������, � ������ ������� �� �����