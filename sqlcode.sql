DROP DATABASE IF EXISTS LibraryManagementSystem;
CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;
CREATE TABLE users (
    uid INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) Not null,
    login_name VARCHAR(255) NOT NULL,
    login_password VARCHAR(255) NOT NULL,
    user_type ENUM('staff', 'student') NOT NULL,
    phone VARCHAR(15) NULL
);
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    staff_email VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(uid) ON DELETE CASCADE
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    mobile_number VARCHAR(15) NOT NULL,
    student_identifier VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(uid) ON DELETE CASCADE
);

CREATE TABLE tblbooks (
    id INT AUTO_INCREMENT PRIMARY KEY,              
    author_name VARCHAR(255),                       
    category_name VARCHAR(150),                     
    publication_date DATE,                          
    isbn VARCHAR(20) UNIQUE,                       
    publisher VARCHAR(255),                      
    language VARCHAR(50),                           
    description TEXT,                               
    status ENUM('available', 'issued') NOT NULL  
);

select * from tblissuedbookdetails;
drop table tblissuedbookdetails;
CREATE TABLE tblissuedbookdetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    BookName VARCHAR(255) NOT NULL,
    StudentID VARCHAR(50) NOT NULL,
    language VARCHAR(50) NOT NULL,
    IssuesDate timestamp DEFAULT current_timestamp,
    ReturnDate timestamp DEFAULT NULL,
    RequestStatus VARCHAR(50) NOT NULL,
    ReturnStatus VARCHAR(50) NOT NULL,
    Fine DECIMAL(10, 2) DEFAULT NULL
);