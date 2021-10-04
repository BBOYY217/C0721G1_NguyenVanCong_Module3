DROP DATABASE IF EXISTS sale_management;
CREATE DATABASE sale_management;
USE sale_management;

CREATE TABLE customer(
cID INT PRIMARY KEY,
Namer VARCHAR(25),
cAge TINYINT
);

CREATE TABLE orders (
oID INT PRIMARY KEY,
cID INT,
oDate DATETIME,
oTotalPrice INT,
FOREIGN KEY(cID)REFERENCES customer(cID)
);

CREATE TABLE product(
pID INT PRIMARY KEY,
pName VARCHAR(25),
pPrice INT
);

CREATE TABLE OrderDetail(
oID INT,
pID INT,
PRIMARY KEY(oID,pID),
odQTY INT,
FOREIGN KEY(oID)REFERENCES orders(oID),
FOREIGN KEY(pID)REFERENCES product(pID)
);

INSERT INTO customer
VALUES (1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);

INSERT INTO orders
VALUES (1,1,"2006/3/21",null),
(2,2,"2006/3/23",null),
(3,1,"2006/3/15",null);

INSERT INTO product
VALUES (1,"May Giat",3),
(2,"Tu Lanh",5),
(3,"Dieu Hoa",7),
(4,"Quat",1),
(5,"Bep Dien",2);

INSERT INTO OrderDetail
VALUES (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

SELECT orders.oID ,orders.oDate , orders.oTotalPrice
FROM orders;

SELECT customer.Namer ,product.pName, product.pPrice
FROM customer 
INNER JOIN orders on customer.cID = orders.cID
INNER JOIN OrderDetail on orders.oID = OrderDetail.oID
INNER JOIN product on OrderDetail.pID = product.pID;

SELECT customer.cID, customer.Namer
FROM customer
LEFT JOIN orders ON customer.cID = orders.cID
WHERE oID IS NULL;
