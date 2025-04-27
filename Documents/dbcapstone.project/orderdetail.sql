create database littlelemondb;
use littlelemondb;
CREATE TABLE customerdetails (CustomerID int NOT NULL,Name varchar(45) NOT NULL,  ContactNumber varchar(45) NOT NULL,Email varchar(45) NOT NULL,PRIMARY KEY (CustomerID));
INSERT INTO customerdetails VALUES (1,'John Doe','555-1234','customer1@email.com'),(2,'Jane Doe','555-2345','customer2@email.com'),(3,'Alice','555-3456','customer3@email.com'),(4,'Bob','555-4567','customer4@email.com'),(5,'Charlie','555-5678','customer5@email.com'),(6,'David','555-6789','customer6@email.com'),(7,'Emily','555-7890','customer7@email.com'),(8,'Frank','555-8901','customer8@email.com'),(9,'Grace','555-9012','customer9@email.com'),(10,'Hannah','555-0123','customer10@email.com');



CREATE TABLE menuitem (MenuItemsID int NOT NULL, CourseName varchar(45) DEFAULT NULL, StarterName varchar(45) DEFAULT NULL, DesertName varchar(45) DEFAULT NULL,  PRIMARY KEY (MenuItemsID));
INSERT INTO menuitem  VALUES (1,'Grilled Chicken','Caesar Salad','Cheesecake'),(2,'Beef Steak','Tomato Soup','Chocolate Mousse'),(3,'Vegetarian Pizza','Garlic Bread','Fruit Salad'),(4,'Spaghetti Carbonara','Bruschetta','Tiramisu'),(5,'Fish and Chips','Coleslaw','Apple Pie'),(6,'Sushi Platter','Miso Soup','Green Tea Ice Cream'),(7,'BBQ Ribs','Cornbread','Peach Cobbler'),(8,'Chicken Curry','Samosas','Gulab Jamun'),(9,'Lobster Tail','Oysters','Key Lime Pie'),(10,'Vegan Burger','Sweet Potato Fries','Vegan Brownie');


CREATE TABLE menu (MenuID int NOT NULL AUTO_INCREMENT,MenuItemsID int NOT NULL,Name varchar(45) NOT NULL,Type varchar(45) NOT NULL,Price decimal(10,0) NOT NULL,Cuisine varchar(45) DEFAULT NULL,PRIMARY KEY (MenuID),KEY `menu_items_menu_fk_idx` (MenuItemsID), CONSTRAINT `menus_items_menu_fk` FOREIGN KEY (MenuItemsID) REFERENCES menuitem (MenuItemsID));
INSERT INTO menu VALUES (1,1,'Cheese Burger','Main',10,NULL),(2,2,'Veggie Burger','Main',9,NULL),(3,3,'French Fries','Side',3,NULL),(4,4,'Caesar Salad','Main',8,NULL),(5,5,'Chicken Wings','Appetizer',6,NULL),(6,6,'Coca Cola','Drink',2,NULL),(7,7,'Pasta','Main',11,NULL),(8,8,'Rice','Side',4,NULL),(9,9,'Margarita','Drink',5,NULL),(10,10,'Ice Cream','Dessert',4,NULL);


CREATE TABLE staffinformation (StaffID int NOT NULL AUTO_INCREMENT,Name varchar(45) NOT NULL, Role varchar(45) NOT NULL,Salary decimal(10,0) NOT NULL,  PRIMARY KEY (StaffID));
INSERT INTO staffinformation VALUES (1,'Sarah','Manager',55000),(2,'Tom','Waiter',30000),(3,'Linda','Chef',40000),(4,'Robert','Cashier',31000),(5,'Daniel','Waiter',32000),(6,'Susan','Hostess',28000),(7,'Chris','Manager',60000),(8,'Jessica','Chef',38000),(9,'Brian','Waiter',29000),(10,'Kim','Hostess',27000);

CREATE TABLE booking (  BookingID int NOT NULL AUTO_INCREMENT,CustomerID int NOT NULL,StaffID int NOT NULL,Date datetime NOT NULL, TableNumber int NOT NULL,  PRIMARY KEY (BookingID),  KEY customer_fk_idx(CustomerID),  KEY staff_fk_idx (StaffID),  CONSTRAINT customer_fk FOREIGN KEY (CustomerID) REFERENCES customerdetails (CustomerID),  CONSTRAINT staff_fk FOREIGN KEY (StaffID) REFERENCES staffinformation(StaffID));

INSERT INTO booking VALUES (1,1,1,'2023-09-01 12:00:00',10),(2,2,2,'2023-09-01 12:30:00',12),(3,3,3,'2023-09-02 13:00:00',14),(4,4,4,'2023-09-02 14:00:00',16),(5,5,5,'2023-09-03 15:00:00',18),(6,6,6,'2023-09-03 16:00:00',20),(7,7,7,'2023-09-04 17:00:00',22),(8,8,8,'2023-09-04 18:00:00',24),(10,10,10,'2023-09-05 20:00:00',28),(11,1,1,'2022-10-10 00:00:00',5),(12,3,2,'2022-11-12 00:00:00',3),(13,2,3,'2022-10-11 00:00:00',2),(14,1,1,'2022-10-13 00:00:00',2),(15,1,1,'2022-10-11 00:00:00',5),(16,1,2,'2022-10-10 00:00:00',5);

CREATE TABLE orders(OrderID int NOT NULL ,CustomerID int NOT NULL,MenuItemID int NOT NULL,StaffID int NOT NULL,Date datetime NOT NULL, Quantity int NOT NULL,TotalCost decimal(10,0) NOT NULL,  PRIMARY KEY (OrderID),  KEY customer_fk_idx (CustomerID),  KEY menu_fk_idx (MenuItemID),  KEY staff_fk_idx (StaffID),  CONSTRAINT customer_orders_fk FOREIGN KEY (CustomerID) REFERENCES customerdetails (CustomerID),CONSTRAINT menu_orders_fk FOREIGN KEY (MenuItemID) REFERENCES menu (MenuID),CONSTRAINT staff_orders_fk FOREIGN KEY (StaffID) REFERENCES staffinformation (StaffID)) ;

INSERT INTO orders VALUES (1,1,1,1,'2023-09-01 12:00:00',2,171),(2,2,2,2,'2023-09-01 12:30:00',1,174),(3,3,3,3,'2023-09-02 13:00:00',3,358),(4,4,4,4,'2023-09-02 14:00:00',1,265),(6,6,6,6,'2023-09-03 16:00:00',2,465),(7,7,7,7,'2023-09-04 17:00:00',1,65),(8,8,8,8,'2023-09-04 18:00:00',2,437),(9,9,9,9,'2023-09-05 19:00:00',3,484),(10,10,10,10,'2023-09-05 20:00:00',1,111);

CREATE TABLE orderdeliverystatuses ( DeliveryID int NOT NULL,  OrderID int NOT NULL,Date datetime NOT NULL,Status varchar(45) NOT NULL,PRIMARY KEY (DeliveryID), KEY order_fk_idx (OrderID),  CONSTRAINT order_delivery_fk FOREIGN KEY (OrderID) REFERENCES orders (OrderID));
INSERT INTO orderdeliverystatuses VALUES (1,1,'2023-09-01 12:15:00','Delivered'),(2,2,'2023-09-01 12:45:00','Preparing'),(3,3,'2023-09-02 13:15:00','Preparing'),(4,4,'2023-09-02 14:15:00','Out for delivery'),(6,6,'2023-09-03 16:15:00','Delivered'),(7,7,'2023-09-04 17:15:00','Preparing'),(8,8,'2023-09-04 18:15:00','Delivered'),(9,9,'2023-09-05 19:15:00','Delivered'),(10,10,'2023-09-05 20:15:00','Delivered');
show tables;
CREATE VIEW  Ordersview
AS
SELECT orderid,Quantity,TotalCost from Orders where Quantity>2;
select * from Ordersview;

SELECT Customerdetails.customerId,Customerdetails.Name,orders.OrderID,orders.TotalCost,Menuitem.Coursename,Menuitem.Startername 
FROM customerdetails  
INNER JOIN orders on  customerdetails.customerID=orders.customerID

INNER JOIN Menuitem on orders.MenuItemID=Menuitem.MenuItemsID where orders.TotalCost>150 order by TotalCost ASC;

SELECT Name From Menu WHERE menuID=ANY(SELECT MenuID from Orders where Quantity>2);