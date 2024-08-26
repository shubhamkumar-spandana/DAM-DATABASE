create database work;
use work;
CREATE TABLE EMPLOYEE (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Emp_id VARCHAR(15) UNIQUE NOT NULL,
    Emp_name VARCHAR(30) NOT NULL,
    Branch VARCHAR(30),
    Designation VARCHAR(25),
    Department VARCHAR(25)
);

CREATE TABLE COMPLAINT (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Reference_id VARCHAR(14) DEFAULT '',
    Complaint_id INT UNIQUE NOT NULL,
    Emp_id VARCHAR(15),
    Case_type VARCHAR(30),
    Case_nature VARCHAR(50),
    Created_by VARCHAR(30),
    Updated_by VARCHAR(30),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ALLEGATIONS (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Reference_id VARCHAR(14) DEFAULT '',
    Complaint_id INT,
    Allegations text,
    Date_of_identification DATE,
    Created_by VARCHAR(30),
    Updated_by VARCHAR(30),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE FINANCIAL (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Reference_id VARCHAR(14) DEFAULT '',
    Complaint_id INT,
    Misappropriation_value DECIMAL(15, 2),
    Amount_recovered DECIMAL(15, 2),
    Created_by VARCHAR(30),
    Updated_by VARCHAR(30),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE CASES (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Reference_id VARCHAR(14) DEFAULT '',
    Case_id INT NOT NULL,
    Attendance VARCHAR(30),
    Submission_of_alleged_employee TEXT,
    Submissions_of_witnesses TEXT,
    Date_of_SCN_Issued DATE,
    SCN_Reply_Received_Date DATE,
    Date_of_Suspension_Issued DATE,
    Date_of_NOE_Issued DATE,
    Date_of_DAC DATE,
    DAC_Recommendation TEXT,
    DAC_Final_Verdict TEXT,
    Date_of_Implementation_of_Verdict DATE,
    HR_Remarks TEXT,
    Created_by VARCHAR(30),
    Updated_by VARCHAR(30),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE CLV (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Reference_id VARCHAR(14) DEFAULT '',
    Case_id INT,
    Emp_id VARCHAR(15),
    Type_of_complaint VARCHAR(50),
    All_complaints TEXT,
    Fraud_investigation_status VARCHAR(15),
    CLV_start_date DATE,
    CLV_end_date DATE,
    Total_borrowers_verified INT,
    Total_fraud_amount DECIMAL(15, 2),
    Amount_recovered DECIMAL(15, 2),
    Due_amount DECIMAL(15, 2),
    Total_borrowers_affected INT,
    CLV_submission_date DATE,
    IA_observations TEXT,
    Recommendation_of_suspension VARCHAR(255),
    Created_by VARCHAR(30),
    Updated_by VARCHAR(30),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE FICM (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Reference_id VARCHAR(14) DEFAULT '',
    Case_id INT,
    FMR_status VARCHAR(25),
    FMR_filled_date DATE,
    Recovery_amount DECIMAL(15, 2),
    Date_of_recovery DATE,
    Date_of_deposit DATE,
    FIR_status VARCHAR(25),
    Amount_as_per_FIR DECIMAL(15, 2),
    Case_status VARCHAR(25),
    FICM_remarks TEXT,
    Amount_recovered DECIMAL(15, 2),
    Created_by VARCHAR(30),
    Updated_by VARCHAR(30),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE FA (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Reference_id VARCHAR(14) DEFAULT '',
    Case_id INT,
    Date_of_posting DATE,
    Amount_posted DECIMAL(15, 2),
    Recovery_amount DECIMAL(15, 2),
    Amount_difference DECIMAL(15, 2),
    FA_remarks TEXT,
    Created_by VARCHAR(30),
    Updated_by VARCHAR(30),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE COMMITTEE (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Reference_id VARCHAR(14) DEFAULT '',
    Case_id INT,
    Observations TEXT,
    Conclusion TEXT,
    Decision TEXT,
    Created_by VARCHAR(30),
    Updated_by VARCHAR(30),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE FIXED (
    Serial_number INT AUTO_INCREMENT PRIMARY KEY,
    Department VARCHAR(25),
    case_type VARCHAR(50),
    unauthorised_absence VARCHAR(50),
    non_financial VARCHAR(50),
    financial VARCHAR(50),
    DAC_Recommendation VARCHAR(50),
    DAC_Final_Verdict VARCHAR(50),
    Type_of_complaint VARCHAR(50),
    Multiple_complaints VARCHAR(50),
    Fraud_Investigation_Status VARCHAR(50),
    FMR_Status VARCHAR(50) NULL,
    FIR_Status VARCHAR(50) NULL,
    Decision VARCHAR(50)
);

DELIMITER //

CREATE TRIGGER before_insert_complaint
BEFORE INSERT ON COMPLAINT
FOR EACH ROW
BEGIN
    SET NEW.Reference_id = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
END; //

CREATE TRIGGER before_insert_allegations
BEFORE INSERT ON ALLEGATIONS
FOR EACH ROW
BEGIN
    SET NEW.Reference_id = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
END; //

CREATE TRIGGER before_insert_financial
BEFORE INSERT ON FINANCIAL
FOR EACH ROW
BEGIN
    SET NEW.Reference_id = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
END; //

CREATE TRIGGER before_insert_case
BEFORE INSERT ON CASES
FOR EACH ROW
BEGIN
    SET NEW.Reference_id = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
END; //

CREATE TRIGGER before_insert_clv
BEFORE INSERT ON CLV
FOR EACH ROW
BEGIN
    SET NEW.Reference_id = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
END; //

CREATE TRIGGER before_insert_ficm
BEFORE INSERT ON FICM
FOR EACH ROW
BEGIN
    SET NEW.Reference_id = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
END; //

CREATE TRIGGER before_insert_fa
BEFORE INSERT ON FA
FOR EACH ROW
BEGIN
    SET NEW.Reference_id = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
END; //

CREATE TRIGGER before_insert_committee
BEFORE INSERT ON COMMITTEE
FOR EACH ROW
BEGIN
    SET NEW.Reference_id = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
END; //

DELIMITER ;

CREATE INDEX idx_emp_id ON EMPLOYEE (Emp_id);
CREATE INDEX idx_complaint_id ON COMPLAINT (Complaint_id);
CREATE INDEX idx_emp_id_complaint ON COMPLAINT (Emp_id);
CREATE INDEX idx_complaint_id_allegations ON ALLEGATIONS (Complaint_id);
CREATE INDEX idx_complaint_id_financial ON FINANCIAL (Complaint_id);
CREATE INDEX idx_case_id ON CASES (Case_id);
CREATE INDEX idx_case_id_clv ON CLV (Case_id);
CREATE INDEX idx_emp_id_clv ON CLV (Emp_id);
CREATE INDEX idx_case_id_ficm ON FICM (Case_id);



