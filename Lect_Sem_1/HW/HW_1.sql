USE sem_hW_1;

# 1. Создайте таблицу с мобильными телефонами, используя SQL скрипт.
# Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ
CREATE TABLE phoneShop (
id INT primary key not null auto_increment,
productName VARCHAR(45),
manufacturer VARCHAR(45),
productCount INT not null,
price INT not null);

INSERT `phoneshop` (`productName`, `manufacturer`, `productCount`, `price`)
VALUES ('Iphone 13', 'Apple', '2', '75000'), ('Iphone X', 'Apple', '3', '40000'), ('P20 Pro', 'Huawei', '5', '30000'), 
('Galaxy S9', 'Samsung', '1', '47000'), ('Galaxy S8', 'Samsung', '2', '38000'), ('Pixel 7 PRO', 'Google', '3', '79000');

# 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL файл, скриншот, либо сам код)
SELECT productName, manufacturer, price FROM phoneshop WHERE productCount > 2;

# 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM phoneshop WHERE manufacturer = 'Samsung';

# 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT * FROM phoneshop WHERE (100000 < productCount * price) AND (productCount * price < 145000);

# 5. С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
#	5.1 Товары, в которых есть упоминание "Iphone"
SELECT * FROM phoneshop WHERE concat_ws(id, productName, manufacturer, productCount, price) like '%Iphone%';
#	5.2 Товары, в которых есть упоминание "Galaxy"
SELECT * FROM phoneshop WHERE concat_ws(id, productName, manufacturer, productCount, price) like '%Galaxy%';
#	5.3 Товары, в которых есть ЦИФРЫ
SELECT * FROM phoneshop WHERE productName REGEXP '[0-9]';
#	5.4 Товары, в которых есть ЦИФРА "8"
SELECT * FROM phoneshop WHERE productName REGEXP '[8]';