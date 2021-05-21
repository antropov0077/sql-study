-- ������� ����� ��������� ������ �������� (���) �� �������� � ������?
SELECT	 FirstName + ' ' + LastName,-- Count (DISTINCT O.OrderID),
		 IsNull(Round(Sum(OD.UnitPrice * Quantity * (1 - Discount)), 2), 0) -- IsNull((..), 0) - ������ NULL ����� "0", Round((..), 2) - ��������� �� 2 ����� ����� ","
FROM	 Employees E LEFT JOIN Orders O
			ON E.EmployeeID = O.EmployeeID
		 AND   ShipCity = 'London'
		 LEFT JOIN [Order Details] OD
			ON O.OrderID = OD.OrderID
GROUP BY FirstName + ' ' + LastName

-- ��������!
-- ������� ����� ��������� ������ �������� (���) �� ������� ������ �1 � ������?
SELECT	 FirstName + ' ' + LastName,-- Count (DISTINCT O.OrderID),
		 IsNull(Round(Sum(OD.UnitPrice * Quantity * (1 - Discount)), 2), 0)
FROM	 Employees E LEFT JOIN Orders O
			ON E.EmployeeID = O.EmployeeID
		 AND   ShipCity = 'London'
		 LEFT JOIN [Order Details] OD
			ON O.OrderID = OD.OrderID
		AND		ProductID = 1
GROUP BY FirstName + ' ' + LastName

-- ��� ��������!
-- ������� ����� ��������� ������ �������� (���) �� ������� ������ 'Chai' � ������?
SELECT	 FirstName + ' ' + LastName,-- Count (DISTINCT O.OrderID),
		 IsNull(Round(Sum(OD.UnitPrice * Quantity * (1 - Discount)), 2), 0)
FROM	 Employees E LEFT JOIN 
		 (
		 Orders O INNER JOIN [Order Details] OD
			ON O.OrderID = OD.OrderID
		 AND   ShipCity = 'London'
		 INNER JOIN Products P
			ON OD.ProductID = P.ProductID
		 AND   ProductName = 'Chai'
		 )
ON E.EmployeeID = O.EmployeeID
GROUP BY FirstName + ' ' + LastName

-- ������� ����� �������� ���������� 'VINET' �� ������ ��������� �������?
SELECT	 CategoryName, IsNull(Round(Sum (OD.UnitPrice * Quantity * (1 - Discount)),2), 0)
FROM	 Categories C LEFT JOIN
			 (
			 Products P INNER JOIN [Order Details] OD
				ON P.ProductID = OD.ProductID
			 INNER JOIN Orders O
				ON OD.OrderID = O.OrderID
			 AND CustomerID = 'VINET'
			 )
ON	C.CategoryID = P.CategoryID
GROUP BY CategoryName

-- ������ ������������
SELECT	CategoryName,
		(
		SELECT	IsNull(Round(Sum (UnitPrice * Quantity * (1 - Discount)),2), 0)
		FROM	[Order Details]
		WHERE	OrderID	IN	(
							SELECT	OrderID
							FROM	Orders
							WHERE	CustomerID = 'VINET'
							)
			AND ProductID IN	(
								SELECT	ProductID
								FROM	Products
								WHERE	CategoryID = Categories.CategoryID
								)
		)
FROM	Categories