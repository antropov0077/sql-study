SELECT TOP (11) ProductName, UnitPrice -- ��� (n) ��������
FROM Products
ORDER BY UnitPrice DESC -- ���������� �� ��������
----------------------------------------------------------
SELECT TOP (11) WITH TIES -- WITH TIES - ��������� ������� � ��� ��� ������ ��������
	   ProductName, UnitPrice -- ��� (n) ��������
FROM Products
ORDER BY UnitPrice DESC -- ���������� �� ��������