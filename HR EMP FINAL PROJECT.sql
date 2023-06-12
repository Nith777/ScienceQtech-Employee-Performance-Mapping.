create database hremp;
select * from emp_record_table;
select FIRST_NAME,LAST_NAME,GENDER,DEPT from emp_record_table;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING FROM emp_record_table where EMP_RATING<2;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING FROM emp_record_table where EMP_RATING>4;
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING FROM emp_record_table where EMP_RATING BETWEEN 2 AND 4;
SELECT concat(FIRST_NAME,LAST_NAME) as NAME from emp_record_table where DEPT='FINANCE';
select * from proj_table;
select * from data_science_team;
SELECT E.EMP_ID,concat(E.FIRST_NAME,' ',E.LAST_NAME) as NAME,count(distinct R.EMP_ID) as EMP_COUNT from emp_record_table as E join emp_record_table as R on E.EMP_ID=R.MANAGER_ID group by E.EMP_ID,E.FIRST_NAME,E.LAST_NAME;  
select FIRST_NAME,LAST_NAME,GENDER,DEPT from emp_record_table WHERE DEPT='HEALTHCARE' UNION select FIRST_NAME,LAST_NAME,GENDER,DEPT from emp_record_table WHERE DEPT='FINANCE';
select E.EMP_ID,E.FIRST_NAME,E.LAST_NAME,E.GENDER,E.DEPT,E.EMP_RATING,M.max_rating from emp_record_table as E JOIN (SELECT DEPT,MAX(EMP_RATING) as max_rating from emp_record_table group by DEPT) as M on E.DEPT=M.DEPT;
SELECT Role,min(salary),max(salary) from emp_record_table group by ROLE;
SELECT EMP_ID,FIRST_NAME,LAST_NAME,EXP,RANK() OVER(order by exp DESC) as experience_rank from emp_record_table;
select FIRST_NAME,LAST_NAME,DEPT,ROLE,country FROM emp_record_table where salary>6000;
select FIRST_NAME,LAST_NAME,DEPT,ROLE,country FROM emp_record_table where EXP>10;
DELIMITER //;
CREATE procedure HIGH_EXP9_EMP() BEGIN SELECT * from emp_record_table where EXP>3;  END //;
CALL HIGH_EXP9_EMP();
DELIMITER &&
CREATE FUNCTION Employee_ROLE(
EXP int
)
RETURNS VARCHAR(40)
DETERMINISTIC
BEGIN
DECLARE Employee_ROLE VARCHAR(40);
IF EXP>12 AND 16 THEN
SET Employee_ROLE="MANAGER";
ELSEIF EXP>10 AND 12 THEN
SET Employee_ROLE ="LEAD DATA SCIENTIST";
ELSEIF EXP>5 AND 10 THEN
SET Employee_ROLE ="SENIOR DATA SCIENTIST";
ELSEIF EXP>2 AND 5 THEN
SET Employee_ROLE ="ASSOCIATE DATA SCIENTIST";
ELSEIF EXP<=2 THEN
SET Employee_ROLE ="JUNIOR DATA SCIENTIST";
END IF;
RETURN (Employee_ROLE);
END &&
SELECT EXP,Employee_ROLE(EXP) FROM data_science_team;
create INDEX idx_EMP8firstname on emp_record_table(FIRST_NAME(20));
select * from emp_record_table where FIRST_NAME='Eric';
SELECT FIRST_NAME,LAST_NAME,DEPT,(0.5*salary*EMP_Rating)as BONUS FROM emp_record_table;
SELECT COUNTRY,CONTINENT,AVG(salary)as salary_distribution FROM emp_record_table group by COUNTRY,CONTINENT;

