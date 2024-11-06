
CREATE DATABASE KoiCareSystem;

USE KoiCareSystem;


CREATE TABLE [User] (
    UserId NVARCHAR(450) NOT NULL PRIMARY KEY,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    Name NVARCHAR(255) NOT NULL
);


INSERT INTO [User] (UserId, Email, Password, Role, Name)
VALUES
    ('U001', 'member1@example.com', 'Abc@123', 'member', 'Member One'),
    ('U002', 'member2@example.com', 'Abc@123', 'member', 'Member Two'),
    ('U003', 'admin@example.com', 'Abc@123', 'admin', 'Admin User'),
    ('U004', 'manager@example.com', 'Abc@123', 'manager', 'Manager User');


CREATE TABLE Pond (
    PondId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    UserId NVARCHAR(450) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Volume INT NOT NULL,
    Thumbnail VARCHAR(MAX) NULL,
    Depth REAL NOT NULL,
    PumpingCapacity INT NOT NULL,
    Drain INT NOT NULL,
    Skimmer INT NOT NULL,
    Note NVARCHAR(MAX) NULL,
    CONSTRAINT FK_Pond_User FOREIGN KEY (UserId) REFERENCES [User](UserId)
);


CREATE TABLE Koi (
    KoiId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    PondId INT NOT NULL,
    UserId NVARCHAR(450) NOT NULL,
    Age INT NOT NULL,
    Thumbnail NVARCHAR(MAX) NULL,
    Name NVARCHAR(255) NOT NULL,
    Note NVARCHAR(MAX) NULL,
    Origin NVARCHAR(255) NOT NULL,
    Length INT NOT NULL,
    Weight REAL NOT NULL,
    Color NVARCHAR(200) NOT NULL,
    CreateAt DATETIME2(7) NOT NULL,
    Sex NVARCHAR(MAX) NOT NULL,
    Variety NVARCHAR(MAX) NOT NULL,
    Physique NVARCHAR(MAX) NOT NULL,
    Status BIT NULL,
    CONSTRAINT FK_Koi_Pond FOREIGN KEY (PondId) REFERENCES Pond(PondId),
    CONSTRAINT FK_Koi_User FOREIGN KEY (UserId) REFERENCES [User](UserId)
);


CREATE TABLE Category (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    CreatedAt DATETIME2(7) NOT NULL DEFAULT GETDATE(),
);


INSERT INTO Category (Name, Description)
VALUES
    ('Koi Treatment', 'Products and solutions to treat koi-specific health issues, such as anti-bacterial and anti-parasite treatments.'),
    ('Water Treatment', 'Products to maintain and improve water quality, including water conditioners and pH balancers.');


CREATE TABLE ExternalProduct (
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Price DECIMAL(18, 2) NOT NULL,
    Thumbnail NVARCHAR(MAX) NULL,
    ExternalUrl NVARCHAR(2083) NOT NULL,
    CategoryId INT NULL,
    Status BIT NOT NULL DEFAULT 1,
    CreatedAt DATETIME2(7) NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT FK_ExternalProduct_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);


CREATE TABLE Measurements (
    MeasureId INT IDENTITY(1,1) PRIMARY KEY,
    PondId INT NOT NULL,
    UserId NVARCHAR(450) NOT NULL,
    Nitrite FLOAT NOT NULL,
    Oxygen FLOAT NOT NULL,
    Nitrate FLOAT NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    Temperature FLOAT NOT NULL,
    Phosphate FLOAT NOT NULL,
    pH FLOAT NOT NULL,
    Ammonium FLOAT NOT NULL,
    Hardness FLOAT NOT NULL,
    CarbonDioxide FLOAT NOT NULL,
    CarbonHardness FLOAT NOT NULL,
    Salt FLOAT NOT NULL,
    TotalChlorines FLOAT NOT NULL,
    OutdoorTemp FLOAT NOT NULL,
    AmountFed FLOAT NOT NULL,

    CONSTRAINT FK_Measurements_PondId FOREIGN KEY (PondId) REFERENCES Pond(PondId),
    CONSTRAINT FK_Measurements_UserId FOREIGN KEY (UserId) REFERENCES [User](UserId)
);