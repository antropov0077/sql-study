-- В какую страну оформлено больше всего заказов?
SELECT TOP (1) WITH TIES ShipCountry--, Count (*)
FROM Orders
GROUP BY ShipCountry
ORDER BY Count (*) DESC

-- Какой продавец поставил рекорд по количеству заказов, оформленных в
-- течение месяца в один и тот же город?
SELECT TOP (1) WITH TIES EmployeeID, Month (OrderDate), Count (*)
FROM Orders
GROUP BY EmployeeID, ShipCity, Year (OrderDate), Month (OrderDate) -- Группируем по продавцу, году, месяцу
ORDER BY Count (*) DESC