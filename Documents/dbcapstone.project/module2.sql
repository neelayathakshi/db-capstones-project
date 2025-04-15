use newlemon;

delimiter //
create procedure bookcheck(tno INT, bdate DATE )

	BEGIN
		DECLARE tablestatus INT;
			SELECT tablestatus  FROM Bookings where BookingDate=bdate and Tableno=tno;
		IF tablestatus IS NULL 
			insert into bookstatus values(1);
		ELSE
			insert into bookstatus values(2);
	    END
 END
   delimiter ;
call CheckBookings('2022-10-10',5);
SELECT  BookingDate,Tableno  FROM Bookings  WHERE BookingDate=@bdate and Tableno = @tno;

CREATE PROCEDURE CheckBookingAvailability(
    IN in_booking_date DATE,
    IN in_tableno INT,
    OUT booking_status VARCHAR(50)
)
BEGIN
    DECLARE existing_count INT;

    SELECT COUNT(*) INTO existing_count
    FROM Bookings
    WHERE BookingDate = in_booking_date AND Tableno = in_tableno;

    IF existing_count > 0 THEN
        SET booking_status = 'Not Available';
    ELSE
        SET booking_status = 'Available';
    END IF;
END$$

DELIMITER ;
-- Step 1: Declare a variable
SET @status = '';

-- Step 2: Call the procedure and pass the variable as the OUT parameter
CALL CheckBookingAvailability('2022-10-10', 5, @status);

-- Step 3: Retrieve the value from the variable
SELECT @status AS BookingStatus;
use newlemon;


DELIMITER //


SET @status= ' ';
CALL AddValidBooking('2022-09-09',6,@status);
Select @status AS BookingStatus;

DELIMITER //

CREATE PROCEDURE AddValidBoook(
    IN p_booking_date DATE,
    IN p_table_number INT,
    IN p_bookingID INT,
    OUT p_status VARCHAR(50)
)
BEGIN
    DECLARE existing_booking INT;

    START TRANSACTION;
    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO existing_booking
    FROM bookings
    WHERE BookingDate = p_booking_date AND Tableno= p_table_number;

    IF existing_booking > 0 THEN
        -- Table is already booked, rollback transaction
        ROLLBACK;
       SET p_status= 'Table already booked-booking cancelled';
    ELSE
        -- Table is available, insert the booking and commit transaction
        INSERT INTO bookings 
        VALUES (p_bookingID, p_table_number,p_booking_date,2);
        COMMIT;
        SET p_status ='Table booked';
    END IF;
END //

DELIMITER ;


Set @status= ' ';
CALL  AddValidBoook('2022-12-17',6,8,@status);
SELECT @status as BookingStatus;

DELIMITER //

CREATE PROCEDURE AddBooking(
	IN p_bookingID INT,
    IN p_table_number INT,
    IN p_booking_date DATE,
    IN p_customerID INT,
    OUT p_status VARCHAR(50)
)
BEGIN
    DECLARE existing_booking INT;

    START TRANSACTION;
    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO existing_booking
    FROM bookings
    WHERE BookingDate = p_booking_date AND Tableno= p_table_number;

    IF existing_booking > 0 THEN
        -- Table is already booked, rollback transaction
        ROLLBACK;
       SET p_status= 'Table already booked-booking cancelled';
    ELSE
        -- Table is available, insert the booking and commit transaction
        INSERT INTO bookings 
        VALUES (p_bookingID, p_table_number,p_booking_date,p_customerID);
        COMMIT;
        SET p_status ='NEW booking added';
    END IF;
END //

DELIMITER ;
set @status= ' ';
CALL AddBooking(9,3,'2024-12-09',3,@status);
SELECT @status AS BookingStatus;

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
