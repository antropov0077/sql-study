--  акие продавцы обслужили нескольких клиентов из одного города?
SELECT DISTINCT EmployeeID--, Count (DISTINCT CustomerID)
FROM Orders
GROUP BY EmployeeID, ShipCity
HAVING Count (DISTINCT CustomerID) > 1

-- Ќа каких товарах мы "недополучили" из-за скидок больше 1000?
SELECT *
FROM [Order Detales]