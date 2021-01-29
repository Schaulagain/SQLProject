--@C:\Users\USER\Desktop\dbas\insert_5.txt

--INSERTING INTO ADDRESSES OBJECT TABLE

INSERT INTO addresses
VALUES('512 BIRCH HILL', 'WOODHAVEN', 'US');

INSERT INTO addresses
VALUES('384 WRANGLER', 'APOPKA', 'US');

INSERT INTO addresses(street, city, country)
VALUES('7925 GRANT', 'NASHVILLE', 'US');

INSERT INTO addresses(street, city, country)
VALUES('424 SHADY LANE', 'BLUFFTON', 'UK');

--INSERTING INTO LOCATION TABLE
INSERT INTO locations(location_id, location_name, location_area)
VALUES(seq_locations.NEXTVAL, 'VERTTOWN', '300');

--UPDATING
UPDATE locations l SET location_address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street = '512 BIRCH HILL'
	 )
WHERE l.location_id=100 ;

INSERT INTO locations(location_id, location_name, location_area)
VALUES (seq_locations.NEXTVAL, 'WINDHELM', '420');

--UPDATING
UPDATE locations l SET location_address = 
	(SELECT REF(a) FROM addresses a
	WHERE a.street = '384 WRANGLER'
	 )
WHERE l.location_id=101 ;

INSERT INTO locations
SELECT seq_locations.NEXTVAL, 'ALDBOURN', '201', REF(a)
FROM addresses a
WHERE a.street = '7925 GRANT';


INSERT INTO locations(location_id, location_name, location_area, location_address)
SELECT seq_locations.NEXTVAL, 'WINTERWAY', '690', REF(a)
FROM addresses a;

--INSERTING INTO FESTIVALS
INSERT INTO festivals
VALUES(seq_festivals.NEXTVAL, 100, 'FOOD FESTIVAL', 4);

INSERT INTO festivals
VALUES(seq_festivals.NEXTVAL, 101, 'MUSIC FESTIVAL', 3);

INSERT INTO festivals(festival_id, location_id, festival_name, festival_duration)
VALUES(seq_festivals.NEXTVAL, 102, 'CULTURAL FESTIVAL', 2);

INSERT INTO festivals(festival_id, location_id, festival_name, festival_duration)
VALUES(seq_festivals.NEXTVAL, 103, 'FILM FESTIVAL', 2);

--INSERTING INTO LOCATION_PROVISION
INSERT INTO location_provision
VALUES(seq_location_provision.NEXTVAL, 100, 'FREE', 0, 4);

INSERT INTO location_provision
VALUES(seq_location_provision.NEXTVAL, 101, 'FREE', 0, 10);

INSERT INTO location_provision(location_provision_id, location_id, provision_type, price, quantity)
VALUES(seq_location_provision.NEXTVAL, 101, 'PAID', 3000.00, 5);

INSERT INTO location_provision(location_provision_id, location_id, provision_type, price, quantity)
VALUES(seq_location_provision.NEXTVAL, 102, 'PAID', 5000.00, 2);

--INSERTING INTO FESTIVAL_PROVISION
INSERT INTO festival_provision
VALUES(seq_festival_provision.NEXTVAL, 100, 100, 'FOOD', 2000.00, 500); 

INSERT INTO festival_provision
VALUES(seq_festival_provision.NEXTVAL, 101, 101, 'DRINK', 1500.00, 2000); 

INSERT INTO festival_provision(festival_provision_id, festival_id, location_provision_id, provision_type, price, quantity)
VALUES(seq_festival_provision.NEXTVAL, 102, 102, 'TENT', 1500.00, 300); 

INSERT INTO festival_provision(festival_provision_id, festival_id, location_provision_id, provision_type, price, quantity)
VALUES(seq_festival_provision.NEXTVAL, 103, 103, 'TRANSPORT', 1700.00, 200); 

--INSERTING INTO STAFFS
INSERT INTO festival_staff
VALUES(seq_festival_staff.NEXTVAL, 100, 'JOSEPH', 'HARPER', 'JHARPER@YAHOO.COM', 'M', '543 ATLANTIC STREET',
contact_varray_type(
	 contact_type('833-9460', '997-2876', '379-5104')), '20-JAN-1900', 80000.02, '01-APRIL-2005', 
social_media_table_type(
	social_media_type('JHARPER123', 'JHARPER231', 'JHARPER321')));
	
	
INSERT INTO festival_staff
VALUES(seq_festival_staff.NEXTVAL, 101, 'MARGARET', 'ROSS', 'MROSS@YAHOO.COM', 'F', '399 LITTLE ACRES',
contact_varray_type(
	 contact_type('891-1002', '996-9860', '965-3026')), '02-FEB-1988', 50000.00, '02-APRIL-2015',
social_media_table_type(
	social_media_type('MROSS123', 'MROSS231', 'MROSS321')));	
	   

INSERT INTO festival_staff(staff_id, festival_id, first_name, last_name, email, gender, address, contact, date_of_birth, salary, date_of_recruitment, social_media)
VALUES(seq_festival_staff.NEXTVAL, 102, 'MATTEW', 'MARTIN', 'MMARTIN@YAHOO.COM', 'M', '12 ARCHWOOD AVENUE',
contact_varray_type(
	 contact_type('663-4790', '468-2497', '858-6237')), '14-JUN-1980',  6000.04, '03-APRIL-2017',
social_media_table_type(
	social_media_type('MMARTIN123', 'MMARTIN231', 'MMARTIN321')));
		
		
INSERT INTO festival_staff(staff_id, festival_id, first_name, last_name, email, gender, address, contact, date_of_birth, salary, date_of_recruitment, social_media)
VALUES(seq_festival_staff.NEXTVAL, 103, 'CHRISTINE', 'SMITH', 'CSMITH@YAHOO.COM', 'F', '39 HARTLAND AVENUE',
contact_varray_type(
	 contact_type('251-1713', '396-5893', '281-8509')), '20-AUG-1977', 42000.00, '04-APRIL-2016',
social_media_table_type(
	social_media_type('CSMITH123', 'CSMITH231', 'CSMITH321')));		

--INSERTING into location_provision using & and &&
INSERT INTO location_provision(location_provision_id, location_id, provision_type, price, quantity)
VALUES(seq_location_provision.NEXTVAL, &location_id,'&&provision_type', &price, &quantity);

COMMIT;






