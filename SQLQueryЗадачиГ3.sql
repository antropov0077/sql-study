-- � ����� ����� �������� �1 ������� ������ ����� ������� ��� ��� ������ �������?
SELECT TOP (1) WITH TIES ShipCity--, EmployeeID, CustomerID, Count (*)
FROM Orders
WHERE EmployeeID = 1
GROUP BY ShipCity, EmployeeID, CustomerID
ORDER BY Count (*) DESC

--����� ���������� ���� ���� ����������� � ������ � ���� �� ��������?
SELECT TOP (1) WITH TIES CustomerID--, EmployeeID, Count (*)
FROM Orders
GROUP BY CustomerID, EmployeeID
ORDER BY Count (*) DESC

-- 1:24