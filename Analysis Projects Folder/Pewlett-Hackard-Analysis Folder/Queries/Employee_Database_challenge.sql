Delivery 1: 

SELECT emp_no, first_name, last_name
FROM employees

SELECT title, from_date, to_date
FROM titles

SELECT e.emp_no,
     e.first_name,
	 e.last_name,
	 t.title,
	 t.from_date,
	 t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles

SELECT emp_no, first_name, last_name, title
FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles



Delivery 2: 

SELECT emp_no, first_name, last_name, birth_date
FROM employees

SELECT from_date, to_date
FROM dept_emp

SELECT title
FROM titles


SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e
LEFT OUTER JOIN dept_emp as de
ON e.emp_no = de.emp_no
LEFT OUTER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND (de.to_date BETWEEN '9999-01-01' AND '9999-01-01')
ORDER BY emp_no, from_date DESC;