(
SELECT	FirstName + ' ' + LastName AS Name, City
FROM	Employees
	UNION  -- ���������� �������, ���������� ��� �������
SELECT	ContactName, City
FROM	Customers
)
ORDER BY City
--------------------------------------------
SELECT	City
FROM	Employees
	UNION	-- �� ��������� - �����������, ������������ ��������� DISTINCT
SELECT	City
FROM	Customers
--------------------------------------------
SELECT	City
FROM	Employees
	UNION ALL	-- �� ��������� ����������
SELECT	City
FROM	Customers