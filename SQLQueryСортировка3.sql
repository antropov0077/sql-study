-- � ����� ������ ��� �������� ��������� ����� � 1997� ����?
SELECT TOP (1) WITH TIES ShipCountry
FROM Orders
WHERE Year (OrderDate) = 1997 -- ����� �� ������ ���
ORDER BY OrderDate DESC -- ���������� �� ����