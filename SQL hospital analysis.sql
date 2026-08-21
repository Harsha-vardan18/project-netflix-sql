drop database Analysis;
create database HospitalDB;
USE HospitalDB;
show tables;
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    gender VARCHAR(10),
    department_id INT,
    experience_years INT,
    consultation_fee DECIMAL(8,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
show tables;
select*from departments;
select*from Doctors;
INSERT INTO Doctors VALUES
(101,'Dr. Amit Sharma','Male',1,15,1200),
(102,'Dr. Sneha Reddy','Female',2,11,1400),
(103,'Dr. Karan Mehta','Male',3,8,900),
(104,'Dr. Anjali Rao','Female',4,13,1000),
(105,'Dr. Vikram Singh','Male',5,9,800),
(106,'Dr. Neha Kapoor','Female',6,12,700),
(107,'Dr. Rohan Gupta','Male',7,10,850),
(108,'Dr. Pooja Nair','Female',8,14,1100),
(109,'Dr. Arjun Patel','Male',1,7,1000),
(110,'Dr. Meera Joshi','Female',6,16,900);
select*from Doctors;
CREATE TABLE Patients (
patient_id INT PRIMARY KEY,
patient_name VARCHAR(100),
gender VARCHAR(10),
age INT,
blood_group VARCHAR(5),
city VARCHAR(50),
phone VARCHAR(15),
registration_date DATE
);
INSERT INTO Patients VALUES
(201,'Aarav Sharma','Male',24,'B+','Hyderabad','9876543210','2024-01-10'),
(202,'Priya Reddy','Female',32,'O+','Hyderabad','9876543211','2024-01-14'),
(203,'Rahul Verma','Male',41,'A+','Bengaluru','9876543212','2024-01-18'),
(204,'Sneha Kapoor','Female',28,'AB+','Chennai','9876543213','2024-01-20'),
(205,'Karan Singh','Male',36,'O-','Mumbai','9876543214','2024-02-01'),
(206,'Ananya Rao','Female',22,'A+','Pune','9876543215','2024-02-03'),
(207,'Rohit Kumar','Male',48,'B+','Delhi','9876543216','2024-02-08'),
(208,'Meera Joshi','Female',55,'AB-','Hyderabad','9876543217','2024-02-15'),
(209,'Vikram Patel','Male',30,'O+','Ahmedabad','9876543218','2024-02-20'),
(210,'Pooja Nair','Female',26,'A-','Kochi','9876543219','2024-02-25'),
(211,'Arjun Das','Male',34,'B-','Kolkata','9876543220','2024-03-02'),
(212,'Divya Iyer','Female',29,'O+','Chennai','9876543221','2024-03-05'),
(213,'Siddharth Jain','Male',44,'A+','Jaipur','9876543222','2024-03-10'),
(214,'Nisha Gupta','Female',39,'B+','Lucknow','9876543223','2024-03-12'),
(215,'Aditya Mishra','Male',27,'AB+','Indore','9876543224','2024-03-15'),
(216,'Kavya Reddy','Female',31,'O-','Hyderabad','9876543225','2024-03-20'),
(217,'Harsh Vardhan','Male',37,'A+','Nagpur','9876543226','2024-03-24'),
(218,'Neha Sharma','Female',23,'B+','Delhi','9876543227','2024-03-28'),
(219,'Mohit Arora','Male',51,'O+','Pune','9876543228','2024-04-01'),
(220,'Ritika Singh','Female',33,'AB+','Mumbai','9876543229','2024-04-05'),

(221,'Yash Patel','Male',40,'A-','Surat','9876543230','2024-04-10'),
(222,'Ishita Roy','Female',25,'B+','Kolkata','9876543231','2024-04-14'),
(223,'Nitin Kumar','Male',46,'O+','Hyderabad','9876543232','2024-04-18'),
(224,'Ayesha Khan','Female',35,'A+','Bhopal','9876543233','2024-04-21'),
(225,'Gaurav Sharma','Male',29,'AB-','Noida','9876543234','2024-04-24'),
(226,'Simran Kaur','Female',42,'O-','Chandigarh','9876543235','2024-04-27'),
(227,'Manoj Yadav','Male',38,'B+','Patna','9876543236','2024-05-02'),
(228,'Shruti Menon','Female',27,'A+','Kochi','9876543237','2024-05-08'),
(229,'Deepak Soni','Male',50,'O+','Jaipur','9876543238','2024-05-12'),
(230,'Riya Verma','Female',21,'B-','Hyderabad','9876543239','2024-05-15');

show tables;
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    disease VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    payment_mode VARCHAR(30),
    status VARCHAR(20),
    rating INT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
INSERT INTO Appointments VALUES
(301,201,101,'2024-06-01','Chest Pain',8500,'Insurance','Completed',5),
(302,202,106,'2024-06-01','Fever',1200,'Cash','Completed',4),
(303,203,102,'2024-06-02','Migraine',3500,'UPI','Completed',5),
(304,204,104,'2024-06-02','Child Vaccination',1800,'Credit Card','Completed',5),
(305,205,103,'2024-06-03','Fracture',15000,'Insurance','Completed',4),
(306,206,105,'2024-06-03','Skin Allergy',2200,'Cash','Completed',4),
(307,207,106,'2024-06-04','Diabetes',2500,'UPI','Completed',5),
(308,208,101,'2024-06-04','Heart Checkup',6500,'Insurance','Completed',5),
(309,209,107,'2024-06-05','Sinus Infection',1700,'Cash','Completed',3),
(310,210,108,'2024-06-05','Pregnancy Checkup',4000,'UPI','Completed',5),
(311,211,103,'2024-06-06','Back Pain',3200,'Debit Card','Completed',4),
(312,212,104,'2024-06-06','Viral Fever',1500,'Cash','Completed',4),
(313,213,102,'2024-06-07','Brain MRI Consultation',5000,'Insurance','Completed',5),
(314,214,101,'2024-06-07','High BP',2800,'UPI','Completed',4),
(315,215,105,'2024-06-08','Acne Treatment',2600,'Cash','Completed',5),
(316,216,108,'2024-06-08','Pregnancy Checkup',4200,'Insurance','Completed',5),
(317,217,103,'2024-06-09','Knee Pain',3900,'Credit Card','Completed',4),
(318,218,107,'2024-06-09','Ear Infection',1800,'Cash','Completed',3),
(319,219,106,'2024-06-10','Diabetes',2400,'UPI','Completed',4),
(320,220,101,'2024-06-10','Heart Checkup',7200,'Insurance','Completed',5),
(321,221,102,'2024-06-11','Migraine',3300,'Debit Card','Completed',4),
(322,222,104,'2024-06-11','Child Fever',1300,'Cash','Completed',5),
(323,223,101,'2024-06-12','Chest Pain',9200,'Insurance','Completed',5),
(324,224,108,'2024-06-12','Pregnancy Checkup',3800,'UPI','Completed',5),
(325,225,105,'2024-06-13','Psoriasis',3100,'Cash','Completed',4),
(326,226,106,'2024-06-13','Thyroid',2700,'Debit Card','Completed',4),
(327,227,103,'2024-06-14','Shoulder Pain',3600,'UPI','Completed',4),
(328,228,104,'2024-06-14','Vaccination',1700,'Cash','Completed',5),
(329,229,102,'2024-06-15','Vertigo',4500,'Insurance','Completed',4),
(330,230,105,'2024-06-15','Skin Infection',2000,'Cash','Completed',5),
(331,201,106,'2024-07-01','Diabetes',2400,'UPI','Completed',5),
(332,202,101,'2024-07-02','Heart Checkup',6800,'Insurance','Completed',5),
(333,203,103,'2024-07-02','Back Pain',3400,'Cash','Completed',4),
(334,204,105,'2024-07-03','Skin Allergy',2100,'UPI','Completed',4),
(335,205,103,'2024-07-03','Fracture Follow-up',1800,'Insurance','Completed',5),
(336,206,106,'2024-07-04','Fever',1400,'Cash','Completed',4),
(337,207,102,'2024-07-04','Headache',2600,'Debit Card','Completed',4),
(338,208,101,'2024-07-05','ECG Review',5500,'Insurance','Completed',5),
(339,209,107,'2024-07-05','Sinus Infection',1600,'Cash','Cancelled',NULL),
(340,210,108,'2024-07-06','Pregnancy Checkup',4100,'Insurance','Completed',5),
(341,211,103,'2024-07-06','Back Pain',3000,'UPI','Completed',4),
(342,212,104,'2024-07-07','Viral Fever',1400,'Cash','Completed',4),
(343,213,102,'2024-07-07','Migraine',3400,'Insurance','Pending',NULL),
(344,214,101,'2024-07-08','Heart Checkup',7600,'Insurance','Completed',5),
(345,215,105,'2024-07-08','Skin Rash',1800,'Cash','Completed',4),
(346,216,108,'2024-07-09','Pregnancy Scan',6000,'Insurance','Completed',5),
(347,217,103,'2024-07-09','Joint Pain',3700,'Debit Card','Completed',4),
(348,218,107,'2024-07-10','Ear Pain',1500,'Cash','Completed',3),
(349,219,106,'2024-07-10','Diabetes Review',2300,'UPI','Completed',5),
(350,220,101,'2024-07-11','Heart Checkup',8100,'Insurance','Completed',5);
  
  
  ## Question 1 :Display all details of every patient registered in the hospital.
  select*from patients;
  ##Question 2 :Display only the patient name, age, and city of all patients.
  select patient_name,age,city 
  from patients;
##Question 3 :Display the details of all doctors
select*from Doctors;
## Question 4:Display all unique cities where patients are registered
select distinct city from patients;
## Question 5:Display all appointments sorted by appointment date in ascending order.
select*from Appointments order by appointment_date  asc;
## Question6: Display the five most recently registered patients.
select * 
from patients
 order by registration_date DESC
 LIMIT 5 ;
##Question 7:Display the names of doctors along with their consultation fees.
select doctor_name,consultation_fee from Doctors;
## Question 8:Display all departments available in the hospital.
select Distinct department_name from departments ;
##Question 9:Display all completed appointments.
select status from appointments;
## Question 10: all appointments with their treatment cost sorted from highest to lowest.
select *from appointments order by treatment_cost  desc;  
## Question 11:Display patients who are older than 40 years.
select *from patients 
where age>40;
## Question 12:Display doctors having more than 10 years of experience.
select * from doctors where experience_years>10;
## Question 13:Display appointments where the treatment cost is greater than ₹5,000.
select* from appointments where treatment_cost>5000;
## Question 14:Display patients belonging to Hyderabad.
select*from patients where city='Hyderabad';
### Question 15:Display appointments paid using Insurance.
select*from appointments  WHERE payment_mode='insurance';
## Question 16:Display patients whose age is between 25 and 40 years.
select * from patients where age between 25 and 40;
## Question 17:Display doctors whose consultation fee is either ₹900 or ₹1,000.
select *from doctors where consultation_fee =900 or 1000;
##Question 18:Display patients whose names start with the letter 'A'.
select patient_name from patients where patient_name  LIKE 'A%';
## Question 19:Display appointments that are either Pending or Cancelled.
select *
FROM appointments
WHERE status IN ('Pending', 'Cancelled');
## Question 24:Find the highest treatment cost recorded.
select MAX(treatment_cost) from appointments;
## Question 25:Find the minimum consultation fee charged by any doctor
select MIN(consultation_fee) from Doctors;
## Question 26:Calculate the total treatment cost collected from completed appointments.
select sum( treatment_cost)
 from appointments
 where status='completed';
 ## Question 27:Find the average treatment cost of completed appointments.
 select avg(treatment_cost) from appointments where status ='completed';

## Question 28:Find the total number of completed appointments.

select count(appointment_id)  from appointments WHERE STATUS ='COMPLETED';
## Question 29:Find the average age of patients.
select avg(age) from patients;
## Question 30:Find the total revenue generated through Insurance payments.
SELECT SUM(treatment_cost) AS total_insurance_revenue
FROM appointments
WHERE payment_mode = 'Insurance';
## Question 31:Find the number of patients registered from each city.
SELECT city, COUNT(*) AS number_of_patients
FROM Patients
GROUP BY city;
## Question 32:Find the average consultation fee department-wise.
select department_id,avg(consultation_fee) AS avg_dep_fee
from Doctors
group by department_id;
## Question 33:Find the total treatment revenue generated by each doctor.
SELECT d.doctor_id, d.doctor_name,
       SUM(a.treatment_cost) AS total_treatment_revenue
FROM Doctors d
JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name;
## Question 34:Find the number of appointments handled by each doctor.


SELECT d.doctor_id, d.doctor_name,
       COUNT(a.appointment_id) AS number_of_appointments
FROM Doctors d
JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name;
## Question 35:Display departments having more than one doctor.
SELECT department_id, COUNT(*) AS number_of_doctors
FROM Doctors
GROUP BY department_id
HAVING COUNT(*) > 1;
## Question 36:Find cities having more than two registered patients.
SELECT city, COUNT(*) AS number_of_patients
FROM Patients
GROUP BY city
HAVING COUNT(*) > 2;
## Question 37:Find the average treatment cost for each payment mode.
SELECT payment_mode,
       AVG(treatment_cost) AS average_treatment_cost
FROM Appointments
GROUP BY payment_mode;
## Question 38:Find the total treatment revenue generated by each department.
SELECT d.department,
       SUM(a.treatment_cost) AS total_treatment_revenue
FROM Doctors d
JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.department_id;



