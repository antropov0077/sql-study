-- ������� ������� � ������ ���������?
SELECT CategoryID, CategoryName,
		(
		SELECT Count (*)
		FROM Products
		WHERE CategoryID = Categories.CategoryID
		)
FROM Categories

-- ������� ������� ������ ������ ��������?
SELECT FirstName + ' ' + LastName AS Name,
	(
	SELECT Count (*)
	FROM Orders
	WHERE EmployeeID = Employees.EmployeeID
	) AS Total
FROM Employees

-- ������� ������� ������ ������ ����������?
SELECT ContactName AS Name,
	(
	SELECT Count (*)
	FROM Orders
	WHERE CustomerID = Customers.CustomerID
	)
FROM Customers