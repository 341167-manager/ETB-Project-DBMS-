INSERT INTO `Hotel` (`Hotel_Name`, `City`, `State`, `Country`, `Address`, `Phone`, `Email`, `Star_Rating`, `Opening_Date`) VALUES
('The Royal Palace', 'Jaipur', 'Rajasthan', 'India', '12 Amber Fort Road, Jaipur', '+91-141-2555555', 'contact@royalpalace.com', 5, '2010-05-15'),
('Sea View Residency', 'Mumbai', 'Maharashtra', 'India', '45 Marine Drive, Mumbai', '+91-22-24444444', 'info@seaviewmumbai.com', 4, '2015-08-20'),
('Bangalore Grand', 'Bengaluru', 'Karnataka', 'India', '88 MG Road, Bengaluru', '+91-80-23333333', 'reservations@blrgrand.com', 5, '2018-01-10'),
('Capital Stay', 'New Delhi', 'Delhi', 'India', '101 Connaught Place, New Delhi', '+91-11-23456789', 'delhi@capitalstay.com', 3, '2012-11-05'),
('Chennai Gateway', 'Chennai', 'Tamil Nadu', 'India', '22 OMR Road, Chennai', '+91-44-22222222', 'hello@chennaigateway.com', 4, '2016-03-25');

-- 2. Insert Services
INSERT INTO `Services` (`Service_Name`, `Description`, `Default_Price`) VALUES
('Room Service', 'Food and Beverage delivery to room', 0.00), -- Varies by order
('Laundry', 'Washing and ironing', 500.00),
('Spa', 'Full body massage (60 mins)', 2500.00),
('Airport Pickup', 'Luxury Sedan Pickup', 1500.00),
('Extra Bed', 'Folding bed for extra guest', 1000.00);

-- 3. Insert Guests
INSERT INTO `Guests` (`Name`, `Gender`, `Phone_Number`, `Email`, `Address`, `City`, `State`, `Country`, `Document_Id_Number`, `Document_Id`) VALUES
('Amit Sharma', 'M', '9876543210', 'amit.sharma@example.com', '12 Civil Lines', 'Nagpur', 'Maharashtra', 'India', 'ABCD1234F', 'PAN Card'),
('Priya Iyer', 'F', '9988776655', 'priya.iyer@example.com', '56 Mylapore', 'Chennai', 'Tamil Nadu', 'India', '1234-5678-9012', 'Aadhar Card'),
('Rahul Verma', 'M', '9123456789', 'rahul.v@example.com', '78 Sector 18', 'Noida', 'Uttar Pradesh', 'India', 'Z1234567', 'Passport'),
('Sneha Patil', 'F', '9555666777', 'sneha.patil@example.com', '34 Kothrud', 'Pune', 'Maharashtra', 'India', 'DL-MH-12-2020', 'Driving License'),
('Vikram Singh', 'M', '8888899999', 'vikram.singh@example.com', '90 Bani Park', 'Jaipur', 'Rajasthan', 'India', 'X5555555', 'Voter ID');

-- 4. Insert Rooms
-- For Hotel 1 (Royal Palace - Jaipur)
INSERT INTO `Rooms` (`Hotel_Id_Hotel`, `RoomNumber`, `Floor`, `Room_Type`, `Bed_Type`, `Base_Rate`, `Max_Occupancy`, `Status`) VALUES
(1, '101', 1, 'Deluxe', 'King', 5000.00, 2, 'Occupied'),
(1, '102', 1, 'Suite', 'King', 12000.00, 4, 'Available'),
-- For Hotel 2 (Sea View - Mumbai)
(2, '205', 2, 'Standard', 'Queen', 3500.00, 2, 'Occupied'),
-- For Hotel 3 (Bangalore Grand)
(3, '301', 3, 'Executive', 'King', 7000.00, 2, 'Reserved'),
-- For Hotel 4 (Capital Stay)
(4, '404', 4, 'Standard', 'Twin', 2500.00, 2, 'Available');

-- 5. Insert Employees
INSERT INTO `Employees` (`Hotel_id_Hotel`, `Name`, `Gender`, `Position`, `Phone`, `Email`, `Hire_Date`, `Salary`, `Status`) VALUES
(1, 'Ramesh Gupta', 'M', 'Manager', '9000100001', 'ramesh@royalpalace.com', '2015-06-01', 80000.00, 'Active'),
(1, 'Suresh Yadav', 'M', 'Housekeeping', '9000100002', 'suresh@royalpalace.com', '2019-02-15', 20000.00, 'Active'),
(2, 'Anita Desai', 'F', 'Receptionist', '9000200001', 'anita@seaview.com', '2018-11-20', 35000.00, 'Active'),
(3, 'Arjun Reddy', 'M', 'Chef', '9000300001', 'arjun@blrgrand.com', '2020-01-10', 55000.00, 'Active'),
(2, 'Meera Nair', 'F', 'Manager', '9000200002', 'meera@seaview.com', '2016-08-05', 90000.00, 'Active');

-- 6. Insert Reservations
INSERT INTO `Reservations` (`Guests_idGuests`, `Hotel_Id_Hotel`, `Rooms_idRooms`, `ReservationDate`, `CheckinDate`, `CheckOut_Date`, `NumberOfGuests`, `Status`, `Total_Amount`, `Payment_Status`) VALUES
(1, 1, 1, '2023-10-01 10:00:00', '2023-10-25', '2023-10-28', 2, 'Confirmed', 15000.00, 'Paid'),
(2, 2, 3, '2023-10-05 14:30:00', '2023-11-01', '2023-11-03', 1, 'Confirmed', 7000.00, 'Pending'),
(3, 3, 4, '2023-10-10 09:15:00', '2023-11-10', '2023-11-15', 2, 'Pending', 35000.00, 'Unpaid'),
(4, 1, 2, '2023-10-12 11:00:00', '2023-12-01', '2023-12-05', 3, 'Confirmed', 48000.00, 'Partial'),
(5, 4, 5, '2023-10-15 16:45:00', '2023-10-20', '2023-10-22', 1, 'CheckedOut', 5000.00, 'Paid');

-- 7. Insert Stays (Linked to Reservations)
INSERT INTO `Stays` (`Reservations_idReservations`, `Actual_Checkin`, `Actual_CheckOut`, `Room_Rate_per_Night`, `Extra_Charges`, `Discount_Amount`, `Final_Amount`, `Status`) VALUES
(1, '2023-10-25 12:00:00', '2023-10-28 11:00:00', 5000.00, 500.00, 0.00, 15500.00, 'Completed'),
(5, '2023-10-20 13:00:00', '2023-10-22 10:30:00', 2500.00, 200.00, 0.00, 5200.00, 'Completed'),
(2, '2023-11-01 14:00:00', NULL, 3500.00, 0.00, 0.00, NULL, 'Active'), -- Currently staying
(4, '2023-12-01 12:30:00', NULL, 12000.00, 1000.00, 500.00, NULL, 'Scheduled'),
(3, '2023-11-10 12:00:00', NULL, 7000.00, 0.00, 1000.00, NULL, 'Scheduled');

-- 8. Insert Service Usage
INSERT INTO `ServiceUsage` (`Services_idServices`, `Service_Name`, `UsageDateTime`, `Description`, `Quantity`, `PricePerUnit`, `Total_Amount`) VALUES
(1, 'Room Service', '2023-10-25 20:00:00', 'Dinner', 1, 1200.00, 1200.00),
(2, 'Laundry', '2023-10-26 10:00:00', 'Shirt Ironing', 2, 100.00, 200.00),
(4, 'Airport Pickup', '2023-10-20 13:00:00', 'Pickup from DEL', 1, 1500.00, 1500.00),
(3, 'Spa', '2023-11-02 16:00:00', 'Deep Tissue', 1, 2500.00, 2500.00),
(1, 'Room Service', '2023-10-21 08:00:00', 'Breakfast', 1, 500.00, 500.00);

-- 9. Link Service Usage to Stays
INSERT INTO `ServiceUsage_has_Stays` (`ServiceUsage_idServiceUsage`, `Stays_idStays`) VALUES
(1, 1),
(2, 1),
(5, 2),
(3, 3),
(4, 2);

-- 10. Insert Payments
INSERT INTO `Payments` (`Stays_idStays`, `Payment_Date`, `Amount`, `Payment_Method`, `Reference_Id`, `Status`) VALUES
(1, '2023-10-28 11:30:00', 15500.00, 'Credit Card', 'TXN12345678', 'Success'),
(2, '2023-10-22 10:45:00', 5200.00, 'UPI', 'UPI987654321', 'Success'),
(3, '2023-11-01 14:00:00', 3500.00, 'Cash', 'CASH001', 'Advance'),
(1, '2023-10-25 12:00:00', 5000.00, 'Credit Card', 'TXN12345000', 'Advance'),
(5, '2023-11-10 12:00:00', 2000.00, 'UPI', 'UPI11223344', 'Advance');
