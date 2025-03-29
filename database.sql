

CREATE TABLE Province (
    City VARCHAR(50),
    Province VARCHAR(50), 
    PRIMARY KEY (City) -- City must be unique in Province
    
   
);
CREATE TABLE Locations (
    Location_name VARCHAR(50), 
    Type VARCHAR(10) NOT NULL,  -- Use VARCHAR instead of ENUM
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    Phone_Number VARCHAR(12),
    Web_Address VARCHAR(50),
    Maximum_Cap INT,
    PRIMARY KEY (Location_name),
    FOREIGN KEY (City) REFERENCES Province(City),
    CHECK (Type IN ('Head', 'Branch'))  -- Use CHECK constraint to limit values
    
);


-- FOR THE DATE OF BIRTH ONLY USE YEAR TO MAKE SURE ITS IN BCNF

CREATE TABLE Personnel (
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Date_of_Birth_year INT,
    SIN VARCHAR(50) NOT NULL,
    MEDICAR_CART_NUMBER VARCHAR(50),
    Phone_Number VARCHAR(12),
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    email VARCHAR(50),
    PRIMARY KEY(SIN),
    FOREIGN KEY (City) REFERENCES Province(City)
);

CREATE TABLE Role_table (
    Type_job VARCHAR(10) NOT NULL,
    Role_name VARCHAR(50), 
    PRIMARY KEY (Role_name),
    CHECK (Type_job IN ('Head', 'Branch'))  -- Use CHECK constraint to limit values
);


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



CREATE TABLE Family_member (
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Date_of_Birth DATE,
    SIN VARCHAR(50) NOT NULL,
    MEDICAR_CART_NUMBER VARCHAR(50),
    Phone_Number VARCHAR(12),
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    email VARCHAR(50),
    PRIMARY KEY(SIN),
    FOREIGN KEY (City) REFERENCES Province(City)
);

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

CREATE TABLE Club_member (
    CMN VARCHAR(50),
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Date_of_Birth_month INT,
    Date_of_Birth_year INT,
    SIN VARCHAR(50) NOT NULL,
    MEDICAR_CART_NUMBER VARCHAR(50),
    Phone_Number VARCHAR(12),
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    PRIMARY KEY(SIN),
    FOREIGN KEY (City) REFERENCES Province(City)
);

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

CREATE TABLE Team_position (
    Position_id VARCHAR(50), 
    Position_name VARCHAR (50),
    PRIMARY KEY(Position_id)

);

CREATE TABLE Team_entity (
    Team_name VARCHAR(50), 
    Captain_name VARCHAR (50),
    PRIMARY KEY(Team_name)
);

-- Assume a player is fixed per team, and kep the same role. 

CREATE TABLE Player_team (
    Team_name VARCHAR(50), 
    Player_SIN VARCHAR (50),
    Position_id VARCHAR(50), 
    PRIMARY KEY(Player_SIN),
    FOREIGN KEY (Team_name) REFERENCES Team_entity(Team_name), 
    FOREIGN KEY (Player_SIN) REFERENCES Club_member(SIN),
    FOREIGN KEY (Position_id) REFERENCES Team_position(Position_id)
);


CREATE TABLE Game_log (
    game_id VARCHAR(50), 
    game_month INT,
    game_year INT,
    game_hour INT, 
    game_type VARCHAR(50), 
    game_city_location VARCHAR (100),
    Player_SIN VARCHAR (50),
    team1_name VARCHAR(50),
    team2_name VARCHAR(50),
    score INT, 
    CHECK (game_type IN ('training', 'game')),  -- Use CHECK constraint to limit values
    PRIMARY KEY(game_id),
    FOREIGN KEY (team1_name) REFERENCES Team_entity(Team_name), 
    FOREIGN KEY (team2_name) REFERENCES Team_entity(Team_name),
    FOREIGN KEY (Player_SIN) REFERENCES Club_member(SIN)
);


    
    









