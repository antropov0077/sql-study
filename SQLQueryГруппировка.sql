-- Сколько заказов мы оформили в каждую страну?
SELECT ShipCountry, Count (*)
FROM Orders
GROUP BY ShipCountry

-- Сколько заказов мы оформили в каждую страну в 1997м году?
SELECT ShipCountry, Count (*)
FROM Orders
WHERE Year (OrderDate) = 1997
GROUP BY ShipCountry