-- ������� ������� �� �������� � ������ ������?
SELECT ShipCountry, Count (*)
FROM Orders
GROUP BY ShipCountry

-- ������� ������� �� �������� � ������ ������ � 1997� ����?
SELECT ShipCountry, Count (*)
FROM Orders
WHERE Year (OrderDate) = 1997
GROUP BY ShipCountry