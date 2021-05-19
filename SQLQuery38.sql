-- INNER JOIN
-- ������� ������� ������ ������ �������� � 1997� ����?
SELECT	 E.FirstName + ' ' + E.LastName, Count (*)
FROM	 Employees E INNER JOIN Orders O
		 ON	E.EmployeeID = O.EmployeeID
WHERE	 Year (OrderDate) = 1997
GROUP BY E.FirstName + ' ' + E.LastName

-- ����� ���������� (���) � 1997� ���� �������� ������ ���� ����� �� ������� ("Beverages")?
SELECT	 TOP (1) C.ContactName--, Sum(OD.UnitPrice * Quantity * (1 - Discount))
FROM	 Customers C INNER JOIN Orders O
			ON	C.CustomerID = O.CustomerID -- ���������� ����������
		 INNER JOIN [Order Details] OD
			ON	O.OrderID = OD.OrderID	-- ������ ���������� ��� ���� �����
		 INNER JOIN Products P
			ON	OD.ProductID = P.ProductID	-- ���������� �����
		 INNER JOIN Categories Cat
			ON	P.CategoryID = Cat.CategoryID	-- �� ���������� ���������
WHERE	 Cat.CategoryName = 'Beverages'
	AND  Year (O.OrderDate) = 1997
GROUP BY C.ContactName
ORDER BY Sum(OD.UnitPrice * Quantity * (1 - Discount)) DESC

-- ����� ���������� (���) �������� ����� ������� ����������� �������?
SELECT	 TOP (1) WITH TIES ContactName--, Count (DISTINCT P.ProductID)
FROM	 Customers C INNER JOIN Orders O
			ON C.CustomerID = O.CustomerID
		 INNER JOIN [Order Details] OD
			ON O.OrderID = OD.OrderID
		 INNER JOIN Products P
			ON OD.ProductID = P.ProductID
GROUP BY ContactName
ORDER BY Count (DISTINCT P.ProductID) DESC

-- ������� ������� ������ ������ ����������(���)?
SELECT	 ContactName, Count (DISTINCT OrderID)
FROM	 Customers C LEFT JOIN Orders O
			ON C.CustomerID = O.CustomerID
GROUP BY ContactName
ORDER BY Count (DISTINCT OrderID)

-- ������� ������� ������� ������ �������� (���) � �����?
SELECT	 FirstName + ' ' + LastName, Count (DISTINCT O.OrderID)
FROM	 Employees E LEFT JOIN Orders O
			ON E.EmployeeID = O.EmployeeID
		 AND   ShipCity = 'Paris'
GROUP BY FirstName + ' ' + LastName

SELECT	FirstName + ' ' + LastName,
		(
		SELECT	Count (*)
		FROM	Orders
		WHERE	EmployeeID = Employees.EmployeeID
			AND ShipCity = 'Paris'
		)
FROM	Employees