-- Сколько заказов оформлено в Германию в 1997м году?
SELECT Count (*)
FROM Orders
WHERE Year (OrderDate) = 1997
	AND ShipCountry = 'Germany'

-- Каких покупателей (customers) больше: с факсом или без?
SELECT Count (*)
FROM Customers
WHERE Fax IS NOT NULL

SELECT Count (*)
FROM Customers
WHERE Fax IS NULL
------------------------------------------------------
SELECT Count (Fax), Count (*) - Count (Fax) -- Всего строк минус строки с факсом
FROM Customers