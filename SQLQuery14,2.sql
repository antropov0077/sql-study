-- ����� ������ ���� ������� ������ 1997 ����?
SELECT	*
FROM	Orders
WHERE	Year (OrderDate) = 1997
	AND (
		Month (OrderDate) = 3
	OR  Month (OrderDate) = 4
	OR  Month (OrderDate) = 5
		)
----------------------------------------------
SELECT	*
FROM	Orders
WHERE	Year (OrderDate) = 1997
	AND Month (OrderDate) >= 3
	AND Month (OrderDate) <= 5
----------------------------------------------
SELECT	*
FROM	Orders
WHERE	Year (OrderDate) = 1997
	AND Month (OrderDate) BETWEEN 3 AND 5 -- ��������
----------------------------------------------
SELECT	*
FROM	Orders
WHERE	Year (OrderDate) = 1997
	AND Month (OrderDate) IN (1, 3, 5) -- ����������� 
----------------------------------------------
SELECT	*
FROM	Orders
WHERE	OrderDate >= '19970301'
	AND OrderDate < '19970601'  -- ���������������� �������