SELECT DISTINCT City -- DISTINCT - ��������� ��������� ������
FROM Customers

-- � ����� ������ �������� ������ �������� �1 � 1997 ����?
SELECT DISTINCT ShipCity
FROM Orders
WHERE Year (OrderDate) = 1997
	AND EmployeeID = 1
