use littlelemondb;
DELIMITER //
 CREATE PROCEDURE Cancelordered(IN id  int)
 BEGIN
 Delete  From Orders where OrderID=id;
 SELECT CONCAT("Order ", id, " is cancelled") AS Confirmation;
 END //
 DELIMITER ;

 CALL Cancelordered(5);
