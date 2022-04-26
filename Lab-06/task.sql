Question 1:

MariaDB [p200107_Awais]> select * from HOURS;
+---------+------------+-------------------+-----------+-------------+
| EMP_NUM | ATTRACT_NO | HOURS_PER_ATTRACT | HOUR_RATE | DATE_WORKED |
+---------+------------+-------------------+-----------+-------------+
|     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
+---------+------------+-------------------+-----------+-------------+
11 rows in set (0.000 sec)

MariaDB [p200107_Awais]> SELECT AVG(HOUR_RATE) FROM HOURS;
+----------------+
| AVG(HOUR_RATE) |
+----------------+
|       7.033636 |
+----------------+
1 row in set (0.001 sec)


Question 2:

MariaDB [p200107_Awais]> SELECT * FROM ATTRACTION;
+------------+-----------------+-------------+------------------+-----------+
| ATTRACT_NO | ATTRACT_NAME    | ATTRACT_AGE | ATTRACT_CAPACITY | PARK_CODE |
+------------+-----------------+-------------+------------------+-----------+
|      10034 | ThunderCoaster  |          11 |               34 | FR1001    |
|      10056 | SpinningTeacups |           4 |               62 | FR1001    |
|      10067 | FlightToStars   |          11 |               24 | FR1001    |
|      10078 | Ant-Trap        |          23 |               30 | FR1001    |
|      10082 | NULL            |          10 |               40 | ZA1342    |
|      10098 | Carnival        |           3 |              120 | FR1001    |
|      20056 | 3D-Lego_Show    |           3 |              200 | UK3452    |
|      30011 | BlackHole2      |          12 |               34 | UK3452    |
|      30012 | Pirates         |          10 |               42 | UK3452    |
|      30044 | UnderSeaWord    |           4 |               80 | UK3452    |
|      98764 | GoldRush        |           5 |               80 | ZA1342    |
+------------+-----------------+-------------+------------------+-----------+
11 rows in set (0.001 sec)

MariaDB [p200107_Awais]> SELECT AVG(ATTRACT_AGE) FROM ATTRACTION WHERE PARK_CODE = 'UK3452';
+------------------+
| AVG(ATTRACT_AGE) |
+------------------+
|           7.2500 |
+------------------+
1 row in set (0.001 sec)


Question 3:

MariaDB [p200107_Awais]> SELECT * FROM HOURS;
+---------+------------+-------------------+-----------+-------------+
| EMP_NUM | ATTRACT_NO | HOURS_PER_ATTRACT | HOUR_RATE | DATE_WORKED |
+---------+------------+-------------------+-----------+-------------+
|     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
+---------+------------+-------------------+-----------+-------------+
11 rows in set (0.001 sec)

MariaDB [p200107_Awais]> SELECT EMP_NUM, SUM(HOURS_PER_ATTRACT) AS TOTAL_HOURS FROM HOURS GROUP BY EMP_NUM;
+---------+-------------+
| EMP_NUM | TOTAL_HOURS |
+---------+-------------+
|     100 |          12 |
|     101 |           6 |
|     102 |          12 |
|     104 |          12 |
|     105 |          12 |
+---------+-------------+
5 rows in set (0.001 sec)


Question 4:

MariaDB [p200107_Awais]> SELECT * FROM HOURS;
+---------+------------+-------------------+-----------+-------------+
| EMP_NUM | ATTRACT_NO | HOURS_PER_ATTRACT | HOUR_RATE | DATE_WORKED |
+---------+------------+-------------------+-----------+-------------+
|     100 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     100 |      10034 |                 6 |      6.50 | 2007-05-20  |
|     101 |      10034 |                 6 |      6.50 | 2007-05-18  |
|     102 |      30012 |                 3 |      5.99 | 2007-05-23  |
|     102 |      30044 |                 6 |      5.99 | 2007-05-21  |
|     102 |      30044 |                 3 |      5.99 | 2007-05-22  |
|     104 |      30011 |                 6 |      7.20 | 2007-05-21  |
|     104 |      30012 |                 6 |      7.20 | 2007-05-22  |
|     105 |      10078 |                 3 |      8.50 | 2007-05-18  |
|     105 |      10098 |                 3 |      8.50 | 2007-05-18  |
|     105 |      10098 |                 6 |      8.50 | 2007-05-19  |
+---------+------------+-------------------+-----------+-------------+
11 rows in set (0.001 sec)

MariaDB [p200107_Awais]> SELECT ATTRACT_NO, MIN(HOUR_RATE), MAX(HOUR_RATE) FROM HOURS GROUP BY ATTRACT_NO;
+------------+----------------+----------------+
| ATTRACT_NO | MIN(HOUR_RATE) | MAX(HOUR_RATE) |
+------------+----------------+----------------+
|      10034 |           6.50 |           6.50 |
|      10078 |           8.50 |           8.50 |
|      10098 |           8.50 |           8.50 |
|      30011 |           7.20 |           7.20 |
|      30012 |           5.99 |           7.20 |
|      30044 |           5.99 |           5.99 |
+------------+----------------+----------------+
6 rows in set (0.001 sec)


Question 5:

MariaDB [p200107_Awais]> SELECT EMP_NUM, ATTRACT_NO, AVG(HOURS_PER_ATTRACT) FROM HOURS GROUP BY EMP_NUM, ATTRACT_NO HAVING AVG(HOURS_PER_ATTRACT) >= 5;
+---------+------------+------------------------+
| EMP_NUM | ATTRACT_NO | AVG(HOURS_PER_ATTRACT) |
+---------+------------+------------------------+
|     100 |      10034 |                 6.0000 |
|     101 |      10034 |                 6.0000 |
|     104 |      30011 |                 6.0000 |
|     104 |      30012 |                 6.0000 |
+---------+------------+------------------------+
4 rows in set (0.001 sec)

Question 6:

MariaDB [p200107_Awais]> SELECT COUNT(*) FROM HOURS CROSS JOIN EMPLOYEE;
+----------+
| COUNT(*) |
+----------+
|       77 |
+----------+
1 row in set (0.001 sec)


Question 7:

MariaDB [p200107_Awais]> SELECT EMPLOYEE.EMP_LNAME, EMPLOYEE.EMP_FNAME, ATTRACT_NO, DATE_WORKED FROM EMPLOYEE JOIN HOURS USING(EMP_NUM);
+------------+-----------+------------+-------------+
| EMP_LNAME  | EMP_FNAME | ATTRACT_NO | DATE_WORKED |
+------------+-----------+------------+-------------+
| Calderdale | Emma      |      10034 | 2007-05-18  |
| Calderdale | Emma      |      10034 | 2007-05-20  |
| Ricardo    | Marshel   |      10034 | 2007-05-18  |
| Arshad     | Arif      |      30012 | 2007-05-23  |
| Arshad     | Arif      |      30044 | 2007-05-21  |
| Arshad     | Arif      |      30044 | 2007-05-22  |
| Denver     | Enrica    |      30011 | 2007-05-21  |
| Denver     | Enrica    |      30012 | 2007-05-22  |
| Namowa     | Mirrelle  |      10078 | 2007-05-18  |
| Namowa     | Mirrelle  |      10098 | 2007-05-18  |
| Namowa     | Mirrelle  |      10098 | 2007-05-19  |
+------------+-----------+------------+-------------+
11 rows in set (0.001 sec)


Question 8:

MariaDB [p200107_Awais]> SELECT EMPLOYEE.EMP_LNAME, EMPLOYEE.EMP_FNAME, ATTRACT_NO, ATTRACT_NAME FROM EMPLOYEE JOIN HOURS USING(EMP_NUM) JOIN ATTRACTION USING(ATTRACT_NO);
+------------+-----------+------------+----------------+
| EMP_LNAME  | EMP_FNAME | ATTRACT_NO | ATTRACT_NAME   |
+------------+-----------+------------+----------------+
| Calderdale | Emma      |      10034 | ThunderCoaster |
| Calderdale | Emma      |      10034 | ThunderCoaster |
| Ricardo    | Marshel   |      10034 | ThunderCoaster |
| Arshad     | Arif      |      30012 | Pirates        |
| Arshad     | Arif      |      30044 | UnderSeaWord   |
| Arshad     | Arif      |      30044 | UnderSeaWord   |
| Denver     | Enrica    |      30011 | BlackHole2     |
| Denver     | Enrica    |      30012 | Pirates        |
| Namowa     | Mirrelle  |      10078 | Ant-Trap       |
| Namowa     | Mirrelle  |      10098 | Carnival       |
| Namowa     | Mirrelle  |      10098 | Carnival       |
+------------+-----------+------------+----------------+
11 rows in set (0.001 sec)


Question 9:

MariaDB [p200107_Awais]> SELECT PARK_NAME, SUM(LINE_PRICE) FROM THEMEPARK JOIN SALES  USING(PARK_CODE) JOIN SALES_LINE USING(TRANSACTION_NO) GROUP BY PARK_COUNTRY HAVING PARK_COUNTRY = 'UK' OR PARK_COUNTRY = 'FR';
+--------------+-----------------+
| PARK_NAME    | SUM(LINE_PRICE) |
+--------------+-----------------+
| FairyLand    |          401.86 |
| PleasureLand |          851.00 |
+--------------+-----------------+
2 rows in set (0.001 sec)

Question 10:    

MariaDB [p200107_Awais]> SELECT SALE_DATE , LINE_QTY , LINE_PRICE FROM SALES_LINE JOIN SALES USING(TRANSACTION_NO) WHERE SALE_DATE = '2007-05-18';
+------------+----------+------------+
| SALE_DATE  | LINE_QTY | LINE_PRICE |
+------------+----------+------------+
| 2007-05-18 |        2 |      69.98 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        2 |      69.98 |
| 2007-05-18 |        2 |      41.98 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        1 |      34.99 |
| 2007-05-18 |        4 |     139.96 |
| 2007-05-18 |        4 |     168.40 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        4 |     168.40 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
| 2007-05-18 |        1 |      18.56 |
| 2007-05-18 |        1 |      12.12 |
| 2007-05-18 |        4 |     114.68 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
+------------+----------+------------+
31 rows in set (0.001 sec)
