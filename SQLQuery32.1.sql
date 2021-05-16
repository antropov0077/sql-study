-- ����� �������� ��������� ���������� �������� �� ������ ������?
SELECT DISTINCT EmployeeID--, Count (DISTINCT CustomerID)
FROM Orders
GROUP BY EmployeeID, ShipCity
HAVING Count (DISTINCT CustomerID) > 1

-- �� ����� ������� �� "������������" ��-�� ������ ������ 1000?
SELECT ProductName
FROM Products
WHERE	(
	SELECT Sum (UnitPrice * Quantity * Discount) -- ���� * ����������� * ������
	FROM [Order Details]
	WHERE ProductID = Products.ProductID
		) > 1000
ORDER BY (     -- ���� ������� �������������
	SELECT Sum (UnitPrice * Quantity * Discount) -- ���� * ����������� * ������
	FROM [Order Details]
	WHERE ProductID = Products.ProductID
		) DESC

-- ��� ����� ����������, ������� ������ ������ ���� ������� � 1997�?
SELECT TOP (1) WITH TIES ContactName
FROM Customers
ORDER BY (
	SELECT Count (*)
	FROM Orders
	WHERE CustomerID = Customers.CustomerID
		AND Year (OrderDate) = 1997
	 	 ) DESC

-- ��� ����� ���������, ������� � 1997� ���� �������� ������� � 10 ��������?
SELECT FirstName + ' ' + LastName
FROM Employees
WHERE	(
		SELECT Count (DISTINCT ShipCountry) -- ���������� ���������� �����
		FROM Orders
		WHERE EmployeeID = Employees.EmployeeID
			AND Year (OrderDate) = 1997
		) > 10