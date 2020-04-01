CREATE TABLE "departments" (
  "dept_no" varchar(4) PRIMARY KEY,
  "dept_name" varchar(20)
);

CREATE TABLE "employees" (
  "emp_no" int PRIMARY KEY,
  "birth_date" date,
  "first_name" varchar(20),
  "last_name" varchar(20),
  "gender" varchar(1),
  "hire_date" date
);

CREATE TABLE "dept_emp" (
  "emp_no" int,
  "dept_no" varchar(4),
  "from_date" date,
  "to_date" date
);

CREATE TABLE "dept_manager" (
  "dept_no" varchar(4),
  "emp_no" int,
  "from_date" date,
  "to_date" date
);

CREATE TABLE "salaries" (
  "emp_no" int,
  "salary" int,
  "from_date" date,
  "to_date" date
);

CREATE TABLE "titles" (
  "emp_no" int,
  "title" varchar(20),
  "from_date" date,
  "to_date" date
);

ALTER TABLE "dept_emp" ADD FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no");
