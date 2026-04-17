# 📌 Campus Issue Management System

A full-stack Java web application that allows users to report campus-related issues and enables administrators to manage and resolve them efficiently. The system also demonstrates **distributed computing using Java RMI**.

---

## 🚀 Features

### 👤 User Module

* User Registration & Login
* Session-based authentication
* Submit issues with:

  * Issue type
  * Description
  * Contact details
  * Image upload
* View all submitted issues
* Logout functionality

---

### 👨‍💼 Admin Module

* Admin Login
* View all user-submitted issues
* Update issue status:

  * Pending
  * Resolved

---

## ⚙️ Tech Stack

* **Frontend:** HTML, CSS, JSP
* **Backend:** Java Servlets
* **Database:** MySQL
* **Connectivity:** JDBC
* **Server:** Apache Tomcat
* **Distributed System:** Java RMI

---

## 🧠 System Architecture

```
User → HTML/JSP → Servlet → JDBC → MySQL
                ↓
           RMI Server → Priority Logic
```

---

## 🗄️ Database Setup

### 1. Create Database

```sql
CREATE DATABASE campus_db;
USE campus_db;
```

### 2. Create Users Table

```sql
CREATE TABLE users (
    username VARCHAR(50),
    password VARCHAR(50)
);
```

### 3. Create Issues Table

```sql
CREATE TABLE issues (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    issue_type VARCHAR(50),
    description TEXT,
    priority VARCHAR(10),
    contact VARCHAR(15),
    image VARCHAR(255),
    status VARCHAR(20)
);
```

---

## ▶️ How to Run the Project

### 🔹 Step 1: Start RMI Server

* Navigate to `RMI_Project`
* Run: `RMIServer.java`

### 🔹 Step 2: Start Web Application

* Open `CampusIssueSystem` in Eclipse
* Run on Apache Tomcat Server

### 🔹 Step 3: Access Application

```
http://localhost:8080/CampusIssueSystem/login.html
```

### 🔹 Step 4: Admin Login

* **Username:** admin
* **Password:** admin123

---

## 📂 Project Structure

```
Campus-Issue-System/
 ├── CampusIssueSystem/   # Web Application (Servlets + JSP)
 └── RMI_Project/         # RMI Server (Priority Logic)
```

---

## 🎯 Key Concepts Implemented

* Java Servlets (Backend Processing)
* JSP (Dynamic UI Rendering)
* JDBC (Database Connectivity)
* Java RMI (Distributed Computing)
* Session Management (Authentication)
* File Upload Handling (Multipart)

---

## 💡 Future Enhancements

* Email/SMS notifications
* Issue filtering & search
* Admin analytics dashboard
* Role-based access control
* Cloud deployment

---

## 👨‍💻 Author

**Shlok Noval**
