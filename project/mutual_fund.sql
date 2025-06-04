create database mutualfund;
use mutualfund;

CREATE TABLE Investors (
    InvestorID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    PAN VARCHAR(10) UNIQUE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE FundHouses (
    FundHouseID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Website VARCHAR(100),
    EstablishedYear YEAR
);
CREATE TABLE MutualFunds (
    FundID INT PRIMARY KEY AUTO_INCREMENT,
    FundName VARCHAR(100) NOT NULL,
    FundType ENUM('Equity', 'Debt', 'Hybrid', 'Index', 'ETF') NOT NULL,
    RiskLevel ENUM('Low', 'Moderate', 'High') NOT NULL,
    FundHouseID INT NOT NULL,
    LaunchDate DATE,
    FOREIGN KEY (FundHouseID) REFERENCES FundHouses(FundHouseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE NAVHistory (
    NAVID INT PRIMARY KEY AUTO_INCREMENT,
    FundID INT NOT NULL,
    NAVDate DATE NOT NULL,
    NAV DECIMAL(10,4) NOT NULL,
    FOREIGN KEY (FundID) REFERENCES MutualFunds(FundID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    UNIQUE (FundID, NAVDate)
);
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    InvestorID INT NOT NULL,
    FundID INT NOT NULL,
    TransactionType ENUM('Buy', 'Sell') NOT NULL,
    TransactionDate DATE NOT NULL,
    Units DECIMAL(12,4) NOT NULL,
    NAVAtTime DECIMAL(10,4) NOT NULL,
    FOREIGN KEY (InvestorID) REFERENCES Investors(InvestorID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (FundID) REFERENCES MutualFunds(FundID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE FundRatings (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    FundID INT NOT NULL,
    AgencyName VARCHAR(50),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    RatingDate DATE,
    FOREIGN KEY (FundID) REFERENCES MutualFunds(FundID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE Benchmarks (
    BenchmarkID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT
);
CREATE TABLE FundBenchmarks (
    FundID INT NOT NULL,
    BenchmarkID INT NOT NULL,
    PRIMARY KEY (FundID, BenchmarkID),
    FOREIGN KEY (FundID) REFERENCES MutualFunds(FundID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (BenchmarkID) REFERENCES Benchmarks(BenchmarkID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
