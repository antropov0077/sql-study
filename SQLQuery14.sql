SELECT	GetDate ()  -- ����������� ����

SELECT	Year(GetDate ()) AS ���,
		Month(GetDate ()) AS �����,
		Day(GetDate ()) AS ����,
		DatePart(hour, GetDate ()) AS ����,
		DatePart(minute, GetDate ()) AS ������,
		DatePart(second, GetDate ()) AS �������     -- ������� ���� � �����

SELECT DateDiff (day, '12.04.1961', GetDate ()) -- ������� ����� ������� � 12.04.61

SELECT DateAdd (hour, 100, GetDate ()) -- ��������� � ������� 100 �����

/* ����������� �� 38:20*/