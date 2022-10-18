--DQL(질의어) 데이터를 조회할때 사용한다.
--select 컬럼명
--from 테이블명

--전체 컬럼 데이터 조회


select *
from emp;


--부분컬럼 데이터
select empno,ename,sal
from emp;

--14개deptno 컬럼   모두 조회
select deptno
from emp;

--똑같으면 한번만 조회(중복 제외)
select DISTINCT(deptno)
from emp;

select DISTINCT(job)
from emp;

--월급확인하기
select ename, sal
from emp;


-- +,-,*,/
-- 컬럼을 대상으로 연산한다.
--null 값은 연산이 불가하다.
--컬럼에 별칭을 사용할 수 있다.
select ename as사원명,sal,sal * 12+nvl(comm,0)as연봉,comm
from emp;

--데이터 정렬
--select 컬럼명
--from 테이블명
--order by 컬럼명(정렬기준이 되는 값)  asc(오름차순)/desc(내림차순)

select *
from emp
order by sal ;     --오름차순은 기본값이라 생략 가능하다.

--숫자(1 ~ 10),날짜(과거날짜 ~ 최근날짜),문자(사전순서)


--조건검색
--select 컬럼명
--from 테이블명
--where 조건식;   <, >, =, !=/ <> , <=, >= , and , or

select *
from emp
where sal >=3000;   --급여가 3천 이상인사람

select *
from emp
where deptno = 30;

--and 두가지 이상의 조건이 모두 참인경우
select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;


--문자를 조건절에 사용할때
--대소문자
--' '
select *
from emp
where ename = 'ford'; --실행시 오류는 안난다 소문자 ford는 없다.

--날짜를 조건절에 사용할때
--' '
--날짜도 크기가 있다
--80/12/20     1980 12 20 시 분 초 요일정보
select * 
from emp
where hiredate < '1982/01/01';

--or 두개이상의 조건중에 하나이상 참인경우
select * 
from emp 
where deptno = 10 or sal >= 2000;

--not 논리부정 연산자

select * 
from emp
where sal != 3000;

select * 
from emp
where sal = 3000;

-- and, or
-- 번위 조건을 표현 할때 사용
--ex 1000 ~ 3000 사이
select *
from emp
where sal >= 1000 and sal <= 3000;

select *
from emp
where sal <=1000 or sal >=3000;

--between  = and
select *
from emp
where sal between 1000 and 3000;

--in = or
select *
from emp
where sal = 800 or sal = 3000 or sal = 5000;

select *
from emp
where sal in(800,3000,5000);

--like연산자
--값의 일부만 가지고 데이터를 조회한다
--와일드 카드를 사용한다( % _)
--% 모든 문자를 대체한다
-- _ 한문자를 대체한다
select*
from emp
where ename like'F%';

select*
from emp
where ename like '%D'

--null 연산자



--================================
-- 집합연산자
-- 합집합(UNION),교집합(intersect),차집합(minus)
-- 컬럼의 타입이 동일해야 한다.
-- 컬럼의 이름은 상관 없다.


select empno,ename,sal,deptno
from emp
where deptno = 10
UNION  --합집합
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION  --합집합
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
minus --차집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
intersect -- 교집합
select empno,ename,sal,deptno
from emp
where deptno = 10;

--where
--비교연산자, 논리연산자, lide, is null / is not null, 집합연산자
--< > <= >= = !=  비교연산자
--in nill , is not null   논리연산자
--UNLON , INERSECT , MINUS  집합연산자

select *    ---Q1
from emp
where ename like '%S';

--Q2
select job,salesman,ename,job,sal,deptno
form emp;
where deptno = 30 amd job = 'salesman

--Q3
select *
from emp
where deptno in(20,30)and sla>=2000;

--Q4
select *
from emp
where sal>=2000, sal <=3000;

--Q5
select *
from emp
where ename like '%E' , not sal

-- 함수
-- 문자함수 : upper,lower,substr,instr,replace,lpad,rpad,concat
-- 숫자함수 :
-- 날짜함수


select 'Welcone',upper('Welcome')
from dual;

select lower(ename),upper(ename)
from emp;

select *
from ename - 'FORD';

select *
from emp
where lower(ename) = 'scott';

select ename,length(ename)
from emp;

select 'Welcome to Oracle',substr('Welcome to Oracle',2,3),substr('Welcome to Oracle',10)
from dual;

select 'Welcome to Oracle',substr('Welcome to Oracle',-3,3),substr('Welcome to Oracle',-17)
from dual;

select instr('Welcome to Oracle','O')
from dual;

select instr('Welcome to Oracle','e',3,2)
from dual;


select 'Welcome to Orale',replace('Welcom to Oracle','to','of')
from dual;

select 'oracle',lpad('oracle',10,'.')
from dual;

select rpad('970424-',13,'*')
from dual;

select concat(empno,ename), empno || '' || ename
from emp;

===숫자===
select 
           round(1234.5678),
           round(1234.5678,0),
           round(1234.5678,1),
           round(1234.5678,2),
from dual;



