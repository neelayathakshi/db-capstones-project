create database littlelemon
use littlelemon
CREATE TABLE Customer(CustomerID INT NOT NULL PRIMARY KEY, FullName VARCHAR(100) NOT NULL, PhoneNumber INT NOT NULL UNIQUE);

show tables;
INSERT INTO Customers(CustomerID, FullName, PhoneNumber) VALUES (1, "Vanessa McCarthy", 0757536378), (2, "Marcos Romero", 0757536379), (3, "Hiroki Yamane", 0757536376), (4, "Anna Iversen", 0757536375), (5, "Diana Pinto", 0757536374);
select * from customers;
CREATE TABLE Bookings (BookingID INT NOT NULL PRIMARY KEY,  BookingDate DATE NOT NULL,  TableNumber INT NOT NULL, NumberOfGuests INT NOT NULL CHECK (NumberOfGuests <= 8), CustomerID INT NOT NULL, FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE); 
select * from Bookings;
INSERT INTO Bookings (BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) VALUES (10, '2021-11-11', 7, 5, 1), (11, '2021-11-10', 5, 2, 2), (12, '2021-11-10', 3, 2, 4);
select * from Bookings;
CREATE TABLE MenuItems (
ItemID INT AUTO_INCREMENT,
Name VARCHAR(200),
Type VARCHAR(100),
Price INT,
PRIMARY KEY (ItemID)
);
CREATE TABLE Menus (
MenuID INT,
ItemID INT,
Cuisine VARCHAR(100),
PRIMARY KEY (MenuID,ItemID)
);
CREATE TABLE Orders (
OrderID INT,
TableNo INT,
MenuID INT,
BookingID INT,
BillAmount INT,
Quantity INT,
PRIMARY KEY (OrderID,TableNo)
);
INSERT INTO MenuItems (ItemID, Name, Type, Price)
VALUES
(1,'Olives','Starters',5),
(2,'Flatbread','Starters', 5),
(3, 'Minestrone', 'Starters', 8),
(4, 'Tomato bread','Starters', 8),
(5, 'Falafel', 'Starters', 7),
(6, 'Hummus', 'Starters', 5),
(7, 'Greek salad', 'Main Courses', 15),
(8, 'Bean soup', 'Main Courses', 12),
(9, 'Pizza', 'Main Courses', 15),
(10,'Greek yoghurt','Desserts', 7),
(11, 'Ice cream', 'Desserts', 6),
(12, 'Cheesecake', 'Desserts', 4),
(13, 'Athens White wine', 'Drinks', 25),
(14, 'Corfu Red Wine', 'Drinks', 30),
(15, 'Turkish Coffee', 'Drinks', 10),
(16, 'Turkish Coffee', 'Drinks', 10),
(17, 'Kabasa', 'Main Courses', 17);
select * from MenuItems;
Drop table Bookings;
show tables;
CREATE TABLE Bookings (
BookingID INT AUTO_INCREMENT,
TableNo INT,
GuestFirstName VARCHAR(100) NOT NULL,
GuestLastName VARCHAR(100) NOT NULL,
BookingSlot TIME NOT NULL,
EmployeeID INT,
PRIMARY KEY (BookingID)
);
INSERT INTO Bookings (TableNo, GuestFirstName, 
GuestLastName, BookingSlot, EmployeeID)
VALUES
( 2,  'Anna','Iversen','17:00:00',1),
( 12, 'Joakim', 'Iversen', '19:00:00', 1),
( 19, 'Vanessa', 'McCarthy', '15:00:00', 3),
( 15, 'Marcos', 'Romero', '17:30:00', 4),
( 5, 'Hiroki', 'Yamane', '18:30:00', 2),
( 8, 'Diana', 'Pinto', '20:00:00', 5);
select * from Bookings;
delete from Bookings where bookingId=1;
select * from Bookings;
drop table bookings;
show tables;
CREATE TABLE Bookings (
BookingID INT AUTO_INCREMENT,
TableNo INT,
GuestFirstName VARCHAR(100) NOT NULL,
GuestLastName VARCHAR(100) NOT NULL,
BookingSlot TIME NOT NULL,
EmployeeID INT,
PRIMARY KEY (BookingID)
);
show tables;
INSERT INTO Bookings (TableNo, GuestFirstName, 
GuestLastName, BookingSlot, EmployeeID)
VALUES
( 2,  'Anna','Iversen','17:00:00',1),
( 12, 'Joakim', 'Iversen', '19:00:00', 1),
( 19, 'Vanessa', 'McCarthy', '15:00:00', 3),
( 15, 'Marcos', 'Romero', '17:30:00', 4),
( 5, 'Hiroki', 'Yamane', '18:30:00', 2),
( 8, 'Diana', 'Pinto', '20:00:00', 5);
show tables;
create View Ordersview
as
select 
orderid,quantity,billamount as totalcost  from Orders ;
select * from Ordersview;
INSERT INTO Menus (MenuID, ItemID, Cuisine)
VALUES
(1, 1, 'Greek'),
(1, 7, 'Greek'),
(1, 10, 'Greek'),
(1, 13, 'Greek'),
(2, 3, 'Italian'),
(2, 9, 'Italian'),
(2, 12, 'Italian'),
(2, 15, 'Italian'),
(3, 5, 'Turkish'),
(3, 17, 'Turkish'),
(3, 11, 'Turkish'),
(3, 16, 'Turkish');
INSERT INTO Orders (OrderID, TableNo, MenuID, BookingID, Quantity, BillAmount)
VALUES
(1, 12, 1, 1, 2, 86),
(2, 19, 2, 2, 1, 37),
(3, 15, 2, 3, 1, 37),
(4, 5, 3, 4, 1, 40),
(5, 8, 1, 5, 1, 43);
select * from Ordersview;
create view orderedview as select Orders.OrderID,Orders.Quantity,Orders.BillAmount as Totalcost from Orders where quantity>2;
select * from orderedview;
create view orderesview as select Orders.OrderID,Orders.Quantity,Orders.BillAmount as Totalcost from Orders where quantity=2;
select * from orderesview;
select Customer.customerid,Customer.fullname,Orders.orderid,orders.billamount as cost from customers  Inner join customers on Customer.customerid=orders.customerid;
show tables;
select Menus.Cuisine,MenuItems.Name,Orders.OrderID,Orders.BillAmount as Cost 
 from 
 Orders  inner join Menus on Orders.MenuID=Menus.MenuID
 Inner join MenuItems  on Menus.ItemID=MenuItems.ItemID  where MenuItems.Type="Starters";
 select Name as Menuname from MenuItems where (Select quantity from Orders where quantity=2)

DELIMITER //
CREATE PROCEDURE GetMaximumQuantity()
BEGIN
  select Max(quantity) as Maximumquantityinorder from Orders;
END //
DELIMITER ;
call GetMaximumQuantity()
Prepare Getorderquantity from 'select OrderID,Quantity ,BillAmount as Cost from Orders where BookingID=?'
set @booking_id=4;
Execute Getorderquantity using @booking_id;
DELIMITER //
 CREATE PROCEDURE CancelOrder(IN id  int)
 BEGIN
 Delete  From Orders where OrderID=id;
 END //
 DELIMITER ;
 CALL CancelOrder(5);
