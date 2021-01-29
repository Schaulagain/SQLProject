
--@C:\Users\USER\Desktop\dbas\create_5.txt

--CREATING contact_type AS TYPE
CREATE TYPE contact_type AS OBJECT(
office_number VARCHAR2(12),
mobile_number VARCHAR2(12),
fax_number VARCHAR2(10));
/
--Testing for errors
SHOW ERRORS;


--CREATING contact_type AS VARRAY
CREATE OR REPLACE TYPE contact_varray_type AS VARRAY(40) OF contact_type;
/

--CREATING address_type AS VARRAY
CREATE OR REPLACE TYPE address_type AS OBJECT(
street VARCHAR2(25),
city VARCHAR2(20),
country VARCHAR2(20));
/
--Testing for errors
SHOW ERRORS;


--CREATING addresses TABLE
CREATE TABLE addresses OF address_type;

--CREATING social_media_type AS OBJECT
CREATE OR REPLACE TYPE social_media_type AS OBJECT(
facebook VARCHAR2(22),
twitter VARCHAR2(20),
instagram VARCHAR2(20));
/
--Testing for errors
SHOW ERRORS;

--CREATING social_media_table_type AS TABLE TYPE
CREATE TYPE social_media_table_type AS TABLE OF social_media_type;
/

--CREATING location TABLE
CREATE TABLE locations(
location_id	 NUMBER(8) NOT NULL,
location_name VARCHAR2(22),
location_area VARCHAR2(20),
location_address REF address_type SCOPE IS addresses);
--Testing for errors
SHOW ERRORS;
	

--CREATING festival TABLE
CREATE TABLE festivals(
festival_id NUMBER(6) NOT NULL,
location_id NUMBER(8) NOT NULL,
festival_name VARCHAR2(22),
festival_duration NUMBER(6));
--Testing for errors
SHOW ERRORS;


--CREATING location provision TABLE
CREATE TABLE location_provision(
location_provision_id NUMBER(10) NOT NULL,
location_id NUMBER(8) NOT NULL,
provision_type VARCHAR2(20),
price NUMBER(10,2),
quantity NUMBER(10));
--Testing for errors
SHOW ERRORS;

--CREATING festival provision TABLE
CREATE TABLE festival_provision(
festival_provision_id NUMBER(10) NOT NULL,
festival_id NUMBER(6) NOT NULL,
location_provision_id NUMBER(10) NOT NULL,
provision_type VARCHAR2(20),
price NUMBER(10,2),
quantity NUMBER(10));
--Testing for errors
SHOW ERRORS;

--CREATING festival_staff TABLE
CREATE TABLE festival_staff(
staff_id NUMBER(5) NOT NULL,
festival_id NUMBER(6) NOT NULL,
first_name VARCHAR2(20),
last_name VARCHAR2(20),
email VARCHAR2(40),
gender CHAR(1) DEFAULT 'F',
address VARCHAR2(20),
contact contact_varray_type,
date_of_birth DATE,
salary NUMBER(7,2),
date_of_recruitment DATE DEFAULT SYSDATE,
social_media social_media_table_type)
NESTED TABLE social_media STORE AS social_media_table;
--Testing for errors
SHOW ERRORS;