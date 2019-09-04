-- 문제1
select MAX(salary) as '최고임금', MIN(salary) as '최저임금' , MAX(salary) - MIN(salary) as '최고임금 - 최저임금'
from salaries;

-- 문제2
select date_format(MAX(hire_date), '%Y년 %c월 %d일') as '마지막으로 신입사원이 들어온 날'from employees;

-- 문제3  모르겠다
select date_format(MIN(hire_date), '%Y년 %c월 %d일') from employees;

-- 문제4
select avg(salary) as '평균 연봉' from salaries where to_date like '9999-%';

-- 문제5
select max(salary) as '최고 연봉', min(salary) as '최저 연봉' from salaries where to_date like '9999-%';

-- 문제 6
select substring(now(), 1, 4) - substring(min(birth_date), 1, 4) as '최고 연장자의 나이',
 substring(now(), 1, 4) - substring(max(birth_date), 1, 4) as '최고 어린 사원의 나이' 
 from employees;
