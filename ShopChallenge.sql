CREATE DATABASE IF NOT EXISTS Shop;
USE SHOP;

DROP TABLE ORDERLINE;
DROP TABLE ORDERS;
DROP TABLE USER;
DROP TABLE PRODUCTS;


CREATE TABLE User (
UserId int NOT NULL auto_increment, 
name varchar(40) NOT NULL,
email varchar(100) NOT NULL,
house_number int NOT NULL,
postcode varchar(8) NOT NULL,
PRIMARY KEY (UserId)
);

Describe USER;


CREATE TABLE Products (
ProductId int NOT NULL auto_increment, 
name varchar(40) NOT NULL,
Description varchar(100) NOT NULL,
Stock int NOT NULL,
Cost decimal(6,2) NOT NULL,
PRIMARY KEY (ProductId)
);

CREATE TABLE Orders (
OrderId int NOT NULL auto_increment, 
DatePlaced date NOT NULL,
UserId_Fk int NOT NULL,
PRIMARY KEY (OrderId),
FOREIGN KEY (UserId_Fk) references User(UserId) ON DELETE cascade
);

create table OrderLine (
OrderLineId int NOT NULL AUTO_INCREMENT,
OrderId_Fk int NOT NULL,
ProductId_fk int not null,
PRIMARY key (OrderLineId),
foreign key (OrderId_Fk) references Orders(OrderId) ON DELETE cascade,
foreign key (ProductId_fk) references Products(ProductId) ON DELETE cascade
);

CREATE TABLE Reviews (
ReviewID INT NOT NULL AUTO_INCREMENT,
ReviewDesc VARCHAR(500) NOT NULL,
UserId_Fk INT NOT NULL,
ProductId_Fk INT NOT NULL,
primary key (ReviewID),
FOREIGN KEY (UserId_Fk) REFERENCES User(UserId) ON DELETE CASCADE,
FOREIGN KEY (ProductId_Fk) REFERENCES Products(ProductId) ON DELETE CASCADE
);

INSERT INTO User (name, email, house_number, postcode)
VALUES ('bob', 'bobpp@bob.com', 23,  'rg39 8hh');
INSERT INTO User (name, email, house_number, postcode)
VALUES ('Craig', 'Craig@bob.com', 33,  'rg19 5hh');
INSERT INTO User (name, email, house_number, postcode)
VALUES ('Liam', 'Luke@john.com', 24,  'rg19 1jh');
INSERT INTO User (name, email, house_number, postcode)
VALUES ('Connor', 'Connor@bob.com', 18,  'rg19 8lh');
INSERT INTO User (name, email, house_number, postcode)
VALUES ('Jerimiah', 'JJ@John.com', 56,  'rg14 5we');
INSERT INTO User (name, email, house_number, postcode)
VALUES ('Doug', 'Dougy@bob.com', 69,  'hp13 9bw');
INSERT INTO User (name, email, house_number, postcode)
VALUES ('Smith', 'John@bob.com', 83,  'rp65 8ah');

INSERT INTO Products (name, description, stock, cost)
VALUES ('Golden Toilet Throne', 'Gold Plated wonderful piece of design', 2000,  999.99);
INSERT INTO Products (name, description, stock, cost)
VALUES ('Platinum Toilet NFT', 'Picture of a Platinum toilet', 2,  9999.99);
INSERT INTO Products (name, description, stock, cost)
VALUES ('Chair', 'You sit on it', 566,  6.00);
INSERT INTO Products (name, description, stock, cost)
VALUES ('Gold leaf Edible Sofa', 'You can eat a sofa and also sit on it!', 23,  35.65);
INSERT INTO Products (name, description, stock, cost)
VALUES ('The left arm of ghandi', 'Only one left in stock!', 1,  69.69);

INSERT INTO ORDERS (DATEPLACED,UserId_Fk)
VALUES ('2022-05-13', 1);
INSERT INTO ORDERS (DATEPLACED,UserId_Fk)
VALUES ('2021-08-10', 2);
INSERT INTO ORDERS (DATEPLACED,UserId_Fk)
VALUES ('2012-03-15', 3);
INSERT INTO ORDERS (DATEPLACED,UserId_Fk)
VALUES ('2022-11-30', 4);
INSERT INTO ORDERS (DATEPLACED,UserId_Fk)
VALUES ('2022-10-09', 5);

INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (1,4);
INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (3,1);
INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (3,1);
INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (3,3);
INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (1,5);
INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (1,5);
INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (2,1);
INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (3,2);
INSERT INTO Orderline (OrderId_Fk, ProductId_Fk)
Values (4,4);

SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Orderline;
SELECT * FROM USER;

SELECT Name, Email FROM User WHERE Email LIKE ('%@Bob.com');

SELECT Name, Postcode FROM User WHERE Postcode LIKE ('rg19%');

SELECT u.Name, DatePlaced, Sum(Cost) AS TotalCost
FROM User u
JOIN Orders o
On u.UserID=o.UserId_Fk
JOIN OrderLine ol
On O.OrderId=ol.OrderId_Fk
Join Products p
On P.ProductID=ol.ProductId_Fk
GROUP BY UserId
ORDER BY TotalCost DESC;

SELECT u.Name, P.name
FROM User u
JOIN Orders o
On u.UserID=o.UserId_Fk
JOIN OrderLine ol
On O.OrderId=ol.OrderId_Fk
Join Products p
On P.ProductID=ol.ProductId_Fk;

SELECT u.Name, P.name, Count(P.name) AS Pcount
FROM User u
JOIN Orders o
On u.UserID=o.UserId_Fk
JOIN OrderLine ol
On O.OrderId=ol.OrderId_Fk
Join Products p
On P.ProductID=ol.ProductId_Fk
WHERE P.productID = 1
GROUP By U.NAME
ORDER By PCount;

SELECT u.Name, O.dateplaced
FROM User u
JOIN Orders o
On u.UserID=o.UserId_Fk
Where Dateplaced like '2022%';

Select Name, Cost
FROM Products 
WHERE Cost < 100;

SELECT u.Name, DatePlaced, Sum(Cost) AS TotalCost
FROM User u
JOIN Orders o
On u.UserID=o.UserId_Fk
JOIN OrderLine ol
On O.OrderId=ol.OrderId_Fk
Join Products p
On P.ProductID=ol.ProductId_Fk
WHERE U.name = "Liam"
GROUP BY UserId
ORDER BY TotalCost DESC;

SELECT UserId, Name, COUNT(orderId) AS total_orders
FROM user u
JOIN orders o
ON u.UserId=o.UserId_FK
GROUP BY UserId
ORDER BY total_orders desc;

set sql_safe_updates=0;

DELETE FROM Orderline WHERE OrderlineId = 3;
DELETE FROM User WHERE UserId = 6;
DELETE FROM ProductS WHERE Name = 'Chair';
DELETE FROM Orders WHERE Dateplaced LIKE '2012%';

/* DELETE
FROM User u
JOIN Orders o
On u.UserID=o.UserId_Fk
JOIN OrderLine ol
On O.OrderId=ol.OrderId_Fk
Join Products p
On P.ProductID=ol.ProductId_Fk
Where ProductID = '3';

DELETE User.*, Orders.*
FROM User u, Orders o
WHERE U.UserId=o.UserID_FK
AND U.UserID = 2;

DELETE User, Orders, Orderline, Products
FROM
	User
    INNER JOIN Orders
		ON Orders *\
