SELECT Title, Price
FROM Titles
------------------------
SELECT Title + ' ('+ CAST (Price AS varchar) +')', 
                    -- CAST (Price AS varchar) - превращает число в строку
					-- (строки NULL) Неизвестный оперант делает неизвестным весь результат
		Title + ' ('+ IsNull (CAST (Price AS varchar), 'не продается') +')' 
		            -- IsNull заменет неизвестные занчения на известные
FROM Titles