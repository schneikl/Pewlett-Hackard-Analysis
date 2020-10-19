SELECT employees.emp_no, 
	employees.first_name, 
	employees.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

DROP TABLE unique_title;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_title
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_title;

DROP TABLE retiring_titles;

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_title
GROUP BY title
ORDER BY count(emp_no) DESC;

SELECT * FROM retiring_titles;

SELECT DISTINCT ON (emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_manager.from_date,
dept_manager.to_date,
titles.title
INTO mentorship_eligibility
FROM employees
LEFT JOIN dept_manager
ON employees.emp_no = dept_manager.emp_no
LEFT JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

Select * FROM mentorship_eligibility;