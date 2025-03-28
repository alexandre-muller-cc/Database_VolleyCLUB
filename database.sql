CREATE TABLE Locations (
    Name VARCHAR(50), 
    Type VARCHAR(10) NOT NULL,  -- Use VARCHAR instead of ENUM
    Address VARCHAR(50),
    City VARCHAR(50),
    Postal_Code VARCHAR(7),
    Phone_Number VARCHAR(12),
    Web_Address VARCHAR(50),
    Maximum_Cap INT,
    PRIMARY KEY (Name),
    FOREIGN KEY (City) REFERENCES Province(City),
    CHECK (Type IN ('Head', 'Branch'))  -- Use CHECK constraint to limit values
    
);

CREATE TABLE Province (
    City VARCHAR(50),
    Province VARCHAR(50), 
    PRIMARY KEY (City) -- City must be unique in Province
    
   
);


CREATE TABLE Personnel (
    `First Name` VARCHAR(50), 
    `Last Name` VARCHAR(50), 
    `Date of Birth` DATE,
    SIN VARCHAR(50) NOT NULL,
    `MEDICAR CART NUMBER` VARCHAR(50),
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
    `Transaction_id` VARCHAR(50), 
    SIN VARCHAR(50), 
    `Name` VARCHAR(50), 
    Role_name VARCHAR(50),
    Mandate ENUM('Paid','Unpaid'),
    Start_date DATE NOT NULL,
    END_DATE,
    PRIMARY KEY(`Transaction_id`),
    FOREIGN KEY (`Role_name`) REFERENCES Role_table(Role_name)
    
);
