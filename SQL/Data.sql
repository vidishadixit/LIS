

INSERT INTO Users (UserID, Username, Role) VALUES
(1, 'jdoe', 'Lab Technician'),
(2, 'asmith', 'QA Reviewer'),
(3, 'mjohnson', 'Laboratory Manager'),
(4, 'rwilson', 'Researcher'),
(5, 'itadmin', 'IT Administrator');

INSERT INTO Samples (
SampleID,
SampleStatus,
WorkflowStep,
ReportGenerationStatus,
Timestamp,
UserID
) VALUES
(101, 'Collected', 'Sample Registration', 'Pending', '2026-06-01 08:15:00', 1),
(102, 'Testing In Progress', 'Sample Testing', 'Pending', '2026-06-01 09:00:00', 1),
(103, 'QA Validation', 'QA Review', 'Pending', '2026-06-01 10:20:00', 2),
(104, 'Completed', 'Report Generation', 'Generated', '2026-06-01 11:45:00', 2),
(105, 'Rejected', 'QA Review', 'Failed', '2026-06-01 12:30:00', 2),
(106, 'Collected', 'Sample Registration', 'Pending', '2026-06-02 08:00:00', 1),
(107, 'Testing In Progress', 'Sample Testing', 'Pending', '2026-06-02 09:40:00', 1),
(108, 'Completed', 'Report Generation', 'Generated', '2026-06-02 11:10:00', 2),
(109, 'QA Validation', 'QA Review', 'Pending', '2026-06-02 12:00:00', 2),
(110, 'Completed', 'Report Generation', 'Generated', '2026-06-03 10:30:00', 2);

-- =========================================
-- AUDIT TRAIL TABLE
-- =========================================

INSERT INTO AuditTrail (
AuditID,
SampleID,
SampleStatus,
Timestamp,
UserID
) VALUES
(1, 101, 'Collected', '2026-06-01 08:20:00', 1),
(2, 102, 'Testing In Progress', '2026-06-01 09:15:00', 1),
(3, 103, 'QA Validation', '2026-06-01 10:30:00', 2),
(4, 104, 'Completed', '2026-06-01 11:50:00', 2),
(5, 105, 'Rejected', '2026-06-01 12:35:00', 2),
(6, 106, 'Collected', '2026-06-02 08:05:00', 1),
(7, 107, 'Testing In Progress', '2026-06-02 09:50:00', 1),
(8, 108, 'Completed', '2026-06-02 11:15:00', 2),
(9, 109, 'QA Validation', '2026-06-02 12:10:00', 2),
(10, 110, 'Completed', '2026-06-03 10:35:00', 2);

-- =========================================
-- DOWNSTREAM SYSTEMS TABLE
-- =========================================

INSERT INTO DownstreamSystems (
SystemID,
SystemName,
IntegrationProtocol
) VALUES
(1, 'LIS System', 'HL7'),
(2, 'Reporting System', 'REST API'),
(3, 'Analytics Platform', 'FHIR'),
(4, 'Notification Service', 'SMTP');

-- =========================================
-- INTEGRATION LOGS TABLE
-- =========================================

INSERT INTO IntegrationLogs (
LogID,
SystemID,
IntegrationProtocol,
Timestamp
) VALUES
(1, 1, 'HL7', '2026-06-01 08:30:00'),
(2, 2, 'REST API', '2026-06-01 09:10:00'),
(3, 3, 'FHIR', '2026-06-01 10:00:00'),
(4, 4, 'SMTP', '2026-06-01 11:00:00'),
(5, 1, 'HL7', '2026-06-02 08:20:00'),
(6, 2, 'REST API', '2026-06-02 09:25:00'),
(7, 3, 'FHIR', '2026-06-02 10:15:00'),
(8, 4, 'SMTP', '2026-06-02 11:05:00');

-- =========================================
-- STAKEHOLDERS TABLE
-- =========================================

INSERT INTO Stakeholders (
StakeholderID,
StakeholderName,
Role
) VALUES
(1, 'Dr. Brown', 'Clinician'),
(2, 'Sarah Lee', 'Researcher'),
(3, 'David Miller', 'Laboratory Manager'),
(4, 'Emily Clark', 'External Auditor');

-- =========================================
-- NOTIFICATIONS TABLE
-- =========================================

INSERT INTO Notifications (
NotificationID,
StakeholderID,
SampleID,
NotificationType,
Timestamp
) VALUES
(1, 1, 104, 'Report Ready', '2026-06-01 12:00:00'),
(2, 2, 108, 'Report Ready', '2026-06-02 11:30:00'),
(3, 3, 105, 'QA Rejection Alert', '2026-06-01 12:40:00'),
(4, 4, 110, 'Audit Notification', '2026-06-03 10:45:00');

-- =========================================
-- WORKFLOW STEPS TABLE
-- =========================================

INSERT INTO WorkflowSteps (
WorkflowStepID,
WorkflowStepName,
BusinessRule
) VALUES
(1, 'Sample Registration', 'All samples must be registered before testing'),
(2, 'Sample Testing', 'Testing must follow approved lab procedures'),
(3, 'QA Review', 'QA validation required before report generation'),
(4, 'Report Generation', 'Reports generated only after QA approval'),
(5, 'Notification Dispatch', 'Stakeholders notified after report generation');

-- =========================================
-- WORKFLOW LOGS TABLE
-- =========================================

INSERT INTO WorkflowLogs (
WorkflowLogID,
SampleID,
WorkflowStepID,
Timestamp
) VALUES
(1, 101, 1, '2026-06-01 08:15:00'),
(2, 102, 2, '2026-06-01 09:00:00'),
(3, 103, 3, '2026-06-01 10:20:00'),
(4, 104, 4, '2026-06-01 11:45:00'),
(5, 104, 5, '2026-06-01 12:00:00'),
(6, 106, 1, '2026-06-02 08:00:00'),
(7, 107, 2, '2026-06-02 09:40:00'),
(8, 108, 4, '2026-06-02 11:10:00'),
(9, 108, 5, '2026-06-02 11:30:00'),
(10, 110, 4, '2026-06-03 10:30:00');