
--- *************************************************************************************************
--- ***         INSERT STATEMENTS                                                                 ***
--- ***                        update statements are below                                        ***
--- *************************************************************************************************

-- physicians:
INSERT INTO physicians (name, pager_number, specialization, salary)
VALUES ('Dr. Alice Morgan', '613-555-2010', 'Cardiology', 185000);

INSERT INTO physicians (name, pager_number, specialization, salary)
VALUES ('Dr. Brian Chen', '613-555-2020', 'Neurology', 192000);

INSERT INTO physicians (name, pager_number, specialization, salary)
VALUES ('Dr. Sarah Patel', '613-555-2030', 'Orthopedics', 178000);

--- car centers:
INSERT INTO care_centers (name, location, nurse_charge_id)
VALUES ('Riverside Clinic', 'Riverside South', NULL);

INSERT INTO care_centers (name, location, nurse_charge_id)
VALUES ('Maple Health Unit', 'Barrhaven', NULL);

INSERT INTO care_centers (name, location, nurse_charge_id)
VALUES ('Capital Care Centre', 'Orleans', NULL);

--- Nurses:
INSERT INTO nurses (name, care_center_id, certificate_type, telephone, salary)
VALUES ('Nurse Emily Ross', 1, 'RN', '613-555-3010', 82000);

INSERT INTO nurses (name, care_center_id, certificate_type, telephone, salary)
VALUES ('Nurse Jacob Hill', 2, 'RPN', '613-555-3020', 76000);

INSERT INTO nurses (name, care_center_id, certificate_type, telephone, salary)
VALUES ('Nurse Olivia Grant', 3, 'RN', '613-555-3030', 83000);

--- Reference fixes:
UPDATE care_centers SET nurse_charge_id = 1 WHERE cid = 1;

UPDATE care_centers SET nurse_charge_id = 2 WHERE cid = 2;

UPDATE care_centers SET nurse_charge_id = 3 WHERE cid = 3;

--- Patients:
INSERT INTO patients (name, address, telephone, care_center_id)
VALUES ('John Matthews', '12 Oak Street, Kanata', '613-555-4010', 1);

INSERT INTO patients (name, address, telephone, care_center_id)
VALUES ('Linda Park', '88 Pine Avenue, Nepean', '613-555-4020', 2);

INSERT INTO patients (name, address, telephone, care_center_id)
VALUES ('Carlos Rivera', '55 Elm Crescent, Orleans', '613-555-4030', 3);

--- Treatments:
INSERT INTO treatments (patient_id, physician_id, treatment_name, date)
VALUES (1, 1, 'Cardiac Stress Test', DATE '2026-09-15');

INSERT INTO treatments (patient_id, physician_id, treatment_name, date)
VALUES (2, 2, 'Neurological Assessment', DATE '2026-09-18');

INSERT INTO treatments (patient_id, physician_id, treatment_name, date)
VALUES (3, 3, 'Knee Joint Evaluation', DATE '2026-09-20');

INSERT INTO treatments (patient_id, physician_id, treatment_name, date)
VALUES (1, 3, 'Orthopedic Follow-up', DATE '2026-10-01');




--- *************************************************************************************************
--- ***         SELECT STATEMENTS                                                                 ***
--- *************************************************************************************************

--- * generic select from each table
select * from patients;
select * from treatments;
select * from care_centers;
select * from nurses;
select * from physicians;

--- * all patients treatments for last year and where, by whom
select pat.name, t.treatment_name, t.date, cc.name, phys.name, n.name from treatments t
inner join patients pat on t.patient_id = pat.pid
inner join physicians phys on t.physician_id = phys.phid
inner join care_centers cc on pat.care_center_id = cc.cid
inner join nurses n on cc.nurse_charge_id = n.nid
where t.date > sysdate - 365
