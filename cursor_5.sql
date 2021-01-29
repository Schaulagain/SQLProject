--@C:\Users\USER\Desktop\dbas\cursor_5.txt

SET SERVEROUTPUT ON

--VIEWING locations table
DESC locations;

--CREATING procedure with implicit cursor
CREATE OR REPLACE PROCEDURE proc_imp_cursor(in_location_name locations.location_name%TYPE) IS
BEGIN 
	DELETE FROM locations WHERE location_name = in_location_name;
	IF(SQL%NOTFOUND) THEN
		DBMS_OUTPUT.PUT_LINE('PLACE NOT FOUND');
		ELSE
		DBMS_OUTPUT.PUT_LINE(in_location_name||' DELETED');
	END IF;
END proc_imp_cursor;
/
SHOW ERRORS;
--procedure created without any errors

--CREATING procedure with explicit cursor 
CREATE OR REPLACE PROCEDURE proc_exp_festival_staff_cursor(in_salary festival_staff.salary%TYPE)IS
CURSOR cur_salary IS
SELECT first_name, salary FROM festival_staff WHERE salary>= in_salary;

vn_rows NUMBER(2);

BEGIN
DBMS_OUTPUT.PUT_LINE('SN   FESTIVAL_STAFF  SALARY');
DBMS_OUTPUT.PUT_LINE('--------------------------');
FOR rec_cur_salary IN cur_salary LOOP
	DBMS_OUTPUT.PUT_LINE(cur_salary%ROWCOUNT||'    '||rec_cur_salary.first_name||'     '||rec_cur_salary.salary);
	vn_rows:=cur_salary%ROWCOUNT;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('THERE ARE '||vn_rows||' ROWS IN THE DATABASE');
	
END proc_exp_festival_staff_cursor;
/
SHOW ERRORS;

--CREATING procedure with explicit cursor using WHILE LOOP
CREATE OR REPLACE PROCEDURE proc_exp_location_provision_cursor(in_price location_provision.price%TYPE)IS
CURSOR cur_price IS
SELECT location_provision_id,provision_type,price FROM location_provision
WHERE price>= in_price;

vn_rows_lp NUMBER(2);

rec_cur_price cur_price%ROWTYPE;
BEGIN 
	OPEN cur_price;
	FETCH cur_price INTO rec_cur_price;
	
	IF cur_price %NOTFOUND THEN
		DBMS_OUTPUT.PUT_LINE('LOCATION PROVISION NOT FOUND');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('lOCATION_PROVISION_ID    LOCATION_PROVISION   PRICE');
		DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
		WHILE cur_price%FOUND LOOP
			DBMS_OUTPUT.PUT_LINE(cur_price%ROWCOUNT||'   '||rec_cur_price.location_provision_id||'   '||rec_cur_price.provision_type|| '   '||rec_cur_price.price);
			vn_rows_lp:= cur_price%ROWCOUNT;
			FETCH cur_price INTO rec_cur_price;
		END LOOP;
		
		DBMS_OUTPUT.PUT_LINE('THERE ARE '||vn_rows_lp||' ROWS IN THE DATABASE');
	END IF;
END proc_exp_location_provision_cursor;
/
SHOW ERRORS;
--procedure created successfully





