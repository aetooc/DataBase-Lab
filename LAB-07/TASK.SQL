QUESTION NO 1:

SELECT EMP_FNAME, EMP_LNAME FROM EMPLOYEE JOIN HOURS WHERE EMPLOYEE.HOUR_RATE > (SELECT AVG(HOUR_RATE) FROM HOURS);
+-----------+-----------+
| EMP_FNAME | EMP_LNAME |
+-----------+-----------+
| Enrica    | Denver    |
| Mirrelle  | Namowa    |
+-----------+-----------+
2 rows in set (0.001 sec)


QUESTION NO 2:

MariaDB [p200107_Awais]> SELECT EMP_FNAME, EMP_LNAME, HOURS.DATE_WORKED,(SELECT AVG(HOURS_PER_ATTRACT) FROM HOURS) AS AVERAGE, HOURS_PER_ATTRACT - ( SELECT AVG(HOURS_PER_ATTRACT) FROM HOURS) AS DIFFERENCE  FROM EMPLOYEE JOIN HOURS USING(EMP_NUM)  ;
+-----------+------------+-------------+---------+------------+
| EMP_FNAME | EMP_LNAME  | DATE_WORKED | AVERAGE | DIFFERENCE |
+-----------+------------+-------------+---------+------------+
| Emma      | Calderdale | 2007-05-18  |  4.9091 |     1.0909 |
| Emma      | Calderdale | 2007-05-20  |  4.9091 |     1.0909 |
| Marshel   | Ricardo    | 2007-05-18  |  4.9091 |     1.0909 |
| Arif      | Arshad     | 2007-05-23  |  4.9091 |    -1.9091 |
| Arif      | Arshad     | 2007-05-21  |  4.9091 |     1.0909 |
| Arif      | Arshad     | 2007-05-22  |  4.9091 |    -1.9091 |
| Enrica    | Denver     | 2007-05-21  |  4.9091 |     1.0909 |
| Enrica    | Denver     | 2007-05-22  |  4.9091 |     1.0909 |
| Mirrelle  | Namowa     | 2007-05-18  |  4.9091 |    -1.9091 |
| Mirrelle  | Namowa     | 2007-05-18  |  4.9091 |    -1.9091 |
| Mirrelle  | Namowa     | 2007-05-19  |  4.9091 |     1.0909 |
+-----------+------------+-------------+---------+------------+
11 rows in set (0.001 sec)

QUESTION 3:

MariaDB [p200107_Awais]> SELECT ATTRACT_CAPACITY FROM ATTRACTION WHERE ATTRACTION.ATTRACT_CAPACITY <= (SELECT AVG(ATTRACT_CAPACITY) FROM ATTRACTION) ;
+------------------+
| ATTRACT_CAPACITY |
+------------------+
|               34 |
|               62 |
|               24 |
|               30 |
|               40 |
|               34 |
|               42 |
+------------------+
7 rows in set (0.001 sec)




