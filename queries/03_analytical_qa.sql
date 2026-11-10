-- ===================================================
-- 03. АГРЕГАЦИЯ (GROUP BY, HAVING) И ОБЪЕДИНЕНИЕ (JOIN)
-- ===================================================

-- Сверка данных для дашборда: подсчет количества комнат по типам с сортировкой по убыванию
SELECT home_type, COUNT(*) AS count_rooms 
FROM Rooms 
GROUP BY home_type 
ORDER BY count_rooms DESC;

-- Проверка бизнес-расчетов: вычисление разницы между самой дорогой и дешевой комнатой
-- Фильтруем группы через HAVING (выводим только типы жилья, где объектов 2 и более)
SELECT home_type, MAX(price) - MIN(price) AS difference 
FROM Rooms 
GROUP BY home_type 
HAVING COUNT(*) >= 2;

-- Сложный интеграционный тест (INNER JOIN 3-х таблиц)
-- Проверяем цепочку: Товар -> Платеж -> Пользователь. 
-- Ищем названия продуктов, которые покупал именно пользователь со статусом 'son'
SELECT good_name FROM Goods
INNER JOIN Payments ON Payments.good = Goods.good_id
INNER JOIN FamilyMembers ON Payments.family_member = FamilyMembers.member_id
WHERE FamilyMembers.status = 'son';
