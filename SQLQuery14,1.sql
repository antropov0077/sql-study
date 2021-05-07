SELECT * FROM Titles WHERE Price > 20
SELECT * FROM Titles WHERE Price < 20
SELECT * FROM Titles WHERE Price = 20 -- 16, должно быть 18
SELECT * FROM Titles WHERE Price IS NULL -- Знает неизвестные значения
SELECT * FROM Titles WHERE Price IS NOT NULL