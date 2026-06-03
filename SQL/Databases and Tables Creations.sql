-- create database LIS

use LIS

CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY,
    Username TEXT NOT NULL,
    Role TEXT NOT NULL
);


CREATE TABLE Samples (
    SampleID INTEGER PRIMARY KEY,
    SampleStatus TEXT NOT NULL,
    WorkflowStep TEXT NOT NULL,
    ReportGenerationStatus TEXT NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    UserID INTEGER NOT NULL
);

CREATE TABLE AuditTrail (
    AuditID INTEGER PRIMARY KEY,
    SampleID INTEGER NOT NULL,
    SampleStatus TEXT NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    UserID INTEGER NOT NULL,
    FOREIGN KEY (SampleID) REFERENCES Samples (SampleID),
    FOREIGN KEY (UserID) REFERENCES Users (UserID)
);

CREATE TABLE DownstreamSystems (
    SystemID INTEGER PRIMARY KEY,
    SystemName TEXT NOT NULL,
    IntegrationProtocol TEXT NOT NULL
);

CREATE TABLE IntegrationLogs (
    LogID INTEGER PRIMARY KEY,
    SystemID INTEGER NOT NULL,
    IntegrationProtocol TEXT NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SystemID) REFERENCES DownstreamSystems (SystemID)
);

CREATE TABLE Stakeholders (
    StakeholderID INTEGER PRIMARY KEY,
    StakeholderName TEXT NOT NULL,
   Role TEXT NOT NULL
);

CREATE TABLE Notifications (
    NotificationID INTEGER PRIMARY KEY,
    StakeholderID INTEGER NOT NULL,
    SampleID INTEGER NOT NULL,
    NotificationType TEXT NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StakeholderID) REFERENCES Stakeholders (StakeholderID),
    FOREIGN KEY (SampleID) REFERENCES Samples (SampleID)
);

CREATE TABLE WorkflowSteps (
    WorkflowStepID INTEGER PRIMARY KEY,
    WorkflowStepName TEXT NOT NULL,
    BusinessRule TEXT NOT NULL
);

CREATE TABLE WorkflowLogs (
    WorkflowLogID INTEGER PRIMARY KEY,
    SampleID INTEGER NOT NULL,
    WorkflowStepID INTEGER NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SampleID) REFERENCES Samples (SampleID),
    FOREIGN KEY (WorkflowStepID) REFERENCES WorkflowSteps (WorkflowStepID)
);
