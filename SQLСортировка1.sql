SELECT ProductName, UnitPrice -- ����� ������� ����������
FROM Products -- �� ����� �������
ORDER BY UnitPrice ASC, -- ASC �� �����������(�� ���������), DESC - �� ��������
         ProductName ASC  -- �������������� ��������, ���� ������ ����������
------------------------------------------------------------------------------
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice * (1 + 0.18) -- ����������� ������� (����� �������� �������)