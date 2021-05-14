-- ������� ������� ������ ������ ���������� � 1997 ����?
SELECT ContactName,
	(
	SELECT Count (*)
	FROM Orders
	WHERE CustomerID = Customers.CustomerID
		AND Year (OrderDate) = 1997
	)
FROM Customers

-- ��������� ������� � ������� ������
SELECT ProductName,
	(
	SELECT Round (Sum (UnitPrice * Quantity * (1 - Discount)), 2) -- Round ((...),2) - ����������, 2 ����� ����� �������
	FROM [Order Details]
	WHERE ProductID = Products.ProductID
	)
FROM Products

-- ��������� � ������. ������ ����� �����. ������ � HAVING��.
-- ��� ����� �����������, ������� ��������� ������ ���� ������� � ������ ��������?
SELECT	(
		SELECT ContactName
		FROM Customers
		WHERE CustomerID = Orders.CustomerID
		) AS Name, Count (*) AS Orders
FROM Orders
GROUP BY CustomerID, EmployeeID
HAVING Count (*) > 4