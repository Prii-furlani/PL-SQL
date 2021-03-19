SET SERVEROUTPUT ON

--CREATE 
CREATE TABLE DEPT(deptno number(4) primary key,
dname varchar2(15) not null, local varchar2(15));

create table emp(empno number(5) primary key,
ename varchar2(15) not null, sal number(10,2), 
deptno number(4) references dept);

--DROP
DROP TABLE DEPT CASCADE CONSTRAINTS;
DROP TABLE EMP CASCADE CONSTRAINTS;

--INSERT
insert into dept values(1,'contabilidade','sp');
insert into dept values(2,'T.I.','sp');
insert into dept values(3,'filial x','rj');
insert into dept values(4,'filial z','mg');

insert into emp values(100,'Jose Silva',1200.35,1);
insert into emp values(101,'João Barbosa',1800.35,1);
insert into emp values(102,'Carlos Siqueira',2000,1);
insert into emp values(103,'Maria Jose',3400,2);
insert into emp values(104,'Celina Anjos',3800,2);
insert into emp values(105,'Alberto Carlos',5800,3);
insert into emp values(106,'Roberto Vieira',4900,3);


--ver todos os dados
Select * from Dept;
Select * from emp;


--COM IF/ELSE
 SET SERVEROUTPUT ON
 DECLARE    
  V_CODIGO   NUMBER(4); 
  V_NOME_FUNC VARCHAR2(15);
  V_SALARIO  NUMBER(10,2);
BEGIN   
     SELECT EMPNO,ENAME,SAL INTO V_CODIGO,V_NOME_FUNC,V_SALARIO  
     FROM EMP WHERE EMPNO=&V_CODIGO;
     DBMS_OUTPUT.PUT_LINE('CODIGO: ' || V_CODIGO);
     DBMS_OUTPUT.PUT_LINE('NOME: ' || V_NOME_FUNC);
     IF V_SALARIO <= 1000 THEN
          DBMS_OUTPUT.PUT_LINE('SALARIO: ' || V_SALARIO || ' ESTA BAIXO');
     ELSIF V_SALARIO >= 1001 AND v_SALARIO <= 3000 THEN
          DBMS_OUTPUT.PUT_LINE('SALARIO: ' || V_SALARIO || ' É MEDIANO');
     ELSE
         DBMS_OUTPUT.PUT_LINE('SALARIO: ' || V_SALARIO || ' É ALTO');
     END IF;
EXCEPTION
     WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('EMPREGADO NÃO ENCONTRADO');
END;  
/ 




--CASE

SET SERVEROUTPUT ON
 DECLARE    
  V_CODIGO   NUMBER(4); 
  V_NOME_FUNC VARCHAR2(15);
  V_SALARIO  NUMBER(10,2);
BEGIN   
     SELECT EMPNO,ENAME,SAL INTO V_CODIGO,V_NOME_FUNC,V_SALARIO  
     FROM EMP WHERE EMPNO=&V_CODIGO;
     DBMS_OUTPUT.PUT_LINE('CODIGO: ' || V_CODIGO);
     DBMS_OUTPUT.PUT_LINE('NOME: ' || V_NOME_FUNC);
     CASE
     WHEN V_SALARIO <= 1000 THEN
          DBMS_OUTPUT.PUT_LINE('SALARIO: ' || V_SALARIO || ' ESTA BAIXO');
     WHEN V_SALARIO >= 1001 AND v_SALARIO <= 3000 THEN
          DBMS_OUTPUT.PUT_LINE('SALARIO: ' || V_SALARIO || ' É MEDIANO');
     ELSE
         DBMS_OUTPUT.PUT_LINE('SALARIO: ' || V_SALARIO || ' É ALTO');
     END CASE;
EXCEPTION
     WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('EMPREGADO NÃO ENCONTRADO');
END;  
/ 