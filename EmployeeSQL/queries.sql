/* 
 List the following details of each employee:
 employee number, last name, first name, gender, and salary.
 */
 -- Join
 select e.emp_no as "Employee Number", e.last_name as "Last Name", e.gender as "Gender", b.salary 
 from employees  e
 join salaries  b on e.emp_no = b.emp_no;
 
 -- Other option

 select e.emp_no as "Employee Number", e.last_name as "Last Name", e.gender as "Gender", b.salary 
 from employees  e, salaries  b where e.emp_no = b.emp_no;


 -- List employees who were hired in 1986.
 
 select *
 from employees  e where extract(YEAR FROM hire_date) = 1986 order by hire_date;
 

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select d.dept_no as "Department Number" , d.dept_name as "Department Name",  
       dm.emp_no as "Employee Name", e.last_name as "Last Name", e.first_name "First Name", dm.from_date, dm.to_date
from dept_manager dm
join departments d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no;

-- another option

select d.dept_no as "Department Number" , d.dept_name as "Department Name",  
       dm.emp_no as "Employee Number", e.last_name as "Last Name", e.first_name "First Name", dm.from_date, dm.to_date
from dept_manager dm, departments d, employees e
where dm.dept_no = d.dept_no and dm.emp_no = e.emp_no;



-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no as "Employee Number",e.last_name as "Last Name", e.first_name "First Name",
       d.dept_name as "Department Name" 
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
order by "Department Name" ;



-- List all employees whose first name is "Hercules" and last names begin with "B."
 select e.emp_no as "Employee Number",e.last_name as "Last Name", e.first_name "First Name"
 from employees e
 where e.first_name='Hercules' and e.last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no as "Employee Number",e.last_name as "Last Name", e.first_name "First Name",
       d.dept_name as "Department Name" 
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';




-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no as "Employee Number",e.last_name as "Last Name", e.first_name "First Name",
       d.dept_name as "Department Name" 
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name in ('Sales' ,'Development');

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select e.last_name as "Last Name", count(e.last_name) as "Last Name Count"
from employees e
group by e.last_name
order by "Last Name Count" desc;