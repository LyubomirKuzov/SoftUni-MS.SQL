CREATE TABLE Teachers
(
TeacherID INT IDENTITY(101, 1) PRIMARY KEY,
[Name] VARCHAR(30) NOT NULL,
ManagerID INT

CONSTRAINT FK_Teachers_ManagerID
	FOREIGN KEY (ManagerID)
		REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers ([Name], ManagerID)
	VALUES
		('John', NULL),
        ('Maya', 106),
        ('Silvia', 106),
        ('Ted', 105),
        ('Mark', 101),
        ('Greta', 101)