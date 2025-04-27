 use littlelemondb;
PREPARE GetOrderDetail FROM 'SELECT orderID,Quantity,TotalCost as Cost  From Orders where customerID=?';
SET @id=1;
Execute  GetOrderDetail USING @id;