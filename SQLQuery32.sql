-- ����� �������� ��������� ���������� �������� �� ������ ������?
SELECT DISTINCT EmployeeID--, Count (DISTINCT CustomerID)
FROM Orders
GROUP BY EmployeeID, ShipCity
HAVING Count (DISTINCT CustomerID) > 1

-- �� ����� ������� �� "������������" ��-�� ������ ������ 1000?
SELECT *
FROM [Order Detales]