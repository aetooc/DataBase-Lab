QUESTION 1:

MariaDB [company]> select empno, ename, MAX(salary) from emp;
+-------+-------+-------------+
| empno | ename | MAX(salary) |
+-------+-------+-------------+
|  7369 | Smith |        6500 |
+-------+-------+-------------+

QUESTION 2:

MariaDB [company]> select * from emp where deptno = 30;
+-------+--------+----------+------+------------+--------+------------+--------+
| empno | ename  | job      | mgr  | hiredate   | salary | commission | deptno |
+-------+--------+----------+------+------------+--------+------------+--------+
|  7499 | Allen  | Salesman | 7566 | 2021-07-31 |   2000 |        500 |     30 |
|  7521 | Ward   | Salesman | 7698 | 2021-07-31 |   1650 |        800 |     30 |
|  7654 | Martin | Salesman | 7698 | 2021-07-31 |   1650 |       1400 |     30 |
|  7698 | Blake  | Manager  | 7839 | 2021-07-31 |   3250 |       NULL |     30 |
|  7844 | Turner | Salesman | 7698 | 2021-07-31 |   1900 |          0 |     30 |
|  7900 | James  | Clerk    | 7698 | 2021-07-31 |   1350 |       NULL |     30 |
+-------+--------+----------+------+------------+--------+------------+--------+
6 rows in set (0.001 sec)

MariaDB [company]> select * from emp natural join dept where dname = 'Sales';
+--------+-------+--------+----------+------+------------+--------+------------+-------+----------+
| deptno | empno | ename  | job      | mgr  | hiredate   | salary | commission | dname | location |
+--------+-------+--------+----------+------+------------+--------+------------+-------+----------+
|     30 |  7499 | Allen  | Salesman | 7566 | 2021-07-31 |   2000 |        500 | Sales | Chicago  |
|     30 |  7521 | Ward   | Salesman | 7698 | 2021-07-31 |   1650 |        800 | Sales | Chicago  |
|     30 |  7654 | Martin | Salesman | 7698 | 2021-07-31 |   1650 |       1400 | Sales | Chicago  |
|     30 |  7698 | Blake  | Manager  | 7839 | 2021-07-31 |   3250 |       NULL | Sales | Chicago  |
|     30 |  7844 | Turner | Salesman | 7698 | 2021-07-31 |   1900 |          0 | Sales | Chicago  |
|     30 |  7900 | James  | Clerk    | 7698 | 2021-07-31 |   1350 |       NULL | Sales | Chicago  |
+--------+-------+--------+----------+------+------------+--------+------------+-------+----------+


QUESTION 3:

MariaDB [company]> select * from emp natural join dept where location = 'New York';
+--------+-------+--------+-----------+------+------------+--------+------------+------------+----------+
| deptno | empno | ename  | job       | mgr  | hiredate   | salary | commission | dname      | location |
+--------+-------+--------+-----------+------+------------+--------+------------+------------+----------+
|     10 |  7782 | Clark  | Manager   | 7839 | 2021-07-31 |   2850 |       NULL | Accounting | New York |
|     10 |  7839 | King   | President | NULL | 2021-07-31 |   6500 |       NULL | Accounting | New York |
|     10 |  7934 | Miller | Clerk     | 7782 | 2021-07-31 |   1700 |       NULL | Accounting | New York |
+--------+-------+--------+-----------+------+------------+--------+------------+------------+----------+


QUESTION 4:

MariaDB [company]> select count(*) from emp where deptno = 30;
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.001 sec)

MariaDB [company]> select count(*) from emp natural join dept where dname = 'Sales';
+----------+
| count(*) |
+----------+
|        6 |
+----------+
1 row in set (0.001 sec)

QUESTION 5:

MariaDB [company]> select * from emp where salary > (select Max(salary) from emp where deptno = 30); 
+-------+-------+-----------+------+------------+--------+------------+--------+
| empno | ename | job       | mgr  | hiredate   | salary | commission | deptno |
+-------+-------+-----------+------+------------+--------+------------+--------+
|  7566 | Jones | Manager   | 7839 | 2021-07-31 |   3375 |       NULL |     20 |
|  7788 | Scott | Analyst   | 7566 | 2021-07-31 |   3500 |       NULL |     20 |
|  7839 | King  | President | NULL | 2021-07-31 |   6500 |       NULL |     10 |
|  7902 | Ford  | Analyst   | 7566 | 2021-07-31 |   3500 |       NULL |     20 |
+-------+-------+-----------+------+------------+--------+------------+--------+
4 rows in set (0.001 sec)


QUESTION 6:

MariaDB [company]> select * from emp where salary > (select MIN(salary) from emp where deptno = 30); 
+-------+--------+-----------+------+------------+--------+------------+--------+
| empno | ename  | job       | mgr  | hiredate   | salary | commission | deptno |
+-------+--------+-----------+------+------------+--------+------------+--------+
|  7499 | Allen  | Salesman  | 7566 | 2021-07-31 |   2000 |        500 |     30 |
|  7521 | Ward   | Salesman  | 7698 | 2021-07-31 |   1650 |        800 |     30 |
|  7566 | Jones  | Manager   | 7839 | 2021-07-31 |   3375 |       NULL |     20 |
|  7654 | Martin | Salesman  | 7698 | 2021-07-31 |   1650 |       1400 |     30 |
|  7698 | Blake  | Manager   | 7839 | 2021-07-31 |   3250 |       NULL |     30 |
|  7782 | Clark  | Manager   | 7839 | 2021-07-31 |   2850 |       NULL |     10 |
|  7788 | Scott  | Analyst   | 7566 | 2021-07-31 |   3500 |       NULL |     20 |
|  7813 | David  | Clerk     | 7788 | 2021-07-31 |   1500 |       NULL |     20 |
|  7839 | King   | President | NULL | 2021-07-31 |   6500 |       NULL |     10 |
|  7844 | Turner | Salesman  | 7698 | 2021-07-31 |   1900 |          0 |     30 |
|  7876 | Adams  | Clerk     | 7788 | 2021-07-31 |   1500 |       NULL |     20 |
|  7902 | Ford   | Analyst   | 7566 | 2021-07-31 |   3500 |       NULL |     20 |
|  7934 | Miller | Clerk     | 7782 | 2021-07-31 |   1700 |       NULL |     10 |
+-------+--------+-----------+------+------------+--------+------------+--------+

