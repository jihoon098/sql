-- 문제1
select concat(first_name , ' ', last_name) from employees;

-- 문제2
select concat(first_name , ' ', last_name) as 이름, 
	gender as 성별, hire_date as 입사일 from employees order by hire_date asc;
    
-- 문제3
select count(*) as '각 직원수' from employees group by gender;


-- 문제4
select count(emp_no) from salaries where to_date like '9999-%';

-- 문제5
select count(*) from departments;

-- 문제6
select count(emp_no) from dept_manager where to_date like '9999-%';

-- 문제7
select dept_name from departments order by length(dept_name) desc;

-- 문제 8
select count(emp_no) from salaries where salary > 120000;

-- 문제 9
select distinct title from titles order by length(title) desc;

-- 문제 10
select count(emp_no) from titles where title = 'Engineer';

-- 문제 11
select title, from_date from titles where emp_no = '13250' order by from_date asc;
