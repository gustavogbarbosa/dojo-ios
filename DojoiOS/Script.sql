CREATE TABLE IF NOT EXISTS tb_cars
(
id_car INTEGER NOT NULL PRIMARY KEY,
name TEXT,
information TEXT,
hp REAL,
id_brand_fk INTEGER NOT NULL,
FOREIGN KEY(id_brand_fk) REFERENCES tb_brands(id_brand)
);

CREATE TABLE IF NOT EXISTS tb_brands
(
id_brand INTEGER NOT NULL PRIMARY KEY,
name TEXT,
isFancy INTEGER DEFAULT '0' NOT NULL
);

INSERT INTO tb_brands(name, isFancy) VALUES ('Ferrari', 1), ('Lamborghini', 1), ('Porsche', 1), ('Fiat', 0), ('Volks', 0), ('Nissan', 0), ('Ford', 0), ('Chevrolet', 0),  ('Kia', 0), ('Renault', 0);