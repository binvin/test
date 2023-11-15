CREATE OR REPLACE PACKAGE sql_injection_demo  
IS  
   TYPE name_sal_rt IS RECORD (  
      last_name   hr.employees.last_name%TYPE  
    , salary      hr.employees.salary%TYPE  
   );  
  
   FUNCTION name_sal_for (where_in IN VARCHAR2 DEFAULT NULL)  
      RETURN sys_refcursor;  
  
   PROCEDURE show_name_sal (  
      title_in IN VARCHAR2  
    , rows_inout IN OUT sys_refcursor  
   );  
END sql_injection_demo; 
