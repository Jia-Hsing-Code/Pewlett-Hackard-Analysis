-- Deliverable 1 --

SELECT e.emp_no,
e.first_name,
e.last_name,
tit.title,
tit.from_date,
tit.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS tit
ON (e.emp_no = tit.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, 
	first_name, 
    last_name, 
    title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- retrieve the number of employees by their most recent job title  who are about to retire.
SELECT COUNT(title), title 
--INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;


-- Deliverable 2 --
-- query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON (em.emp_no) em.emp_no, 
	em.first_name, 
	em.last_name, 
	em.birth_date, 
	de.from_date, 
	de.to_date, 
	tit.title
INTO mentorship_eligibilty 
FROM employees AS em
LEFT JOIN dept_emp AS de
ON em.emp_no = de.emp_no
LEFT JOIN titles AS tit
ON em.emp_no = tit.emp_no
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY em.emp_no;