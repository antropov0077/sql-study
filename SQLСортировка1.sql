SELECT ProductName, UnitPrice -- Какой столбец показывать
FROM Products -- Из какой таблицы
ORDER BY UnitPrice ASC, -- ASC по возрастанию(по умолчанию), DESC - По убыванию
         ProductName ASC  -- Дополнительный критерий, если первый одинаковый
------------------------------------------------------------------------------
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice * (1 + 0.18) -- Вычисленный столбец (можно добавить формулу)