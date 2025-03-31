CREATE TABLE Province (
    City VARCHAR(50),
    Province VARCHAR(50), 
    PRIMARY KEY (City) -- City must be unique in Province  
);


INSERT INTO Province (City, Province) VALUES
  ('Ottawa', 'ON'),
  ('Edmonton', 'AL'),
  ('Calgary', 'AL'),
  ('Montreal', 'QC'),
  ('Laval', 'QC'),
  ('Toronto', 'ON'),
  ('Vancouver', 'BC'),
  ('Halifax', 'NS');


CREATE TABLE Locations (
    Location_name VARCHAR(50), 
    Type VARCHAR(10) NOT NULL,  -- Use VARCHAR instead of ENUM
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    Phone_Number VARCHAR(50),
    Web_Address VARCHAR(50),
    Maximum_Cap INT,
    PRIMARY KEY (Location_name),
    FOREIGN KEY (City) REFERENCES Province(City),
    CHECK (Type IN ('Head', 'Branch'))  -- Use CHECK constraint to limit values
);

INSERT INTO Locations (Location_name, Type, Address, City, Postal_Code, Phone_Number, Web_Address, Maximum_Cap) VALUES
('HeadLocation1', 'Head', '123 Main St', 'Montreal', 'H1A 1A1', '514-111-1111', 'www.headlocation1.ca', 150),
('BranchLocation2', 'Branch', '456 Park Ave', 'Laval', 'H7H 7H7', '514-222-2222', 'www.branchlocation2.ca', 120),
('BranchLocation3', 'Branch', '789 Sunset Blvd', 'Toronto', 'M3B 3B3', '416-333-3333', 'www.branchlocation3.ca', 100),
('HeadLocation4', 'Head', '321 Ocean Dr', 'Vancouver', 'V5K 0A1', '604-444-4444', 'www.headlocation4.ca', 180),
('BranchLocation5', 'Branch', '654 Maple Lane', 'Halifax', 'B3J 3K7', '902-555-5555', 'www.branchlocation5.ca', 90),
('BranchLocation6', 'Branch', '2022 Richmond Rd', 'Montreal', 'H3C 2B1', '514-666-6666', 'www.branchlocation6.ca', 140),
('BranchLocation7', 'Branch', '88 Front Street', 'Toronto', 'M5J 1E3', '416-777-7777', 'www.branchlocation7.ca', 130),
('HeadLocation8', 'Head', '4097 Pine Hill', 'Halifax', 'B2V 3N4', '902-888-8888', 'www.headlocation8.ca', 160),
('BranchLocation9', 'Branch', '1180 Queen Mary', 'Laval', 'H7V 1A4', '450-999-9999', 'www.branchlocation9.ca', 110),
('BranchLocation10', 'Branch', '555 Wellington St', 'Vancouver', 'V6C 1T1', '604-000-0000', 'www.branchlocation10.ca', 95);


-- FOR THE DATE OF BIRTH ONLY USE YEAR TO MAKE SURE ITS IN BCNF

CREATE TABLE Personnel (
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Date_of_Birth_year INT,
    SIN VARCHAR(50) NOT NULL,
    MEDICAR_CART_NUMBER VARCHAR(50),
    Phone_Number VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    email VARCHAR(50),
    PRIMARY KEY(SIN),
    FOREIGN KEY (City) REFERENCES Province(City)
);

INSERT INTO Personnel (First_Name, Last_Name, Date_of_Birth_year, SIN, MEDICAR_CART_NUMBER, Phone_Number, Address, City, Postal_Code, email) VALUES
('John', 'Brown', 1994, '064 583 289', 'MED8038374', '(910) 518-34', '997 Kristen Valley', 'Edmonton', 'J7E6E7', 'dshields@hotmail.com'),
('Denise', 'Lucas', 1988, '035 185 487', 'MED5667265', '(972) 624-73', '32677 Michelle Circle', 'Calgary', 'R5A 8R5', 'smoore@gmail.com'),
('Tanya', 'Riley', 1970, '805 172 657', 'MED8090293', '(482) 081-21', '169 Donovan Ford', 'Ottawa', 'K3L5R8', 'smithchristine@hotmail.com'),
('Wendy', 'Jones', 1977, '321 103 871', 'MED3608513', '378 498 0841', '18244 Jennifer Ford Suite 874', 'Edmonton', 'C1S 1L6', 'evan78@patterson.com'),
('Amy', 'Davenport', 1981, '813 508 520', 'MED2714803', '1 (333) 158-', '0256 Joseph Turnpike', 'Calgary', 'R4B 4V8', 'lori33@gmail.com'),
('Brian', 'Reed', 1985, '126 473 629', 'MED4372801', '438-213-7890', '8392 Coleman Fork', 'Montreal', 'H2X 1Y9', 'brian.reed@example.com'),
('Julia', 'Fleming', 1990, '322 198 713', 'MED8721065', '1-514-333-4000', '9203 Anne Prairie', 'Laval', 'H7W 3Z1', 'julia.fleming@example.com'),
('Kevin', 'Hunt', 1969, '210 498 721', 'MED7835402', '514-973-0241', '1567 Audrey Branch', 'Toronto', 'M4K 1M1', 'kevin.hunt@example.com'),
('Laura', 'Kim', 1973, '409 674 315', 'MED9832104', '416-856-3451', '8000 Anderson Brook', 'Toronto', 'M5E 2J6', 'laura.kim@example.com'),
('George', 'Wells', 1966, '100 374 281', 'MED1293604', '902-857-1290', '2038 Lynn Forest', 'Halifax', 'B2Z 2V3', 'george.wells@example.com');


CREATE TABLE Role_table (
    Type_job VARCHAR(10) NOT NULL,
    Role_name VARCHAR(50), 
    PRIMARY KEY (Role_name),
    CHECK (Type_job IN ('Head', 'Branch'))  -- Use CHECK constraint to limit values
);


INSERT INTO Role_table (Type_job, Role_name) VALUES
  ('Head', 'General Manager'),
  ('Head', 'Treasurer'),
  ('Head', 'Secretary'),
  ('Branch', 'Coach'),
  ('Branch', 'Captain');



CREATE TABLE Working_log (
    Transaction_work_id VARCHAR(50), 
    SIN VARCHAR(50), 
    Location_name VARCHAR(50), 
    Role_name VARCHAR(50),
    Mandate  VARCHAR(50),
    Start_date_month INT NOT NULL,
    Start_date_month_year INT NOT NULL,
    end_date_month INT,
    end_date_year INT,
    PRIMARY KEY(Transaction_work_id),
    FOREIGN KEY (Role_name) REFERENCES Role_table(Role_name),
    FOREIGN KEY (Location_name) REFERENCES Locations(Location_name),
    CHECK (Mandate IN ('Paid', 'Unpaid'))  -- Use CHECK constraint to limit values
);

INSERT INTO Working_log (Transaction_work_id, SIN, Location_name, Role_name, Mandate, Start_date_month, Start_date_month_year, end_date_month, end_date_year) VALUES
('WLOG1', '064 583 289', 'HeadLocation8', 'Secretary', 'Paid', 12, 2023, 12, 2024),
('WLOG2', '035 185 487', 'BranchLocation2', 'General Manager', 'Paid', 2, 2023, NULL, NULL),
('WLOG3', '805 172 657', 'BranchLocation6', 'Captain', 'Unpaid', 4, 2021, NULL, NULL),
('WLOG4', '321 103 871', 'BranchLocation6', 'Secretary', 'Paid', 7, 2023, 9, 2024),
('WLOG5', '813 508 520', 'BranchLocation2', 'Captain', 'Paid', 10, 2023, NULL, NULL),
('WLOG6', '805 172 657', 'BranchLocation3', 'Coach', 'Paid', 8, 2023, NULL, NULL),
('WLOG7', '126 473 629', 'HeadLocation4', 'General Manager', 'Unpaid', 12, 2022, 9, 2024),
('WLOG8', '322 198 713', 'BranchLocation7', 'Coach', 'Paid', 5, 2023, NULL, NULL),
('WLOG9', '210 498 721', 'BranchLocation9', 'Secretary', 'Unpaid', 3, 2020, 11, 2021),
('WLOG10', '100 374 281', 'BranchLocation5', 'Coach', 'Paid', 10, 2021, NULL, NULL);



CREATE TABLE Family_member (
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Date_of_Birth DATE,
    SIN VARCHAR(50) NOT NULL,
    MEDICAR_CART_NUMBER VARCHAR(50),
    Phone_Number VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    email VARCHAR(50),
    secondary_fam_number_SIN VARCHAR(50),
    PRIMARY KEY(SIN),
    FOREIGN KEY (City) REFERENCES Province(City)
);

INSERT INTO Family_member (First_Name, Last_Name, Date_of_Birth, SIN, MEDICAR_CART_NUMBER, Phone_Number, Address, City, Postal_Code, email,secondary_fam_number_SIN) VALUES
('John', 'Foster', '1966-03-01', '482 056 645', 'MED2556017', '583.842.5135', '8498 Elizabeth Plaza', 'Vancouver', 'E2G2L9', 'juan35@watts.net','6637499733'),
('Tracy', 'Whitehead', '1966-06-10', '055 624 688', 'MED7022674', '342 786 8011', '9826 Bobby Lakes', 'Toronto', 'P2J 6K9', 'sarayoung@gmail.com','2768803454'),
('Theresa', 'Cochran', '1976-12-03', '601 726 482', 'MED1728977', '1-521-607-33', '03654 Tammy Harbors', 'Vancouver', 'X6R1Y2', 'beverlyterrell@gmail.com','8807729634'),
('Daniel', 'Hamilton', '1994-04-21', '534 806 245', 'MED3094235', '1-606-088-35', '148 Estrada Islands Suite 482', 'Vancouver', 'S5R 7H9', 'justin69@pena.com','2321732910'),
('William', 'Leon', '1965-08-17', '258 253 061', 'MED5918715', '1-833-200-37', '936 Ross Drive Apt. 163', 'Halifax', 'X9T 4B2', 'lauriecontreras@hotmail.com','7349712426'),
('Diane', 'Miller', '1962-11-30', '717 388 448', 'MED9376542', '514-873-1234', '2435 Taylor Loop', 'Montreal', 'H3A 3K5', 'diane.miller@example.com','4164693513'),
('Andrew', 'Grant', '1975-02-22', '812 235 900', 'MED8847612', '1-613-555-6789', '4390 Richard Glen', 'Toronto', 'M2N 6K6', 'andrew.grant@example.com','9519046510'),
('Angela', 'Sullivan', '1970-07-09', '612 458 123', 'MED3009843', '514-963-2288', '7219 Kelly View Apt. 5', 'Laval', 'H7N 3C2', 'angela.sullivan@example.com','2325820666'),
('Bruce', 'Mason', '1969-04-14', '208 991 555', 'MED7632104', '450-754-4592', '9023 Jerry Route', 'Halifax', 'B2Y 3K1', 'bruce.mason@example.com','4586699124'),
('Lisa', 'Hayes', '1968-01-05', '407 293 666', 'MED8851203', '1-438-789-0456', '1038 Megan Tunnel', 'Montreal', 'H4A 1K4', 'lisa.hayes@example.com','0801175915');



CREATE TABLE Secondary_Family_member (
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Date_of_Birth DATE,
    SIN VARCHAR(50) NOT NULL,
    Phone_Number VARCHAR(50),
    Relationship VARCHAR(50),
    PRIMARY KEY(SIN)
);

-- THIS IS  A TEST TABLE 
INSERT INTO Secondary_Family_member (First_Name, Last_Name, Date_of_Birth,SIN, Phone_Number,Relationship) VALUES
('Ale', 'Foster', '1966-03-01', '6637499733', '583.842.5135','Grandmother'),
('a', 'Whitehead', '1966-06-10', '2768803454','342 786 8011','Grandmother'),
('Theresa', 'Cochran', '1976-12-03', '4164693513','1-521-607-33', 'Grandfather'),
('Daniel', 'Hamilton', '1994-04-21', '533 806 245', '1-606-088-35', 'Grandmother'),
('William', 'Leon', '1965-08-17', '9519046510', '1-833-200-37','Grandmother'),
('Diane', 'Miller', '1962-11-30', '711 388 448', '514-873-1234', 'Grandmother'),
('Andrew', 'Grant', '1975-02-22', '819 235 900', '1-613-555-6789', 'Grandfather'),
('Angela', 'Sullivan', '1970-07-09', '312 458 123',  '514-963-2288','Grandmother'),
('Bruce', 'Mason', '1969-04-14', '208 993 555',  '450-754-4592', 'Grandfather'),
('Lisa', 'Hayes', '1968-01-05', '401 293 666', '1-438-789-0456', 'Grandfather');


CREATE TABLE Member_registration (
    Registration_id VARCHAR(50), 
    SIN VARCHAR(50), 
    Location_name VARCHAR(50), 
    Family_SIN VARCHAR(50),
    Relationship VARCHAR(50),
    Registration_date_month INT NOT NULL,
    Registration_date_year INT NOT NULL,
    Age_at_registration INT,
    PRIMARY KEY(Registration_id),
    FOREIGN KEY (Family_SIN) REFERENCES Family_member(SIN)
);

INSERT INTO Member_registration (Registration_id, SIN, Location_name, Family_SIN, Relationship, Registration_date_month, Registration_date_year, Age_at_registration) VALUES
('REG1', '537 532 244', 'HeadLocation1', '482 056 645', 'Father', 11, 2021, 12),
('REG2', '432 534 774', 'BranchLocation2', '055 624 688', 'Mother', 9, 2024, 18),
('REG3', '341 053 411', 'BranchLocation6', '717 388 448', 'Aunt', 4, 2023, 17),
('REG4', '720 533 819', 'HeadLocation4', '208 991 555', 'Father', 10, 2023, 17),
('REG5', '720 533 819', 'HeadLocation1', '208 991 555', 'Father', 10, 2023, 17),
('REG6', '720 533 819', 'HeadLocation3', '208 991 555', 'Father', 10, 2023, 17),
('REG7', '100 497 566', 'BranchLocation2', '612 458 123', 'Mother', 1, 2024, 15),
('REG8', '963 347 771', 'BranchLocation5', '407 293 666', 'Mother', 1, 2023, 14),
('REG9', '514 068 345', 'HeadLocation1', '601 726 482', 'Mother', 5, 2021, 12),
('REG10', '514 068 345', 'HeadLocation1', '601 726 482', 'Mother', 5, 2021, 12),
('REG11', '514 068 345', 'HeadLocation3', '601 726 482', 'Mother', 5, 2021, 12),
('REG12', '203 457 623', 'BranchLocation6', '258 253 061', 'Uncle', 1, 2022, 12),
('REG13', '600 921 054', 'BranchLocation10', '534 806 245', 'Tutor', 3, 2022, 11),
('REG14', '402 537 146', 'BranchLocation6', '717 388 448', 'Aunt', 3, 2024, 17),
('REG15', '402 537 146', 'BranchLocation2', '717 388 448', 'Aunt', 3, 2024, 19),
('REG16', '203 457 623', 'BranchLocation20', '258 253 061', 'Uncle', 1, 2022, 12),
('REG17', '203 457 623', 'BranchLocation12', '258 253 061', 'Uncle', 1, 2022, 12);


CREATE TABLE Club_member (
    CMN VARCHAR(50),
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Date_of_Birth_month INT,
    Date_of_Birth_year INT,
    SIN VARCHAR(50) NOT NULL,
    MEDICAR_CART_NUMBER VARCHAR(50),
    Phone_Number VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    PRIMARY KEY(SIN),
    FOREIGN KEY (City) REFERENCES Province(City)
);

INSERT INTO Club_member (CMN, First_Name, Last_Name, Date_of_Birth_month, Date_of_Birth_year, SIN, MEDICAR_CART_NUMBER, Phone_Number, Address, City, Postal_Code) VALUES
('66d06371', 'Ronald', 'Rodriguez', 2, 2008, '750 144 677', 'MED6279418', '1-999-856-98', '18367 Robert Views Suite 661', 'Laval', 'J9X 6K9'),
('15da705c', 'Christopher', 'Davis', 11, 2010, '514 068 345', 'MED7637601', '+1 (956) 049', '73158 Wilson Harbors', 'Vancouver', 'T2W 4G5'),
('c32d4526', 'Kyle', 'Morgan', 3, 2009, '016 546 889', 'MED3342608', '518-366-7525', '910 Eric River Apt. 147', 'Laval', 'R5W 1J2'),
('1c6345ab', 'Justin', 'Gregory', 12, 2011, '720 533 819', 'MED5408072', '1-332-445-10', '8388 Jones Wall', 'Halifax', 'B3G 2N5'),
('a3e05309', 'Robert', 'Wilson', 7, 2011, '071 231 831', 'MED7700828', '436.968.1645', '18188 Rebecca Keys Suite 231', 'Toronto', 'M5H 2N2'),
('12b401fa', 'Ashley', 'Price', 4, 2007, '100 497 566', 'MED3067725', '1-450-287-03', '9312 Erica Bridge Suite 473', 'Montreal', 'H1A 4G9'),
('f3c2a4e7', 'Jacob', 'Brooks', 10, 2012, '963 347 771', 'MED1204867', '1-290-532-25', '2907 Morgan Hill', 'Toronto', 'M4V 1K5'),
('e244e28b', 'Alyssa', 'Martin', 5, 2010, '402 537 146', 'MED9837465', '1-601-332-82', '0523 Wallace Curve Suite 756', 'Montreal', 'H3B 2T6'),
('3df9a79c', 'Laura', 'Campbell', 8, 2008, '600 921 054', 'MED7043136', '819.364.9804', '9811 Gomez Mountains', 'Halifax', 'B1P 4W6'),
('647d99a2', 'Tyler', 'Walker', 6, 2013, '203 457 623', 'MED3841298', '514-456-7890', '3580 Thomas Roads', 'Laval', 'H7T 2R3');

CREATE TABLE Financial_log (
    Transaction_Fin_id VARCHAR(50), 
    CMN VARCHAR(50),
    SIN VARCHAR(50),
    Payment_amount INT,
    Date_of_payment_month INT,
    Date_of_payment_year INT,
    Method_of_payment VARCHAR(50),
    PRIMARY KEY(Transaction_Fin_id),
    FOREIGN KEY (SIN) REFERENCES Club_member(SIN)
);

INSERT INTO Financial_log (Transaction_Fin_id, CMN, SIN, Payment_amount, Date_of_payment_month, Date_of_payment_year, Method_of_payment) VALUES
('FIN1', '66d06371', '750 144 677', 110, 12, 2023, 'Debit'),
('FIN2', '15da705c', '514 068 345', 50, 6, 2024, 'Cash'),
('FIN3', '15da705c', '514 068 345', 75, 5, 2025, 'Debit'),
('FIN4', 'c32d4526', '016 546 889', 75, 2, 2023, 'Debit'),
('FIN5', '1c6345ab', '720 533 819', 50, 4, 2025, 'Debit'),
('FIN6', 'a3e05309', '071 231 831', 75, 10, 2023, 'Debit'),
('FIN7', '12b401fa', '100 497 566', 25, 8, 2023, 'Cash'),
('FIN8', 'f3c2a4e7', '963 347 771', 100, 12, 2025, 'Credit Card'),
('FIN9', 'e244e28b', '402 537 146', 100, 6, 2023, 'Cash'),
('FIN10', '3df9a79c', '600 921 054', 100, 7, 2023, 'Cash');


CREATE TABLE Team_position (
    Position_id VARCHAR(50), 
    Position_name VARCHAR (50),
    PRIMARY KEY(Position_id)
);

INSERT INTO Team_position (Position_id, Position_name) VALUES
  ('1', 'Outside Hitter'),
  ('2', 'Opposite'),
  ('3', 'Setter'),
  ('4', 'Middle Blocker'),
  ('5', 'Libero');

CREATE TABLE Team_entity (
    Team_name VARCHAR(50), 
    Captain_name VARCHAR (50),
    PRIMARY KEY(Team_name)
);

INSERT INTO Team_entity (Team_name, Captain_name) VALUES
('Team1', 'Rodrigo Walker'),
('Team2', 'Yusuf Morgan'),
('Team3', 'Alexandre Wilson'),
('Team4', 'Jerry Martin'),
('Team5', 'Charbel Price');


-- Assume a player is fixed per team, and kep the same role. 

CREATE TABLE Player_team (
    Team_name VARCHAR(50), 
    Player_SIN VARCHAR (50),
    Position_id VARCHAR(50), 
    PRIMARY KEY(Player_SIN, Team_name), -- Allow multiple teams for a player
    FOREIGN KEY (Team_name) REFERENCES Team_entity(Team_name), 
    FOREIGN KEY (Player_SIN) REFERENCES Club_member(SIN),
    FOREIGN KEY (Position_id) REFERENCES Team_position(Position_id)
);

INSERT INTO Player_team (Team_name, Player_SIN, Position_id) VALUES
('Team1', '750 144 677', '1'),  
('Team2', '514 068 345', '5'),  
('Team3', '016 546 889', '3'),  
('Team4', '720 533 819', '1'),  
('Team5', '071 231 831', '2'),  
('Team2', '100 497 566', '4'),  
('Team4', '963 347 771', '5'),  
('Team3', '402 537 146', '2'),  
('Team5', '600 921 054', '1'), 
('Team1', '203 457 623', '2');  


CREATE TABLE Game_log (
    game_id VARCHAR(50), 
    game_month INT,
    game_year INT,
    game_hour INT, 
    game_type VARCHAR(50), 
    game_city_location VARCHAR (100),
    team1_name VARCHAR(50),
    team2_name VARCHAR(50),
    score INT, 
    CHECK (game_type IN ('training', 'game')),  -- Use CHECK constraint to limit values
    PRIMARY KEY(game_id),
    FOREIGN KEY (team1_name) REFERENCES Team_entity(Team_name), 
    FOREIGN KEY (team2_name) REFERENCES Team_entity(Team_name)
);

INSERT INTO Game_log (game_id, game_month, game_year, game_hour, game_type, game_city_location, team1_name, team2_name, score) VALUES
('GAME1', 12, 2024, 12, 'training', 'Port Christina',  'Team5', 'Team3', 9),
('GAME2', 11, 2024, 12, 'game', 'Jasonhaven',  'Team5', 'Team1', 83),
('GAME3', 5, 2023, 9, 'training', 'South Stacy',  'Team4', 'Team5', 55),
('GAME4', 12, 2024, 9, 'training', 'Robersonton',  'Team4', 'Team5', 2),
('GAME5', 10, 2023, 18, 'training', 'Victorton',  'Team3', 'Team1', 71),
('GAME6', 10, 2023, 12, 'training', 'West Bobview',  'Team3', 'Team5', 91),
('GAME7', 12, 2023, 18, 'game', 'Johnstonport',  'Team4', 'Team3', 29),
('GAME8', 12, 2024, 12, 'training', 'Coxburgh', 'Team2', 'Team1', 70),
('GAME9', 2, 2023, 18, 'training', 'Lake Isaiah',  'Team3', 'Team5', 26),
('GAME10', 8, 2023, 20, 'game', 'Ayalachester',  'Team5', 'Team1', 88);




 --  6. Assign/Delete/Edit a club member to a team formation. (Attempt to assign a conflicting
 -- assignment for a club member in two team formations on the same day)
 
 -- NOT WORKING 
 
-- CREATE TRIGGER prevent_multiple_team_assignments
-- BEFORE INSERT ON Player_team
-- FOR EACH ROW
-- BEGIN
--     -- Check if the player is already assigned to another team on the same day
--     IF EXISTS (
--         SELECT 1
--         FROM Game_log gl
--         JOIN Player_team pt1 ON gl.team1_name = pt1.Team_name OR gl.team2_name = pt1.Team_name
--         WHERE pt1.Player_SIN = NEW.Player_SIN
--           AND gl.game_year = (SELECT game_year FROM Game_log WHERE game_id = NEW.game_id)
--           AND gl.game_month = (SELECT game_month FROM Game_log WHERE game_id = NEW.game_id)
--     ) THEN
--         -- If a conflict is found, signal an error
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Player is already assigned to another team playing on this day.';
--     END IF;
-- END;


-- QUESTION 8 
-- For a given family member, get details of all the locations that she/he was/is associated
-- with, the secondary family member and all the club members associated with the
-- primary family member. Information includes first name, last name and phone number
-- of the secondary family member, and for every associated club member, the location
-- name, the club membership number, first-name, last-name, date of birth, Social
-- Security Number, Medicare card number, telephone number, address, city, province,
-- postal-code, and relationship with the secondary family member.



WITH TABLE1 AS (

SELECT Secondary_Family_member.First_Name AS Secondary_first_name,
Secondary_Family_member.Last_Name AS Secondary_last_name,
Secondary_Family_member.Phone_Number AS Secondary_phone_number,
Member_registration.SIN AS PLAYER_SIN,
Secondary_Family_member.relationship
FROM Family_member
INNER JOIN Secondary_Family_member ON Family_member.secondary_fam_number_SIN = Secondary_Family_member.SIN
INNER JOIN Member_registration ON Family_member.SIN = Member_registration.Family_SIN
)



SELECT *

FROM TABLE1
INNER JOIN Club_member ON TABLE1.PLAYER_SIN = Club_member.SIN;



-- Get details of club members who are currently active and have been associated with at
-- least three different locations and are members for at most three years. Details include
-- Club membership number, first name and last name. Results should be displayed sorted
-- in ascending order by club membership number.


-- GET THE TABLE FOR ACTIVE CLUB MEMBER , ONLY USE YEAR 2025 

WITH TABLE2 AS (
    SELECT 
        CMN, 
        SUM(Payment_amount) AS TOTAL_PAYMENT,
        CASE 
            WHEN SUM(Payment_amount) >= 100 THEN 'ACTIVE' 
            ELSE 'INACTIVE' 
        END AS STATUS 
    FROM Financial_log
    WHERE Date_of_payment_year = 2025
    GROUP BY CMN
    HAVING STATUS = 'ACTIVE'
),

-- GET THE table for each club member that are registered to three locations at least in the past 

TABLE3 AS (

        SELECT SUB.SIN AS SIN1, COUNT(*) AS Registration_count
        FROM 
            (SELECT SIN,
            Location_name,
            COUNT(*) AS count_ls
            FROM Member_registration
            GROUP BY SIN,Location_name) AS SUB
        GROUP BY SIN
        HAVING Registration_count >=3
      
  ),
  


TABLE4 AS (
        SELECT TABLE2.CMN,TABLE2.STATUS,
        Club_member.First_Name,
        Club_member.Last_Name,
        Club_member.SIN AS SIN2
        FROM TABLE2 
        INNER JOIN Club_member ON TABLE2.CMN = Club_member.CMN
        ORDER BY TABLE2.CMN
        

  )

-- working but gives no query because not happening in databse 

SELECT * 
FROM TABLE4
inner JOIN TABLE3 ON TABLE4.SIN2 = TABLE3.SIN1;





-- Get a report on all active club members who have never been assigned to any formation
-- team session. The list should include the club member’s membership number, first
-- name, last name, age, date of joining the club, phone number, email and current location
-- name. The results should be displayed sorted in ascending order by location name then
-- by club membership number.


-- Create the table of active member 


WITH TABLE2 AS (
    SELECT 
        CMN, 
        SUM(Payment_amount) AS TOTAL_PAYMENT,
        CASE 
            WHEN SUM(Payment_amount) >= 100 THEN 'ACTIVE' 
            ELSE 'INACTIVE' 
        END AS STATUS 
    FROM Financial_log
    WHERE Date_of_payment_year = 2025
    GROUP BY CMN
    HAVING STATUS = 'ACTIVE'
),

-- GET THE SIN of the player
TABLE3 AS (
        SELECT TABLE2.CMN,TABLE2.STATUS,
        Club_member.First_Name,
        Club_member.Last_Name,
        Club_member.SIN AS SIN2
        FROM TABLE2 
        INNER JOIN Club_member ON TABLE2.CMN = Club_member.CMN
        ORDER BY TABLE2.CMN
        

  ),
  
 RankedRegistrations AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY SIN 
               ORDER BY Registration_date_year DESC, Registration_date_month DESC
           ) AS rn
    FROM Member_registration
),

-- THIS TABLE IS THE TABLE SHOWING ALL THE CURRENT LOCATIONS OF EVERY PLAYERS (IN CASE OF MULTIPLE LOCATIONS)
Ranked_Filtered AS (
  SELECT *
  FROM RankedRegistrations
  WHERE rn = 1),
  
  
  -- TABLE SHOWING ALL THE TEAMS THAT HAVE BEEN REGISTERED IN A GAME SESSIONS 
  
Teams_participation AS(
SELECT DISTINCT Team_in_log FROM (
    SELECT team1_name AS Team_in_log FROM Game_log
    UNION
    SELECT team2_name AS Team_in_log FROM Game_log
) AS AllTeams),


-- GET ALL THE PLAYER THAT HAVE BEEN PLAYING IN AN ACTIVE TEAMS FROM TEAMS PARTICIPATION TABLE


PLAYER_TEAMS_PARTICIPATION AS (

SELECT * FROM (
    SELECT Team_name, PLAYER_SIN
    FROM Player_team
    GROUP BY Team_name,Player_SIN) AS SUB
    LEFT JOIN Teams_participation ON SUB.Team_name = Teams_participation.Team_in_log
    WHERE Teams_participation.Team_in_log IS NOT NULL
),


-- Now That we have all the player we need to merge them with the Ranked_Filtered in order to get the current location 
CURRENT_LOCATION AS (
  SELECT SIN AS SIN1,Location_name
  FROM Ranked_Filtered
  INNER JOIN PLAYER_TEAMS_PARTICIPATION on Ranked_Filtered.SIN = PLAYER_TEAMS_PARTICIPATION.Player_SIN)
  
-- NOW WE CAN MERGE BACK TO THE PLAYER TABLE 
-- HERE NOT COMPLETE BECAUSE SOME PLAYER ARE IN THE CLUB MEMBER BUT HAVE NEVER BEEN REGISTERED 

SELECT * 
FROM Club_member
left JOIN CURRENT_LOCATION on Club_member.SIN = CURRENT_LOCATION.SIN1
WHERE CURRENT_LOCATION.SIN1 IS NULL;









-- Get a report on all active club members who have been assigned at least once to every
-- role throughout all the formation team game sessions. The club member must be
-- assigned to at least one formation game session as an outside hitter, opposite, setter,
-- middle blocker, libero, defensive specialist, and serving specialist. The list should
-- include the club member’s membership number, first name, last name, age, phone
-- number, email and current location name. The results should be displayed sorted in
-- ascending order by location name then by club membership number.



-- GET THE LAST OF ACTIVE MEMBER, THIS TABLE IS THE UPDATED ONE WITH THE AGE IN CONSIDERATION 

WITH TABLE2 AS (
SELECT * FROM (
    SELECT 
      CMN AS CMN1, SIN AS financial_sin,
        SUM(Payment_amount) AS TOTAL_PAYMENT,
        CASE 
            WHEN SUM(Payment_amount) >= 100 THEN 'ACTIVE' 
            ELSE 'INACTIVE' 
        END AS STATUS 
    FROM Financial_log
    WHERE Date_of_payment_year = 2025
    GROUP BY CMN1,financial_sin
    HAVING STATUS = 'ACTIVE') AS SUB 
    INNER JOIN Club_member ON SUB.financial_sin = Club_member.SIN
    WHERE Club_member.Date_of_Birth_year<2014 AND Club_member.Date_of_Birth_year>2007
)

 --  GET THE NUMBER OF TIME A PLAYER HAS BEEN ASSIGNED TO DIFFERENT ROLE 
  --  IF THE COUNT IS 7, THEN THE PLAYER HAS BEEN throughout ALL THE ROLES AVAILABLES 
 
 SELECT SUB.Player_SIN, COUNT(*)
 FROM (
      SELECT Player_SIN,Position_id
      FROM Player_team
      GROUP BY Player_SIN,Position_id) AS SUB 
      
      GROUP BY SUB.Player_SIN
     
     




