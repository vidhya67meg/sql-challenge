--List the employee number, last name, first name, sex, and salary of each employee
select employees.emp_no, employees.last_name, employees.first_name,
employees.sex, salaries.salary
from employees
inner join salaries on 
employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 
select first_name, last_name, hire_date
from employees
WHERE EXTRACT(YEAR FROM hire_date::date) = 1986;

--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name 
select dept.dept_no, dept.dept_name, employees.emp_no, 
employees.last_name,employees.first_name
from dept
join dept_manager on dept.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no = employees.emp_no;

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name 
select employees.emp_no, employees.last_name, employees.first_name, dept.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join dept on dept_emp.dept_no = dept.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose 
--last name begins with the letter B 
select first_name, last_name, sex
from employees
where lower(first_name) = 'hercules' and lower(last_name) like 'b%';

--List each employee in the Sales department, including their employee number, last name, 
--and first name
select employees.emp_no, employees.last_name, employees.first_name, dept.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join dept on dept_emp.dept_no = dept.dept_no
where dept.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name

select employees.emp_no, employees.last_name, employees.first_name, dept.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join dept on dept_emp.dept_no = dept.dept_no
where dept.dept_name = 'Sales' or dept.dept_name = 'Development'
order by dept.dept_name;

--List the frequency counts, in descending order, of all the employee last names (that is, how many 
--employees share each last name) 
select last_name, count(*) as count
from employees
GROUP BY last_name
order by count desc;
