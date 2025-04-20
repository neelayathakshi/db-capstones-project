
use littlelemon;
	CREATE PROCEDURE DeleteBookingS(
	IN p_bookingID INT,
   
   OUT p_status VARCHAR(50)
)
BEGIN
   DELETE FROM  Bookings  where BookingID=p_bookingID;
        
        SET p_status ='booking Cancelled';
   
END //

DELIMITER ;
SET @status= ' ';
CALL DeleteBookingS(9,@status);
SELECT @status as Confirmation