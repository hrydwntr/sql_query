-- Session 1

-- MySQL

-- case tidak sensitive
-- Indentasi tidak berpengaruh
-- Comparison dengan singe =

-- Menampilkan Database
show DATABASES;

-- Menggunakan suatu database
USE sakila;

-- Membuat DATABASE
CREATE DATABASE seller;

-- Menghapus database tertentu (HINDARI)
DROP DATABASE seller;

-- Masuk ke database seller
USE seller;

-- Menampilkan table apa saja yang ada di database
SHOW FULL TABLES;

# ===========================================================================================
-- Cara membuat table
CREATE TABLE customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR (300),
    LastName VARCHAR (300),
    City VARCHAR (200),
    Salary DOUBLE (20, 5)
);

-- Menampilkan table yang ada di sebuah database
SHOW FULL TABLES;

-- Menghapus table dari sebuah database (HATI-HATI)
DROP TABLE customer;

-- Menampilkan format table saat dibuat
SHOW CREATE TABLE customer;

# ===========================================================================================

-- Menampilkan semua kolom di sebuah table
SELECT * FROM customer;

-- Menampilkan beberapa kolom di sebuah table
SELECT FirstName, LastName FROM customer;

# ===========================================================================================
-- Memasukkan data ke dalam TABLE

-- INSERT INTO name_table
-- VALUES (values1, values2, values3)

INSERT INTO customer
VALUES (1, 'Roger', 'Federer', 'Pamulang', 20.5);

SELECT * FROM customer;

-- INSERT INTO nama_table (kolom2, kolom3, kolom1)
-- VALUES (values2, values3, values1) 

INSERT INTO customer (FirstName, LastName, CustomerID)
VALUES('Taylor', 'Swift', 2);

SELECT * FROM customer;

-- Langsung memasukkan lebih dari 1 baris data
INSERT INTO customer
VALUES 
	(3, 'Tiger', 'Woods', 'Jatinangor', 33.333),
	(4, 'Angelina', 'Jolie', 'Jatinangor', 99.999)
;

SELECT * FROM customer;

# ===========================================================================================
-- Mengganti/memodifikasi isi data dalam table yang sudah ada

-- UPDATE name_table
-- SET nama_kolom = nilai_baru
-- WHERE kondisi

UPDATE customer
SET City = 'Citayem'
WHERE CustomerID = 2;

SELECT * FROM customer;

-- Mengganti nilai pada lebih dari 1 kolom
UPDATE customer
SET LastName = 'Lautner', salary = 40
WHERE CustomerID = 2;

SELECT * FROM customer;

# ===========================================================================================
-- Menghapus baris pada sebuah table

SET SQL_SAFE_UPDATES = 0; 	# setting agar bisa update isi table

-- DELETE FROM nama_table
-- WHERE kondisi

DELETE FROM customer
WHERE CustomerID = 4;  

DELETE FROM customer
WHERE Salary > 30;  

SELECT * FROM customer;

# ===========================================================================================
-- SELECT kolom1, kolom2, kolom3 FROM nama_table

USE world;    -- masuk ke database world 
SHOW TABLES;  -- melihat table apa saja yg ada di database world

SELECT * FROM country;

SELECT Name, Population FROM country; 

# ===========================================================================================
-- LIMIT: membatasi jumlah baris

-- Menampilkan 5 baris pertama
SELECT Code, Name, Continent FROM country
LIMIT 5
;

-- Menampilkan 5 baris setelah baris ke 3 (baris ke 3 tidak termasuk)
SELECT * FROM country
LIMIT 5 OFFSET 3;

# ===========================================================================================
-- DISTINCT: untuk menampilkan unique value (tidak ada duplikat)

-- SELECT DISTINCT nama_kolom FROM nama_table
SELECT DISTINCT continent FROM country;

# ===========================================================================================
-- COUNT: untuk menghitung jumlah baris 

SELECT continent FROM country;
SELECT count(continent) FROM country;      			# 239 --> jumlah baris pada table country    

-- Hanya menghitung jumalah continent unique 
SELECT DISTINCT continent FROM country;
SELECT count(DISTINCT continent) FROM country;		# 7 --> jumlah benua

SELECT count(*) FROM country;						# 239 --> jumlah baris pada table country

# ===========================================================================================
-- SUM: menjumlahkan nilai pada kolom numerikal 

SELECT * FROM country;

-- Total GNP dari semua negara (semua baris)
SELECT sum(GNP) FROM country;

# ===========================================================================================
-- AVG: menampilkan nilai rata-rata pada kolom numerikal 

SELECT avg(GNP) FROM country;               	# rata-rata GNP

SELECT sum(GNP)/count(name) FROM country;		# rata-rata GNP = total GNP / jumlah negara	

# ===========================================================================================
-- WHERE: 
-- untuk filtering (menampilkan baris yg kondisinya True)
-- jika kondisi lebih dari 1, maka bisa gunakan AND atau OR

-- SELECT nama_kolom FROM nama_table
-- WHERE kondisi

-- Negara yang berada di benua North America 
SELECT * FROM country
WHERE continent = 'North America';

-- Jumlah negara yang berada di benua North America 
SELECT count(*) FROM country
WHERE continent = 'North America';

-- Total populasi dari negara-negara yang SurfaceArea-nya lebih dari 2 juta  
SELECT sum(Population) FROM country
WHERE SurfaceArea > 2000000;

# ===========================================================================================
-- AS: memberi alias pada nama kolom

SELECT sum(Population) AS Total_Populasi
FROM country
WHERE SurfaceArea > 2000000;

SELECT * FROM country;

-- Tampilkan kolom Name dan LifeExpectancy dengan nama kolom Nama_Negara dan Harapan_Hidup
SELECT Name as Nama_Negara, LifeExpectancy as Harapan_Hidup
FROM country;

# ===========================================================================================
# ===========================================================================================
-- Session II
# ===========================================================================================
# ===========================================================================================
-- Modul 2 Session 2
Use world;
SELECT * FROM country;

# ===========================================================================================
-- String Pattern (LIKE)
-- Untuk memilih/filtering baris tertentu pada kolom berisi TABLE_CHECKSUM

-- SELECT name_collumn FROM name_table
-- WHERE name_collumn LIKE ....ADD

SELECT * FROM country
WHERE Name = 'Indonesia';

SELECT * FROM country
WHERE Name LIKE 'Indonesia'; 

SELECT * FROM country
WHERE population LIKE 103000;

-- %: menunjukan teks biasa diawali atau diikuti dengan beberapa jumlah karakter
-- _: Menunjukan teks bisa diawali atau diikuti dengan 1 karakter

-- Menampilkan nama kota yang diawali oleh huruf a
SELECT * from city
WHERE Name LIKE 'a%';

-- Menampilkan nama kota yang diakhiri oleh huruf j
SELECT * from city
WHERE Name LIKE '%j';

-- Menampilkan nama kota yang ada huruf j-nya
SELECT * from city
WHERE name LIKE '%j%';

-- Menampilkan nama kota yang ada huruf j-nya, tapi tidak boleh di depan dan dibelakang ada hurufnya!
SELECT * from city
WHERE name LIKE '%j%'
AND NAME not LIKE 'j%'
AND Name not LIKE '%j';

-- \: escape character

-- Menampilkan nama kota yang mengandung karakter %
SELECT * FROM city
WHERE name LIKE '%\%%';

-- Menampilkan kota yang populasinya diawali angka 1 dan diakhiri angka 9
SELECT * FROM city
WHERE population LIKE '1%9';

SELECT * FROM city
WHERE population LIKE '1%'
 AND population LIKE '%9';

-- Menampilkan nama kota dengan 5 karakter dan diawali huruf a
SELECT * FROM city
WHERE name LIKE 'a____';

-- Menampilkan nama kota dengan 14 karakter dan diawali huruf a
-- spasi dianggap 1 karakter
SELECT * FROM city
WHERE name LIKE 'a_____________';

-- Menampilkan nama kota dengan 5 karakter dan huruf ketiganya adalah huruf c
SELECT * FROM city
WHERE name LIKE '__c__';

# ===========================================================================================

-- BETWEEN : Diantara
-- Membatassi rentang nilai tertentu
-- Nilai awal dan nilai akhir include (termasuk yang ditampilkan)

-- Menampilkan kota dengan populasi antara 500rb sampai 600rb

SELECT * FROM city
WHERE population BETWEEN 500000 AND 600000;

SELECT * FROM city
WHERE population >= 500000 AND population <= 600000;

# ===========================================================================================

-- ORDER BY
-- Mengurutkan data secara ascending atau descending
-- Ascending (ASC): A->Z, angka kecil ke besar
-- Descending (DESC): Z->A, angka besar ke kecil

-- Menampilkan kota diurutakan dari populasi terbanyak
SELECT * FROM city
ORDER BY Population DESC LIMIT 5;

-- Menampilkan kota diururtkan berdasarkan abjad
SELECT * FROM city
ORDER BY name;

-- Menampilkan negara diurutkan berdasarkan region secara ascending, kemudian GNP dari yang terbesar
SELECT * FROM country
ORDER BY region ASC, GNP DESC;

-- Menampilkan kota dengan populasi antara 500rb sampai 600rb
-- Kemudian urutkan dari populasi terbesar
SELECT * FROM city
where population BETWEEN 500000 AND 600000
ORDER BY population DESC
LIMIT 5;

-- Urutan syntax: SELECT -> FROM -> WHERE -> ORDER BY -> LIMIT

# ===========================================================================================

-- GROUP BY
-- Mengelompokan data berdasarkan unique value pada suatu kolom
-- GROUP BY biasanya berpasangan dengan aggregate function: sum, count, avg, min, max, dll.ADD

-- Total populasi dari semua negara
SELECT sum(population) FROM country;

-- Total populasi dari tiap continent
SELECT continent, SUM(population) FROM country
GROUP BY continent;

-- Menampilkan unique value dari kolom Continent (hasilnya sama dengan SELECT DISTINCT)
SELECT continent from country
GROUP BY continent;

-- Total populasi tiap continent, kemudian diurutkan dari populasi terkecil
SELECT continent as Benua, sum(population) as Total_Population FROM country
GROUP BY Benua
ORDER BY Continent;

-- Total populasi Negara berawalan huruf a dari tiap continent, kemudian diurutkan dari populasi terkecil
SELECT continent, sum(population) FROM country
WHERE name like 'a%'
GROUP BY continent
ORDER BY SUM(population);

SELECT * FROM country
WHERE name LIKE 'a%';

-- Menampilkan total populasi dari rata-rata GNP tiap benua
SELECT continent, sum(population), avg(GNP)
FROM country
GROUP BY continent
ORDER BY AVG(GNP) DESC;

-- Urutan syntax: SELECT -> FROM -> WHERE -> GROUP BY -> ORDER BY -> LIMIT

# ===========================================================================================

-- HAVING
-- Fungsinya sama dengan WHERE (filtering berdasarkan kondisi tertentu)
--  Letaknya setelah group BY

-- Total populasi tiap continent, dan hanya tampilkan continent yang populasinya di atas 2 milyar
-- Contoh yang benar: HAVING setelah GROUP BY
SELECT continent, sum(Population)
FROM country
GROUP BY continent
HAVING sum(Population) > 2e9;

-- Contoh yang salah: WHERE setelah GROUP BY
SELECT Continent, sum(Population)
FROM country
GROUP BY Continent
WHERE sum(population) > 2e9;

-- Tampilkan rata-rata GNP dari continent Asia and Africa
SELECT continent, AVG(GNP) FROM country
GROUP BY Continent
HAVING continent = 'Asia' OR continent = 'Africa';

-- CARA LAIN
SELECT continent, AVG(GNP) FROM country
GROUP BY continent
HAVING continent in ('Asia', 'Africa');

-- CARA LAIN
SELECT continent, AVG(GNP) FROM COUNTRY
WHERE CONTINENT IN('Asia', 'Africa')
GROUP BY continent;

# ===========================================================================================

-- BUILT IN FUNCTION

-- Aggregate: berlaku untuk seluruh data dalam sebuah kolom atau untuk kumpulan/kelompok data

SELECT sum(GNP) FROM COUNTRY;

SELECT CONTINENT, SUM(GNP) FROM country
GROUP BY continent;

-- Kota dengan populasi terkecil
SELECT * FROM city
ORDER BY population
LIMIT 1;

SELECT min(Population) FROM city;

SELECT AVG(population) FROM City;

-- SCALAR FUNCTION:
-- Function yang diaplikasikan pada tiap baris.
-- Jadi jumlah baris awal tidak berkurang.

SELECT * FROM country;

-- Menampilkan jumlah karakter dari nama negara
SELECT Name, LENGTH(Name)
FROM country;

-- Menampilkan negara dan LifeExpectany yang dibulatkan
SELECT Name, LifeExpectancy, ROUND(LifeExpectancy)
FROM COUNTRY;

-- Menampilkan nama negara dengan Uppercase
SELECT Name, ucase(Name)
FROM country

# ===========================================================================================
# ===========================================================================================
-- Session III
# ===========================================================================================
# ===========================================================================================

-- Modul 2: Session3

Use world;
SELECT * FROM city;

# ===========================================================================================

-- Subquery berupa 1 cell (bisa kita anggap sebuah nilai)

-- Soal: Tampilkan kota yang populasinya di atas rata-rata populasi!

-- Contoh yang salah: aggregate function tidak bisa langsung diletakkan di WHERE clause
SELECT name, population
FROM city
WHERE population > AVG(population);

-- Contoh yang benar: rata-rata populasi didapatkan dengan subquery
SELECT name, population
FROM city
WHERE population > (SELECT AVG(population) FROM city);

-- Kita cari dulu nilai rata-rata populasi,
-- Kemudian dijadikan subquery untuk dimasukkan ke query utama
SELECT AVG(population)
FROM city;

# ===========================================================================================
-- Subquery bisa berupa sebuah kolom (bisa kita anggap sebagai list)

-- Nama kota berawalan Z, kita jadikan sebagai subquery
SELECT Name FROM city
WHERE Name LIKE 'z%';

-- Menampilkan negara yang namanya ada di dalam list subquery yang sudah dibuat di atas
SELECT * FROM city
WHERE Name IN (SELECT Name FROM city
                WHERE Name LIKE 'z%');

# ===========================================================================================

USE employees;
SHOW full tables;

SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM salaries;

-- Soal: Tampilkan karyawan yang paling muda

-- Subquery: mencari tanggal paling muda (max birth_date)
SELECT MAX(birth_date) FROM employees;

-- query utama
SELECT emp_no, first_name, last_name, birth_date
FROM employees
WHERE birth_date = (SELECT MAX(birth_date) FROM employees);

# ===========================================================================================

-- Subquery bisa diletakkan setelah WHERE (untuk filtering)

-- Menampilkan karyawan dengan gaji diatas rata-rata

-- Subquery: rata-rata gaji
SELECT AVG(salary) FROM salaries;

-- Query utama:
SELECT emp_no, salary FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries);

# ===========================================================================================

-- Subquery bisa diletakkan setelah SELECT (berperan sebagai kolom)

-- Menampilkan emp_no, salary, dan rata-rata salary

-- subquery: rata-rata salary
SELECT AVG(salary) FROM salaries;

-- main query:
SELECT emp_no, salary, (SELECT AVG(salary) FROM salaries) as Avg_Salary
FROM salaries;

-- Menampilkan selisih santara salary dan rata-rata salary dari tiap baris
SELECT 
    emp_no,
    salary,
    (SELECT AVG(salary) FROM salaries) as avg_Salary,
    salary - (SELECT AVG(salary) FROM salaries) as Selisih
    FROM
    salaries;

# ===========================================================================================

-- Subquery bisa diletakkan setelah FROM (berperan sebagai table sementara)
-- HARUS pakai alias

-- Subquery: biodata karyawan perempuan
SELECT * FROM employees
WHERE gender = 'F';

-- Main query: karyawan perempuan kelahiran 1964
SELECT *
FROM (
    SELECT * from employees
    WHERE gender = 'F'
) as female_emp
WHERE YEAR(birth_date) = 1964;

# ===========================================================================================
-- working with Multiple Tables
-- Bisa menggunakan subquery, join operator, implicit join

# ===========================================================================================
-- Subquery

SHOW TABLES;

-- Menampilkan nama karyawan yang punya title 'Senior Engineer'
SELECT * FROM employees;
SELECT * FROM titles;

-- Subquery: title 'Senior Engginer'
SELECT emp_no FROM titles
WHERE title = 'Senior Engineer';

-- Main query
SELECT * FROM employees
WHERE emp_no in (SELECT emp_no FROM titles
            WHERE title = 'Senior Engineer');

-- Kelemahan: tidak bisa menampilkan kolom title, karena main query-nya dari table employees

# ===========================================================================================
-- Soal: Tampilkan nama karyawan yang gajinya pernah di atas 155000

SELECT * FROM employees;
SELECT * FROM salaries;

-- Subquery: mencari emp_no yang gajinya pernah di atas 155000
SELECT emp_no FROM salaries
WHERE salary >155000
ORDER BY emp_no;

-- Main query
SELECT * FROM employees
WHERE emp_no IN (SELECT emp_no FROM salaries
    WHERE salary > 155000
        ORDER BY emp_no
);

# ==============================================================================
-- JOIN
-- Untuk menggabungkan data dari 2 table atau lebih
-- berdasarkan kolom tertentu yang dimiliki oleh table-table tsb

-- Referencing --> menghubungkan antara beberapa table RDBMS
-- Primary key --> Identitas unique yang dimiliki oleh sebuah table (contoh: emp_no, student_id, no_ktp, dll)
-- Foreign key --> Primary Key yang ditampilkan di table lain
-- Parent Table --> Table yang punya Primary key
-- Dependent Table --> Table yang cuma punya Foreign key

# ==============================================================================
-- INNER JOIN
-- Menampilkan data yang dimiliki oleh kedua table

-- SELECT table_kiri.column1, table_kiri.column2, table_kanan.column3
-- from table_kiri
-- JOIN table_kanan
-- ON table_kiri.key_column = table_kanan.key_column;

SELECT * FROM employees;
SELECT * FROM salaries;

SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees as e
JOIN salaries as s
on e.emp_no = s.emp_no;

# ==============================================================================

-- Menggabungkan 3 tables

SELECT * FROM employees as e
JOIN salaries as s on e.emp_no = s.emp_no
JOIN titles as t on e.emp_no = t.emp_no
LIMIT 100;

# ==============================================================================
-- Soal: Tampilkan nama karyawan yang gajinya pernah di atas 155000 dan tampilkan gajinya

SELECT e.first_name, e.last_name, s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no
WHERE s.salary > 155000;

# ==============================================================================

-- IMPLICITE JOIN
-- Menggabungkan 2 table atau lebih tanpa menggunakan JOIN clause
-- menggunakan WHERE
-- running lebih lambat

-- Menggabungkan table employees dan salaries
SELECT * FROM employees as e, salaries as s
WHERE e.emp_no = s.emp_no;

# ==============================================================================

SELECT e.first_name, e.last_name, s.salary
FROM employees as e, salaries as s
WHERE e.emp_no = s.emp_no AND s.salary >155000;

# ===========================================================================================
# ===========================================================================================
-- Session IIII
# ===========================================================================================
# ===========================================================================================

-- MODUL 2: SESSION 4

# ===========================================================================================
-- COMMON TABLE EXPRESSION (CTE)
-- Sebuah query dalam SQL berupa subquery yang ditulis terpisah sehingga dapat digunakan kembali

-- syntax:
-- WITH name_table_subquery AS (subquery)
-- SELECT * FROM nama_table_di_database

-- Kelebihan:
-- Cara penulisannya lebih rapih
-- Dapat digunakan kembali

-- Kekurangan:
-- Running lebih lambat dari metode lainnya

# ===========================================================================================

USE sakila;

SHOW FULL TABLES;

SELECT * FROM actor;
SELECT * FROM film;

# ===========================================================================================
-- Soal: Tampilkan film dengan rental duration di atas rata-rata rental duration keseluruhan

-- Dengan subquery biasa

-- subquery
SELECT AVG(rental_duration) FROM film;

-- main query
SELECT * FROM film
WHERE rental_duration > (SELECT AVG(rental_duration) FROM film);

# ===========================================================================================
-- Dengan CTE



SELECT * FROM film; 
WITH avg_retal_duration AS
(SELECT avg(rental_duration) FROM film);

SELECT * FROM film
WHERE rental_duration > (SELECT * FROM avg_rental_duration);

# ===========================================================================================
-- Dengan CTE
use sakila;
WITH avg_rental AS
(SELECT avg(rental_duration) as avg_rental_duration FROM film);

SELECT *
FROM film AS f, avg_retal_duration AS a WHERE f.rental_duration > a.rata_rata;

# ===========================================================================================
USE employees;

-- Soal: Tampilkan nama karyawan yang gajinya pernah di atas 155000 dan tampilkan gajinya

# ===========================================================================================

-- Cara 1: join

WITH high_salary AS
(SELECT * FROM salaries
WHERE salary > 155000)

SELECT e.emp_no, e.first_name, e.last_name, h.salary
FROM employees AS e
JOIN high_salary AS h
ON e.emp_no = h.emp_no;

# ===========================================================================================

-- Cara 2: implicite join

WITH high_salary AS
(SELECT * FROM salaries
WHERE salary > 155000)

SELECT * FROM employees, high_salary
WHERE employees.emp_no = high_salary.emp_no;

# ===========================================================================================
-- Cara 3: tampa JOIN

WITH high_salary_emp AS
(SELECT emp_no FROM salaries
WHERE salary > 155000);

SELECT *
FROM employees as e, high_salary_emp AS h
WHERE e.emp_no in (h.emp_no);

# ===========================================================================================
-- WINDOW FUNCTION
-- Dengan window function, kita dapat melakukan agregasi tampa mengurangi jumlah baris
-- Semua value tetap pada row-nya

USE sakila;
SELECT * FROM film;

-- Menampilkan rata-rata rental_duration berdasarkan kategori rating
SELECT rating, AVG(rental_duration) FROM film
GROUP BY rating;

-- Menampilkan rata-rata rental_duration keseluruhan
SELECT avg(rental_duration) FROM film;

# ===========================================================================================
-- OVER PARTITION BY
-- Kegunaanya sama dengan GROUP BY, tapi hasilnya ditampilkan pada tiap baris data

SELECT
    film_id,
    title,
    rating,
    rental_duration,
    AVG(rental_duration) OVER() as avg_rental_all,
    AVG(rental_duration) OVER(PARTITION BY rating) as avg_rental_by_rating
    FROM film
    ;

# ===========================================================================================
SELECT * FROM film;

-- Soal : Tampilkan rata-rata rental_rate untuk tiap kelompok rental_duration,
-- hasilnya ditampilkan pada tiap baris

SELECT
    film_id,
    title,
    rental_duration,
    rental_rate,
    AVG(rental_rate) OVER() as avg_rental_rate_all,
    AVG(rental_rate) OVER(PARTITION BY rental_duration) as avg_rental_rate_by_duration
    FROM film;

# ===========================================================================================
-- ROW_NUMBER
-- Membuat kolom berisi nomor baris

# -----------------------------------------------------------------------

SELECT
    title,
    rating,
    rental_duration,
    ROW_NUMBER() OVER()
    FROM film;

# -----------------------------------------------------------------------

SELECT
    title,
    rating,
    rental_duration,
    ROW_NUMBER() OVER(PARTITION BY rating)
FROM
    film;

# -----------------------------------------------------------------------

SELECT
    title,
    rating,
    rental_duration,
    ROW_NUMBER() OVER(PARTITION BY rating)
    FROM
    film;

# ========================================================================================
-- RANK & DENSE_RANK

-- ROW_NUMBER menghitung baris data dalam angka 1 sampai N dari urutan terkecil.
-- RANK & DENSE_RANK menghitung urutan berdasarkan value yang ingin kita ukur
-- dan bisa dari tertinggi ke terendah.

-- Tampilkan jumlah film berdasarkan kategori rating, urutkan dari yang terbanyak!
SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;

# -----------------------------------------------------------------------
-- RANK: skip urutan sejumlah ranking yang sama

SELECT
    rating,
    COUNT(title),
    RANK() OVER(ORDER BY COUNT(title) DESC)
FROM film
GROUP BY rating;

# -----------------------------------------------------------------------
-- Soal: berikan peringkat film berdasarkan rental duration

SELECT
    title,
    rental_duration,
    RANK() OVER(ORDER BY rental_duration DESC)
FROM film;
# -----------------------------------------------------------------------
-- DENSE_RANK: setelah peringkat 1, kemudian peringkat 2

SELECT
    title,
    rental_duration,
    DENSE_RANK() OVER(ORDER BY rental_duration DESC)
FROM film;

# ========================================================================================
-- NTILE
-- Mengelompokkan data dari terkecil ke terbesar
-- NTILE(4) artinya data akan dibagi menjadi 4 bagian/kelompok yang mana tiap bagian punya jumlah baris yang sama

SELECT
    title,
    rating,
    ROW_NUMBER() OVER(),
    NTILE(4) OVER(),
    NTILE(100) OVER()
FROM film;