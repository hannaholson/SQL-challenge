--CREATE TABLES

CREATE TABLE "Departments" (
    "dept_no" VARCHAR NOT NULL,
    "dept_name" VARCHAR NOT NULL,
	PRIMARY KEY("dept_no")
);

CREATE TABLE "Titles" (
	"title_id" VARCHAR NOT NULL,
    "title" VARCHAR NOT NULL,
	PRIMARY KEY("title_id")
);

CREATE TABLE "Employees" (
	"emp_no" int NOT NULL,
    "emp_title_id" VARCHAR NOT NULL REFERENCES "Titles" ("title_id"),
    "birth_date" date NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" char NOT NULL,
    "hire_date" date NOT NULL,
	PRIMARY KEY("emp_no")
);

CREATE TABLE "Dept_Employees" (
    "emp_no" int NOT NULL REFERENCES "Employees" ("emp_no"),
    "dept_no" VARCHAR NOT NULL REFERENCES "Departments" ("dept_no"),
	PRIMARY KEY("emp_no", "dept_no")
);

CREATE TABLE "Dept_Managers" (
    "dept_no" VARCHAR NOT NULL REFERENCES "Departments" ("dept_no"),
	"emp_no" int NOT NULL REFERENCES "Employees" ("emp_no"),
	PRIMARY KEY("emp_no", "dept_no")
);

CREATE TABLE "Salaries" (
	"emp_no" int NOT NULL REFERENCES "Employees" ("emp_no"),
	"salary" int NOT NULL,
	PRIMARY KEY("emp_no")
);
