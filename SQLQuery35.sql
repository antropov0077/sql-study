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

-- ����� �������� � 1997� ���� ������� ����� 50 ������� �������?
SELECT	FirstName + ' ' + LastName,		-- 1. ���� �������� ������ ���������
		(
		SELECT	Count (DISTINCT ProductID)    -- 2. ������� ���-�� ���������� ������� ��...
		FROM	[Order Details]				  -- 2. ...��������� �������
		WHERE	OrderID IN	(				  -- 3. ������� ������, ������� ������ � ��������� �������, ��������� ����� ���������
							SELECT	OrderID   -- 4. ������ ������� ������� ��...
							FROM	Orders	  -- 4. ... ������� � ��������
							WHERE	EmployeeID = Employees.EmployeeID --5. ����� ������ ��� ����������� ��������
								AND Year (OrderDate) = 1997  -- 6. ��������� ���
							)
		) 
FROM	Employees                    -- 1. ���� �������� ������ ���������
WHERE	(							 -- 7. �������� ������� �� ����, �� ���� ���� �����������, �� ����� ������� ��� �� SELECT � WHERE
		SELECT	Count (DISTINCT ProductID)
		FROM	[Order Details]
		WHERE	OrderID IN	(
							SELECT	OrderID
							FROM	Orders
							WHERE	EmployeeID = Employees.EmployeeID
								AND Year (OrderDate) = 1997
							)
		) > 50      -- 8. �� ������� ������, ������ ���� ����� 50

