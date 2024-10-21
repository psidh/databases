# Database Learning Repository

This repository contains resources, examples, and notes for learning databases, including SQL (PL/SQL), NoSQL, database management systems (DBMS), relational database management systems (RDBMS), normalization, indexing, database optimization, and architecture.

## Table of Contents

- [Introduction to Databases](#introduction-to-databases)
- [PL/SQL](#plsql)
- [DBMS and RDBMS](#dbms-and-rdbms)
- [NoSQL](#nosql)
- [Database Normalization](#database-normalization)
- [Indexing](#indexing)
- [Database Optimization](#database-optimization)
- [Database Architecture](#database-architecture)
- [References](#references)

---

## Introduction to Databases

A **Database** is an organized collection of structured information or data that is stored and accessed electronically. Modern databases are managed using Database Management Systems (DBMS) that allow for efficient interaction with the data, whether it's to add, retrieve, or update records.

- **Types of Databases**:
  - **Relational Databases** (e.g., Oracle, MySQL, PostgreSQL)
  - **NoSQL Databases** (e.g., MongoDB, Cassandra, Redis)
  - **Cloud Databases** (e.g., AWS RDS, Google Cloud Spanner)

---

## PL/SQL

**PL/SQL (Procedural Language/SQL)** is Oracle’s procedural extension of SQL, combining SQL capabilities with procedural programming. It is used for writing complex queries, stored procedures, functions, and triggers.

### Key Concepts:
- **Stored Procedures**: Reusable SQL code that can be executed with parameters.
- **Functions**: Similar to procedures but return a value.
- **Triggers**: Execute automatically in response to certain events.
- **Control Structures**: Loops (`FOR`, `WHILE`), conditional statements (`IF`).

### Example:

```sql
CREATE OR REPLACE PROCEDURE Add_User (p_username VARCHAR2, p_email VARCHAR2) AS
BEGIN
    INSERT INTO Users (user_id, user_name, email, join_date)
    VALUES (Users_seq.NEXTVAL, p_username, p_email, SYSDATE);
    COMMIT;
END Add_User;
```

---

## DBMS and RDBMS

- **DBMS (Database Management System)**: A software tool that allows you to store, modify, and extract information from a database. Examples: Microsoft Access, FileMaker.
- **RDBMS (Relational Database Management System)**: A type of DBMS that stores data in a structured format using rows and tables with relationships between them. Examples: MySQL, Oracle, PostgreSQL.

### Differences:
- **DBMS**: Non-relational, simpler data models, typically used for smaller data sets.
- **RDBMS**: Follows the relational model, supports complex queries, and is ACID-compliant.

---

## NoSQL

**NoSQL** databases provide a mechanism for storing and retrieving data that is modeled differently from relational databases. They are often used for large distributed data and real-time web applications.

### Types of NoSQL Databases:
- **Document-based**: MongoDB, CouchDB
- **Key-Value Stores**: Redis, DynamoDB
- **Column-based**: Cassandra, HBase
- **Graph Databases**: Neo4j, ArangoDB

---

## Database Normalization

**Normalization** is a process of organizing the data in the database to reduce redundancy and improve data integrity.

### Forms of Normalization:
1. **1NF (First Normal Form)**: Ensures that the table has only atomic (indivisible) values.
2. **2NF (Second Normal Form)**: Ensures that each non-key column is fully dependent on the primary key.
3. **3NF (Third Normal Form)**: Ensures that non-key columns are not transitively dependent on the primary key.

---

## Indexing

**Indexing** is a data structure technique used to quickly locate and access the data in a database table.

### Types of Indexes:
- **Primary Index**: Automatically created when a primary key is defined.
- **Secondary Index**: Manually created for faster access on non-primary key columns.
- **Composite Index**: Indexes created on multiple columns.
- **Unique Index**: Ensures the uniqueness of values in one or more columns.

### Example:

```sql
CREATE INDEX idx_user_email ON Users (email);
```

---

## Database Optimization

Optimizing a database involves improving its performance by using techniques that reduce query times and optimize resource usage.

### Optimization Techniques:
1. **Indexing**: Speeds up query execution.
2. **Query Optimization**: Ensure efficient SQL query writing.
3. **Partitioning**: Splitting large tables into smaller, more manageable pieces.
4. **Caching**: Storing frequently accessed data in memory.
5. **Denormalization**: Reducing joins by flattening data structures (for read-heavy applications).

---

## Database Architecture

Database architecture refers to the layout and organization of a database system. Common architectures include:

- **Single-tier Architecture**: Where the DBMS and application are on the same server.
- **Two-tier Architecture**: Client-server model where the client connects directly to the server.
- **Three-tier Architecture**: Separates the user interface, application logic, and data storage.

---

## References

- **Oracle PL/SQL Documentation**: [https://docs.oracle.com/en/database/](https://docs.oracle.com/en/database/)
- **SQL Optimization Techniques**: [https://www.sqlshack.com/sql-query-optimization/](https://www.sqlshack.com/sql-query-optimization/)
- **MongoDB Documentation**: [https://docs.mongodb.com/](https://docs.mongodb.com/)

-- **Database Normalization**: [https://www.studytonight.com/dbms/database-normalization.php](https://www.studytonight.com/dbms/)
