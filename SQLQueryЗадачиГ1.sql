-- Сколько товаров в каждой категории?
SELECT TOP (1) WITH TIES CategoryID --, Count (*)
FROM Products
GROUP BY CategoryID
ORDER BY Count (*) DESC

-- Сколько заказов отправил в каждом году каждый продавец?
SELECT Year (OrderDate), EmployeeID, Count (*) -- Выводим год, продавца и кол-во заказов
FROM Orders
GROUP BY Year (OrderDate), EmployeeID -- Группируем по комбинации год/продавец
ORDER BY EmployeeID, Year (OrderDate) -- Сортируем по продавцам, а внутри каждого по годам