USE littlelemon;

-- =====================================
-- GetMaxQuantity
-- =====================================
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM Orders;
END;

-- =====================================
-- AddBooking
-- =====================================
CREATE PROCEDURE AddBooking(
    IN booking_date DATE,
    IN table_number INT,
    IN customer_id INT
)
BEGIN
    INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
    VALUES (booking_date, table_number, customer_id);

    SELECT 'Booking added successfully' AS Message;
END;

-- =====================================
-- UpdateBooking
-- =====================================
CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_date DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = new_date
    WHERE BookingID = booking_id;

    SELECT 'Booking updated successfully' AS Message;
END;

-- =====================================
-- CancelBooking
-- =====================================
CREATE PROCEDURE CancelBooking(
    IN booking_id INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = booking_id;

    SELECT 'Booking cancelled successfully' AS Message;
END;

-- =====================================
-- ManageBooking
-- =====================================
CREATE PROCEDURE ManageBooking(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE booking_count INT;

    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date
    AND TableNumber = table_number;

    IF booking_count > 0 THEN
        SELECT 'Table is already booked' AS Status;
    ELSE
        SELECT 'Table is available' AS Status;
    END IF;
END;