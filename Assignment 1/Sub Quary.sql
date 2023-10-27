select * from countries;

select * from departments;

select * from employees;

select first_name as 'Fisrt',last_name as 'Last' from employees;

select * from employees
where department_id='60' and salary>6000;

select * from employees
where employee_id = 144;

select * from employees
where salary <(select salary from employees
				where employee_id = 144);
                
select * from employees
where salary =(select max(salary) from employees);

SELECT * FROM DEPARTMENTS;

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID = (
						SELECT DEPARTMENT_ID 
						FROM DEPARTMENTS
						WHERE  DEPARTMENT_NAME = 'MARKETING'
                        );



