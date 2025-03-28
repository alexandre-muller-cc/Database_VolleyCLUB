

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




CREATE TABLE Personnel (
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
    Start_date DATE NOT NULL,
    END_DATE DATE,
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
    Registration_date DATE NOT NULL,
    Age_at_registration INT,
    PRIMARY KEY(Registration_id),
    FOREIGN KEY (Family_SIN) REFERENCES Family_member(SIN)
);

CREATE TABLE Club_member (
    CMN VARCHAR(50),
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Date_of_Birth DATE,
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
    Date_of_payment DATE,
    Method_of_payment VARCHAR(50),
    PRIMARY KEY(Transaction_Fin_id),
    FOREIGN KEY (SIN) REFERENCES Club_member(SIN)
);





