--@C:\Users\USER\Desktop\dbas\package_5.txt

--CREATING package
CREATE OR REPLACE PACKAGE pkg_festival_staff IS
	FUNCTION func_festival_staff RETURN NUMBER;
	PROCEDURE proc_festival_staff;
END pkg_festival_staff;
/
--package head successfully created without any errors

CREATE OR REPLACE PACKAGE BODY pkg_festival_staff IS
	FUNCTION func_festival_staff RETURN NUMBER IS
	vn_staff_id NUMBER(3);

	BEGIN
		SELECT COUNT(staff_id)
		INTO vn_staff_id
		FROM festival_staff;
		
		RETURN vn_staff_id;
		
	END func_festival_staff;
	
	PROCEDURE proc_festival_staff IS
	vn_no_of_staff NUMBER(3);

	BEGIN
		vn_no_of_staff :=pkg_festival_staff.func_festival_staff;
		DBMS_OUTPUT.PUT_LINE ('There are ' || vn_no_of_staff || ' staff in the database.');
	END proc_festival_staff;
END pkg_festival_staff;
/
SHOW ERRORS;
--package body created successfully without any errors


--TESTING PACKAGE
SELECT * FROM festival_staff;
--4 rows selected

--





--Executing the package procedure
DECLARE 
BEGIN
	pkg_festival_staff.proc_festival_staff;
END;
/
SHOW ERRORS;
--There are 4 staff in the database


