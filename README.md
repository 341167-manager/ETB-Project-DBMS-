# ETB-Project-DBMS-
DBMS project
### 📋 Project Submission Details
**Group Number:** 16  
**Submitted To:** Prof. Ashok Harnal  

**Submitted By:**
| Name | Student ID |
| :--- | :--- |
| Srishti Kumari | 341176 |
| Yash Kumar | 341178 |
| Salim Shah | 341167 |

# 🏨 Hotel Management System (DBMS Project)

## 📌 Project Overview
This project is a comprehensive **Relational Database Management System (RDBMS)** designed to manage the daily operations of a multi-branch hotel chain. It efficiently handles guest reservations, room inventory, employee management, service usage (e.g., dining, laundry), and billing processing.

## 🛠️ Tech Stack
* **Database Engine:** MySQL / MariaDB
* **Language:** SQL (DDL & DML)
* **Key Concepts:** Normalization, Joins, Foreign Key Constraints, Indexing

## ✨ Key Features
* **Multi-Branch Support:** Manages data for multiple hotel properties (e.g., Jaipur, Mumbai, Bangalore).
* **Reservation Lifecycle:** Tracks bookings from initial 'Pending' status to 'Confirmed', and links them to actual 'Stays' (Check-in/Check-out).
* **Service Tracking:** detailed logging of amenities used by guests (Spa, Airport Pickup, Room Service) and calculating their costs.
* **Billing & Payments:** Generates final bill amounts including room rates, extra services, taxes, and records payment methods (UPI, Credit Card, Cash).

## 🗂️ Database Schema
The system consists of the following core entities:

* **Hotel & Staff:** Stores details of hotel branches and their employees.
* **Guests:** Manages customer profiles and identity proofs.
* **Rooms:** Tracks room types (Deluxe, Suite), prices, and live occupancy status.
* **Bookings:** Segregated into `Reservations` (planning) and `Stays` (execution).
* **Finance:** Records `Payments` and individual `ServiceUsage` charges.

## 🚀 How to Run
1.  Clone the repository.
2.  Import the `HotelDBMS_Data.sql` file into your MySQL Workbench or command line.
3.  Execute the script to build the schema and populate dummy data.

<table>
  <thead>
    <tr>
      <th width="30%">Table Name</th>
      <th width="70%">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Hotel</strong></td>
      <td>Administrative details for hotel branches including location, contact info, and star ratings.</td>
    </tr>
    <tr>
      <td><strong>Services</strong></td>
      <td>Catalog of available hotel amenities (e.g., Spa, Laundry) and their standard pricing.</td>
    </tr>
    <tr>
      <td><strong>Guests</strong></td>
      <td>Directory of customer profiles containing personal details, contacts, and identity proofs.</td>
    </tr>
    <tr>
      <td><strong>Rooms</strong></td>
      <td>Inventory of rooms across all hotels specifying types, occupancy limits, and nightly rates.</td>
    </tr>
    <tr>
      <td><strong>Employees</strong></td>
      <td>Records of staff members, their job roles, salaries, and assigned hotel branches.</td>
    </tr>
    <tr>
      <td><strong>Reservations</strong></td>
      <td>Initial booking records linking guests to rooms for specific dates and planned costs.</td>
    </tr>
    <tr>
      <td><strong>Stays</strong></td>
      <td>Tracks the actual execution of a reservation, including real check-in/out times and final billing.</td>
    </tr>
    <tr>
      <td><strong>ServiceUsage</strong></td>
      <td>Logs individual chargeable items or services consumed by guests during their visit.</td>
    </tr>
    <tr>
      <td><strong>ServiceUsage_has_Stays</strong></td>
      <td>Linking table that connects specific services consumed to the respective guest stay.</td>
    </tr>
    <tr>
      <td><strong>Payments</strong></td>
      <td>Records financial transactions, payment methods, and success statuses linked to stays.</td>
    </tr>
  </tbody>
</table>
