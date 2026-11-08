create database elearning_platform;
use elearning_platform;

-- Learners Table
create table learners (
	learner_id int primary key,
    full_name varchar(50) not null,
	country varchar(50) not null
    );
    
-- Courses Table
create table courses (
	course_id int primary key,
    course_name varchar(100) not null,
    category varchar(100) not null,
    unit_price decimal(10,2) not null
    );

-- Purchases Table
create table purchases (
	purchase_id int primary key,
    learner_id int,
    course_id int,
    quantity int not null,
    purchase_date date,
    foreign key (learner_id) references learners (learner_id),
    foreign key (course_id ) references courses (course_id )
    );
    
-- Insert values into learners table
insert into learners values
(1, 'Rameshkumar', 'USA'),
(2, 'Umamaheswari', 'India'),
(3, 'Sajith', 'Canada'),
(4, 'Nithiran', 'UK'),
(5, 'Lokesh', 'India'),
(6, 'Sahisnubalan', 'Australia'),
(7, 'Roshini', 'Singapore'),
(8, 'Aishu', 'UAE'),
(9, 'Kathirvel', 'USA'),
(10, 'Lathakathir', 'India');

-- Insert values into courses table
insert into courses values
(101, 'SQL for Beginners', 'Data Analytics', 500.00),
(102, 'Python Programming', 'Programming', 750.00),
(103, 'Power BI Essentials', 'Data Analytics', 1200.00),
(104, 'Digital Marketing Masterclass', 'Marketing', 1500.00),
(105, 'Excel Advanced', 'Productivity', 600.00),
(106, 'Machine Learning Basics', 'Artificial Intelligence', 2500.00),
(107, 'Tableau Dashboard Design', 'Data Visualization', 1000.00),
(108, 'Web Development Fundamentals', 'Programming', 1800.00),
(109, 'Project Management Professional', 'Management', 2200.00),
(110, 'Communication Skills', 'Soft Skills', 500.00);

-- Insert values into purchases table
insert into purchases values
(1001, 1, 101, 2, '2026-06-15'),
(1002, 2, 102, 1, '2026-06-18'),
(1003, 2, 103, 2, '2026-06-20'),
(1004, 3, 104, 1, '2026-06-22'),
(1005, 4, 101, 1, '2026-06-25'),
(1006, 5, 103, 3, '2026-08-28'),
(1007, 1, 104, 1, '2026-08-02'),
(1008, 3, 102, 2, '2026-08-10'),
(1009, 6, 106, 1, '2026-08-12'),
(1010, 7, 107, 2, '2026-08-15');

select * from courses;
select * from learners;
select * from purchases;

-- Format the currency values to 2 decimal places--
select c.course_name, format(c.unit_price, 2) as unit_price from courses c;

-- Use aliases for column names (e.g., AS total_revenue)--
select p.purchase_id, p.course_id, c.course_name, p.quantity, c.unit_price,c.unit_price * p.quantity as total_revenue 
from purchases p join courses c on p.course_id = c.course_id;

-- Sort results appropriately (e.g., highest total_spent first)--
select p.purchase_id, p.course_id, c.course_name, p.quantity, c.unit_price,c.unit_price * p.quantity as total_revenue 
from purchases p join courses c on p.course_id = c.course_id order by total_revenue desc;

select l.full_name,l.country, sum(p.quantity * c.unit_price) as total_spending from learners l join purchases p
on l.learner_id = p.learner_id join courses c on p.course_id = c.course_id
group by l.learner_id, l.full_name, l.country
order by total_spending desc;

-- Use SQL INNER JOIN, LEFT JOIN, and RIGHT JOIN to:
-- Combine learner, course, and purchase data.
-- Display each learner’s purchase details (course name, category, quantity, total amount, and purchase date).

select
    l.full_name as learner_name,
    c.course_name,
    c.category,
    p.quantity,
    p.quantity * c.unit_price as total_amount,
    p.purchase_date
from learners l
inner join purchases p
    on l.learner_id = p.learner_id
inner join courses c
    on p.course_id = c.course_id
order by learner_name;

select
    l.full_name as learner_name,
    c.course_name,
    c.category,
    p.quantity,
    format(ifnull(p.quantity * c.unit_price, 0), 2) as total_amount,
    p.purchase_date
from learners l
left join purchases p
    on l.learner_id = p.learner_id
left join courses c
    on p.course_id = c.course_id
order by learner_name;

select
    l.full_name as learner_name,
    c.course_name,
    c.category,
    p.quantity,
    format(ifnull(p.quantity * c.unit_price, 0), 2) as total_amount,
    p.purchase_date
from purchases p
right join courses c
    on p.course_id = c.course_id
left join learners l
    on p.learner_id = l.learner_id
order by c.course_name;

-- Display each learner’s total spending (quantity × unit_price) along with their country.

select l.full_name,l.country,SUM(p.quantity * c.unit_price) as total_spending from learners l join purchases p
on l.learner_id = p.learner_id join courses c on p.course_id = c.course_id
group by l.learner_id, l.full_name, l.country;

-- Find the top 3 most purchased courses based on total quantity sold

select c.course_id, c.course_name, sum(p.quantity) as total_quantity_sold from courses c join purchases p
on c.course_id = p.course_id 
group by c.course_id, c.course_name
order by total_quantity_sold desc limit 3;


-- Show each course category’s total revenue and the number of unique learners who purchased from that category.

select c.category,
sum(p.quantity * c.unit_price) as total_revenue,
count(distinct p.learner_id) as unique_learners
from courses c
join purchases p on c.course_id = p.course_id
group by c.category
order by total_revenue desc;

-- List all learners who have purchased courses from more than one category.
select l.learner_id,l.full_name,count(distinct c.category) as categories_count
from learners l
join purchases p on l.learner_id = p.learner_id
join courses c on p.course_id = c.course_id
group by l.learner_id, l.full_name
having count(distinct c.category) > 1;

-- Identify courses that have not been purchased at all.
select 
    c.course_id,
    c.course_name,
    c.category
from courses c
left join purchases p on c.course_id = p.course_id
where p.purchase_id is null;
   


