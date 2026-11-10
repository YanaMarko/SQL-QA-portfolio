-- ===================================================
-- 02. ФИЛЬТРАЦИЯ, ДИАПАЗОНЫ И ВАЛИДАЦИЯ ФОРМАТОВ (REGEXP)
-- ===================================================

-- Проверка фильтрации по дате: ищем пользователей, родившихся позже указанного дня
SELECT * FROM FamilyMembers WHERE birthday > '1970-12-30';

-- Тестирование логического оператора XOR (вылет из Москвы ИЛИ прилет в Париж, но не одновременно)
SELECT * FROM Trip WHERE town_from = 'Moscow' XOR town_to = 'Paris';

-- Тест граничных значений (BVA): проверяем стоимость в диапазоне от 100 до 500 включительно
SELECT * FROM Payments WHERE unit_price BETWEEN 100 AND 500;

-- Поиск по списку (эквивалент нескольких OR): фильтрация студентов по годам рождения
SELECT * FROM Student WHERE YEAR(birthday) IN (2000, 2002, 2004);

-- Валидация маски ввода: поиск пользователей почты в домене Hotmail
SELECT name, email FROM Users WHERE email LIKE '%@hotmail.%';

-- Сложная валидация Email через регулярные выражения (REGEXP)
-- Ищем пользователей только с доменами outlook.com или icloud.com
SELECT * FROM Users WHERE email REGEXP '@(outlook\\.com|icloud\\.com)$';

-- Тестирование маски телефона: проверяем, что номер корректно начинается на +7
SELECT name, phone_number FROM Users WHERE phone_number REGEXP '^\\+7';
