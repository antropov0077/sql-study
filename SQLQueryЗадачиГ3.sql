-- В какой город продавец №1 оформил больше всего заказов для для одного клиента?
SELECT TOP (1) WITH TIES ShipCity--, EmployeeID, CustomerID, Count (*)
FROM Orders
WHERE EmployeeID = 1
GROUP BY ShipCity, EmployeeID, CustomerID
ORDER BY Count (*) DESC

--Какой покупатель чаще всех обсуживался у одного и того же продавца?
SELECT TOP (1) WITH TIES CustomerID--, EmployeeID, Count (*)
FROM Orders
GROUP BY CustomerID, EmployeeID
ORDER BY Count (*) DESC

-- 1:24