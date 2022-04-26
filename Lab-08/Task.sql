QUESTION 1:

MariaDB [p200107_Awais]> select * from EMPFR;
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME  | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+


UPDATE EMPFR SET EMP_PHONE = '324-9652' WHERE EMP_NUM = 100;

MariaDB [p200107_Awais]> select * from EMPFR;
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME  | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9652  | FR1001    |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
3 rows in set (0.001 sec)

MariaDB [p200107_Awais]> DROP VIEW EMPFR;
Query OK, 0 rows affected (0.000 sec)


QUESTION 2:

CREATE VIEW EMP_DETAILS AS SELECT EMP_NUM, PARK_CODE, PARK_NAME, EMP_LNAME,EMP_FNAME, EMP_HIRE_DATE, EMP_DOB FROM EMPLOYEE JOIN THEMEPARK USING(PARK_CODE);
Query OK, 0 rows affected (0.012 sec)

MariaDB [p200107_Awais]> DESCRIBE EMP_DETAILS;
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| EMP_NUM       | decimal(4,0) | NO   |     | NULL    |       |
| PARK_CODE     | varchar(10)  | YES  |     | NULL    |       |
| PARK_NAME     | varchar(35)  | NO   |     | NULL    |       |
| EMP_LNAME     | varchar(15)  | NO   |     | NULL    |       |
| EMP_FNAME     | varchar(15)  | NO   |     | NULL    |       |
| EMP_HIRE_DATE | date         | YES  |     | NULL    |       |
| EMP_DOB       | date         | NO   |     | NULL    |       |
+---------------+--------------+------+-----+---------+-------+
7 rows in set (0.003 sec)

MariaDB [p200107_Awais]> SELECT * FROM EMP_DETAILS;
+---------+-----------+--------------+------------+-----------+---------------+------------+
| EMP_NUM | PARK_CODE | PARK_NAME    | EMP_LNAME  | EMP_FNAME | EMP_HIRE_DATE | EMP_DOB    |
+---------+-----------+--------------+------------+-----------+---------------+------------+
|     100 | FR1001    | FairyLand    | Calderdale | Emma      | 1992-03-15    | 1972-06-15 |
|     101 | UK3452    | PleasureLand | Ricardo    | Marshel   | 1996-04-25    | 1978-03-19 |
|     102 | FR1001    | FairyLand    | Arshad     | Arif      | 1990-12-20    | 1969-11-14 |
|     103 | UK3452    | PleasureLand | Roberts    | Anne      | 1994-08-16    | 1974-10-16 |
|     104 | ZA1342    | GoldTown     | Denver     | Enrica    | 2001-10-20    | 1980-11-08 |
|     105 | FR1001    | FairyLand    | Namowa     | Mirrelle  | 2006-11-08    | 1990-03-14 |
|     106 | ZA1342    | GoldTown     | Smith      | Gemma     | 1989-01-05    | 1968-02-12 |
+---------+-----------+--------------+------------+-----------+---------------+------------+


QUESTION 3:
MariaDB [p200107_Awais]> SELECT EMP_FNAME, EMP_LNAME, PARK_NAME FROM EMP_DETAILS;
+-----------+------------+--------------+
| EMP_FNAME | EMP_LNAME  | PARK_NAME    |
+-----------+------------+--------------+
| Emma      | Calderdale | FairyLand    |
| Marshel   | Ricardo    | PleasureLand |
| Arif      | Arshad     | FairyLand    |
| Anne      | Roberts    | PleasureLand |
| Enrica    | Denver     | GoldTown     |
| Mirrelle  | Namowa     | FairyLand    |
| Gemma     | Smith      | GoldTown     |
+-----------+------------+--------------+
7 rows in set (0.001 sec)

QUESTION 4:

CREATE VIEW TICKET_SALES AS  SELECT TH.PARK_NAME, MIN(SL.LINE_PRICE) , MAX(SL.LINE_PRICE) , AVG(SL.LINE_PRICE)  FROM SALES S JOIN THEMEPARK TH ON TH.PARK_CODE=S.PARK_CODE JOIN SALES_LINE SL ON SL.TRANSACTION_NO=S.TRANSACTION_NO  GROUP BY PARK_NAME;
Query OK, 0 rows affected (0.002 sec)

MariaDB [p200107_Awais]> SELECT * FROM TICKET_SALES;
+--------------+--------------------+--------------------+--------------------+
| PARK_NAME    | MIN(SL.LINE_PRICE) | MAX(SL.LINE_PRICE) | AVG(SL.LINE_PRICE) |
+--------------+--------------------+--------------------+--------------------+
| FairyLand    |              14.99 |             139.96 |          50.232500 |
| GoldTown     |              12.12 |             114.68 |          47.637778 |
| PleasureLand |              21.98 |             168.40 |          60.785714 |
+--------------+--------------------+--------------------+--------------------+
3 rows in set (0.002 sec)


QUESTION 5:

SELECT DISTINCT(DATE_FORMAT(SALE_DATE, '%a-%d-%c-%y')) FROM SALES;
+-----------------------------------------+
| (DATE_FORMAT(SALE_DATE, '%a-%d-%c-%y')) |
+-----------------------------------------+
| Fri-18-5-07                             |
+-----------------------------------------+
1 row in set (0.001 sec)

QUESTION 6:

SELECT EMP_FNAME, EMP_LNAME, CONCAT(DATE_FORMAT(EMP_DOB, '%m'), '01', UPPER(SUBSTR( EMP_LNAME, 1,6))) AS USER_ID FROM EMPLOYEE;

+-----------+------------+------------+
| EMP_FNAME | EMP_LNAME  | USER_ID    |
+-----------+------------+------------+
| Emma      | Calderdale | 0601CALDER |
| Marshel   | Ricardo    | 0301RICARD |
| Arif      | Arshad     | 1101ARSHAD |
| Anne      | Roberts    | 1001ROBERT |
| Enrica    | Denver     | 1101DENVER |
| Mirrelle  | Namowa     | 0301NAMOWA |
| Gemma     | Smith      | 0201SMITH  |
+-----------+------------+------------+
7 rows in set (0.001 sec)

QUESTION 7:

MariaDB [p200107_Awais]> SELECT EMP_FNAME, EMP_LNAME, EMP_DOB FROM EMPLOYEE WHERE DAYOFMONTH(EMP_DOB) = '14';
+-----------+-----------+------------+
| EMP_FNAME | EMP_LNAME | EMP_DOB    |
+-----------+-----------+------------+
| Arif      | Arshad    | 1969-11-14 |
| Mirrelle  | Namowa    | 1990-03-14 |
+-----------+-----------+------------+

QUESTION 8:

SELECT EMP_FNAME, EMP_PHONE, CONCAT(SUBSTR(EMP_PHONE, 1, 3), LOWER(SUBSTR( EMP_FNAME, 1,2))) AS USER_PASSWORD FROM EMPLOYEE;

+-----------+-----------+---------------+
| EMP_FNAME | EMP_PHONE | USER_PASSWORD |
+-----------+-----------+---------------+
| Emma      | 324-9652  | 324em         |
| Marshel   | 324-4472  | 324ma         |
| Arif      | 675-8993  | 675ar         |
| Anne      | 898-3456  | 898an         |
| Enrica    | 504-4434  | 504en         |
| Mirrelle  | 890-3243  | 890mi         |
| Gemma     | 324-7845  | 324ge         |
+-----------+-----------+---------------+
7 rows in set (0.001 sec)
