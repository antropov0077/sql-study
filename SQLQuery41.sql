SELECT	 ShipCountry, Year (OrderDate), Count (*)
FROM	 Orders
GROUP BY ShipCountry, Year (OrderDate)

-- ������� ������� (PIVOT)
SELECT	 ShipCountry, [1996], [1997], [1998]
FROM	 (
		 SELECT	ShipCountry, Year (OrderDate) MyYear, OrderID
		 FROM	Orders
		 ) MyTable
PIVOT	 (  -- ����������� �� 2-� ��������� (������������ �� 2-� ����)
		 Count (OrderID) FOR MyYear IN ([1996], [1997], [1998])
		 ) MyReport
--WHERE [1998] > [1997] -- ���� ���� ���-�� �������������
ORDER BY ShipCountry

-- �������� (WITH ROLLUP, WITH CUBE - �����, CROUPING SETS)
SELECT	 ShipCountry, Year (OrderDate), Count (*)
FROM	 Orders
GROUP BY ShipCountry, Year (OrderDate) WITH ROLLUP -- ��������� ������������ � �������� �����
-----
SELECT	 ShipCountry, Year (OrderDate), Count (*)
FROM	 Orders
GROUP BY Year (OrderDate), ShipCountry WITH ROLLUP -- ����� �������, �� �������� ����� �������������� � ����������� �������
-----
SELECT	 ShipCountry, Year (OrderDate), Count (*)
FROM	 Orders
GROUP BY Year (OrderDate), ShipCountry WITH CUBE -- ��� �������� � ������ �������
-----
SELECT	 Year (OrderDate), ShipCountry, EmployeeID, Count (*)
FROM	 Orders
GROUP BY GROUPING SETS	(   -- ���� ����� �����-�� �������� � ��������� ������������ �������
						(Year (OrderDate), ShipCountry, EmployeeID), -- �������
						(Year (OrderDate)), -- ������� �� ������� ����
						(ShipCountry), -- ������� �� ������
						(Year (OrderDate), ShipCountry) -- ������� �� ��������� ���/������
						)

-- ������������ (Row_Number, Rank, Dense_Rank, nTile)
SELECT	 ProductName, UnitPrice,
		 Row_Number () OVER ( -- ������������ (����������� � OVER), ������ �������� ������
							ORDER BY UnitPrice DESC -- ��������� ������� ���������
		 ),
		 Rank () OVER ( -- �������� ��� Row_Number, �� �� ����������� ��������� �����, ���� ��� ������� � ����
		 ORDER BY UnitPrice DESC -- ��������� ������� ���������
		 ),
		 Dense_Rank () OVER ( -- �������� ��� Rank, �� �� ���������� ��������� ����� ����� ����������
		 ORDER BY UnitPrice DESC -- ��������� ������� ���������
		 ),
		 nTile (3) OVER ( -- ����������� ������� �������� (..), ���-�� ������, �� ������� ��������� ����� ������� �� ����
		 ORDER BY UnitPrice DESC -- ��������� ������� ���������
		 )
FROM	 Products
ORDER BY UnitPrice DESC -- ������� ����������

-- 
SELECT	 ProductName, CategoryID, UnitPrice,
		 nTile (3) OVER (
							PARTITION BY CategoryID -- ��������������� �� ������-�� ��������
							ORDER BY UnitPrice DESC
							)
FROM	 Products
ORDER BY CategoryID, UnitPrice DESC
--
SELECT	 *
FROM	(
		SELECT	 ProductName, UnitPrice,
				Row_Number () OVER	(
									ORDER BY UnitPrice DESC
									) AS Num
		FROM	 Products
		) MyScroller
WHERE	Num BETWEEN 21 AND 30 -- ����� 21 � 30

-- ������������ ����� (OFFSET, FETCH)
SELECT		ProductName, UnitPrice
FROM		Products
ORDER BY	UnitPrice DESC
			OFFSET	20 ROWS
			FETCH	NEXT 10 ROWS ONLY -- ����� � 2 �� 3 ��������

-- ������� �������� (Lag, Lead) (��������������)
SELECT	ProductName, UnitPrice,
		Lag (UnitPrice) OVER	( -- ����������
								ORDER BY UnitPrice DESC
								),
		Lead (UnitPrice) OVER	( -- ���������
								ORDER BY UnitPrice DESC
								)
FROM	Products
ORDER BY UnitPrice DESC
-- ��������� ������ ����� ������� �����������
SELECT	ProductName, UnitPrice,
		Lag (UnitPrice) OVER	( 
								ORDER BY UnitPrice DESC
								) - UnitPrice
FROM	Products
ORDER BY UnitPrice DESC
--
SELECT	OrderID, OrderDate,
		Freight,
		(Lag (Freight) OVER (ORDER BY OrderDate) + 
		Freight + 
		Lead (Freight) OVER (ORDER BY OrderDate)) / 3
FROM	Orders
ORDER BY OrderDate

-- ������� ���������
SELECT	OrderID, Freight,
		Sum (Freight) OVER (
							ORDER BY OrderID ASC
							ROWS BETWEEN
								UNBOUNDED PRECEDING -- ��� ���������� �� ��������� � ������� ������
								AND
								CURRENT ROW
							),
		Avg (Freight) OVER	(
							 ORDER BY OrderID ASC
							 ROWS BETWEEN
								30 PRECEDING
							AND
								3 FOLLOWING
							)
FROM	Orders

-- -- � ����� ������ ���������� ���� ������� �� ��������� � ���������� ������� ����� ��� �� 10%
SELECT	*
FROM	(
�������� SELECT Year (OrderDate) AS 'Year', Month(OrderDate) AS 'Month',
		 Sum(UnitPrice * Quantity * ( 1 - Discount)) AS 'Billing',
���������Sum(UnitPrice * Quantity * ( 1-Discount))
���������/
���������Lag (Sum(UnitPrice * Quantity * (1- Discount))) 
			OVER	(
��������������������ORDER BY Year(OrderDate), Month(OrderDate) ASC
���������������		) AS Growth

���������FROM Orders O INNER JOIN [Order Details] OD
���������ON O.OrderID = OD.OrderID
���������GROUP BY Year(OrderDate), Month(OrderDate)
��������)MyTable
WHERE Growth > 1 + 0.1