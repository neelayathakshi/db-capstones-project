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
        INSERT INTO bookings  VALUES (p_bookingID, p_table_number,p_booking_date,2);
        COMMIT;
        SET p_status ='Table booked';
    END IF;
END //

DELIMITER ;


Set @status= ' ';
CALL  AddValidBoook('2022-12-17',6,8,@status);
SELECT @status as BookingStatus;