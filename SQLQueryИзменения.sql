SELECT * FROM Authors

INSERT    -- ��������� � ������ � �������
INTO Authors (au_id, au_lname, au_fname, city, contract) -- ��� ���� ����� ������ �����������, ���� �������� �������
VALUES ('111-22-3333', 'Ivan', 'Ivanov', 'Vladimir', 0),  -- ��������� ������
		('111-22-3334', 'Petr', 'Sidorov', 'Ryazan', 1)
--------------------------------------------------------------------------------
UPDATE Authors  -- ������ ���������� ����� � �������
SET City = 'Kostroma',  -- ���������, ������� � ������� ������ ��������
	Contract = 1 - Contract  -- ����� �������� �������� ����� ',' (1 - n) - �������� 
WHERE City IN ('Vladimir', 'Ryazan')  -- ����� ������ ������
--------------------------------------------------------------------------------
DELETE -- ������� ������
FROM Authors
WHERE City = 'Kostroma' -- �� ������ ������� ������� ������