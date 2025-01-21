
create database hospitaldb;
use hospitaldb;

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    DepartmentHead VARCHAR(100)
);
-- Create Patients table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Address VARCHAR(255),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Create Doctors table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Create Appointments table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
-- Create MedicalRecords table
CREATE TABLE MedicalRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Diagnosis TEXT,
    Treatment TEXT,
    RecordDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create Medications table
CREATE TABLE Medications (
    MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(100),
    Description TEXT
);
-- inserting records into departments table
INSERT INTO Departments (DepartmentName, DepartmentHead) VALUES
('Cardiology', 'Dr. John Smith'),
('Neurology', 'Dr. Emily Davis'),
('Orthopedics', 'Dr. Michael Johnson'),
('Pediatrics', 'Dr. Sarah Brown'),
('Dermatology', 'Dr. Lisa Williams');

-- inserting records into patients table
INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Address, DepartmentID) VALUES
('Alice', 'Green', '1980-05-12', 'Female', '555-1234', '123 Maple St', 1),
('Bob', 'White', '1975-08-22', 'Male', '555-5678', '456 Oak St', 2),
('Charlie', 'Brown', '1992-12-05', 'Male', '555-8765', '789 Pine St', 3),
('Diana', 'Blue', '1986-07-14', 'Female', '555-4321', '321 Birch St', 4),
('Eve', 'Black', '1990-11-30', 'Female', '555-6789', '654 Cedar St', 5),
('Frank', 'Gold', '1972-03-20', 'Male', '555-1357', '987 Elm St', 1),
('Grace', 'Silver', '1985-09-03', 'Female', '555-2468', '123 Ash St', 2),
('Henry', 'Red', '1995-02-14', 'Male', '555-8642', '321 Fir St', 3),
('Ivy', 'Pink', '2000-01-11', 'Female', '555-9753', '456 Willow St', 4),
('Jack', 'Yellow', '1983-04-19', 'Male', '555-3579', '789 Maple St', 5),
('Kathy', 'Orange', '1990-06-29', 'Female', '555-2684', '321 Oak St', 1),
('Leo', 'Purple', '1988-10-04', 'Male', '555-7645', '654 Pine St', 2),
('Mona', 'Gray', '1982-02-11', 'Female', '555-4826', '987 Birch St', 3),
('Nate', 'Cyan', '1997-12-17', 'Male', '555-3961', '123 Elm St', 4),
('Olivia', 'Brown', '1987-03-25', 'Female', '555-6192', '456 Cedar St', 5),
('Paul', 'White', '1994-09-09', 'Male', '555-8235', '789 Ash St', 1),
('Quincy', 'Black', '1991-04-13', 'Male', '555-2378', '321 Fir St', 2),
('Rachel', 'Green', '1984-07-29', 'Female', '555-7856', '654 Willow St', 3),
('Steve', 'Red', '1980-12-21', 'Male', '555-8932', '987 Oak St', 4),
('Tina', 'Blue', '1992-06-10', 'Female', '555-9407', '123 Pine St', 5);


-- inserting records into doctors table
INSERT INTO Doctors (FirstName, LastName, Specialization, ContactNumber, DepartmentID) VALUES
('John', 'Smith', 'Cardiologist', '555-1001', 1),
('Emily', 'Davis', 'Neurologist', '555-2002', 2),
('Michael', 'Johnson', 'Orthopedic Surgeon', '555-3003', 3),
('Sarah', 'Brown', 'Pediatrician', '555-4004', 4),
('Lisa', 'Williams', 'Dermatologist', '555-5005', 5),
('Robert', 'Taylor', 'Ophthalmologist', '555-6006', 1),
('Jessica', 'Martinez', 'Gastroenterologist', '555-7007', 2),
('William', 'Harris', 'Oncologist', '555-8008', 3),
('Mary', 'Clark', 'General Surgeon', '555-9009', 4),
('James', 'Lewis', 'Psychiatrist', '555-1010', 5),
('Karen', 'Young', 'Radiologist', '555-1111', 1),
('Richard', 'King', 'Anesthesiologist', '555-1212', 2),
('Patricia', 'Scott', 'Endocrinologist', '555-1313', 3),
('David', 'Adams', 'Pulmonologist', '555-1414', 4),
('Linda', 'Baker', 'Urologist', '555-1515', 5),
('Charles', 'Wilson', 'Nephrologist', '555-1616', 1),
('Angela', 'Turner', 'Obstetrician', '555-1717', 2),
('Mark', 'Green', 'Hematologist', '555-1818', 3),
('Nancy', 'Hall', 'Rheumatologist', '555-1919', 4),
('Kevin', 'Allen', 'Internist', '555-2020', 5);

-- inserting records into appointment table
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime, Status) VALUES
(1, 1, '2025-01-25', '09:00:00', 'Scheduled'),
(2, 2, '2025-01-26', '10:30:00', 'Completed'),
(3, 3, '2025-01-27', '11:00:00', 'Cancelled'),
(4, 4, '2025-01-28', '13:30:00', 'No Show'),
(5, 5, '2025-01-29', '14:00:00', 'Rescheduled'),
(6, 1, '2025-01-30', '15:30:00', 'Scheduled'),
(7, 2, '2025-02-01', '16:00:00', 'Completed'),
(8, 3, '2025-02-02', '09:00:00', 'Cancelled'),
(9, 4, '2025-02-03', '10:00:00', 'No Show'),
(10, 5, '2025-02-04', '11:00:00', 'Rescheduled'),
(11, 1, '2025-02-05', '12:30:00', 'Completed'),
(12, 2, '2025-02-06', '13:30:00', 'Scheduled'),
(13, 3, '2025-02-07', '14:00:00', 'Rescheduled'),
(14, 4, '2025-02-08', '15:00:00', 'Cancelled'),
(15, 5, '2025-02-09', '16:30:00', 'No Show'),
(16, 1, '2025-02-10', '17:00:00', 'Scheduled'),
(17, 2, '2025-02-11', '09:30:00', 'Completed'),
(18, 3, '2025-02-12', '10:00:00', 'Cancelled'),
(19, 4, '2025-02-13', '11:30:00', 'Rescheduled'),
(20, 5, '2025-02-14', '12:00:00', 'Scheduled');


-- inserting records into MedicalRecords table
INSERT INTO MedicalRecords (PatientID, DoctorID, Diagnosis, Treatment, RecordDate) VALUES
(1, 1, 'Hypertension', 'Prescribed beta-blockers', '2025-01-25'),
(2, 2, 'Migraine', 'Prescribed anti-migraine medication', '2025-01-26'),
(3, 3, 'Fracture', 'Cast and pain management', '2025-01-27'),
(4, 4, 'Common cold', 'Rest and fluids', '2025-01-28'),
(5, 5, 'Acne', 'Topical medication', '2025-01-29'),
(6, 1, 'Cataracts', 'Referred for surgery', '2025-01-30'),
(7, 2, 'Irritable Bowel Syndrome', 'Dietary changes and medication', '2025-02-01'),
(8, 3, 'Lung Cancer', 'Chemotherapy', '2025-02-02'),
(9, 4, 'Hernia', 'Surgical repair', '2025-02-03'),
(10, 5, 'Depression', 'Prescribed antidepressants', '2025-02-04'),
(11, 1, 'Fractured rib', 'Pain management', '2025-02-05'),
(12, 2, 'Hypothyroidism', 'Thyroid hormone replacement', '2025-02-06'),
(13, 3, 'Asthma', 'Prescribed inhalers', '2025-02-07'),
(14, 4, 'Kidney Stones', 'Hydration and pain management', '2025-02-08'),
(15, 5, 'Urinary tract infection', 'Antibiotics', '2025-02-09'),
(16, 1, 'Osteoarthritis', 'Joint replacement surgery', '2025-02-10'),
(17, 2, 'Pregnancy', 'Routine prenatal care', '2025-02-11'),
(18, 3, 'Anemia', 'Iron supplements', '2025-02-12'),
(19, 4, 'Rheumatoid arthritis', 'Immunosuppressants', '2025-02-13'),
(20, 5, 'Diabetes', 'Insulin therapy', '2025-02-14');


-- inserting data into the medication table
INSERT INTO Medications (MedicationName, Description) VALUES
('Atenolol', 'Beta-blocker for hypertension'),
('Sumatriptan', 'Medication for migraine relief'),
('Ibuprofen', 'Pain relief for fractures'),
('Paracetamol', 'Pain relief for common cold'),
('Benzoyl Peroxide', 'Topical treatment for acne'),
('Latanoprost', 'Eye drops for cataract management'),
('Loperamide', 'Medication for IBS'),
('Doxorubicin', 'Chemotherapy drug for cancer'),
('Oxycodone', 'Pain relief for hernia'),
('Fluoxetine', 'Antidepressant'),
('Morphine', 'Pain relief for rib fracture'),
('Levothyroxine', 'Thyroid hormone replacement'),
('Albuterol', 'Inhaler for asthma'),
('Tamsulosin', 'Medication for kidney stones'),
('Ciprofloxacin', 'Antibiotic for UTI'),
('Hydrocodone', 'Pain relief for osteoarthritis'),
('Folic acid', 'Prenatal supplement'),
('Iron sulfate', 'Iron supplement for anemia'),
('Methotrexate', 'Immunosuppressant for arthritis'),
('Insulin', 'Hormone therapy for diabetes');


-- - List of patients in each department.
select Patients.FirstName, patients.LastName, Departments.DepartmentName
from patients
left join Departments on Patients.DepartmentID = departments.DepartmentID
order by DepartmentName;

-- Appointments scheduled for a specific doctor.
select patients.FirstName, patients.LastName, appointments.AppointmentDate, appointments.AppointmentTime
from appointments
right join patients on patients.patientID = appointments.patientID
where doctorID = '1';

-- Medical records of a specific patient.
select medicalRecords.diagnosis, medicalRecords.Treatment, medicalRecords.RecordDate, patients.FirstName, 
Patients.LastName, patients.patientID
from medicalRecords
inner join patients on patients.patientID = medicalRecords.patientID
where patients.FirstName = 'Jack';
 -- or
 select medicalRecords.diagnosis, medicalRecords.Treatment, medicalRecords.RecordDate, doctors.FirstName as doctors_First_Name,
 Doctors.LastName as doctors_Last_Name, patients.FirstName as Patients_First_Name, patients.LastName
 from medicalRecords
 inner join doctors on doctors.doctorID = medicalRecords.doctorID
 inner join patients on patients.patientID = medicalRecords.patientID
 where medicalRecords.patientID = '3';

-- Medications prescribed to patients.

-- doctors schedule
select doctors.FirstName, doctors.LastName, appointments.appointmentDate, appointments.appointmentTime
from doctors
left join appointments on doctors.doctorID = appointments.doctorID
where doctors.doctorID = '5';

-- or
select doctors.FirstName, doctors.LastName, appointments.appointmentDate, appointments.appointmentTime
from doctors
left join appointments on doctors.doctorID = appointments.doctorID
order by doctors.doctorID, appointments.appointmentDate, appointments.appointmentTime;


