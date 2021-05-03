SELECT	GetDate ()  -- Сегодняшняя дата

SELECT	Year(GetDate ()) AS Год,
		Month(GetDate ()) AS Месяц,
		Day(GetDate ()) AS День,
		DatePart(hour, GetDate ()) AS Часы,
		DatePart(minute, GetDate ()) AS Минуты,
		DatePart(second, GetDate ()) AS Секунды     -- Покзать дату и время

SELECT DateDiff (day, '12.04.1961', GetDate ()) -- Разница между сегодня и 12.04.61

SELECT DateAdd (hour, 100, GetDate ()) -- Прибавить к сегодня 100 часов

/* Остановился на 38:20*/