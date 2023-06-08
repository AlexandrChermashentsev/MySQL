CREATE SCHEMA sem_2_hw;
USE sem_2_hw;

# 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными
CREATE TABLE `sales` (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
order_date DATE NOT NULL,
count_product INT);

INSERT `sales` (`order_date`, `count_product`)
VALUES ('2022-01-01', 156), ('2022-01-02', 180), ('2022-01-03', 21), ('2022-01-04', 124), ('2022-01-05', 341);
SELECT * FROM sales;

/* 2. Для данных таблицы "sales” укажите тип заказа в зависимости от кол-ва :
меньше 100 -> Маленький заказ
от 100 до 300 -> Средний заказ
больше 300 -> Большой заказ
*/
SELECT id,
CASE
	WHEN count_product < 100 THEN 'Small order'
    WHEN count_product BETWEEN 100 AND 300 THEN 'Average order'
    WHEN count_product > 300 THEN 'Big order'
    ELSE 'Empty'
END AS `Тип заказа`
FROM sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями
	Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status
OPEN - «Order is in open state» ; CLOSED - «Order is closed» ; CANCELLED - «Order is cancelled»
*/

CREATE TABLE `orders` (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id VARCHAR(3),
amount DECIMAL(6,2),
order_status VARCHAR(10));
ALTER TABLE orders ADD FOREIGN KEY (id) REFERENCES sales (id);

SELECT * FROM orders;

INSERT `orders` (`employee_id`, `amount`, `order_status`)
VALUES ('e03', 15.00, 'OPEN'), ('e01', 25.50, 'OPEN'), ('e05', 100.70, 'CLOSED'), ('e02', 22.18, 'OPEN'), ('e04', 9.50, 'CANSELLED');
SELECT sales.id, order_date, count_product, employee_id, amount, order_status,
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANSELLED' THEN 'Order is canselled'
END AS `full_order_status`
FROM sales, orders 
WHERE sales.id = orders.id; # Решение - "костыльное", зато красивое :-) 