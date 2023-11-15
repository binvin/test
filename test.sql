DECLARE  
   l_rows   sys_refcursor;  
BEGIN  
   l_rows := sql_injection_demo.name_sal_for ('department_id = 100');  
   sql_injection_demo.show_name_sal ('Department 100', l_rows);  
   /* 
     A "classic" demonstration involves pulling out the names of users 
     but that doesn't yield anything interesting in the LiveSQL environment, 
     plus ALL_USERS is not accessible.  
 
     So I will "fall back" simply on the USER_OBJECTS table. 
 
   l_rows :=  
      sql_injection_demo.name_sal_for  
                    (   'department_id = 100'  
                     || ' UNION select ''USER: '' || username, 1 from all_users'  
                    );  
   */ 
   l_rows :=  
      sql_injection_demo.name_sal_for  
                    (   'department_id = 100'  
                     || ' UNION select SUBSTR (''Pretend USER: '' || object_name, 1, 25), 1 from user_objects'  
                    );  
   sql_injection_demo.show_name_sal ('Department 100 PLUS Users', l_rows);  
END; plsq
