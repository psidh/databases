 CREATE TABLE Disease (
     s_id INT PRIMARY KEY,
     s_name VARCHAR(100),
     s_description VARCHAR(100)
 );

 CREATE TABLE Doctors (
    d_id INT PRIMARY KEY,
    d_name VARCHAR(100),
    specialization VARCHAR(100),
    contact_info INT
 );


 INSERT INTO Disease(s_id, s_name, s_description) VALUES (1 , 'Ajapi', 'Weakness in knees');
 INSERT INTO Disease(s_id, s_name, s_description) VALUES (2 , 'Fever', 'Raised Body temperature');
 INSERT INTO Disease(s_id, s_name, s_description) VALUES (3 , 'HeartAttack', 'Raised heart beat');
 INSERT INTO Disease(s_id, s_name, s_description) VALUES (4 , 'Tuberculosis', 'Lung Damaged');
 INSERT INTO Disease(s_id, s_name, s_description) VALUES (5 , 'Prostate', 'Damaged Prostate');
 INSERT INTO Disease(s_id, s_name, s_description) VALUES (6 , 'Dermatalosis', 'Hair Damage');
 INSERT INTO Disease(s_id, s_name, s_description) VALUES (7 , 'Diabetes', 'Pancreas Damage');

 INSERT INTO Doctors(d_id, d_name, specialization, contact_info) VALUES (1, 'Ram', 'Tuberculosis', 987654321);
 INSERT INTO Doctors(d_id, d_name, specialization, contact_info) VALUES (2, 'Shyam', 'Prostate', 123456789);
 INSERT INTO Doctors(d_id, d_name, specialization, contact_info) VALUES (3, 'Radha', 'Diabetes', 342435643);
 INSERT INTO Doctors(d_id, d_name, specialization, contact_info) VALUES (4, 'Kashyap', 'Dermatalosis', 9352465643);
 INSERT INTO Doctors(d_id, d_name, specialization, contact_info) VALUES (5, 'Ashish', 'DiabetesII', 8352465643);
 INSERT INTO Doctors(d_id, d_name, specialization, contact_info) VALUES (6, 'Karthik', 'Fever', 8352465649);
 INSERT INTO Doctors(d_id, d_name, specialization, contact_info) VALUES (7, 'Kaushal', 'Lung', 882465649);

 CREATE VIEW Doctor_specialise_disease AS
 SELECT
     d.d_id,
     d.d_name,
     d.specialization,
     d.contact_info
 FROM
     Disease ds
 LEFT JOIN
     Doctors d
 ON
     ds.s_name = d.specialization;

--  answer 1
 SELECT * FROM Doctor_specialise_disease;


 CREATE OR REPLACE PROCEDURE Update_Description (
     p_sid IN NUMBER,
     p_s_description IN VARCHAR2
 ) AS
 BEGIN
    --   Update the s_description in the Disease table
     UPDATE Disease
     SET s_description = p_s_description
     WHERE s_id = p_sid;

    --   Commit the changes
     COMMIT;
 END;
 /


 SELECT * FROM Disease;

 BEGIN
    --   Call the procedure and pass the parameters
     Update_Description(2, 'New description for disease ID 2');
 END;
 /


-- EXEC Update_Description(2, 'new desc');

SELECT * FROM Disease WHERE s_id = 2;


