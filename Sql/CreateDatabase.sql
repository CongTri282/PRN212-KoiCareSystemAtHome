	
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
    ('U003', 'admin@example	.com', 'Abc@123', 'admin', 'Admin User'),
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


INSERT INTO Pond (UserID, Name, Volume, Thumbnail, Depth, PumpingCapacity, Drain, Skimmer, Note)
VALUES 
('U001', 'Main Pond', 2000.0, 'https://th.bing.com/th/id/R.28e1217b364f51df5df816cae92b7bee?rik=4qTEdf%2bcdv39mg&riu=http%3a%2f%2f3.bp.blogspot.com%2f-E2t4QdpXEdc%2fTkPiqm1rOGI%2fAAAAAAAAAKM%2f-q6u_C9toJw%2fs1600%2fCopy%2bof%2bbutler%252526carterconstuction%2b305.jpg&ehk=AriWPv16%2fg3C15kmspYhYwoX4tSmlWaSx3qx9%2f6htmU%3d&risl=&pid=ImgRaw&r=0', 4, 700, 1, 1, 'This is the main pond for koi fish.'),
('U001', 'Small Pond', 500.0, 'https://www.pondplants.co.uk/wp-content/uploads/2018/02/koi-in-a-pool-merebrook-pondplants.jpg', 2, 300, 1, 0, 'A small pond for young koi.'),
('U002', 'Outdoor Pond', 1500.0, 'https://www.nualgiponds.com/wp-content/uploads/2014/04/nualgi-koi-pond.jpg', 3, 500, 1, 1, 'Outdoor pond with a skimmer and large volume.'),
('U002', 'Indoor Pond', 750.0, 'https://www.kodamakoifarm.com/wp-content/uploads/2018/11/koi-pond-winter-care.jpg', 2, 400, 0, 1, 'Indoor pond for special koi breeding.');


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


INSERT INTO Koi (UserID, PondID, Thumbnail, Age, Name, Note, Origin, Length, Weight, Color, CreateAt, Sex, Variety, Physique, Status)
VALUES
('U001', 1, 'https://th.bing.com/th/id/OIP.Gfyrt1yYp4TtEK6HU6tMxwHaIL?pid=ImgDet&w=474&h=523&rs=1', 1, 'Hotaro', 'A beautiful koi with bright colors.', 'Japan', 45, 3100, 'Orange and White', GETDATE(), 'Male','Kohaku','Corpulent', 1),  
('U001', 3, 'https://th.bing.com/th/id/OIP.4EUdtGjKRHc08wAsM6gjJQHaLL?pid=ImgDet&w=474&h=715&rs=1', 1, 'Kawasaki', 'Young koi, growing fast.', 'USA', 30, 2000, 'Black and Yellow', GETDATE(), 'Female','Sanke','Slim', 1),  
('U001', 2, 'https://th.bing.com/th/id/OIP.P7sMlIeBzK-X3INSPj7czgHaGQ?pid=ImgDet&w=474&h=400&rs=1', 2, 'Neru', 'A stunning koi with unique patterns.', 'China', 35, 3000, 'Red and White', GETDATE(), 'Male','Hikari','Normal', 1),  
('U001', 4, 'https://th.bing.com/th/id/OIP.wqdDkTl9KO4ahpdbVumYwQHaHa?w=1000&h=1000&rs=1&pid=ImgDetMain', 2, 'Yama', 'Very active koi, loves to swim.', 'Thailand', 52, 4600, 'Blue and Orange', GETDATE(), 'Female','Kohaku','Corpulent', 1),  
('U002', 1, 'https://aquariumfishindia.com/wp-content/uploads/2021/12/200563137.jpg', 3, 'Eitoku', 'Friendly koi, often interacts with people.', 'Japan', 38, 2600, 'White with Black Spots', GETDATE(), 'Female','Asagi','Slim', 1),  
('U002', 3, 'https://i.pinimg.com/736x/3c/71/52/3c7152339593b502fee1dec5d14a8f2d.jpg', 3, 'Anteiku', 'An older koi with lots of personality.', 'USA', 65, 5300, 'Yellow and Black', GETDATE(), 'Male','Sanke','Corpulent', 1),  
('U002', 2, 'https://th.bing.com/th/id/OIP.KOCOJ84hiegMDqHYOucJaQHaMW?w=1228&h=2048&rs=1&pid=ImgDetMain', 4, 'Garam', 'Small but very colorful.', 'China', 40, 3000, 'Orange and Black', GETDATE(), 'Female','Shusui','Slim', 1),  
('U002', 4, 'https://aquariumfishindia.com/wp-content/uploads/2021/12/200711250.jpg', 4, 'Honda', 'A rare breed of koi.', 'Thailand', 48, 3700, 'Calico', GETDATE(), 'Male','Hikari','Normal', 1);  


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


INSERT INTO ExternalProduct (Name, Description, Price, Thumbnail, ExternalUrl, CategoryId, Status, CreatedAt)
VALUES
    ('Koi Anti-Bacterial Treatment', 'Effective treatment for bacterial infections in koi fish.', 15.99, 'https://i.ebayimg.com/images/g/7wYAAOSwAPVZJEbO/s-l1600.webp', 'https://www.ebay.co.uk/itm/192195138575', 1, 1, GETDATE()),

    ('Koi Anti-Parasite Treatment', 'Solution to treat parasite infections in koi.', 18.50, 'https://i.ebayimg.com/images/g/rUwAAOSwZstnA6Qa/s-l960.webp', 'https://www.ebay.co.uk/itm/196703155490?_skw=Koi+Anti-Parasite+Treatment&itmmeta=01JCQ4YR45BGZMGBXCF9JPH59Q&hash=item2dcc6bf522%3Ag%3AAQkAAOSwbhdnA6Qo&itmprp=enc%3AAQAJAAAA4HoV3kP08IDx%2BKZ9MfhVJKkcpkbLTyz--9MBHtwJKPczbIt36DWHvZC75Q3i2oqPHxuqoYpD3d6h4U6SgrTcfAJ82U2JbaSKKqxjjy3zhTn0C%2FVsOeYYjfdl56rCV3EsRz9VJFp3LVP0%2FTaBn96SCJXAnjEDDdjWrm87Gi08nCEQYS9LPdyHU%2F5Wwc7YyYz%2F7z12tnl6i7uJqCmkGhBokD2MY1pobgC3sStnU7uXjI%2B8%2F8KudDou2oxzEANE1Ck85M%2BuUua5Mi4kL9m7oQCHaO5jC5FXZ6arRFa5jUPdLHPa%7Ctkp%3ABk9SR5aC--TlZA&var=496403896157', 1, 1, GETDATE()),

    ('Water pH Balancer', 'Maintains optimal pH levels for koi health.', 12.75, 'https://i.ebayimg.com/images/g/ZRkAAOSwrWdmMHGq/s-l1600.webp', 'https://www.ebay.co.uk/itm/156473066740?_skw=Koi+Water+pH+Balancer&itmmeta=01JCQ50TWNJ9W8MWRHK4G1QCKP&hash=item246e8584f4:g:ZRkAAOSwrWdmMHGq&itmprp=enc%3AAQAJAAAA8HoV3kP08IDx%2BKZ9MfhVJKlxcPY8wC4i%2FEI9J9Lr1x5G3qt49ZhWHHYCcQ1G3f9wr5vQnpQycpOQ1tr6OycmEWv9TWeEJs4FmQz76m%2BXAhmThoIODPzmukv7pW%2BgWYAuy2V60XFIurDB4shOKwl6MR663xiVJyhJlo%2FU--Ryv9aIO%2FY%2B6dlxj7nWtDLJNhU6rulkohdfjFg9zbRwGt8jSt0Kcnsd3tKkhIYHYv1TOzbTiIYHOcuAYWqM2%2B3nGzj931crfmEgy3Nmqd0PdCnx6owEo%2FA2WUJyYTQ5YR%2BPczkV7Hgaz1itp53Kiz7kw8F9NA%3D%3D%7Ctkp%3ABFBMuK6D5eVk', 2, 1, GETDATE()),

    ('Water Conditioner', 'Removes harmful chemicals from tap water.', 10.00, 'https://i.ebayimg.com/images/g/JOgAAOSw~29h91pP/s-l1600.webp', 'https://www.ebay.co.uk/itm/196262745092?_skw=Koi+Water+Conditioner&itmmeta=01JCQ521FB20CHMPC71C4X5F1J&hash=item2db22bd404%3Ag%3AJOgAAOSw%7E29h91pP&itmprp=enc%3AAQAJAAAA8HoV3kP08IDx%2BKZ9MfhVJKmcjUZibCQ4N8QiVj--3NpO6KHpfjM6tPPeCk48ZNLn5pKlzP98RDcNenp%2BB2a4GfDl2RwONTkw9wvRT4QCqLj7cOzhc%2BGgf%2B9ozL4elPqBTlT5TqMS5HYnPAfL%2BagawxNXmzMC0bMKeWDbByAljOzKw0up0P5Mh%2B3if1w05sGYGTDaVUTvaMxV%2BNU0iOIq5m%2FF2FeV3p%2BmazkkTILrb6--c7Ccfq9ZS7UWp6a4Rr%2F6jsIz%2BvHUPXHeqTuqaIOhGcKG9gyEQOq9AO1GUyw%2BgvEBUUXXfOlCyOTl%2FPepbuIJsQ%3D%3D%7Ctkp%3ABFBM5JeI5eVk&var=496100816001', 2, 1, GETDATE()),

    ('Algae Control Solution', 'Reduces and controls algae growth in koi ponds.', 14.25, 'https://i.ebayimg.com/images/g/X3AAAOSwDeFhp5iZ/s-l1600.webp', 'https://www.ebay.co.uk/itm/185194405946?_skw=Koi+Algae+Control+Solution&epid=17022533866&itmmeta=01JCQ53764ZE2X6A2VCB2FYANA&hash=item2b1e72603a%3Ag%3AX3AAAOSwDeFhp5iZ&itmprp=enc%3AAQAJAAAA8HoV3kP08IDx%2BKZ9MfhVJKle8kq8Qvq6wNMMozDfu0lHSbqF1pFE5Dj1Z%2Fhxe6ez%2FMKgz5jHYd5QT53VCh7gQ5Q9OU01WUXY2%2F8XhKDB1hhel9MWDByw9qvgw%2BZyftomHRkuOm%2BCN37a%2BE7kB8EzzSvOUHocL7SNDVCVfc8FoB0OxgFMDVFfdFF4LlFitu6HLeGYh5DvRmmSAbPJ%2BlYWiF8kYDMXYtR0Yj%2Bn0badV7UXaXATMUT9zqzLOqQysGXXy3WBoEn9058Tl1Va8gBJtM2TLkVke2ehvFfwIfsnHWKAaEFqPK%2BSoavHVpEhDCjNkg%3D%3D%7Ctkp%3ABFBMlvOM5eVk&var=692950273889', 2, 1, GETDATE()),

    ('Ammonia Remover', 'Neutralizes ammonia levels in pond water.', 13.40, 'https://i.ebayimg.com/images/g/TwgAAMXQ1PNRZOCy/s-l1600.webp', 'https://www.ebay.co.uk/itm/260882190918?_skw=Koi+Ammonia+Remover&itmmeta=01JCQ54FC4TCCK6AV5NHNECM8S&hash=item3cbdca5246:g:TwgAAMXQ1PNRZOCy&itmprp=enc%3AAQAJAAAA8HoV3kP08IDx%2BKZ9MfhVJKnVBgcDekEsWxi6s9YdZg8nSXtQfPIRg%2BI1AH%2BilVvZeB6dBJrqFawABYLI1JccM%2FPES3hnv%2F0JItdHk2S7TEAc3vlULvrnaTFQia2UvOpKo53QSQZhrCbb8kNcV03El6fbo27ChLOBnwbjNNAqz8wOmnyrKhyk2qLsBMqjZuR8ZUWNvMXKJEYfwjylTd5KcqGW4qyBi8T%2Bglw7MWsKFqSsOsd721AY3GyQ8FoUBQFBQYiXkBAQneZ4wrGb5bNlXNYsV%2BQj5oYWlyNB3%2B7emuv9WEARLra6fEmLMkJlhPnlpA%3D%3D%7Ctkp%3ABFBMnvaR5eVk', 2, 1, GETDATE()),

    ('Koi Immune Booster', 'Boosts immunity of koi to prevent infections.', 20.99, 'https://i.ebayimg.com/images/g/whYAAOSwMbRhcF3v/s-l1600.webp', 'https://www.ebay.co.uk/itm/226082478615?_skw=Koi+Immune+Booster&itmmeta=01JCQ55FMKAEJF9A07PEHAHQZ8&hash=item34a390da17%3Ag%3AwhYAAOSwMbRhcF3v&itmprp=enc%3AAQAJAAAA8HoV3kP08IDx%2BKZ9MfhVJKnnpt13FkajzQPo%2F2d5oHw5%2BuatR%2BcjYxKl7NXHzgx92ahhAnfxmQbDgNaunTW7VxYuD9O8bd%2FOL1q79zYtKrx1YRyt2h--0VeLE7jeEl%2Fq2Ix8NRu7jQ2h1botsxp%2F8965SbN%2BsUACUJvYRFbnJaZZwZgxJmTqK6RcO2BJdtAZchyRZnBkNQImg7TDkAPiL%2BhiRXvsae2Q0rl%2Ftf%2BObpGCkqd0Vte6jSHcHZfmqG6whQtYXBT1dAYy3dPmdV3WGsYlzwykiCqJdXwGgC2erMEjxf6k3jP%2BKnM1Gi1ueKZREQ%3D%3D%7Ctkp%3ABFBMsPqV5eVk&var=525202032912', 1, 1, GETDATE()),

    ('Water Hardness Increaser', 'Adjusts water hardness for optimal koi health.', 11.00, 'https://i.ebayimg.com/images/g/y7EAAOSwKqVjAn75/s-l1600.webp', 'https://www.ebay.co.uk/itm/144688958992?_skw=Koi+Water+Hardness+Increaser&itmmeta=01JCQ56FK2VPB2F360TMP1V4G0&hash=item21b0224e10%3Ag%3Ay7EAAOSwKqVjAn75&itmprp=enc%3AAQAJAAABAHoV3kP08IDx%2BKZ9MfhVJKnPFp2AiahrxR2GMPmGFOijPMa4F2ieg5nomwkdaCh7L9v9FtrAg49txnaW8Fj4S9Dc8Lzb4dXIvg9gMbMWj0YHOwB1mcAfkq8GsrdxCCEwvWUq4LeBofsI4cBMbeDq4hKMw%2FHT2mgsic0MweLtO3E37yGvaLNja3Yhqb648naNFgvUs4V6PTdzcTFDeIomYo%2Faw5RDFdREqQKVz4hOMeMdIFtldm%2BVLk1Gh5i5mg4zxQ9GCf5fez5US04EEiPYxrIAotWLsgcKJOuD8M0oBMd5AfXA6tcB4Xl5TB%2B68lhBCgO%2B78MQyTY7mJexUXObDCU%3D%7Ctkp%3ABk9SR9D5meXlZA&var=443924321976', 2, 1, GETDATE()),

    ('Bacterial Starter for Ponds', 'Contains beneficial bacteria for pond ecosystems.', 16.50, 'https://i.ebayimg.com/images/g/xF4AAOSwDthm2J3g/s-l1600.webp', 'https://www.ebay.co.uk/sch/i.html?_from=R40&_trksid=p2334524.m570.l1313&_nkw=Koi+Bacterial+Starter+for+Ponds&_sacat=0&_odkw=Koi+Water+Hardness+Increaser&_osacat=0', 2, 1, GETDATE()),

    ('Koi Skin Treatment', 'Relieves skin irritations and improves scales.', 17.89, 'https://i.ebayimg.com/images/g/UMwAAOSw0vxkRUPC/s-l1600.webp', 'https://www.ebay.co.uk/itm/185867302117?_skw=Koi+Skin+Treatment&epid=1704159844&itmmeta=01JCQ5A8ZB1T5012YK8TZY88T6&hash=item2b468df4e5:g:UMwAAOSw0vxkRUPC&itmprp=enc%3AAQAJAAAA8HoV3kP08IDx%2BKZ9MfhVJKnmPLhS4WkD3p9zcMxlDTDPVGc43z3LsV9%2BZe4e6et0KOrgq3y1pQAFfWxyT0sTg6F8f0Doq5FoaeLB1NjqFA%2FaHiVJsDQkWip%2B9gXc4h6%2FKb6SWRbSkLhMlfUu0W%2Bi8iEP2bYcuowI423A0kfFDHKSIhmYx5FfBClWAzBB4NU6HSs0IElGOYnFa3fmPOu%2BWrMYAicPJmOAU64ly0xHtjoteHKc2%2Bpp8stlYHVTmmMA9zbM87X2WIIl3Q5jkh6TILrxRvPonZLrrtOX%2B6uMePcDY3YYOhIJY0sOl%2BWrjFBYBg%3D%3D%7Ctkp%3ABFBM5I-p5eVk', 1, 1, GETDATE());


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


INSERT INTO Measurements (PondId, UserId, Nitrite, Oxygen, Nitrate, CreatedAt, Temperature, Phosphate, pH, Ammonium, Hardness, CarbonDioxide, CarbonHardness, Salt, TotalChlorines, OutdoorTemp, AmountFed)
VALUES 
    (1, 'U001', 0.05, 8.2, 10.5, GETDATE(), 24.3, 0.02, 7.5, 0.04, 120.0, 15.0, 6.5, 0.1, 0.3, 22.5, 50.0),

    (1, 'U001', 0.04, 7.9, 8.3, GETDATE(), 23.8, 0.01, 7.2, 0.03, 110.0, 16.5, 7.0, 0.08, 0.2, 21.0, 45.0),

    (2, 'U001', 0.06, 8.1, 12.7, GETDATE(), 25.0, 0.03, 7.4, 0.05, 125.0, 14.8, 6.8, 0.12, 0.25, 23.0, 52.0),

    (2, 'U001', 0.03, 7.5, 9.0, GETDATE(), 24.0, 0.02, 7.1, 0.02, 115.0, 15.5, 7.1, 0.09, 0.28, 20.5, 48.0),

    (3, 'U002', 0.07, 8.0, 11.0, GETDATE(), 22.5, 0.04, 7.3, 0.06, 130.0, 13.7, 6.6, 0.15, 0.35, 19.5, 55.0),

    (3, 'U002', 0.05, 7.8, 10.2, GETDATE(), 23.2, 0.03, 7.6, 0.04, 118.0, 14.2, 6.7, 0.1, 0.3, 21.8, 49.0),

    (4, 'U002', 0.06, 7.9, 11.5, GETDATE(), 24.7, 0.02, 7.2, 0.05, 122.0, 16.2, 6.9, 0.13, 0.27, 20.9, 53.0),

    (4, 'U002', 0.04, 8.3, 9.8, GETDATE(), 25.5, 0.01, 7.5, 0.03, 115.5, 15.3, 7.3, 0.08, 0.26, 22.0, 47.0); 