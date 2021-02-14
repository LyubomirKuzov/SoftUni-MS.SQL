CREATE FUNCTION udf_ExamGradesToUpdate (@studentId INT, @grade DECIMAL(18,4))
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @result NVARCHAR(MAX)

	IF (@studentId NOT IN (SELECT se.StudentId FROM StudentsExams AS se))
	BEGIN
		SET @result = 'The student with provided id does not exist in the school!'
	END

	ELSE IF (@grade > 6.00)
	BEGIN
		SET @result = 'Grade cannot be above 6.00!'
	END

	ELSE
	BEGIN
		DECLARE @countOfGrades INT = (SELECT COUNT(StudentId)
									  FROM StudentsExams AS se
									  WHERE StudentId = @studentId AND Grade BETWEEN @grade AND @grade + 0.50)

		DECLARE @studentName NVARCHAR(MAX) = (SELECT FirstName FROM Students WHERE Id = @studentId)

		SET @result = CONCAT('You have to update ', CAST(@countOfGrades AS NVARCHAR(MAX)), ' grades for the student ', @studentName)
	END

	RETURN @result
END