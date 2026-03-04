CREATE DATABASE IF NOT EXISTS littlelemon;
USE littlelemon;

-- =====================
-- Customers Table
-- =====================
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20)
);

-- =====================
-- Bookings Table
-- =====================
CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) 
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =====================
-- Orders Table
-- =====================
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalCost DECIMAL(10,2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) 
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =====================
-- Menu Table
-- =====================
CREATE TABLE Menu (
    MenuID INT AUTO_INCREMENT PRIMARY KEY,
    MenuName VARCHAR(100),
    Cuisine VARCHAR(100)
);

-- =====================
-- MenuItems Table
-- =====================
CREATE TABLE MenuItems (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    MenuItemName VARCHAR(100),
    Course VARCHAR(100),
    Price DECIMAL(10,2),
    MenuID INT,
    FOREIGN KEY (MenuID) 
        REFERENCES Menu(MenuID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- =====================
-- OrderDetails Table
-- =====================
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    MenuItemID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) 
        REFERENCES Orders(OrderID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (MenuItemID) 
        REFERENCES MenuItems(MenuItemID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);