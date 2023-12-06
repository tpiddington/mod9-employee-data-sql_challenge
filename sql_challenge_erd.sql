CREATE TABLE Dept_emp (
    emp_no INTEGER   NOT NULL,
    dep_no VARCHAR   NOT NULL,
    PRIMARY KEY (emp_no)
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR  NOT NULL,
    birth_date VARCHAR NOT NULL,
    First_Name VARCHAR   NOT NULL,
    Last_Name VARCHAR   NOT NULL,
    Sex VARCHAR NOT NULL,
    Hire_date VARCHAR NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES dept_emp, employees, salaries (emp_no);
);

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    PRIMARY KEY (dept_no)
    PRIMARY KEY(dept_name);
);

CREATE TABLE Salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no)