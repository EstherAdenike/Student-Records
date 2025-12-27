-- =========================================
-- Student Records Database
-- =========================================

-- 1. Create Database
CREATE DATABASE StudentRecordsDB;
USE StudentRecordsDB;

-- =========================================
-- 2. Tables
-- =========================================

-- Students Table
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT,
    matric_no VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    PRIMARY KEY (student_id)
);

-- Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    office_location VARCHAR(100),
    PRIMARY KEY (department_id)
);

-- Courses Table
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT,
    course_code VARCHAR(10) NOT NULL UNIQUE,
    course_title VARCHAR(100) NOT NULL,
    credit_unit INT NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (course_id),
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Lecturers Table
CREATE TABLE Lecturers (
    lecturer_id INT AUTO_INCREMENT,
    staff_no VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department_id INT NOT NULL,
    PRIMARY KEY (lecturer_id),
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- =========================================
-- 3. Relationship Tables
-- =========================================

-- One-to-One Relationship
-- Each student has one profile record
CREATE TABLE StudentProfiles (
    student_id INT,
    address VARCHAR(255),
    state_of_origin VARCHAR(50),
    guardian_name VARCHAR(100),
    guardian_phone VARCHAR(15),
    PRIMARY KEY (student_id),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Many-to-Many Relationship
-- Students enroll in many courses, courses have many students
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    academic_session VARCHAR(20) NOT NULL,
    semester ENUM('First', 'Second') NOT NULL,
    PRIMARY KEY (enrollment_id),
    UNIQUE (student_id, course_id, academic_session, semester),
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- One-to-Many Relationship
-- One lecturer can teach many courses
CREATE TABLE CourseAssignments (
    assignment_id INT AUTO_INCREMENT,
    lecturer_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (assignment_id),
    UNIQUE (lecturer_id, course_id),
    FOREIGN KEY (lecturer_id)
        REFERENCES Lecturers(lecturer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- =========================================
-- 4. Results Table
-- =========================================

CREATE TABLE Results (
    result_id INT AUTO_INCREMENT,
    enrollment_id INT NOT NULL,
    score DECIMAL(5,2) NOT NULL,
    grade CHAR(1),
    PRIMARY KEY (result_id),
    FOREIGN KEY (enrollment_id)
        REFERENCES Enrollments(enrollment_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
