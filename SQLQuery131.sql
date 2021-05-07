-- В какой товарной категории (номер) самый дорогой товар?

SELECT TOP (1) WITH TIES CategoryID
FROM Products
ORDER BY UnitPrice DESC

