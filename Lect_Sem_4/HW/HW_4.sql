CREATE SCHEMA sem_4_hw;
USE sem_4_hw;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);

# 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT cats.name, shops.shopname FROM cats
	INNER JOIN shops
	ON shops.id = cats.shops_id;

# 2. Вывести магазины, в которых продается кот 'Murzik' (попробуйте выполнить 2 способами)
SELECT shops.shopname, cats.name FROM shops
	RIGHT JOIN cats ON cats.shops_id = shops.id
	WHERE cats.name = 'Murzik';

SELECT shops.shopname FROM shops
	WHERE id IN (
		SELECT shops_id FROM cats
		WHERE cats.name = 'Murzik');
        
# 3. Вывести магазины, в которых НЕ продаются коты 'Murzik' и 'Zuza'
SELECT shops.shopname FROM shops
	LEFT JOIN cats ON cats.shops_id = shops.id AND (cats.name = 'Murzik' OR cats.name = 'Zuza')
    WHERE cats.name IS NULL;
