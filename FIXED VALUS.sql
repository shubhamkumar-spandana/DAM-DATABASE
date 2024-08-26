INSERT INTO fixed (
    case_type,
    unauthorised_absence,
    non_financial,
    financial,
    Type_of_complaint,
    Fraud_Investigation_Status,
    Decision
) VALUES (
    'Unauthorised Absence',
    'Absconding',
    'Behavioural',
    'Collection Misappropriation',
    'Cash Closing',
    'Completed-Report Pending',
    'Termination'
);

INSERT INTO fixed (
    case_type,
    non_financial,
    financial,
    Type_of_complaint,
    Fraud_Investigation_Status,
    Decision
) VALUES (
    'Non-Financial',
    'Process Lapse',
    'Shortage of Cash',
    'Collection misappropriation',
    'Completed-Report Submitted',
    'Resignation'
),(
    'Financial',
    'Policy Violation',
    'Pre-closure Misappropriation',
    'Commission',
    'Not Required',
    'Drop Charges'
);

INSERT INTO fixed (
    non_financial,
    financial,
    Type_of_complaint,
    Fraud_Investigation_Status,
    Decision
) VALUES (
    'Work Negligence',
    'Collection and Pre-closure Misappropriation',
    'Pre-closure amount Misappropriation',
    'Required',
    'Warning letter'
);

INSERT INTO fixed (
    non_financial,
    financial,
    Type_of_complaint
) VALUES (
    'Violation of “Code of Conduct”',
    'Fake Loan Disbursement',
    'Robbery'
);

INSERT INTO fixed (
    financial,
    Type_of_complaint
) VALUES (
    'Pre-closure and Fake Loan Disbursements',
    'Others'
);

INSERT INTO fixed (
    financial
) VALUES (
    'KYC Manipulations'
),
(
    'Fake Bills Submission'
),
(
    'Commission'
),
(
    'Financial Misappropriation & Absconding'
),
(
    'Theft'
),
(
    'Excess Collection Under '
)
;


