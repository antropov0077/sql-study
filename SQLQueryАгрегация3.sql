-- ������� ������� ��������� � �������� � 1997� ����?
SELECT Count (*)
FROM Orders
WHERE Year (OrderDate) = 1997
	AND ShipCountry = 'Germany'

-- ����� ����������� (customers) ������: � ������ ��� ���?
SELECT Count (*)
FROM Customers
WHERE Fax IS NOT NULL

SELECT Count (*)
FROM Customers
WHERE Fax IS NULL
------------------------------------------------------
SELECT Count (Fax), Count (*) - Count (Fax) -- ����� ����� ����� ������ � ������
FROM Customers