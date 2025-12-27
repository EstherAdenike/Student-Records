---

# Student Records Database (StudentRecordsDB)

## 📘 Project Overview

The **Student Records Database** is a relational database designed using **MySQL** to manage academic records in a tertiary institution.
It stores and organizes data about students, departments, courses, lecturers, enrollments, and results while enforcing data integrity through proper constraints and relationships.

This database demonstrates:

* Well-structured tables
* Proper use of primary and foreign keys
* One-to-One, One-to-Many, and Many-to-Many relationships
* Data integrity using constraints

---

## 🛠️ Technologies Used

* **Database Management System:** MySQL
* **SQL Features:**

  * `CREATE DATABASE`
  * `CREATE TABLE`
  * `PRIMARY KEY`
  * `FOREIGN KEY`
  * `UNIQUE`
  * `ENUM`
  * `AUTO_INCREMENT`

---

## 🗂️ Database Structure

### 1. Students

Stores personal and contact details of students.

**Key Fields:**

* `student_id` (Primary Key)
* `matric_no` (Unique)
* `first_name`, `last_name`
* `gender`, `date_of_birth`
* `email` (Unique)
* `phone`

---

### 2. Departments

Stores academic department information.

**Key Fields:**

* `department_id` (Primary Key)
* `department_name` (Unique)
* `office_location`

---

### 3. Courses

Stores course details offered by departments.

**Key Fields:**

* `course_id` (Primary Key)
* `course_code` (Unique)
* `course_title`
* `credit_unit`
* `department_id` (Foreign Key)

**Relationship:**

* One department offers many courses (One-to-Many)

---

### 4. Lecturers

Stores lecturer information.

**Key Fields:**

* `lecturer_id` (Primary Key)
* `staff_no` (Unique)
* `full_name`
* `email` (Unique)
* `department_id` (Foreign Key)

**Relationship:**

* One department has many lecturers (One-to-Many)

---

### 5. StudentProfiles

Stores additional personal information for students.

**Key Fields:**

* `student_id` (Primary Key & Foreign Key)
* `address`
* `state_of_origin`
* `guardian_name`
* `guardian_phone`

**Relationship:**

* One student has one profile (One-to-One)

---

### 6. Enrollments

Tracks students’ course registrations.

**Key Fields:**

* `enrollment_id` (Primary Key)
* `student_id` (Foreign Key)
* `course_id` (Foreign Key)
* `academic_session`
* `semester`

**Constraints:**

* Prevents duplicate enrollment per session and semester

**Relationship:**

* Students ↔ Courses (Many-to-Many)

---

### 7. CourseAssignments

Links lecturers to the courses they teach.

**Key Fields:**

* `assignment_id` (Primary Key)
* `lecturer_id` (Foreign Key)
* `course_id` (Foreign Key)

**Relationship:**

* One lecturer can teach many courses (One-to-Many)

---

### 8. Results

Stores academic results for enrolled courses.

**Key Fields:**

* `result_id` (Primary Key)
* `enrollment_id` (Foreign Key)
* `score`
* `grade`

**Relationship:**

* One enrollment has one result record (One-to-One)

---

## 🔗 Relationships Summary

| Relationship Type | Tables Involved                      |
| ----------------- | ------------------------------------ |
| One-to-One        | Students ↔ StudentProfiles           |
| One-to-Many       | Departments ↔ Courses                |
| One-to-Many       | Departments ↔ Lecturers              |
| Many-to-Many      | Students ↔ Courses (via Enrollments) |
| One-to-Many       | Lecturers ↔ CourseAssignments        |
| One-to-One        | Enrollments ↔ Results                |

---

## ▶️ How to Use

1. Open **MySQL** or **phpMyAdmin**
2. Copy and run the `.sql` file provided
3. The database `StudentRecordsDB` and all tables will be created automatically
4. Insert records using `INSERT INTO` statements as needed

---

## ✅ Key Features

* Enforced referential integrity using foreign keys
* Cascading updates and deletes where appropriate
* Prevents duplicate records using `UNIQUE` constraints
* Follows database normalization principles (1NF, 2NF, 3NF)

---

## 📌 Use Case

This database is suitable for:

* Universities
* Polytechnics
* Colleges of Education
* Academic database design projects and assignments

---

Just let me know 👍
