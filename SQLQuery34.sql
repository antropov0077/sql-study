-- ������� ����� ��������� ������ ��������?
SELECT FirstName + ' ' + LastName,
	(
	SELECT	Sum (UnitPrice * Quantity * (1 - Discount))
	FROM	[Order Details]
	WHERE	OrderID IN (
						SELECT OrderID
						FROM Orders
						WHERE EmployeeID = Employees.EmployeeID
						)
	)
FROM Employees