use littlelemon;
 DELIMITER //
	CREATE PROCEDURE UpdateBooking(
	IN p_bookingID INT,
   
    IN p_booking_date DATE,
    
    OUT p_status VARCHAR(50)
)
BEGIN
    UPDATE Bookings SET BookingDate=p_booking_date where BookingID=p_bookingID;
        
        SET p_status ='booking updated'; 
   
END //

DELIMITER ;
SET @status= ' ';
CALL  UpdateBooking(9,'2024-12-10',@status);
SELECT @status AS confirmation;


DELIMITER //