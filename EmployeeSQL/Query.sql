--1. List employee number, last name, first name, sex, and salary.
SELECT e.emp_no,e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

--1a. List employee number, last name, first name, sex, and check if no salary is available.
SELECT e.emp_no,e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
RIGHT JOIN salaries AS s ON
e.emp_no=s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name,last_name, hire_date
FROM employees AS e
WHERE hire_date >= '1986-01-01' AND hire_date<= '1986-12-31';

--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no,d.dept_name,m.emp_no,e.last_name,e.first_name
FROM departments AS d
INNER JOIN dept_manager AS m ON
d.dept_no=m.dept_no 
INNER JOIN employees AS e ON
e.emp_no=m.emp_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON
de.dept_no=d.dept_no 
INNER JOIN employees AS e ON
de.emp_no=e.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT first_name,last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT de.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON
de.dept_no=d.dept_no 
INNER JOIN employees AS e ON
de.emp_no=e.emp_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
SELECT de.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON
de.dept_no=d.dept_no 
INNER JOIN employees AS e ON
de.emp_no=e.emp_no
WHERE d.dept_name in ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names
SELECT COUNT(*) AS cnt_emp,last_name 
FROM employees
GROUP BY last_name
ORDER BY cnt_emp  DESC;
