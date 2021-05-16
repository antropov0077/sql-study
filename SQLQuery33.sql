-- ����� ��������� � ��������� �� �������, � �������� ��������� � 1997 ����
SELECT FirstName + ' ' + LastName
FROM Employees
WHERE City IN	( -- IN ��������� � ��������� (����� ��������� � ��������� �� �������, � �������� ��������� � 1997 ����)
				SELECT ShipCity
				FROM Orders
				WHERE Year (OrderDate) = 1997   -- ������ � ������� ���������� � 1997
				)
-------------------------------------------------
SELECT *
FROM	(
		SELECT FirstName + ' ' + LastName AS Name,
				(
				SELECT Count (DISTINCT ShipCountry) -- ���������� ���������� �����
				FROM Orders
				WHERE EmployeeID = Employees.EmployeeID
				) AS Total
		FROM Employees  -- ���������� ������ ������ FROM, 3 �������: �� ������ ���� ����������,
		) AS MyTable            -- ������� ������ ����� �����, � ������� ������ ���� ��������.
WHERE Total > 20

-- ����� �������� (EmployeeID) � 1997� ���� ������� ����� 5000 ���� �������?
SELECT	EmployeeID, Sum (Total) -- ��������� �� ���-�� � ��������� �������
FROM	(
		SELECT EmployeeID,
			(
			SELECT Sum (Quantity) -- ��������� ���-�� ������� ��..
			FROM [Order Details]       -- ������� [Order Details]
			WHERE OrderID = Orders.OrderID -- ������������� ��� ������� ������
			) AS Total -- ������� �������
		FROM Orders
		WHERE Year (OrderDate) = 1997
		) AS MyTable  -- ������� �������, ��� ����������
GROUP BY	EmployeeID  -- ���������� �� ������� �������
HAVING		Sum (Total) > 5000  -- ������