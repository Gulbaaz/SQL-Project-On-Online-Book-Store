# 📘 SQL Project – Online Book Store

This project simulates a real-world online bookstore and applies SQL queries to analyze customer behavior, book inventory, and sales data. It covers both basic and advanced level SQL problems using structured CSV files.

---

## 🔗 Table of Contents

- [📘 Project Overview](#-project-overview)
- [📁 Folder Structure](#-folder-structure)
- [📦 Dataset Description](#-dataset-description)
- [🔍 SQL Queries Included](#-sql-queries-included)
- [🛠️ Tools Used](#️-tools-used)
- [✍️ Author](#-author)

---

## 📘 Project Overview

The goal of this project is to practice writing SQL queries using datasets that represent customers, books, and their orders in an online bookstore. The project includes data cleaning, aggregation, filtering, and advanced analysis to derive useful insights.

---

## 📁 Folder Structure

online-bookstore-sql/
│
├── 01_Data/
│ ├── Books.csv
│ ├── Customers.csv
│ └── Orders.csv
│
├── 02_SQL_Queries/
│ └── Online_Bookstore_Queries.sql # All queries (basic + advanced)
│
├── 03_Outputs/
│ └── (Optional) Screenshots or result outputs)
│
└── README.md

---

## 📦 Dataset Description

The project uses 3 CSV files as the main data source:

- **Books.csv** – Contains book details like ID, title, genre, author, price, stock, and published year.
- **Customers.csv** – Contains customer info like ID, name, city, and country.
- **Orders.csv** – Contains order details like Order_ID, Book_ID, Customer_ID, Quantity, Order_Date, and Total_Amount.

🔁 **Common columns (relationships)**:
- `Book_ID` (Books ↔ Orders)
- `Customer_ID` (Customers ↔ Orders)

---

## 🔍 SQL Queries Included

All queries (Basic + Advanced) are written in a single `.sql` file:

📂 [Online_Bookstore_Queries.sql](./02_SQL_Queries/SQL Queries.sql)


Each query is clearly commented and categorized for easy reading.  
The types of queries include:

### ✅ Basic Queries:
1. Retrieve all books in the "Fiction" genre  
2. Find books published after the year 1950  
3. List all customers from Canada  
4. Show orders placed in November 2023  
5. Retrieve total stock of books available  
6. Find details of the most expensive book  
7. Show customers who ordered more than 1 quantity  
8. Retrieve orders where total amount > $20  
9. List all genres available  
10. Find book with the lowest stock  
11. Calculate total revenue from all orders

### 🚀 Advanced Queries:
1. Total books sold per genre  
2. Average price of books in "Fantasy" genre  
3. Customers who placed at least 2 orders  
4. Most frequently ordered book  
5. Top 3 most expensive books (Fantasy genre)  
6. Total quantity sold per author  
7. Cities of customers who spent over $30  
8. Customer who spent the most  
9. Stock remaining after all orders fulfilled

---

## 🛠️ Tools Used

- **Database Engine:** MySQL 
- **Editor/IDE:** MySQL Workbench
- **Version Control:** Git & GitHub

---

## ✍️ Author

**Gulbaaz**  
Aspiring Data Analyst | SQL Enthusiast | Passionate about real-world problem solving  
📫 [GitHub Profile](https://github.com/Gulbaaz)


