SELECT * FROM departments, dept_emp, dept_manager,employees, salaries, titles

# 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employee AS emp_no, last_name, first_name, sex
FROM employees

SELECT emp_salary As emp_no, salary
FROM salaries

# 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = '1986'

# 3. List the manager of each department along with their department number, 
# department name, employee number, last name, and first name.
SELECT dept_name, dept_no
FROM departments
WHERE dept_no IN
(
  SELECT dept_no 
  FROM Dept_emp
  WHERE emp_no IN
  (
    SELECT emp_no, last_name, first_name
    FROM employees
    GROUPBY emp_no
  )
)

# 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
    SELECT emp_no
    FROM dept_emp
    WHERE dep_no IN
    (
        SELECT dep_no
        FROM Departments
        WHERE dept_name
        GROUPBY emp_no
    )
)

# 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = "Hercules" && last_name LIKE "%B"

# 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT last_name, first_name
FROM employees
WHERE emp_no IN

  (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN
    (
      SELECT dept_no
      FROM departments
      WHERE dept_name = "Sales"
    )
  )
# 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT last_name, first_name
FROM employees
WHERE emp_no IN 
(
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN
    (
        SELECT dept_name
        FROM departments
        WHERE dept_name = "Sales" AND "Development"
    )
)
# 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count 'Frequency'
FROM employees
WHERE last_name = last_name