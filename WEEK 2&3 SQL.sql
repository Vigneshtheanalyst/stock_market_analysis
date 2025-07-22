CREATE DATABASE stock_market;

USE stock_market;

CREATE TABLE company_table(
company_id INT PRIMARY KEY,
company_name VARCHAR(100),
ticket VARCHAR(100),
sector VARCHAR(100),
location VARCHAR(100)
);

CREATE TABLE stock_table(
stock_date DATE,
company_id INT,
open_price FLOAT(50),
high_price FLOAT(50),
low_price FLOAT(50),
close_price FLOAT(50),
adj_close_price FLOAT(50),
volume FLOAT(50),
FOREIGN KEY(company_id) REFERENCES company_table(company_id)
);


INSERT INTO company_table(company_id,company_name,ticket,sector,location) 
VALUES(101,"International Business Machines Corp","IBM","Information Technology","USA"),
(102,"Intel Corporation","INTC","Semiconductors","USA"),
(103,"Sony Group Corporation","SONY","Consumer Electronics","Japan"),
(104,"Verizon Communications Inc","VZ","Telecommunications","USA"),
(105,"Microsoft Corporation","MSFT","Information Technology","USA"),
(106,"Dell Technologies Inc","DELL","Information Technology","USA");


SELECT *
FROM company_table;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/stock_table.csv'
INTO TABLE stock_table
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(stock_date,Company_ID,open_price,high_price,low_price,close_price,adj_close_price,volume);


SELECT *
FROM stock_table;


SELECT c.company_name,COUNT(DISTINCT s.stock_date) AS total_trading_days
FROM stock_table s
JOIN company_table c ON s.company_id = c.company_id
GROUP BY c.company_id;


SELECT c.company_name,SUM(s.volume) AS total_volume
FROM stock_table s
JOIN company_table c ON s.company_id = c.company_id
GROUP BY c.company_id;


SELECT c.company_name,ROUND(AVG(s.close_price),2) AS avg_close
FROM stock_table s
JOIN company_table c ON s.company_id = c.company_id
GROUP BY c.company_id;


SELECT *,ROUND(((close_price-open_price)/open_price)*100,2) AS daily_changes
FROM stock_table;


SELECT *,
CASE 
WHEN close_price>open_price THEN "gain"
WHEN close_price<open_price THEN "loss"
ELSE "no changes"
END AS day_status
FROM stock_table;


SELECT c.company_name,MAX(s.high_price) AS highest_price
FROM stock_table s
JOIN company_table c ON s.company_id = c.company_id
GROUP BY c.company_id;


SELECT c.company_name,ROUND(AVG(s.close_price),2) AS avg_close,RANK() OVER (ORDER BY AVG(s.close_price) DESC) AS ranking_position
FROM stock_table s
JOIN company_table c ON s.company_id = c.company_id
GROUP BY c.company_id;

SELECT company_id,stock_date,close_price,ROUND(AVG(close_price) OVER (PARTITION BY company_id ORDER BY stock_date
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ),2) AS ma_7_day
FROM stock_table ;


SELECT c.company_name,s.stock_date,s.close_price
FROM stock_table s
JOIN company_table c ON s.company_id = c.company_id
ORDER BY s.close_price DESC
LIMIT 5;
