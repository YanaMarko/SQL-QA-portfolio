-- ==========================================
-- 01. SMOKE-CHECK ЗАПРОСЫ И ПРОВЕРКА НА NULL
-- ==========================================

-- Простой вывод текста для проверки доступности БД
SELECT 'Hello world' AS test_output;

-- Экспресс-анализ: выгрузка всех членов семьи для визуальной проверки данных
SELECT * FROM FamilyMembers;

-- Негативный тест: ищем преподавателей с пропущенным (NULL) отчеством
-- Помогает найти дефекты валидации формы регистрации
SELECT * FROM Teacher WHERE middle_name IS NULL;

-- Позитивный тест: проверяем записи, где отчество заполнено корректно
SELECT * FROM Teacher WHERE middle_name IS NOT NULL;

-- Использование синонимов (алиасов) для приведения названий колонок к UI-виду
SELECT member_id, member_name AS Name FROM FamilyMembers;
SELECT name AS passengerName FROM Passenger;
