CREATE DATABASE School

USE School

CREATE TABLE Students
(
Id int IDENTITY PRIMARY KEY NOT NULL,
[Name] char(30) NOT NULL,
Age tinyint NOT NULL,
PhoneNumber char(20)
)

CREATE TABLE Classes
(
Id int IDENTITY PRIMARY KEY NOT NULL,
[Name] char(20) NOT NULL,
MaxStudents tinyint NOT NULL
)

CREATE TABLE Teachers
(
Id int IDENTITY PRIMARY KEY NOT NULL,
[Name] char(30) NOT NULL,
Class int NOT NULL
)

INSERT INTO Students ([Name], Age, PhoneNumber)
VALUES
('Ivan', 19, 052152512),
('Pesho', 20, 5215964078)

UPDATE Students
SET PhoneNumber = '8052152512'
WHERE [Name] = 'Ivan'

INSERT INTO Classes ([Name], MaxStudents)
VALUES
('Dolphins', 30)

INSERT INTO Teachers ([Name], Class)
VALUES
('Ivanov', 1)

SELECT * FROM Students
SELECT * FROM Classes
SELECT * FROM Teachers

DELETE FROM Students
WHERE [Name] = 'Pesho'
 