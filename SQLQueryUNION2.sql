SELECT	ProductName, UnitPrice, '�����' -- ���������� �������, ���� ������ �� ����� ������� ������
FROM	Products
	UNION ALL
SELECT	Title, Price, '�����'	-- ���������� �������, ���� ������ �� ����� ������� ������
FROM	Pubs..Titles	-- Pubs.. -��������� � ������ ����

	ORDER BY UnitPrice ASC