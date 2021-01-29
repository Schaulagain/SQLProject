
--@C:\Users\USER\Desktop\dbas\drop_5.txt

--DROP TRIGGERS
DROP TRIGGER trig_email_validation;
DROP TRIGGER trig_salary;
DROP TRIGGER trig_festival;
DROP TRIGGER trigg_salary;
DROP TRIGGER trig_date_of_recruitment;
DROP TRIGGER trig_logon_event_schema_table;
DROP TRIGGER trig_logoff_event_schema_table;

--DROP CURSORS
DROP CURSOR proc_imp_cursor;
DROP CURSOR proc_exp_festival_staff_cursor;
DROP CURSOR proc_exp_location_provision_cursor;

--DROP  FUNCTION AND PROCEDURE
DROP PROCEDURE proc_del_cur_festival_staff;
DROP PROCEDURE proc_person_display;
DROP FUNCTION func_person_search;
DROP PROCEDURE proc_working_age;
DROP FUNCTION func_working_age;
DROP PROCEDURE proc_count_staff;
DROP FUNCTION func_staff_count;
DROP PROCEDURE proc_param_staff;
DROP PROCEDURE proc_param_addresses;
DROP FUNCTION func_festival_staff;
DROP PROCEDURE proc_festival_staff;
DROP PROCEDURE PROC_PARAM_FESTIVALS;
DROP FUNCTION FUNC_VALIDATION_OF_EMAIL;
DROP PROCEDURE PROC_VALIDATION_OF_EMAIL;
DROP PROCEDURE PROC_IMP_CURSOR;
DROP PROCEDURE PROC_EXP_FESTIVAL_STAFF_CURSOR;
DROP PROCEDURE PROC_EXP_LOCATION_PROVISION_CURSOR;
--DROP PACKAGE
DROP PACKAGE pkg_festival_staff;




--DROP CONSTRAINTS
--DROPPING FOREIGN KEYS

--DROPPING foreign key of festival_staff
ALTER TABLE festival_staff
DROP CONSTRAINT fk_fs_festivals;

--DROPPING foreign key of festival_provision
ALTER TABLE festival_provision
DROP CONSTRAINT fk_fp_location_provision;

ALTER TABLE festival_provision
DROP CONSTRAINT fk_fp_festivals;

--DROPPING foreign key of festival
ALTER TABLE festivals
DROP CONSTRAINT fk_f_locations;

--DROPPING foreign key of location_provision
ALTER TABLE location_provision
DROP CONSTRAINT fk_lp_locations;


--DROPPING PRIMARY KEYS

--DROPPING primary key of festival_staff
ALTER TABLE festival_staff
DROP CONSTRAINT pk_festival_staff;

--DROPPING primary key of festival_provision
ALTER TABLE festival_provision
DROP CONSTRAINT pk_festival_provision;

--DROPPING primary key of festival
ALTER TABLE festivals
DROP CONSTRAINT pk_festivals;

--DROPPING primary key of location_provision
ALTER TABLE location_provision
DROP CONSTRAINT pk_location_provision;

--DROPPING primary key of location_provision
ALTER TABLE locations
DROP CONSTRAINT pk_locations;


--   *******  DROPPING UNIQUE CONSTRAINTS   *******
--DROPPING unique key u_email
ALTER TABLE festival_staff
DROP CONSTRAINT u_email;


--   *******   DROPPING CHECK IN CONSTRAINTS   *******
--DROPPING check constraint ck_first_name
ALTER TABLE festival_staff
DROP CONSTRAINT ck_first_name;

--DROPPING check constraint ck_last_name
ALTER TABLE festival_staff
DROP CONSTRAINT ck_last_name;

--DROPPING check constraint ck_gender
ALTER TABLE festival_staff
DROP CONSTRAINT ck_gender;

--DROPPING check constraint ck_festival_duration
ALTER TABLE festivals
DROP CONSTRAINT ck_festival_duration;
	
--DROP SEQUENCE
DROP SEQUENCE seq_festival_provision;
DROP SEQUENCE seq_location_provision;
DROP SEQUENCE seq_festival_staff;
DROP SEQUENCE seq_locations;
DROP SEQUENCE seq_festivals;

--DROPPING TABLE
DROP TABLE event_schema_table;
DROP TABLE festival_staff;
DROP TABLE festival_provision;
DROP TABLE location_provision;
DROP TABLE festivals;
DROP TABLE locations;
DROP TABLE addresses;

--DROPPING TYPE
DROP TYPE contact_varray_type;
DROP TYPE contact_type;
DROP TYPE address_type;
DROP TYPE social_media_table_type;
DROP TYPE social_media_type;


