#HEADER
#Program Name: Assignment 2
#Author: Ethan Sexton
#Class: CS162 spring 2021
#Date: 5/4/2021
#Description: This project is meant to implement the data from an ERD;

DROP DATABASE IF EXISTS AssignmentTwo; 
CREATE database AssignmentTwo;
USE  AssignmentTwo;
CREATE TABLE IF NOT EXISTS orderform (
	OrderNumber int UNIQUE NOT NULL PRIMARY KEY,
    CustomerNumber varchar(30) UNIQUE,
    OrderDate date UNIQUE
    );
   # Truncate orderform;
    
    CREATE TABLE IF NOT EXISTS Customer (
	CustomerNumber int PRIMARY KEY auto_increment,
    Name varchar(20) NOT NULL,
    Address varchar(60) NOT NULL,
    Email varchar(100) not null,
    PhoneNumber varchar(15)
);

Create table if not exists Address (
	Id int Primary Key auto_increment UNIQUE,
    Line_1 varchar(50) NOT NULL,
    Line_2 varchar(50) NULL, 
    City varchar(50), 
    State varchar(50), 
    Zip int
    
    );

CREATE TABLE IF NOT EXISTS Product (
	ProductNo varchar(20) NOT NULL UNIQUE PRIMARY KEY,
    Description varchar (250) UNIQUE,
    UnitPrice varchar(15)
);
CREATE TABLE IF NOT EXISTS Order_Line (
	OrderNumber int NOT NULL, #Primary Key, 
    ProductNo int, # PRIMARY KEY,
    Quantity int UNIQUE,
    PRIMARY KEY (OrderNumber, ProductNo)

);

INSERT INTO orderform (OrderNumber, CustomerNumber, OrderDate)
VALUES 
	('1234', '9876', '1998-04-11'), 
    ('2234', '9875', '2020-08-30'),
    ('3234', '9874', '2020-09-26'),
    ('4234', '9873', '2021-02-26');

    INSERT INTO Customer (name, address, Email, PhoneNumber)
VALUES 
	('Billy', '4222 nd', 'billybob@gmail.com', '541-000-1230'),
    ('Tate','3456 Belmont Rd', 'tater@gmail.com', '541-000-1231'),
    ('Caleb', '43 slint Rd', 'billytheman@gmail.com', '541-000-1232'),
    ('Garris', '303 Dr', 'garris123@yahoo.com', '541-000-1233'), 
    ('Jim', '4233 Sutherland Rd', 'jim321@yahoo.com', '541-000-1243');
  

    
     INSERT INTO Address (Line_1, Line_2, City, State, Zip) 
VALUES 
	('0001 Rd', null, 'The Dalles', 'Oregon', '97058' ),
    ('456 HighTower Street', null, 'Hong Kong', null, null),
    ('Belmont Street', '05 Dotsoon Rd', 'Hood River', 'Oregon', '97031'),
    ('Garris Street', null, 'Mcfarland', 'Idaho', '12345'), 
    ('Jim Street', null, 'JimTown', 'Indiana', '98765');
    
    
    
     INSERT INTO Product (ProductNo, Description, UnitPrice) 
VALUES 
	('A123', 'Pencil', '$3.00'),
    ('B234', 'Eraser', '$1.50'),
    ('C345', 'Sharpener', '$8.00'),
    ('D456', 'Ruler', '$10.00'), 
    ('E567', 'Pencil Box', '$7.30'),
    ('F678', 'Crayon', '$0.99'),
    ('G789', 'Paper Clip', '$0.21');
   
      

     INSERT INTO Order_Line (OrderNumber, ProductNo, Quantity) 
VALUES 
	('1234', 'A123', '100' ),
    ('2234', 'B234', '200'),
    ('3234', 'C345', '5'),
    ('4234', 'D456', '32'), 
    ('5234', 'E567', '7'), 
    ('6234', 'F678', '466'), 
    ('7234', 'G789', '532');
    
    
   

 /* SHOW columns from orderform;
   SELECT
	ORDERNUMBER
FROM
	orderform
WHERE
	OrderDate = '2020-08-30';
    */
SELECT 
	order_line.ProductNo, order_line.Quantity,
    orderform.OrderNumber, orderform.CustomerNumber, Orderform.OrderDate
FROM
	orderform
    #JOIN orderform ON order_line.OrderNumber = orderform.OrderNumber;
    JOIN order_line ON orderform.OrderNumber = order_Line.OrderNumber; 
    
/*ALTER TABLE Order_Line ADD CONSTRAINT FOREIGN KEY (CustomerNumber) REFERENCES Customer (name) ON DELETE CASCADE;
ALTER TABLE Order_Line ADD CONSTRAINT FOREIGN KEY (ProductNo) REFERENCES Product (ProductNo) ON DELETE CASCADE;
ALTER TABLE Order_Line ADD CONSTRAINT FOREIGN KEY (OrderNumber) REFERENCES OrderForm (OrderNumber) ON DELETE CASCADE;
*/

SELECT 
	Order_line.OrderNumber, Order_line.Quantity, 
    Product.ProductNo, Product.description, Product.UnitPrice
FROM
	Order_Line
    JOIN Product ON Order_Line.ProductNo = Product.ProductNo;
    
ALTER TABLE Order_Line ADD CONSTRAINT FOREIGN KEY (OrderNumber) REFERENCES OrderForm (CustomerNumber) ON DELETE CASCADE;


/*
# OrderNumber	Quantity	ProductNo	description	UnitPrice
3234	5	A123	Pencil	$3.00
3234	5	B234	Eraser	$1.50
3234	5	C345	Sharpener	$8.00
3234	5	D456	Ruler	$10.00
3234	5	E567	Pencil Box	$7.30
3234	5	F678	Crayon	$0.99
3234	5	G789	Paper Clip	$0.21
5234	7	A123	Pencil	$3.00
5234	7	B234	Eraser	$1.50
5234	7	C345	Sharpener	$8.00
5234	7	D456	Ruler	$10.00
5234	7	E567	Pencil Box	$7.30
5234	7	F678	Crayon	$0.99
5234	7	G789	Paper Clip	$0.21
4234	32	A123	Pencil	$3.00
4234	32	B234	Eraser	$1.50
4234	32	C345	Sharpener	$8.00
4234	32	D456	Ruler	$10.00
4234	32	E567	Pencil Box	$7.30
4234	32	F678	Crayon	$0.99
4234	32	G789	Paper Clip	$0.21
1234	100	A123	Pencil	$3.00
1234	100	B234	Eraser	$1.50
1234	100	C345	Sharpener	$8.00
1234	100	D456	Ruler	$10.00
1234	100	E567	Pencil Box	$7.30
1234	100	F678	Crayon	$0.99
1234	100	G789	Paper Clip	$0.21
2234	200	A123	Pencil	$3.00
2234	200	B234	Eraser	$1.50
2234	200	C345	Sharpener	$8.00
2234	200	D456	Ruler	$10.00
2234	200	E567	Pencil Box	$7.30
2234	200	F678	Crayon	$0.99
2234	200	G789	Paper Clip	$0.21
6234	466	A123	Pencil	$3.00
6234	466	B234	Eraser	$1.50
6234	466	C345	Sharpener	$8.00
6234	466	D456	Ruler	$10.00
6234	466	E567	Pencil Box	$7.30
6234	466	F678	Crayon	$0.99
6234	466	G789	Paper Clip	$0.21
7234	532	A123	Pencil	$3.00
7234	532	B234	Eraser	$1.50
7234	532	C345	Sharpener	$8.00
7234	532	D456	Ruler	$10.00
7234	532	E567	Pencil Box	$7.30
7234	532	F678	Crayon	$0.99
7234	532	G789	Paper Clip	$0.21

# ProductNo, Quantity, OrderNumber, CustomerNumber, OrderDate
'0', '100', '1234', '9876', '1998-04-11'
'0', '200', '2234', '9875', '2020-08-30'
'0', '5', '3234', '9874', '2020-09-26'
'0', '32', '4234', '9873', '2021-02-26'

*/