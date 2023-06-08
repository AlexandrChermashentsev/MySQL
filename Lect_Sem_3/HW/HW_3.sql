CREATE SCHEMA sem_3_hw;
USE sem_3_hw;

CREATE TABLE staff (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
firstName VARCHAR(20) NOT NULL,
lastName VARCHAR(30) NOT NULL,
post VARCHAR(20) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL);

INSERT `staff` (`firstName`, `lastName`, `post`, `seniority`, `salary`, `age`)
VALUES ('Василий', 'Петров', 'Начальник', 40, 100000, 60), ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Екатерина', 'Катина', 'Инженер', 2, 70000, 25), ('Александр', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Иванов', 'Рабочий', 40, 30000, 59), ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35), ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25), ('Максим', 'Максимов', 'Рабочий', 2, 11000, 22),
('Юрий', 'Галкин', 'Рабочий', 2, 12000, 24), ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

# 1. Отсортируйте данные по полю заработная плата ( salary ) в порядке: убывания; возрастания.
SELECT * FROM staff ORDER BY salary DESC;
SELECT * FROM staff ORDER BY salary ASC;

# 2. Выведите 5 максимальных заработных плат (salary)
SELECT salary FROM staff ORDER BY salary DESC LIMIT 5;

# 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT SUM(salary) AS 'Sum salary', post FROM staff GROUP BY post;

# 4. Найдите кол во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(*) AS 'count' FROM staff WHERE post IN ('Рабочий') and (age > 23 AND age < 50);

# 5. Найдите количество специальностей
SELECT COUNT(distinct post) AS 'кол-во специальностей' FROM staff;

# 6. Выведите специальности, у которых средний возраст сотрудников меньше 40 лет
SELECT post, AVG(age) FROM staff GROUP BY post HAVING AVG(age) < 40;