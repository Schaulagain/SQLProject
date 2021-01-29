--@C:\Users\USER\Desktop\dbas\test_script_triggers.txt

--TESTING trig_email_validation 
SELECT * FROM festival_staff;
--4 rows selected


--INSERTING into festival_staff
INSERT INTO festival_staff(staff_id, festival_id, first_name, last_name, email)
VALUES(seq_festival_staff.NEXTVAL, 102, 'RB', 'SMITH', 'RBgmail.COM');
--ERROR-email is invalid!

INSERT INTO festival_staff(staff_id, festival_id, first_name, last_name, email)
VALUES(seq_festival_staff.NEXTVAL, 100, 'RB', 'SMITH', 'RBB@gmail.COM');
--Inserted successfully!

SELECT * FROM festival_staff;
--5 rows selected



--testing for salary more than 50000

--INSERTING into festival_staff
INSERT INTO festival_staff(staff_id, festival_id, first_name, last_name, email, salary)
VALUES(111, 100, 'RAM', 'SHRESTHA', 'RAM@gmail.COM', 60000.00);
--Inserted successfully!

--INSERTING into festival_staff
INSERT INTO festival_staff(staff_id, festival_id, first_name, last_name, email, salary)
VALUES(112, 100, 'RITA', 'SHRESTHA', 'RITASHRESTHA@gmail.COM', 40000.00);
--ERROR-Staff cannot have salary more than 50,000



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

-- Testing of trig_date_of_recruitment

UPDATE festival_staff SET date_of_recruitment = '17-OCT-2000' 
WHERE first_name = 'CHRISTINE';
--valid date!


UPDATE festival_staff SET date_of_recruitment = '01-DEC-2019' 
WHERE first_name = 'RAMU';	
-- invalid test : ERROR-DATE OF RECRUITMENT should be less than current date.




--TESTING trig_logon_event_schema_table
SELECT * FROM event_schema_table;
DISCONNECT;
connect C##a
--connected




--TESTING trig_logoff_event_schema_table
SELECT * FROM event_schema_table;
--LOGOFF                                                   20-APR-19

WHERE festival_id =118;
--Data is deleted by C## in the festivals table
