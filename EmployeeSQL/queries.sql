/* 
 List the following details of each employee:
 employee number, last name, first name, gender, and salary.
 */
 -- Join
 select a.emp_no as "Employee Number", a.last_name as "Last Name", a.gender as "Gender", b.salary 
 from employees  a
 join salaries  b on a.emp_no = b.emp_no;
 
 select a.emp_no as "Employee Number", a.last_name as "Last Name", a.gender as "Gender", b.salary 
 from employees  a, salaries  b where a.emp_no = b.emp_no;


 -- List employees who were hired in 1986.
 
 select *
 from employees  a where extract(YEAR FROM hire_date) = 1986 order by hire_date
 