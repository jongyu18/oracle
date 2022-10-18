--DQL(���Ǿ�) �����͸� ��ȸ�Ҷ� ����Ѵ�.
--select �÷���
--from ���̺��

--��ü �÷� ������ ��ȸ


select *
from emp;


--�κ��÷� ������
select empno,ename,sal
from emp;

--14��deptno �÷�   ��� ��ȸ
select deptno
from emp;

--�Ȱ����� �ѹ��� ��ȸ(�ߺ� ����)
select DISTINCT(deptno)
from emp;

select DISTINCT(job)
from emp;

--����Ȯ���ϱ�
select ename, sal
from emp;


-- +,-,*,/
-- �÷��� ������� �����Ѵ�.
--null ���� ������ �Ұ��ϴ�.
--�÷��� ��Ī�� ����� �� �ִ�.
select ename as�����,sal,sal * 12+nvl(comm,0)as����,comm
from emp;

--������ ����
--select �÷���
--from ���̺��
--order by �÷���(���ı����� �Ǵ� ��)  asc(��������)/desc(��������)

select *
from emp
order by sal ;     --���������� �⺻���̶� ���� �����ϴ�.

--����(1 ~ 10),��¥(���ų�¥ ~ �ֱٳ�¥),����(��������)


--���ǰ˻�
--select �÷���
--from ���̺��
--where ���ǽ�;   <, >, =, !=/ <> , <=, >= , and , or

select *
from emp
where sal >=3000;   --�޿��� 3õ �̻��λ��

select *
from emp
where deptno = 30;

--and �ΰ��� �̻��� ������ ��� ���ΰ��
select *
from emp
where deptno = 30 and job = 'SALESMAN' and empno = 7499;


--���ڸ� �������� ����Ҷ�
--��ҹ���
--' '
select *
from emp
where ename = 'ford'; --����� ������ �ȳ��� �ҹ��� ford�� ����.

--��¥�� �������� ����Ҷ�
--' '
--��¥�� ũ�Ⱑ �ִ�
--80/12/20     1980 12 20 �� �� �� ��������
select * 
from emp
where hiredate < '1982/01/01';

--or �ΰ��̻��� �����߿� �ϳ��̻� ���ΰ��
select * 
from emp 
where deptno = 10 or sal >= 2000;

--not ������ ������

select * 
from emp
where sal != 3000;

select * 
from emp
where sal = 3000;

-- and, or
-- ���� ������ ǥ�� �Ҷ� ���
--ex 1000 ~ 3000 ����
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

--like������
--���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�
--���ϵ� ī�带 ����Ѵ�( % _)
--% ��� ���ڸ� ��ü�Ѵ�
-- _ �ѹ��ڸ� ��ü�Ѵ�
select*
from emp
where ename like'F%';

select*
from emp
where ename like '%D'

--null ������



--================================
-- ���տ�����
-- ������(UNION),������(intersect),������(minus)
-- �÷��� Ÿ���� �����ؾ� �Ѵ�.
-- �÷��� �̸��� ��� ����.


select empno,ename,sal,deptno
from emp
where deptno = 10
UNION  --������
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
where deptno = 10
UNION  --������
select empno,ename,sal,deptno
from emp
where deptno = 20;

select empno,ename,sal,deptno
from emp
minus --������
select empno,ename,sal,deptno
from emp
where deptno = 10;

select empno,ename,sal,deptno
from emp
intersect -- ������
select empno,ename,sal,deptno
from emp
where deptno = 10;

--where
--�񱳿�����, ��������, lide, is null / is not null, ���տ�����
--< > <= >= = !=  �񱳿�����
--in nill , is not null   ��������
--UNLON , INERSECT , MINUS  ���տ�����

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

-- �Լ�
-- �����Լ� : upper,lower,substr,instr,replace,lpad,rpad,concat
-- �����Լ� :
-- ��¥�Լ�


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

===����===
select 
           round(1234.5678),
           round(1234.5678,0),
           round(1234.5678,1),
           round(1234.5678,2),
from dual;



