SELECT emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date,
FROM Employees
WHERE birth_date BETWEEN '1952-0101' AND '1955-12-31';
	