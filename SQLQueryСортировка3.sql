-- В какую страну был оформлен последний заказ в 1997м году?
SELECT TOP (1) WITH TIES ShipCountry
FROM Orders
WHERE Year (OrderDate) = 1997 -- Поиск по строке Год
ORDER BY OrderDate DESC -- Сортировка по дате