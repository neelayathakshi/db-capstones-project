use littlelemondb;

SET @status =' ';
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
   SELECT quantity from orders where quantity=(SELECT MAX(Quantity) FROM Orders);
 END
//
 DELIMITER ;

Call GetMaxQuantity();
