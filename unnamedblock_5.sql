----@C:\Users\USER\Desktop\dbas\unnamedblock_5.txt
SET SERVEROUTPUT ON


--CREATING ANONYMOUS(unnamed) block using EXIT WHEN
DECLARE
	vn_location_length NUMBER(5);
	vn_location_counter NUMBER(5):=1;
	vc_location_name VARCHAR2(30):='KATHMANDU';
BEGIN
	vn_location_length := LENGTH(vc_location_name);
	LOOP
		EXIT WHEN vn_location_counter > vn_location_length;

		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_location_name, vn_location_counter, 1));
		vn_location_counter:= vn_location_counter+1;
	END LOOP;
END;
/




--CREATING ANONYMOUS block using IF THEN, FOR AND WHILE LOOP
DECLARE
	vn_fs_length NUMBER(3);
	vn_fs_counter NUMBER(3):=1;
	vc_fs_firstname VARCHAR2(25):='DEEPAK';
	vc_fs_middle VARCHAR2(25):='NARAYAN';
	vc_fs_surname VARCHAR2(25):='ACHARYA';
	
BEGIN
	vn_fs_length := LENGTH(vc_fs_firstname);
	DBMS_OUTPUT.PUT_LINE('------- ');
	LOOP
		IF vn_fs_counter>vn_fs_length THEN
			EXIT;
			
		END IF;
		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_fs_firstname, vn_fs_counter, 1));
		vn_fs_counter := vn_fs_counter+1;
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('------ ');
	vn_fs_counter:=1;
	vn_fs_length := LENGTH(vc_fs_middle);
	WHILE vn_fs_counter<=vn_fs_length LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_fs_middle, vn_fs_counter, 1));
		vn_fs_counter := vn_fs_counter+1;
	END LOOP;

	DBMS_OUTPUT.PUT_LINE('----- ');
	vn_fs_length := LENGTH(vc_fs_surname);
	FOR vn_fs_counter IN 1..vn_fs_length LOOP
		DBMS_OUTPUT.PUT_LINE(SUBSTR(vc_fs_surname, vn_fs_counter, 1));
	END LOOP;	
END;
/




