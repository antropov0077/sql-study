SELECT Title, Price
FROM Titles
------------------------
SELECT Title + ' ('+ CAST (Price AS varchar) +')', 
                    -- CAST (Price AS varchar) - ���������� ����� � ������
					-- (������ NULL) ����������� ������� ������ ����������� ���� ���������
		Title + ' ('+ IsNull (CAST (Price AS varchar), '�� ���������') +')' 
		            -- IsNull ������� ����������� �������� �� ���������
FROM Titles