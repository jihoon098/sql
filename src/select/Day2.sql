-- ceiling
select ceiliing(3.14), ceiling(-3.14);

-- round(x) : x에 가장 근접한 정수 반환
select round(1.298), round(1.5111);

-- round(x, d) : d자리에 가장 근접한 실수 반환
select round(1.298, 1), round(1.5111, 0);

-- 제곱승
select pow(2, 10), power(10, 5);

-- sign(x) : x가 음수이면 -1, 
select sign(2), sign(-2), sign(0);

-- 가장 큰값, 가장 작은 값
select greatest(10, 2, 4, 9),
	least(10, 2, 4, 9),
    greates('Abc', 'Abc1', 'ABcd');
    
-- ---- 날짜 함수들 ----
-- curdate(), current_date => yyyy, MM, dd
select curdate(), current_date;

-- curtime(), current_time => hh, mm, ss
select curtime(), current_time;

-- now(), sysdate(), current_timestamp() => yyyy, MM, dd, 
select curtime(), current_time;


-- date_format
select date_format(now(), '%Y년 %c월 %d일 %h시 %i분 %s초');



select concat(first_name, ' ', last_name) as name,
	period_diff((date_format(curdate), '%Y%m'),
				(date_format(hire_date), '%Y%m'))
    from employees;
    
    
-- date_add, adddate
-- date_sub, subdate
-- (date, INTERVAL expr type)
-- : 날짜 date에 type형식(year, month, day)으로 지정한 expr값을 더하거나 뺀다,
-- ex) 각 직원들의 6개월 후 근무 평가일
select concat(first_name, ' ', last_name) as name, 
	hire_date,
	date_add(hire_date, INTERVAL 6 month)
    from employees;
    
    
-- cast
select now(), cast(now() as date), cast(now() as datetime);

select 1-2, cast(1-2 as unsigned);
