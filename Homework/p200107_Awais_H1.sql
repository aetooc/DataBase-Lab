-- -- CREATE DATABASE ORGANISATION;
-- -- use ORGANISATION;

-- CREATE TABLE employees(
--     emp_no INT NOT NULL PRIMARY KEY,
--     birth_date DATE NOT NULL,
--     first_name VARCHAR(14) NOT NULL,
--     last_name VARCHAR(15) NOT NULL,
--     sex ENUM('M','F'),
--     hire_date DATE NOT NULL
-- );

-- CREATE TABLE departments(
--     dept_no CHAR(4) NOT NULL PRIMARY KEY,
--     dept_name VARCHAR(40) NOT NULL
-- );

-- CREATE TABLE dept_manager(
--     dept_no CHAR(4),
--     emp_no INT,
--     from_date DATE,
--     to_date DATE,
--     CONSTRAINT PK_dept_manager PRIMARY KEY (dept_no,emp_no),
--     CONSTRAINT FK_dept_manager_employees FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
--     CONSTRAINT FK_dept_manager_departments FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
-- );

-- CREATE TABLE dept_emp(
--     emp_no INT,
--     dept_no CHAR(4),
--     from_date DATE NOT NULL,
--     to_date DATE,
--     CONSTRAINT PK_dept_emp PRIMARY KEY (emp_no,dept_no),
--     CONSTRAINT FK_dept_emp_employees FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
--     CONSTRAINT FK_dept_emp_departments FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

-- );

-- CREATE TABLE titles(
--     emp_no INT,
--     title VARCHAR(50) NOT NULL,
--     from_date DATE NOT NULL,
--     to_date DATE,
--     CONSTRAINT PK_titles PRIMARY KEY (emp_no, title),
--     CONSTRAINT FK_title_employees FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

-- );

-- CREATE TABLE salaries(
--     emp_no INT,
--     salary INT NOT NULL,
--     from_date DATE NOT NULL,
--     to_date DATE,
--     CONSTRAINT PK_salaries PRIMARY KEY (emp_no, to_date, from_date),
--     CONSTRAINT FK_salaries_employees FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
-- );


create table employee(
    SEX ENUM('M', 'F')
);
