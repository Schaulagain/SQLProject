--@C:\Users\USER\Desktop\dbas\alter_5.txt

--ADDING PRIMARY KEY IN THE TABLES

--ADDING primary key in the location table
ALTER TABLE locations
ADD CONSTRAINT pk_locations
PRIMARY KEY (location_id);

--ADDING primary key constraint in the festival table
ALTER TABLE festivals
ADD CONSTRAINT pk_festivals
PRIMARY KEY (festival_id);

--ADDING primary key in the location_provision table
ALTER TABLE location_provision
ADD CONSTRAINT pk_location_provision
PRIMARY KEY (location_provision_id);

--ADDING primary key in the festival_staff table
ALTER TABLE festival_staff
ADD CONSTRAINT pk_festival_staff
PRIMARY KEY (staff_id);

--ADDING Primary key in the festival_provision table
ALTER TABLE festival_provision
ADD CONSTRAINT pk_festival_provision
PRIMARY KEY (location_provision_id,festival_id);


--ADDING FOREIGN KEY IN THE TABLES

--ADDING foreign key in the festival table
ALTER TABLE festivals
ADD CONSTRAINT fk_f_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id);

--ADDING foreign key in the location_provision table
ALTER TABLE location_provision
ADD CONSTRAINT fk_lp_locations
FOREIGN KEY (location_id)
REFERENCES locations(location_id);

--ADDING foreign key in the festival_staff table
ALTER TABLE festival_staff
ADD CONSTRAINT fk_fs_festivals
FOREIGN KEY (festival_id)
REFERENCES festivals(festival_id);

--ADDING foreign key in the festival_provision table
ALTER TABLE festival_provision
ADD CONSTRAINT fk_fp_festivals
FOREIGN KEY (festival_id)
REFERENCES festivals(festival_id);

ALTER TABLE festival_provision
ADD CONSTRAINT fk_fp_location_provision
FOREIGN KEY (location_provision_id)
REFERENCES location_provision(location_provision_id);


--ADDING UNIQUE KEY IN THE TABLES

--ADDING unique key in the table festival_staff
ALTER TABLE festival_staff
ADD constraint u_email
UNIQUE(email);


--ADDING CHECK IN CONSTRAINTS IN THE TABLES

--CHECKING UPPER constraint for first_name of festival_staff
ALTER TABLE festival_staff
ADD CONSTRAINT ck_first_name
CHECK (first_name = UPPER(first_name));

--CHECKING UPPER constraint for last_name of festival_staff
ALTER TABLE festival_staff
ADD CONSTRAINT ck_last_name
CHECK (last_name = UPPER(last_name));

--CHECKING constraint for gender of festival_staff
ALTER TABLE festival_staff
ADD CONSTRAINT ck_gender
CHECK(gender IN('F','M'));

--CHECKING constraint for festival_duration in the table festivals
ALTER TABLE festivals
ADD CONSTRAINT ck_festival_duration
CHECK (festival_duration IN ('2','3','4'));
