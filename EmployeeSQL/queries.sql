--1.)List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no as "employee number", e.last_name as "last name", e.first_name as "first name", e.sex, s.salary
from employees AS e
INNER JOIN salaries AS s on 
e.emp_no=s.emp_no;

--2.)List first name, last name, and hire date for employees who were hired in 1986.
select first_name as "first name", last_name as "last name", hire_date as "hire date"
from employees
where extract(year from hire_date) = 1986;


--3.)List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select departments.dept_no as "department number", departments.dept_name as "department name", dept_manager.emp_no as "employee number", 
employees.last_name as "last name", employees.first_name as "first name"
from departments
JOIN dept_manager ON departments.dept_no=dept_manager.dept_no
JOIN employees ON dept_manager.emp_no=employees.emp_no;


--4.)List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no as "employee number",employees.last_name as "last name", employees.first_name, departments.dept_name as "department name"
from employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no;
--* employees can be in more than one department



--5.)List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name as "first name", last_name as "last name", sex
from employees
where first_name = 'Hercules'AND last_name like 'B%';



--6.)List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no as "employee number",employees.last_name as "last name", employees.first_name, departments.dept_name as "department name"
from employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
Where dept_name ='Sales';



--7.)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no as "employee number",employees.last_name as "last name", employees.first_name, departments.dept_name as "department name"
from employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
Where dept_name ='Sales' OR dept_name='Development';



--8.)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name as "last name", COUNT (last_name) as "frequency count"
FROM employees
group by last_name Order By "frequency count" DESC;




