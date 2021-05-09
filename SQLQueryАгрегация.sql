SELECT Avg (Price),/*Среднее*/ Max (Price), Min (Price), Sum (Price)
FROM Titles

SELECT Count (*), /*Считает кол-во строк*/ Count (Price) -- Кол-во не нулевых цен
FROM Titles