-- 문제1
select count(a.emp_no) as '평균 연봉보다 많은 월급은 받는 직원의 수'
from salaries a
where a.to_date = '9999-01-01'
and a.salary > (select avg(salary) from salaries where to_date = '9999-01-01');


-- 왜 안됨?
-- select count(b.emp_no) 
-- from salaries a , employees b
-- where a.to_date = '9999-01-01'
-- group by a.emp_no
-- having a.salary > avg(a.salary);


-- 문제2
select dept_name as '부서', a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름',  b.salary as '부서연봉'
from employees a, salaries b, (select b.emp_no, c.dept_name, max(a.salary)
								from salaries a, dept_emp b, departments c
								where a.emp_no = b.emp_no
								and b.dept_no = c.dept_no
								and a.to_date = '9999-01-01'
								and b.to_date = '9999-01-01'
								group by c.dept_name) c
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and b.to_date = '9999-01-01'
order by salary desc;


-- 문제3  ->> 서브쿼리의 컬럼이름이 집계함수일 경우 본체쿼리에서 사용하기때문에, 이름을 바꿔주고 사용하니까 됨...꼭이래야함? 다른사람은 어떻게 했을까 확인 ㄱㄱ 
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름', b.salary as '연봉'
from employees a, salaries b, (select a.emp_no, c.dept_name, avg(a.salary) as 'salary'
								from salaries a, dept_emp b, departments c
								where a.emp_no = b.emp_no
								and b.dept_no = c.dept_no
								and a.to_date = '9999-01-01'
								and b.to_date = '9999-01-01'
								group by c.dept_name) c
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and b.to_date = '9999-01-01'
and b.salary > c.salary;


-- 문제4
select a.emp_no as '사번',  concat(a.first_name, ' ', a.last_name) as '이름', d.managerName as '매니저 이름', d.dept_name as '부서 이름'
from employees a, dept_emp b, departments c, (select b.emp_no, concat(a.first_name, ' ', a.last_name) as 'managerName', c.dept_name
												from employees a, dept_manager b, departments c
												where a.emp_no = b.emp_no
												and b.dept_no = c.dept_no
												and b.to_date = '9999-01-01') d
where a.emp_no = b.emp_no
and b.dept_no = c.dept_no
and c.dept_name = d.dept_name
and b.to_date = '9999-01-01';


-- 문제5 
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '사원 이름', b.title as '직책', c.salary as '연봉' 
from employees a, titles b, salaries c, dept_emp d, (select a.dept_no
														from (select a.dept_no, avg(c.salary) as 'AVGSalary'
																from departments a, dept_emp b, salaries c
																where a.dept_no = b.dept_no
																and b.emp_no = c.emp_no
																group by a.dept_name) a
														group by a.dept_no
														having max(a.AVGSalary) 
														order by a.dept_no desc
														limit 1) e
where a.emp_no = b.emp_no
and b.emp_no = c.emp_no
and c.emp_no = d.emp_no
and d.dept_no = e.dept_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
group by a.emp_no
order by c.salary desc;





-- 문제6  부서별 평균연봉을 구하고 비교
select a.dept_name as '평균 연봉이 가장 높은 부서'
from (select a.dept_name , avg(c.salary) as 'AVGSalary'
		from departments a, dept_emp b, salaries c
		where a.dept_no = b.dept_no
		and b.emp_no = c.emp_no
		group by a.dept_name) a
group by a.dept_name
having max(a.AVGSalary) 
order by a.dept_name desc
limit 1;



-- 문제7 1)직책별로 평균연봉을 구하고 2) 비교
select a.title as '평균 연봉이 가장 높은 직책'
from (select a.emp_no , a.title, avg(b.salary) as 'AVGSalary'
		from titles a, salaries b
		where a.emp_no = b.emp_no
		and b.to_date = '9999-01-01'
		and a.to_date = '9999-01-01'
		group by a.title) a
group by a.title
having max(a.AVGSalary)
order by a.AVGSalary desc
limit 1;


-- 문제8 1) 현재 각 직원의 매니저의 정보구하기 2) 비교 3) 높은 연봉받는 직원 내용 select
select d.dept_name as '부서이름', concat(a.first_name, ' ', a.last_name) as '사원 이름', b.salary as '연봉',
 e.managerName as '매니저 이름', e.salary as '매니저 연봉'
from employees a, salaries b, dept_emp c, departments d, (select b.dept_no , concat(c.first_name, ' ', c.last_name) as 'managerName', d.salary
												from departments a, dept_manager b, employees c, salaries d
												where a.dept_no = b.dept_no
												and b.emp_no = c.emp_no
												and c.emp_no = d.emp_no
												and b.to_date = '9999-01-01'
												and d.to_date = '9999-01-01'
												group by b.dept_no) e
where b.emp_no = a.emp_no
and a.emp_no = c.emp_no
and c.dept_no = d.dept_no
and d.dept_no = e.dept_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
group by a.emp_no
having b.salary > e.salary;