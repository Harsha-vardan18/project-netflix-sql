create database HARSHA;
use HARSHA;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    country VARCHAR(50),
    signup_date DATE
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT,
    rating FLOAT
);

CREATE TABLE Subscriptions (
    sub_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    plan VARCHAR(20),
    start_date DATE,
    end_date DATE,
    price DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE WatchHistory (
    watch_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    watch_date DATE,
    watch_duration INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);
INSERT INTO Users (name, age, gender, country, signup_date) VALUES
('Ayesha', 25, 'Female', 'India', '2024-01-05'),
('Imran', 30, 'Male', 'India', '2024-01-12'),
('Zara', 27, 'Female', 'UAE', '2024-02-10'),
('Rohan', 35, 'Male', 'USA', '2024-03-15'),
('Fatima', 28, 'Female', 'UK', '2024-03-20'),
('Vivek', 22, 'Male', 'India', '2024-04-01'),
('Meera', 26, 'Female', 'India', '2024-04-12'),
('Karan', 33, 'Male', 'Canada', '2024-05-05'),
('Sneha', 24, 'Female', 'India', '2024-05-20'),
('John', 40, 'Male', 'USA', '2024-06-01');


INSERT INTO Movies (title, genre, release_year, rating) VALUES
('The Silent Sea', 'Sci-Fi', 2022, 8.1),
('Money Heist', 'Thriller', 2021, 9.0),
('Friends Reunion', 'Comedy', 2021, 8.5),
('Dark', 'Sci-Fi', 2020, 9.2),
('Stranger Things', 'Horror', 2023, 8.9),
('The Office', 'Comedy', 2019, 8.8),
('Extraction', 'Action', 2020, 7.8),
('Dune', 'Sci-Fi', 2021, 8.2),
('Wednesday', 'Horror', 2023, 8.6),
('Inception', 'Action', 2010, 9.3);

INSERT INTO Subscriptions (user_id, plan, start_date, end_date, price) VALUES
(1, 'Basic', '2024-01-05', '2024-04-05', 499.00),
(2, 'Premium', '2024-01-12', '2024-07-12', 999.00),
(3, 'Standard', '2024-02-10', '2024-05-10', 699.00),
(4, 'Premium', '2024-03-15', '2024-09-15', 999.00),
(5, 'Standard', '2024-03-20', '2024-06-20', 699.00),
(6, 'Basic', '2024-04-01', '2024-07-01', 499.00),
(7, 'Standard', '2024-04-12', '2024-07-12', 699.00),
(8, 'Premium', '2024-05-05', '2024-11-05', 999.00),
(9, 'Basic', '2024-05-20', '2024-08-20', 499.00),
(10, 'Premium', '2024-06-01', '2024-12-01', 999.00);

INSERT INTO WatchHistory (user_id, movie_id, watch_date, watch_duration) VALUES
(1, 1, '2024-02-01', 120),
(1, 3, '2024-02-10', 90),
(2, 2, '2024-03-01', 150),
(2, 10, '2024-03-10', 130),
(3, 5, '2024-03-20', 100),
(3, 9, '2024-03-25', 110),
(4, 4, '2024-04-01', 200),
(4, 10, '2024-04-05', 180),
(5, 6, '2024-04-10', 140),
(5, 3, '2024-04-15', 80),
(6, 7, '2024-04-20', 160),
(7, 5, '2024-05-01', 120),
(7, 9, '2024-05-03', 90),
(8, 8, '2024-05-10', 150),
(8, 10, '2024-05-15', 170),
(9, 6, '2024-05-25', 130),
(9, 1, '2024-05-30', 100),
(10, 4, '2024-06-05', 190),
(10, 2, '2024-06-10', 160),
(10, 9, '2024-06-15', 120);
SELECT COUNT(*) AS total_users
FROM users;
SELECT country,
       COUNT(*) AS total_users
FROM users
GROUP BY country
ORDER BY total_users DESc;
SELECT plan,
       SUM(price) AS total_revenue
FROM subscriptions
GROUP BY plan
ORDER BY total_revenue DESC;
SELECT plan,
       COUNT(*) AS total_subscribers
FROM subscriptions
GROUP BY plan
ORDER BY total_subscribers DESC;
SELECT title,
       rating
FROM movies
ORDER BY rating DESC
LIMIT 5;
select movie_id,
COUNT(*)as most_watched 
from watchHistory
group by movie_id
order by most_watched DESC;

#Genre popularity (which genre is watched the most?).
select genre,
count(*)as frequent_genre
from movies
group by genre
order by frequent_genre DESC;
#Average watch time per user.
select AVG(watch_duration) as avg_time

from watchHistory
group by watch_duration
order by avg_time
DESC;
SELECT
    user_id,
    AVG(watch_duration) AS avg_watch_time
FROM watchHistory
GROUP BY user_id; 

 #2. Which country spends the most time watching?
select u.country,
SUM(w.watch_duration) as total_watched_time
from users u
join watchHistory w
on u.user_id=w.user_id
group by u.country
order by total_watched_time DESC;

