-- ================================
-- HOSPITAL MANAGEMENT SYSTEM
-- ================================

-- --------------------------------------------
-- SECTION 1: TABLE CREATION
-- --------------------------------------------

-- Patients Table
CREATE TABLE Patients(
    pid INT PRIMARY KEY,
    name VARCHAR(30),
    address VARCHAR(20),
    telephone NUMBER(10),
    care_centre_id INT
);

-- Care Centres Table
CREATE TABLE Care_centres(
    cid INT PRIMARY KEY,
    name VARCHAR(20),
    location VARCHAR(30),
    nurse_charge_id INT
);

-- Treatments Table
CREATE TABLE Treatments(
    tid INT PRIMARY KEY,
    patient_id INT,
    physician_id INT,
    treatment_name VARCHAR(30),
    date DATE
);

-- Nurses Table
CREATE TABLE Nurses(
    nid INT PRIMARY KEY,
    name VARCHAR(20),
    care_centre_id INT,
    certificate_type VARCHAR(10),
    telephone NUMBER(10),
    salary NUMBER(20,2)
);

-- Physicians Table
CREATE TABLE Physicians(
    phid INT PRIMARY KEY,
    name VARCHAR(20),
    pager_number INT,
    specialization VARCHAR(20),
    salary NUMBER(20,2)
);

-- --------------------------------------------
-- SECTION 2: INDEXING
-- --------------------------------------------

-- Indexing for Patients
-- Creating indexes for the Patients table
CREATE INDEX idx_patients_pid ON Patients(pid);
CREATE INDEX id_patients_care_centre_id ON Patients(care_centre_id);

-- Creating indexes for the Care_centres table
CREATE INDEX idx_Care_centres_cid ON Care_centres(cid);
CREATE INDEX idx_Care_centres_nurse_charge_id ON Care_centres(nurse_charge_id);

-- Creating indexes for the Treatments table
CREATE INDEX idx_Treatments_tid ON Treatments(tid);
CREATE INDEX idx_Treatments_patient_id ON Treatments(patient_id);
CREATE INDEX idx_Treatments_physician_id ON Treatments(physician_id);

-- Creating indexes for the Nurses table
CREATE INDEX idx_Nurses_nid ON Nurses(nid);
CREATE INDEXidx_ Nurses_care_centre_id ON Nurses(care_centre_id);

-- Creating indexes for the Physicians table
CREATE INDEX idx_Physicians_phid ON Physicians(phid);

-- --------------------------------------------
-- SECTION 3: DATA INSERTION
-- --------------------------------------------

-- Inputting sample data
INSERT INTO Patients(pid, name, address, telephone, care_centre_id)
VALUES (1, 'Bob Easton', '742 Evergreen Terrace', '905-665-7689', 5),
       (2, 'Allison Grace', '124 Conch Street', '905-342-9854', 2),
       (3, 'Olivia Hunston', '29 Acacia Road', '905-124-5489', 2);

INSERT INTO Care_centres(cid, name, location, nurse_charge_id)
VALUES(7, 'Sunnybrook', 'Mississauga', 783), 
      (9, 'Krembil', 'Toronto', 662), 
      (1, 'Sickkids', 'Oakville', 889);

INSERT INTO Treatments(tid,patient_id, physician_id, treatment_name, date)
VALUES(1, 6, 6, 'X-ray test', '2023-04-21'),
      (2, 9, 4, 'General medical checkup', '2023-06-14'),
      (3, 8, 5,'Blood Work Test','2023-08-30');

INSERT INTO Nurses(nid, name, care_centre_id, certificate_type, telephone, salary)
VALUES(783, 'April Robinson', 7, 'RPN', '905-896-321', '87898.00'),
      (662, 'Maggie Garret', 9, 'RN', '905-432-0984', 125007.81),
      (889, 'Greg Allen', 1, 'RN','905-727-6321',  156788.22);

INSERT INTO Physicians(phid, name, pager_number, specialization, salary)
VALUES(1,'Meredith Grey',66, 'Neurosurgery', 2279000.00 ),
      (5,'Ethan Choi', 94, 'Emergency Medicine', 312867.00),
      (7, 'Christina Yang', 67, 'Cardiothoracic Surgery',943904.22);


-- Output content of SQL queries
SELECT * FROM Patients;
SELECT * FROM Care_centres;
SELECT * FROM Treatments;
SELECT * FROM Nurses;
SELECT * FROM Physicians;


-- --------------------------------------------
-- SECTION 4: QUERIES AND VIEWS
-- --------------------------------------------

-- Sample Query: Select all from Patients
SELECT * FROM Patients;

-- Creating view for Patient view
CREATE VIEW PATIENT_VIEW AS
SELECT P.pid AS Patient_Number, P.name AS Patient_Name, C.name AS Care_Centre_Name, N.name AS Nurse_in_Charge,
T.tid AS Treatment_ID, T.treatment_name AS treatment_name, T.physician_id AS Physician_ID, T.date AS DATE
FROM Patients P
JOIN Care_centres C ON P.care_centre_id = C.cid
JOIN Treatments T ON P.pid = T.patient_id
JOIN Nurses N ON C.nurse_charge_id = N.nid
ORDER BY P.pid, T.tid;

