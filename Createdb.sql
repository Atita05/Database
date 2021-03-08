--1 st task :- create table script
-- here Outlet_Name is PK
CREATE TABLE Outlet (
    Outlet_Name VARCHAR(500) NOT NULL,
    Address_Street VARCHAR(100),
    Address_City VARCHAR(100),
    PRIMARY KEY (Outlet_Name)
   );

-- here Customer_Number is PK
CREATE TABLE Customer (
    Customer_Number int  NOT NULL,
    Customer_Name VARCHAR(100),
    Address_Street VARCHAR(40),
    Address_City VARCHAR(40),
    PRIMARY KEY (Customer_Number)
   );
--here Product_Id is PK
CREATE TABLE Product (
    Product_Id int NOT NULL,
    Product_Name VARCHAR(100),
    Description VARCHAR(50),
    Standard_Price Float,
    PRIMARY KEY (Product_Id)
   );

--here Category is PK
CREATE TABLE Category (
    Category_Id int NOT NULL,
    Description VARCHAR(100),
    PRIMARY KEY (Category_Id)
   );

-- foreign key concept wise table creation
--here Product_Id, Category_Id is FK
CREATE TABLE Product_Category (
    Product_Id  int NOT NULL,  
    Category_Id int NOT NULL,
    PRIMARY KEY (Product_Id,Category_Id),
    FOREIGN KEY (Category_Id) REFERENCES Category(Category_Id),
    FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
    );
    
--prim + foreign key concept
CREATE TABLE Purchase (
    Purchase_id  int NOT NULL,  
    Date_time datetime,
    Outlet_Name VARCHAR(200), 
    Customer_Number int,  
    PRIMARY KEY (Purchase_id),
    FOREIGN KEY (Outlet_Name) REFERENCES Outlet(Outlet_Name),
    FOREIGN KEY (Customer_Number) REFERENCES Customer(Customer_Number)
);
CREATE TABLE PurchaseItem (
    Purchase_id  int NOT NULL, 
    Product_Id int NOT NULL,
    copies int,
    price_per_copy float,  
    PRIMARY KEY (Purchase_id,Product_id),
    FOREIGN KEY (Purchase_id) REFERENCES Purchase(Purchase_id),
    FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
);
CREATE TABLE Stock (
    Outlet_Name VARCHAR(200) NOT NULL,
    Product_Id int NOT NULL,
    copies int, 
   PRIMARY KEY (Outlet_Name,Product_id),
    FOREIGN KEY (Outlet_Name) REFERENCES Outlet(Outlet_Name),
    FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
);




