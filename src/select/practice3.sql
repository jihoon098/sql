-- 문제1
select a.emp_no as '사번', concat(first_name, ' ', last_name) as '이름', salary as '연봉'
from employees a
join salaries b 
on a.emp_no = b.emp_no and to_date like '9999-%'
order by salary desc;


-- 문제2
select a.emp_no as '사번', concat(first_name, ' ', last_name) as '이름', title as '현재 직책'
from employees a, titles b
where to_date like '9999-%' and a.emp_no = b.emp_no
order by concat(first_name, ' ', last_name) desc;


-- 문제3
select a.emp_no as '사번', concat(first_name, ' ', last_name) as '이름', dept_name as '현재 부서'
from employees a, dept_emp b, departments c
where to_date like '9999-%' and a.emp_no = b.emp_no and b.dept_no = c.dept_no
order by concat(first_name, ' ', last_name) desc;


-- 문제4
select a.emp_no as '사번', concat(first_name, ' ', last_name) as '이름', salary as '연봉', title as '현재 직책', dept_name as '현재 부서'
from employees a, salaries b , titles c, dept_emp d, departments e
where c.to_date = '9999-01-01' 
and a.emp_no = b.emp_no 
and a.emp_no = c.emp_no
and a.emp_no = d.emp_no
and d.dept_no = e.dept_no
order by concat(a.first_name, ' ', a.last_name) desc;


-- 문제5
select a.emp_no as '사번', concat(first_name, ' ', last_name) as '이름'
from employees a, titles b
where b.to_date != '9999-01-01'
and a.emp_no = b.emp_no
and b.title = 'Technique Leader';


-- 믄제6
select concat(first_name, ' ', last_name) as '이름', dept_name as '부서명', title as '직책' 
from employees a, titles b, dept_emp c, departments d
where last_name like 'S%'
and a.emp_no = b.emp_no
and a.emp_no = c.emp_no
and c.dept_no = d.dept_no;


-- 문제7
