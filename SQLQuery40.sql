-- ��� ������ ��������� ����� 2 ����� ������� ������
SELECT	CategoryName, ProductName
FROM	Categories C
			CROSS APPLY
		(
		SELECT	 TOP (2) WITH TIES ProductID, ProductName, UnitPrice
		FROM	 Products
		WHERE	 CategoryID = C.CategoryID
		ORDER BY UnitPrice DESC
		) P

-- ��� ������� �������� (���) ����� 3 ��� ������� ������.
SELECT	FirstName + ' ' + LastName, ShipCountry
FROM	Employees E 
			OUTER APPLY
		(
		SELECT	 TOP (3) WITH TIES ShipCountry, Count (*) AS Total	-- ������ ������� ������� ������� �� ������, ����������� ���� ������� �������
		FROM	 Orders
		WHERE	 EmployeeID = E.EmployeeID
		GROUP BY ShipCountry	-- ���������� ����� ������
		ORDER BY Total DESC
		) C