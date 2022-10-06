CREATE TABLE Patient(
	email varchar(50) PRIMARY KEY,
	password varchar(30) NOT NULL,
	name varchar(50) NOT NULL,
	address varchar(60) NOT NULL,
	gender VARCHAR(20) NOT NULL
);
insert into Patient (email,password,name,address, gender) values ('john@gmail.com','0401aes', 'John','1 Anzac Pde, NSW 2035','M');
insert into Patient (email,password,name,address, gender) values ('anna@gmail.com','dfjbnsdfjk', 'Anna','23 Main St., NY 2049','W');
insert into Patient (email,password,name,address, gender) values ('am30078n@pace.edu','jdndf', 'Aya','4679 11th Ave, NY 20766','W');
insert into Patient (email,password,name,address, gender) values ('kylie@gmail.com','dfbfyerb', 'Kylie','2456 17th Ave, FL 2035','W');
insert into Patient (email,password,name,address, gender) values ('ted@gmail.com','8yvdu', 'Ted','1 Whetherole St, NY 2095','M');
insert into Patient (email,password,name,address, gender) values ('marshall@gmail.com','ednbdh888', 'Marshall','1 Pace Plaza, NY 4567','M');
insert into Patient (email,password,name,address, gender) values ('robin@gmail.com','6dhhd0', 'Robin','23 5th Ave NY 3451','W');
insert into Patient (email,password,name,address, gender) values ('lilyjohn@gmail.com','dhjdb675', 'Lily','45 Ruthvelt Ave, NY 2119','W');
insert into Patient (email,password,name,address, gender) values ('barnie@gmail.com','ajdhhd7', 'Barie','57 Fort Hamilton St., NY 2065','M');
insert into Patient (email,password,name,address, gender) values ('mosby@gmail.com','thdn778', 'Mosby','3 Brighton, NY 2675','M');

SELECT * FROM Patient;

CREATE TABLE MedicalHistory(
	id int PRIMARY KEY,
	date DATE NOT NULL,
	conditions VARCHAR(100) NOT NULL, 
	surgeries VARCHAR(100) NOT NULL, 
	medication VARCHAR(100) NOT NULL
);
INSERT INTO MedicalHistory(id,date,conditions,surgeries,medication)
VALUES 
(1,'2019-01-1','Pain in abdomen','Heart Surgery','Crocin'),
(2,'2020-01-2','Frequent Indigestion','none','none'),
(3,'2020-01-3','Body Pain','none','Iodex'),
(4,'2019-01-4','Breast pain','Breast Surgery','Crocin'),
(5,'2021-01-5','Fatigue','Endocrine Surgery','none'),
(6,'2022-01-6','Weakness','Endocrine Surgery','Iodex'),
(7,'2019-01-7','Pain in abdomen','Heart Surgery','Crocin'),
(8,'2021-01-8','Frequent Indigestion','none','none'),
(9,'2019-01-9','Body Pain','none','Iodex'),
(10,'2022-01-10','Body Pain','none','Iodex')
;

SELECT * FROM MedicalHistory;


CREATE TABLE Doctor(
	email varchar(50) PRIMARY KEY,
	gender varchar(20) NOT NULL,
	password varchar(30) NOT NULL,
	name varchar(50) NOT NULL
);
insert into Doctor (email,gender,password,name) values ('mistry@gmail.com','M','thdn778', 'Dr Mistry');
insert into Doctor (email,gender,password,name) values ('pulen@gmail.com','W','djncbd00', 'Dr Pulen');
insert into Doctor (email,gender,password,name) values ('lukes@gmail.com','M','7dbcn00', 'Dr Lukes');
insert into Doctor (email,gender,password,name) values ('daniel@gmail.com','M','djdjf00', 'Dr Daniel');



CREATE TABLE Appointment(
	id int PRIMARY KEY,
	date DATE NOT NULL,
	starttime TIME NOT NULL,
	endtime TIME NOT NULL,
	status varchar(15) NOT NULL
);

INSERT INTO Appointment(id,date,starttime,endtime,status)
VALUES
(1, '2022-02-15', '09:00', '10:00', 'Done'),
(2, '2022-02-16', '10:00', '11:00', 'Done'),
(3, '2022-02-18', '14:00', '15:00', 'Done'),
(4, '2022-02-19', '09:00', '10:00', 'Done'),
(5, '2022-02-20', '10:00', '11:00', 'Done'),
(6, '2022-02-21', '14:00', '15:00', 'Done'),
(7, '2022-02-22', '09:00', '10:00', 'Done'),
(8, '2022-02-22', '10:00', '11:00', 'Done'),
(9, '2022-02-22', '14:00', '15:00', 'Done'),
(10, '2022-10-11', '14:00', '15:00', 'InProgress')
;

SELECT * FROM Appointment;


CREATE TABLE PatientsAttendAppointments(
	patient varchar(50) NOT NULL,
	appt int NOT NULL,
	concerns varchar(40) NOT NULL,
	symptoms varchar(40) NOT NULL,
	FOREIGN KEY (patient) REFERENCES Patient (email) ON DELETE CASCADE,
	FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
	PRIMARY KEY (patient, appt)
);

INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('john@gmail.com',1, 'none', 'itchy throat'),
('anna@gmail.com',2, 'infection', 'fever'),
('am30078n@pace.edu',3, 'nausea', 'fever'),
('kylie@gmail.com',4, 'nausea', 'breast pain'),
('ted@gmail.com',5, 'cough', 'fever'),
('marshall@gmail.com',6, 'headaches', 'fever'),
('robin@gmail.com',7, 'muscle pain', 'itchy throat'),
('lilyjohn@gmail.com',8, 'sore throat', 'fever'),
('barnie@gmail.com',9, 'nausea', 'fever'),
('mosby@gmail.com',10, 'nausea', 'fever')
;

SELECT * FROM PatientsAttendAppointments;


CREATE TABLE Schedule(
	id int NOT NULL ,
	starttime TIME NOT NULL,
	endtime TIME NOT NULL,
	breaktime TIME NOT NULL,
	day varchar(20) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO Schedule(id,starttime,endtime,breaktime,day)
VALUES
(001,'09:00','17:00','12:00','Tuesday'),
(002,'09:00','17:00','12:00','Saturday'),
(003,'09:00','17:00','12:00','Wednesday'),
(004,'09:00','17:00','12:00','Monday')
;
SELECT * FROM Schedule;

CREATE TABLE PatientsFillHistory(
	patient varchar(50) NOT NULL,
	history int NOT NULL,
	FOREIGN KEY (patient) REFERENCES Patient (email) ON DELETE CASCADE,
	FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
	PRIMARY KEY (history)
);

INSERT INTO PatientsFillHistory(patient,history)
VALUES
('john@gmail.com',1),
('anna@gmail.com',2),
('am30078n@pace.edu',3),
('kylie@gmail.com',4),
('ted@gmail.com',5),
('marshall@gmail.com',6),
('robin@gmail.com',7),
('lilyjohn@gmail.com',8),
('barnie@gmail.com',9),
('mosby@gmail.com',10)
;

SELECT* FROM PatientsFillHistory;

CREATE TABLE Diagnose(
	appt int NOT NULL,
	doctor varchar(50) NOT NULL,
	diagnosis varchar(40) NOT NULL,
	prescription varchar(50) NOT NULL,
	FOREIGN KEY (appt) REFERENCES Appointment (id) ON DELETE CASCADE,
	FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
	PRIMARY KEY (appt, doctor)
);

INSERT INTO Diagnose(appt,doctor,diagnosis,prescription)
VALUES
(1,'mistry@gmail.com', 'Bloating', 'Ibuprofen as needed'),
(2,'pulen@gmail.com', 'Muscle soreness', 'Stretch morning/night'),
(3,'lukes@gmail.com', 'Vitamin Deficiency', 'Good Diet'),
(4, 'daniel@gmail.com', 'Pneumonia', 'Ibuprofen'),
(5,'mistry@gmail.com', 'Bloating', 'Ibuprofen as needed'),
(6,'pulen@gmail.com', 'Muscle soreness', 'Stretch morning/night'),
(7,'lukes@gmail.com', 'Vitamin Deficiency', 'Good Diet'),
(8, 'daniel@gmail.com', 'Pneumonia', 'Ibuprofen'),
(9,'mistry@gmail.com', 'Bloating', 'Ibuprofen as needed'),
(10,'pulen@gmail.com', 'Muscle soreness', 'Stretch morning/night')
;

SELECT * FROM Diagnose;

CREATE TABLE DocsHaveSchedules(
	sched int NOT NULL,
	doctor varchar(50) NOT NULL,
	FOREIGN KEY (sched) REFERENCES Schedule (id) ON DELETE CASCADE,
	FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
	PRIMARY KEY (sched, doctor)
	);

INSERT INTO DocsHaveSchedules(sched,doctor)
VALUES
(001,'mistry@gmail.com'),
(002,'pulen@gmail.com'),
(003, 'lukes@gmail.com'),
(004, 'daniel@gmail.com')
;
SELECT * FROM DocsHaveSchedules;

CREATE TABLE DoctorViewsHistory(
	history int NOT NULL,
	doctor varchar(50) NOT NULL,
	FOREIGN KEY (doctor) REFERENCES Doctor (email) ON DELETE CASCADE,
	FOREIGN KEY (history) REFERENCES MedicalHistory (id) ON DELETE CASCADE,
	PRIMARY KEY (history, doctor)
);
INSERT INTO DoctorViewsHistory(history,doctor)
VALUES
(1,'mistry@gmail.com'),
(2,'pulen@gmail.com'),
(3, 'lukes@gmail.com'),
(4, 'daniel@gmail.com'),
(5,'mistry@gmail.com'),
(6,'pulen@gmail.com'),
(7, 'lukes@gmail.com'),
(8, 'daniel@gmail.com'),
(9, 'lukes@gmail.com'),
(10, 'daniel@gmail.com')
;
SELECT * FROM DoctorViewsHistory;

CREATE TABLE Paycheck(
	cheque_number INT NOT NULL PRIMARY KEY,
	doctor Varchar(100) NOT NULL,
	salary FLOAT,
	bonus FLOAT,
	pay_date DATE,
	FOREIGN KEY(doctor) REFERENCES Doctor(email),
	CHECK(Salary>=0 AND Bonus>=0)
);
insert into Paycheck values(101,'mistry@gmail.com', 11934.43, 3188.33, '7/31/2020');
insert into Paycheck values(102,'pulen@gmail.com', 7839.88, 4350.22, '8/31/2020');
insert into Paycheck values(103,'lukes@gmail.com', 6180.097, 5497.75, '8/31/2020');
insert into Paycheck values(104,'daniel@gmail.com', 8013.878, 3129.58, '6/30/2021');
insert into Paycheck values(105,'daniel@gmail.com', 6443.145, 6164.45, '5/31/2020');
insert into Paycheck values(106,'mistry@gmail.com', 7563.87, 5421.22, '7/31/2022');
insert into Paycheck values(107,'pulen@gmail.com', 10216.875, 7544.225, '7/31/2020');
insert into Paycheck values(108,'lukes@gmail.com', 7640.142, 5190.252, '6/30/2021');

SELECT * FROM Paycheck;
-------------------------------------------------------------------------------------
/* How many total doctors in this hospital */
SELECT COUNT(*) FROM doctor;

/* What about gender distribution of doctors? */
SELECT gender, COUNT(*) AS total_employees
FROM doctor
GROUP BY gender;

/* What about gender distribution of patients? */
SELECT gender, COUNT(*) AS total_patients
FROM Patient
GROUP BY gender;

------------------------------------VIEWS-----------------------------------------------------------------
----------------------------View to display patients history----------------------------------------------
CREATE VIEW PatientHistory
AS
SELECT PT.email, PT.name AS Patient_Name, PT.Gender, MH.surgeries, MH.medication, MH.conditions
FROM Patient AS PT
	 INNER JOIN PatientsFillHistory AS PM
		ON PT.email = PM.patient
	 INNER JOIN MedicalHistory AS MH
		ON MH.id = PM.history
	
Select * from PatientHistory;



CREATE VIEW ACCESSPatientHistoryApponment
AS
SELECT D.name AS Doctors_Name,PT.name AS Patient_name, AP.date AS Appoinment_date, AP.status AS Appoinment_Status, MH.conditions AS Patient_condition,MH.surgeries AS Patient_surgeries, MH.medication AS Patient_medication
FROM Doctor AS D
	 INNER JOIN Diagnose AS Diagnose
		ON D.email = Diagnose.doctor
	 INNER JOIN Appointment AS AP
		ON Diagnose.appt = AP.id
	 INNER JOIN DoctorViewsHistory AS DH
	 	ON D.email = DH.doctor
	 INNER JOIN MedicalHistory AS MH
	 	ON DH.history = MH.id
	 INNER JOIN PatientsAttendAppointments AS PAA
	 	ON AP.id = PAA.appt
	 INNER JOIN Patient AS PT
	 	ON PT.email = PAA.patient
	 
	 
	 
Select * from ACCESSPatientHistoryApponment;




----------------Stored Procedure to return a list of Paychecks associated with a doctor---------------------
--------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE GetDoctorPayChecks 
(doctor_email VARCHAR(50))
AS
BEGIN
SELECT Doctor.email, Doctor.name AS Doctor_Name, cheque_number, salary, bonus, pay_date  
FROM Doctor 
	 INNER JOIN Paycheck
	 ON Doctor.email = Paycheck.doctor
	 WHERE Doctor.email = doctor_email
	 ORDER BY pay_date
END;


EXEC GetDoctorPayChecks '101';

