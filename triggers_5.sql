--@C:\Users\USER\Desktop\dbas\triggers_5.txt

SET SERVEROUTPUT ON
--CREATING function func_validation_of_email for email_validation
CREATE OR REPLACE FUNCTION func_validation_of_email(in_email VARCHAR2) RETURN NUMBER IS
	vn_email_validation NUMBER(1);
BEGIN
	IF in_email LIKE '%_@_%_.__%' THEN
		vn_email_validation := 0;
	ELSE 
		vn_email_validation := 1;
	END IF;
		RETURN vn_email_validation;		
						
END func_validation_of_email;
/	
SHOW ERRORS;	

--CREATING procedure proc_validation_of_email for email_validation		
CREATE OR REPLACE PROCEDURE proc_validation_of_email(in_email VARCHAR2)IS 
vn_email_p NUMBER(1);
BEGIN
	vn_email_p := func_validation_of_email(in_email);
				
	IF vn_email_p = 0 THEN 
		DBMS_OUTPUT.PUT_LINE('Email is valid!');	
	ELSE 
		DBMS_OUTPUT.PUT_LINE('Email is invalid!');
	END IF;		
END proc_validation_of_email;		
/			
SHOW ERRORS;

--CREATING DML trigger for email_validation
CREATE OR REPLACE TRIGGER trig_email_validation
BEFORE INSERT OR UPDATE OF email ON festival_staff
FOR EACH ROW
DECLARE 
	vn_email_validation NUMBER(1);
BEGIN
	vn_email_validation := func_validation_of_email(:NEW.email);
						
	IF vn_email_validation = 0 THEN
		DBMS_OUTPUT.PUT_LINE('Inserted Successfully!');
	ELSE
		RAISE_APPLICATION_ERROR(-20000,'ERROR-Email is invalid!');
	END IF;
END trig_email_validation;
/	
SHOW ERRORS;		
		
	


--TRIGGER TO CHECK SALARY USING WHEN	
CREATE OR REPLACE TRIGGER trig_salary
BEFORE INSERT OR UPDATE OF salary ON festival_staff
FOR EACH ROW
	WHEN(NEW.salary<50000)
BEGIN
	RAISE_APPLICATION_ERROR(-20001,'ERROR-Staff cannot have salary more than 50,000');	
END trig_salary;
/
SHOW ERRORS;

--testing for salary more than 50000

--INSERTING into festival_staff
INSERT INTO festival_staff(staff_id, festival_id, first_name, last_name, email, salary)
VALUES(111, 100, 'RAM', 'SHRESTHA', 'RAM@gmail.COM', 60000.00);
--Inserted successfully!

--INSERTING into festival_staff
INSERT INTO festival_staff(staff_id, festival_id, first_name, last_name, email, salary)
VALUES(112, 100, 'RITA', 'SHRESTHA', 'RITASHRESTHA@gmail.COM', 40000.00);
--ERROR-Staff cannot have salary more than 50,000

--CREATING TRIGGER using IF, ELSE IF AND ELSE
CREATE OR REPLACE TRIGGER trig_festival
BEFORE INSERT OR DELETE OR UPDATE ON festivals
FOR EACH ROW

DECLARE
vc_user_db VARCHAR2(30);
BEGIN
	SELECT USER 
	INTO vc_user_db
	FROM DUAL;

	IF INSERTING THEN
		DBMS_OUTPUT.PUT_LINE('Data is inserted by '||vc_user_db||' in the festivals table');		
 
	ELSIF UPDATING THEN 
		DBMS_OUTPUT.PUT_LINE('Data is updated by '||vc_user_db||' in the festivals table');

	ELSE
		DBMS_OUTPUT.PUT_LINE('Data is deleted by '||vc_user_db||' in the festivals table');
	END IF;
END trig_festival;
/
SHOW ERROR;

--TESTING trigger trig_festival
INSERT INTO festivals
VALUES(118, 102, 'FOOD FESTIVAL', 2);
--Data is inserted by C## in the festivals table

--UPDATING trigger trig_festival
UPDATE festivals SET festival_duration = 4 
WHERE festival_id = 103;
--Data is updated by C## in the festivals table

--testing of deletion
DELETE FROM festivals 
WHERE festival_id =118;
--Data is deleted by C## in the festivals table

--CREATING trigger trigg_salary
CREATE OR REPLACE TRIGGER trigg_salary
AFTER UPDATE OF salary ON festival_staff
FOR EACH ROW
BEGIN
DBMS_OUTPUT.PUT_LINE('salary of '||:OLD.first_name||' was changed from  '||:OLD.salary||' to '|| :NEW.salary);
END trigg_salary;
/
SHOW ERRORS;

--testing of salary message
UPDATE festival_staff SET salary = 27000 
WHERE staff_id = 103;
--salary of JOSEPH was changed from  26000 to 27000

--CREATING triggers using nested loop

CREATE OR REPLACE TRIGGER trig_date_of_recruitment
BEFORE INSERT OR UPDATE OF date_of_recruitment ON festival_staff
FOR EACH ROW
BEGIN
	IF (INSERTING OR UPDATING ) THEN 
		IF :NEW.date_of_recruitment > SYSDATE THEN
			RAISE_APPLICATION_ERROR(-20000,'ERROR-DATE OF RECRUITMENT should be less than current date. ');
				
		ELSIF :NEW.date_of_recruitment < SYSDATE THEN
			DBMS_OUTPUT.PUT_LINE('Valid date!');
		ELSE NULL;
		END IF;
	ELSE DBMS_OUTPUT.PUT_LINE('deleted');
	END IF;	
END trig_date_of_recruitment;
/
SHOW ERRORS;	

--CREATING table event_schema_table for schema level trigger
CREATE TABLE event_schema_table
  (
    event_schema_type VARCHAR2(30),
    date_of_login DATE,
    time_of_login VARCHAR2(15),
    date_of_logoff DATE,
    time_of_logoff VARCHAR2(15)
  );
  
--CREATING trigger trig_logon_event_schema_table
CREATE OR REPLACE TRIGGER trig_logon_event_schema_table
AFTER LOGON ON SCHEMA
BEGIN
  INSERT INTO event_schema_table 
  VALUES(ora_sysevent,SYSDATE,TO_CHAR(SYSDATE, 'hh24:mi:ss'),NULL,NULL
  );
  COMMIT;
END;
/SHOW ERRORS;

--CREATING trigger trig_logoff_event_schema_table
CREATE OR REPLACE TRIGGER trig_logoff_event_schema_table
BEFORE LOGOFF ON SCHEMA

BEGIN
	INSERT INTO event_schema_table
	VALUES(ora_sysevent,NULL,NULL,SYSDATE,TO_CHAR(sysdate, 'hh24:mi:ss'));
  COMMIT;
END;
/
SHOW ERRORS;

	