-- Determine hire date and birth date 
SELECT e.emp_no, 
	   e.birth_date, 
	   e.first_name, 
	   e.last_name, 
	   e.gender, 
	   e.hire_date,
	   ti.title,
	   ti.to_date,
	   ti.from_date
INTO Retirees
FROM employees AS e
	INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY e.emp_no;

SELECT * FROM Retirees;

-- Determine the number of employees retiring
SELECT COUNT(emp_no, birth_date, first_name, last_name, gender, hire_date)
FROM employees as e
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title

INTO titles_unique
FROM retirees
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM titles_unique

SELECT COUNT(title) as title_count,
title
INTO retiring_titles
FROM titles_unique
GROUP BY title
ORDER BY title_count ASC;

SELECT * FROM retiring_titles

