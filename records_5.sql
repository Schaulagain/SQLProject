SET SERVEROUTPUT ON
--creating table-based records
DECLARE 
   festival_staff_rec festival_staff%ROWTYPE; 
BEGIN 
   SELECT * into festival_staff_rec 
   FROM festival_staff 
   WHERE staff_id = 101;  
   DBMS_OUTPUT.PUT_LINE('Staff id: ' || festival_staff_rec.staff_id); 
   DBMS_OUTPUT.PUT_LINE('Staff Name: ' || festival_staff_rec.first_name||' '||festival_staff_rec.last_name); 
   DBMS_OUTPUT.PUT_LINE('Email: ' || festival_staff_rec.email); 
   DBMS_OUTPUT.PUT_LINE('Salary: ' || festival_staff_rec.salary); 
END; 
/
--TESTING table-based records
/*Staff id: 101
Staff Name: JOSEPH HARPER
Email: JHARPER@YAHOO.COM
Salary: 80000.02

procedure successfully completed.*/

--creating cursor-based records
DECLARE 
   CURSOR festival_cur IS
      SELECT staff_id, first_name, last_name  
      FROM festival_staff; 
   festival_staff_rec festival_cur%ROWTYPE; 
BEGIN 
   OPEN festival_cur; 
   LOOP 
      FETCH festival_cur into festival_staff_rec; 
      EXIT WHEN festival_cur%notfound; 
      DBMS_OUTPUT.put_line(festival_staff_rec.staff_id || ' ' || festival_staff_rec.first_name||' '||festival_staff_rec.last_name); 
   END LOOP; 
END; 
/
--TESTING table-based records
/*101 JOSEPH HARPER
102 MARGARET ROSS
103 MATTEW MARTIN
104 CHRISTINE SMITH

procedure successfully completed.
*/

--CREATING user-defined records
DECLARE 
   TYPE students IS RECORD
		(student_id NUMBER(10),
		student_name VARCHAR(30), 	
		address VARCHAR(50), 
		program VARCHAR(100));
	student1 students;  
BEGIN 
-- specification of student 1
	student1.student_id := 1000;
	student1.student_name := 'KANCHAN'; 
	student1.address := 'BHAKTAPUR';  
	student1.program := 'IT'; 
    
--Student 1 is recorded
	DBMS_OUTPUT.PUT_LINE('Student 1: student_id : ' || student1.student_id); 
  
	DBMS_OUTPUT.PUT_LINE('Student 1: student_name : '|| student1.student_name); 
	
	DBMS_OUTPUT.PUT_LINE('Student 1: address : '|| student1.address); 
	DBMS_OUTPUT.PUT_LINE('Student 1: program : '|| student1.program);   
END; 
/
--TESTING user-defined records
/*Student 1: student_id : 1000
Student 1: student_name : KANCHAN
Student 1: address : BHAKTAPUR
Student 1: program : IT
procedure successfully completed*/





