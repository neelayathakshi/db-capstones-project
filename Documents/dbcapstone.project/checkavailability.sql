use newlemon;




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








