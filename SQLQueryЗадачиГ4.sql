-- —кольких французов обслужил каждый продавец?
SELECT EmployeeID, Count (DISTINCT CustomerID)
FROM Orders
WHERE ShipCountry = 'France'
GROUP BY EmployeeID, ShipCountry

--  акой продавец обсужил больше всех городов в одной стране?
SELECT TOP (1) WITH TIES EmployeeID, Count (DISTINCT ShipCity)
FROM Orders
GROUP BY EmployeeID, ShipCountry
ORDER BY Count (DISTINCT ShipCity) DESC

--  акой покупатель обслуживалс€ у максимального количества продавцов в течение мес€ца?
SELECT TOP (1) WITH TIES CustomerID
FROM Orders
GROUP BY CustomerID, Year (OrderDate), Month (OrderDate)
ORDER BY Count (DISTINCT EmployeeID) DESC