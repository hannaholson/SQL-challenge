--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Employees"."sex", "Salaries"."salary" FROM "Employees"
JOIN "Salaries" ON "Salaries"."emp_no" = "Employees"."emp_no"

--List first name, last name, and hire date for employees who were hired in 1986.
-- SELECT EXTRACT(YEAR FROM "hire_date") 
-- FROM "Employees";
SELECT "first_name", "last_name", "hire_date" 
FROM "Employees"
WHERE EXTRACT(YEAR FROM "hire_date") = 1986

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT "Dept_Managers"."dept_no", "Dept_Managers"."emp_no", "Departments"."dept_name", "Employees"."last_name", "Employees"."first_name"
FROM "Dept_Managers"
LEFT JOIN "Departments" ON "Departments"."dept_no" = "Dept_Managers"."dept_no"
JOIN "Employees" ON "Employees"."emp_no" = "Dept_Managers"."emp_no"

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_Employees" ON "Dept_Employees"."emp_no" = "Employees"."emp_no"
LEFT JOIN "Departments" ON "Departments"."dept_no" = "Dept_Employees"."dept_no"
UNION 
SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_Managers" ON "Dept_Managers"."emp_no" = "Employees"."emp_no"
LEFT JOIN "Departments" ON "Departments"."dept_no" = "Dept_Managers"."dept_no"

--List first name, last name, and sex for employees whose first name 
--is "Hercules" and last names begin with "B."

SELECT "first_name", "last_name", "sex"
FROM "Employees"
WHERE "Employees"."first_name" LIKE 'Hercules'
AND "Employees"."last_name" LIKE 'B%'

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_Employees" ON "Dept_Employees"."emp_no" = "Employees"."emp_no"
LEFT JOIN "Departments" ON "Departments"."dept_no" = "Dept_Employees"."dept_no"
WHERE "Departments"."dept_name" LIKE 'Sales'
UNION 
SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_Managers" ON "Dept_Managers"."emp_no" = "Employees"."emp_no"
LEFT JOIN "Departments" ON "Departments"."dept_no" = "Dept_Managers"."dept_no"
WHERE "Departments"."dept_name" LIKE 'Sales'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_Employees" ON "Dept_Employees"."emp_no" = "Employees"."emp_no"
LEFT JOIN "Departments" ON "Departments"."dept_no" = "Dept_Employees"."dept_no"
WHERE ("Departments"."dept_name" LIKE 'Sales') OR ("Departments"."dept_name" LIKE 'Development')
UNION 
SELECT "Employees"."emp_no", "Employees"."last_name", "Employees"."first_name", "Departments"."dept_name"
FROM "Employees"
JOIN "Dept_Managers" ON "Dept_Managers"."emp_no" = "Employees"."emp_no"
LEFT JOIN "Departments" ON "Departments"."dept_no" = "Dept_Managers"."dept_no"
WHERE ("Departments"."dept_name" LIKE 'Sales') OR ("Departments"."dept_name" LIKE 'Development')

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.SELECT COUNT("Employees"."last_name"), "Employees"."last_name"
FROM "Employees"
GROUP BY "Employees"."last_name"
ORDER BY COUNT("Employees"."last_name") DESC