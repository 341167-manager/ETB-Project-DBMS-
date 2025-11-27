-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema HotelManagementSystem
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema HotelManagementSystem
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HotelManagementSystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `HotelManagementSystem` ;

-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`Hotel` (
  `Id_Hotel` INT NOT NULL AUTO_INCREMENT,
  `Hotel_Name` VARCHAR(100) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `Phone` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Star_Rating` TINYINT(1) NULL DEFAULT NULL,
  `Opening_Date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Hotel`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`Employees` (
  `idEmployees` INT NOT NULL AUTO_INCREMENT,
  `Hotel_id_Hotel` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Gender` CHAR(1) NULL DEFAULT NULL,
  `Position` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Hire_Date` DATE NULL DEFAULT NULL,
  `Salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `Status` VARCHAR(45) NULL DEFAULT 'Active',
  PRIMARY KEY (`idEmployees`),
  INDEX `fk_Employees_Hotel` (`Hotel_id_Hotel` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Hotel`
    FOREIGN KEY (`Hotel_id_Hotel`)
    REFERENCES `HotelManagementSystem`.`Hotel` (`Id_Hotel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`Guests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`Guests` (
  `idGuests` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Gender` CHAR(1) NULL DEFAULT NULL,
  `Phone_Number` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Address` VARCHAR(255) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Document_Id_Number` VARCHAR(45) NULL DEFAULT NULL,
  `Document_Id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idGuests`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`Rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`Rooms` (
  `idRooms` INT NOT NULL AUTO_INCREMENT,
  `Hotel_Id_Hotel` INT NOT NULL,
  `RoomNumber` VARCHAR(10) NOT NULL,
  `Floor` INT NULL DEFAULT NULL,
  `Room_Type` VARCHAR(45) NULL DEFAULT NULL,
  `Bed_Type` VARCHAR(45) NULL DEFAULT NULL,
  `Base_Rate` DECIMAL(10,2) NOT NULL,
  `Max_Occupancy` TINYINT NULL DEFAULT NULL,
  `Status` VARCHAR(45) NULL DEFAULT 'Available',
  PRIMARY KEY (`idRooms`),
  INDEX `fk_Rooms_Hotel` (`Hotel_Id_Hotel` ASC) VISIBLE,
  CONSTRAINT `fk_Rooms_Hotel`
    FOREIGN KEY (`Hotel_Id_Hotel`)
    REFERENCES `HotelManagementSystem`.`Hotel` (`Id_Hotel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`Reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`Reservations` (
  `idReservations` INT NOT NULL AUTO_INCREMENT,
  `Guests_idGuests` INT NOT NULL,
  `Hotel_Id_Hotel` INT NOT NULL,
  `Rooms_idRooms` INT NOT NULL,
  `ReservationDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `CheckinDate` DATE NOT NULL,
  `CheckOut_Date` DATE NOT NULL,
  `NumberOfGuests` TINYINT NULL DEFAULT NULL,
  `Status` VARCHAR(45) NULL DEFAULT 'Confirmed',
  `Total_Amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `Payment_Status` VARCHAR(45) NULL DEFAULT 'Pending',
  PRIMARY KEY (`idReservations`),
  INDEX `fk_Reservations_Guests` (`Guests_idGuests` ASC) VISIBLE,
  INDEX `fk_Reservations_Hotel` (`Hotel_Id_Hotel` ASC) VISIBLE,
  INDEX `fk_Reservations_Rooms` (`Rooms_idRooms` ASC) VISIBLE,
  CONSTRAINT `fk_Reservations_Guests`
    FOREIGN KEY (`Guests_idGuests`)
    REFERENCES `HotelManagementSystem`.`Guests` (`idGuests`),
  CONSTRAINT `fk_Reservations_Hotel`
    FOREIGN KEY (`Hotel_Id_Hotel`)
    REFERENCES `HotelManagementSystem`.`Hotel` (`Id_Hotel`),
  CONSTRAINT `fk_Reservations_Rooms`
    FOREIGN KEY (`Rooms_idRooms`)
    REFERENCES `HotelManagementSystem`.`Rooms` (`idRooms`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`Stays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`Stays` (
  `idStays` INT NOT NULL AUTO_INCREMENT,
  `Reservations_idReservations` INT NOT NULL,
  `Actual_Checkin` DATETIME NULL DEFAULT NULL,
  `Actual_CheckOut` DATETIME NULL DEFAULT NULL,
  `Room_Rate_per_Night` DECIMAL(10,2) NULL DEFAULT NULL,
  `Extra_Charges` DECIMAL(10,2) NULL DEFAULT '0.00',
  `Discount_Amount` DECIMAL(10,2) NULL DEFAULT '0.00',
  `Final_Amount` DECIMAL(10,2) NULL DEFAULT NULL,
  `Status` VARCHAR(45) NULL DEFAULT 'Checked In',
  PRIMARY KEY (`idStays`),
  INDEX `fk_Stays_Reservations` (`Reservations_idReservations` ASC) VISIBLE,
  CONSTRAINT `fk_Stays_Reservations`
    FOREIGN KEY (`Reservations_idReservations`)
    REFERENCES `HotelManagementSystem`.`Reservations` (`idReservations`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`Payments` (
  `idPayments` INT NOT NULL AUTO_INCREMENT,
  `Stays_idStays` INT NOT NULL,
  `Payment_Date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `Amount` DECIMAL(10,2) NOT NULL,
  `Payment_Method` VARCHAR(45) NULL DEFAULT NULL,
  `Reference_Id` VARCHAR(45) NULL DEFAULT NULL,
  `Status` VARCHAR(45) NULL DEFAULT 'Completed',
  PRIMARY KEY (`idPayments`),
  INDEX `fk_Payments_Stays` (`Stays_idStays` ASC) VISIBLE,
  CONSTRAINT `fk_Payments_Stays`
    FOREIGN KEY (`Stays_idStays`)
    REFERENCES `HotelManagementSystem`.`Stays` (`idStays`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`Services` (
  `idServices` INT NOT NULL AUTO_INCREMENT,
  `Service_Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Default_Price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idServices`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`ServiceUsage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`ServiceUsage` (
  `idServiceUsage` INT NOT NULL AUTO_INCREMENT,
  `Services_idServices` INT NOT NULL,
  `Service_Name` VARCHAR(45) NULL DEFAULT NULL,
  `UsageDateTime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT '1',
  `PricePerUnit` DECIMAL(10,2) NULL DEFAULT NULL,
  `Total_Amount` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idServiceUsage`),
  INDEX `fk_ServiceUsage_Services` (`Services_idServices` ASC) VISIBLE,
  CONSTRAINT `fk_ServiceUsage_Services`
    FOREIGN KEY (`Services_idServices`)
    REFERENCES `HotelManagementSystem`.`Services` (`idServices`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `HotelManagementSystem`.`ServiceUsage_has_Stays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HotelManagementSystem`.`ServiceUsage_has_Stays` (
  `ServiceUsage_idServiceUsage` INT NOT NULL,
  `Stays_idStays` INT NOT NULL,
  PRIMARY KEY (`ServiceUsage_idServiceUsage`, `Stays_idStays`),
  INDEX `fk_ServiceUsage_has_Stays_Stays` (`Stays_idStays` ASC) VISIBLE,
  CONSTRAINT `fk_ServiceUsage_has_Stays_ServiceUsage`
    FOREIGN KEY (`ServiceUsage_idServiceUsage`)
    REFERENCES `HotelManagementSystem`.`ServiceUsage` (`idServiceUsage`),
  CONSTRAINT `fk_ServiceUsage_has_Stays_Stays`
    FOREIGN KEY (`Stays_idStays`)
    REFERENCES `HotelManagementSystem`.`Stays` (`idStays`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
