SELECT	E1.FirstName + ' ' + E1.LastName,
		E2.FirstName + ' ' + E2.LastName
FROM	Employees AS E1 CROSS JOIN Employees AS E2  -- ��������� ��������, ����� ������ �� ������� (AS ...)
WHERE	E1.TitleOfCourtesy = 'Mr.'
  AND	E2.TitleOfCourtesy = 'Ms.'

-- ������� ������� � ������ ���������?
SELECT	 Categories.CategoryID, CategoryName,	-- ������� ����� � ��� ���������
		 Count (*), Avg (UnitPrice)				-- ���������� ������� � ������ ���������, ����� ����� ��������� ���� � �.�.
FROM	 Categories CROSS JOIN Products		-- ����� ������ ��������� � ���-�� �������, ����� ��� �������
WHERE	 Categories.CategoryID = Products.CategoryID	-- ����� �������� ����, ������� ����������, ����� ���������, ������ ����� �� ���� ���������
GROUP BY Categories.CategoryID, CategoryName	-- ��������� � ������ ��������� ID � Name

-- ������� ������� ������ ������ ��������?
SELECT	 E.FirstName + ' ' + E.LastName, Count (*)
FROM	 Employees E CROSS JOIN Orders O
WHERE    E.EmployeeID = O.EmployeeID
GROUP BY E.FirstName + ' ' + E.LastName

-- ������� ����� �� ���������� �� ������ ������? -- � ������ ������ ����� ������� �������?
SELECT	 TOP (1) P.ProductName, Sum (OD.UnitPrice * Quantity * (1 - Discount)) AS Total
FROM	 Products P CROSS JOIN [Order Details] OD
WHERE	 P.ProductID = OD.ProductID
GROUP BY P.ProductName
ORDER BY Total DESC

-- ����� �������� (���) �������� ������ 20 ����������� � 1997� ����?
SELECT	 E.FirstName + ' ' + LastName--, Count (DISTINCT CustomerID)
FROM	 Employees E CROSS JOIN Orders O
WHERE	 E.EmployeeID = O.EmployeeID
	AND  Year (OrderDate) = 1997
GROUP BY E.FirstName + ' ' + LastName
HAVING	 Count (DISTINCT CustomerID) > 20

-- ����� ���������� (���) ������������� � 1997� ���� � �������� �1?
SELECT	 DISTINCT C.ContactName
FROM	 Customers C CROSS JOIN Orders O
WHERE	 C.CustomerID = O.CustomerID
	AND	 Year (OrderDate) = 1997
	AND	 EmployeeID = 1