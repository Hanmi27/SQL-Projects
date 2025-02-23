# SQL Database Projects Portfolio  
This repository showcases structured **SQL database projects** built using **MySQL Workbench**. The projects demonstrate **database design, SQL queries, and data management techniques**.

---

## **Gradebook Database**  
### **Overview**  
The **Gradebook Database** is designed to **track student enrollments, class assignments, and grades** efficiently. It follows standard **database normalization rules** and best practices in **relational database design**.

### **Features**  
- **Many-to-Many Relationship**: A student can be enrolled in multiple classes, and each class can have multiple students.  
- **Normalized Structure**: Avoids data redundancy by creating separate tables for students, classes, and grades.  
- **Surrogate Primary Keys**: Each table uses a unique `ID` as the primary key for efficient indexing.  
- **Foreign Key Constraints**: Maintains referential integrity between related tables.  
- **ERD Design**: Fully structured **Entity-Relationship Diagram (ERD)**.  

### **Files in This Project**  
- **[ERD Diagram](./gradebook/gradebook_erd.png)**  
- **[SQL Schema & Table Creation Script](./gradebook/gradebook.sql)**  
- **[SQL Data Insert Statements](./gradebook/insert.sql)**  
- **[SQL Database Dump (Backup)](./gradebook/gradebook_dump.sql)**  

### **ERD Diagram**  
![Gradebook ERD](./gradebook/gradebook_erd.png)  

---

## **High School Basketball District Roster Database**  
### **Overview**  
The **Basketball Roster Database** is designed to manage **high school teams, players, and coaching staff** within different districts. This project applies **relational database principles** to efficiently store and retrieve sports team data.

### **Features**  
- **Hierarchical Structure**: Each team belongs to a district, and each team has multiple players and coaches.  
- **Foreign Keys & Relationships**:  
  - **District → Team** (One-to-Many)  
  - **Team → Players & Coaches** (One-to-Many)  
- **Data Organization**: Stores detailed information about **players, coaches, and teams**, including contact details.  
- **ERD Design**: Structured **Entity-Relationship Diagram (ERD)** with **normalized tables**.  

### **Files in This Project**  
- **[ERD Diagram](./basketball/basketball_erd.png)**  
- **[SQL Schema & Table Creation Script](./basketball/basketball_roster.sql)**  
- **[SQL Data Insert Statements](./basketball/insert.sql)**  

### **ERD Diagram**  
![Basketball Roster ERD](./basketball/basketball_erd.png)  

---

## **Technologies Used**  
- **SQL / MySQL Workbench**  
- **Relational Database Management**  
- **Entity-Relationship Diagram (ERD)**  
- **Database Normalization & Indexing**  
- **SQL Query Optimization**  

---

## **How to Use These Databases**  
### **Setting Up the Gradebook Database**  
1. **Download the `.sql` schema** and **run it in MySQL Workbench**.  
2. **Run the `insert.sql` file** to add sample data (1 student, 2 classes, 9 grades).  
3. **Use SELECT queries** to retrieve student performance data.  

### **Setting Up the Basketball Roster Database**  
1. **Run `basketball_roster.sql`** to create tables for teams, players, and coaches.  
2. **Insert sample data** for players and teams.  
3. **Query the database** to find player stats and team affiliations.  

---

## **Repository Structure**  
