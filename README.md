# Module End Assignment
# Module End – 3

## Title:
## Analyzing E-Learning Platform Purchases using MySQL

## Objective:
An online learning platform sells various digital courses to learners across different countries. Each learner can purchase multiple courses, and each course belongs to a specific category.
I use MySQL to design and query a relational database that helps derive meaningful insights from this e-learning purchase data.
## Dataset Description:
E-Learning Purchase data contains three tables:
## 1.	Table: learners
Attributes:
•	learner_id (Primary Key)
•	full_name
•	Country

## 2.	Table: courses
Attributes
•	course_id (Primary Key)
•	course_name
•	category
•	unit_price

## 3.	Table: purchases
Attributes:
•	purchase_id (Primary Key)
•	learner_id (Foreign Key → learners.learner_id)
•	course_id (Foreign Key → courses.course_id)
•	Quantity
•	purchase_date

## 1.Create the Database and Schema:
I Insert the 10 records to three tables.
### Courses Table:
<img width="951" height="668" alt="image" src="https://github.com/user-attachments/assets/3bd2fd7d-05e1-4355-a9f1-7c5dfea2e709" />

### Learners Table:
<img width="886" height="613" alt="image" src="https://github.com/user-attachments/assets/bda3fb1b-016a-4439-87db-bd35dc0884d7" />

### Purchases Table:
<img width="940" height="649" alt="image" src="https://github.com/user-attachments/assets/d71a2802-a566-43ff-bfa3-dda6096f5667" />

## 2.Data Exploration Using Joins:
## Format currency values to 2 decimal places:
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/0bb1a385-0021-41e8-8b3f-1bae7beaefaf" />

## Use aliases for column names (e.g., AS total_revenue):
 <img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/b7551d15-cd93-44d1-a2d6-869a229572c2" />

## Sort results appropriately (e.g., highest total_spent first):
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/83fa2713-c837-40ef-b054-794d01b065e0" />

 
## Use SQL INNER JOIN, LEFT JOIN, and RIGHT JOIN to:
### Inner Join:
•	Combine learner, course, and purchase data.
•	Display each learner’s purchase details (course name, category, quantity, total amount, and purchase date).
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/7e87a5ff-4756-46d9-8bf1-dc15955af713" />

### Left Join:
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/1f81e0ad-91f8-4054-8852-336591f95069" />

### Right Join:
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/da9b7966-3292-4029-8feb-bdd1a3fa978f" />

## 3.  Analytical Queries:
### Q1. Display each learner’s total spending (quantity × unit_price) along with their country.
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/6a238477-4caa-4e6d-9eab-b3d6bf6bf131" />

### Q2. Find the top 3 most purchased courses based on total quantity sold.
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/e5f347ed-8743-4f21-8e3b-f6127e32a708" />

### Q3. Show each course category’s total revenue and the number of unique learners who purchased from that category.
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/b729c07a-d737-41e4-9f1f-c17e799fbe44" />

### Q4. List all learners who have purchased courses from more than one category.
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/6a14c4a6-cf68-42f4-b3ee-e12f53141c63" />

### Q5. Identify courses that have not been purchased at all.
<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/fd84ef11-7058-4dc1-afe4-5429083123bc" />

## Conclusion:
This module-end assignment successfully demonstrates the practical implementation of relational database design and advanced querying techniques using MySQL Workbench. By structuring an e-learning platform's dataset into normalized learners, courses, and purchases tables with proper primary and foreign key constraints, the project established a solid foundation for data integrity. 

Through the application of SQL operations including INNER JOIN, LEFT JOIN, aggregate functions (SUM, COUNT), grouping, and sorting—the analysis effectively extracted actionable business insights. Key findings included identifying top-performing courses, calculating category-wise revenue, tracking individual learner spending patterns, and spotting unpurchased catalog items. Overall, the assignment reinforces core data analytics competencies in handling transactional data and writing efficient SQL queries to support data-driven decision-making. 


