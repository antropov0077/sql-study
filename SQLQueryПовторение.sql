-- ����� �������� ������� ������ ����� � �������� � 1997� ����?

SELECT TOP (1) WITH TIES EmployeeID
FROM Orders
WHERE Year (OrderDate) = 1997
	AND ShipCountry = 'Brazil'
ORDER BY OrderDate ASC