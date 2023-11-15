CREATE OR REPLACE PACKAGE BODY sql_injection_demo  
IS  
   FUNCTION name_sal_for (where_in IN VARCHAR2 DEFAULT NULL)  
      RETURN sys_refcursor  
   IS  
      l_query   VARCHAR2 (32767)  
              := 'select last_name, salary from hr.employees WHERE ' || where_in;  
      l_cursor        sys_refcursor;  
   BEGIN  
      OPEN l_cursor FOR l_query;  
  
      RETURN l_cursor;  
   END name_sal_for;  
  
   PROCEDURE show_name_sal (  
      title_in IN VARCHAR2  
    , rows_inout IN OUT sys_refcursor  
   )  
   IS  
      l_employee   name_sal_rt;  
   BEGIN  
      DBMS_OUTPUT.put_line (RPAD ('=', 100, '='));  
      DBMS_OUTPUT.put_line ('SQL Injection Demonstration: ' || title_in);  
  
      LOOP  
         FETCH rows_inout  
          INTO l_employee;  
         EXIT WHEN rows_inout%NOTFOUND;  
  
         DBMS_OUTPUT.put_line (l_employee.last_name || '-'  
                               || l_employee.salary  
                              );  
      END LOOP;  
  
      CLOSE rows_inout;  
   END show_name_sal;  
END sql_injection_demo; 
