-- Сколько денег мы заработали на каждой категории товаров?
SELECT	CategoryName,
		(
		SELECT	Sum (UnitPrice * Quantity * (1 - Discount))
		FROM	[Order Details]
		WHERE	ProductID IN	(
								SELECT	ProductID
								FROM	Products
								WHERE	CategoryID = Categories.CategoryID
								)
		)
FROM	Categories

-- Каким товаром заинтересовалось больше всего покупателей?
SELECT TOP (1) WITH TIES	ProductName
FROM	Products
ORDER BY	(
			SELECT	Count (DISTINCT CustomerID)
			FROM	Orders
			WHERE	OrderID IN	(
									SELECT OrderID
									FROM [Order Details]
									WHERE ProductID = Products.ProductID
									)
			) DESC

-- Какой покупатель в 1997м году потратил больше всех денег на напитки (Beverages)?
SELECT		TOP (1) WITH TIES ContactName
FROM		Customers
ORDER BY	(
		SELECT	Sum (UnitPrice * Quantity * (1 - Discount))
		FROM	[Order Details]
		WHERE	ProductID	IN	(
								SELECT	ProductID
								FROM	Products
								WHERE	CategoryID =	(
														SELECT	CategoryID
														FROM	Categories
														WHERE	CategoryName = 'Beverages'
														)
								)
				AND	OrderID IN	(
								SELECT	OrderID
								FROM	Orders
								WHERE	Year (OrderDate) = 1997
									AND CustomerID = Customers.CustomerID
								)
		) DESC