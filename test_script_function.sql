--@C:\Users\USER\Desktop\dbas\test_script_function.txt
--Testing proc_param_festivals

 Select * from festivals;
 
 exec proc_param_festivals(112,'Tech FESTIVAL','4');
 
 Select * from festivals;
 
 --Testing proc_param_addresses
 Select * from addresses;
 
 exec proc_param_addresses('JORPATI','KATHMANDU','NEPAL');
 
 Select * from addresses;
 
 --Testing proc_param_staff
 /*select first_name from festival_staff;
 exec proc_param_staff(104,'&in_fname','&in_lname','&in_email','&in_gender','&in_address','&in_dob',&in_salary,'&in_dor');
 */
 --Testing proc_count_staff
 
 select first_name from festival_staff;
 
 exec proc_count_staff;
 
 -- Testing proc_working_age
 
 exec proc_working_age('JOSEPH');
 
 exec proc_working_age('RAJAN');
 
 --Testing proc_person_display
 exec proc_person_display('JOSEPH','HARPER');

--Viewing locations
SELECT staff_id, first_name FROM festival_staff;
--4 rows selected

--EXECUTING procedure proc_del_cur_festival_staff
EXEC proc_del_cur_festival_staff;
--Deleted record with staff_id 104

SELECT staff_id, first_name FROM festival_staff;
--3 rows selected

		
 
 
