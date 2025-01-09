# Drone Database

This project was done October 2023

In this project, I made a drone database where drone images can be stored. The database also has user and drone information. I designed the database first with an ER model. After this, I created a server using Docker. I then created  SQL scripts for adding the database to the server and some example data I created. With these scripts imported to the server, I could make different SQL queries to the data.

### ER model

![Image 9 1 2025 at 14 14](https://github.com/user-attachments/assets/1251e91e-1c57-4464-9de9-3f5a471459af)

## Test the database

To easily test the database for yourself, make sure you have Docker installed and running.

1. Clone the repository and change to the drone-database directory. 
2. Start Docker containers:
   docker-compose up -d
3. Go to http://localhost:8080
4. Log in with:
   username: drone
   password: drone
   database: drone
5. Using the 'import' feature add SQL scripts in the following order:
   1. drone_script.sql
   2. data.sql
6. In the 'SQL command' section you can now test the database with different SQL queries.
7. Stop the docker containers when done:
  docker-compose down

## Example SQL query

### Check which user has taken which images:

SELECT i.name AS image, u.name AS user, i.analysis FROM image i
JOIN user u
JOIN flight f
WHERE f.user_id = u.id AND i.flight_id = f.id;

Result: 

![Screenshot 2025-01-09 at 14 11 42](https://github.com/user-attachments/assets/fe7c4187-629c-4308-ab4f-0ee5412738b8)
