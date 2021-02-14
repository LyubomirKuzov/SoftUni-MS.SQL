CREATE PROC usp_ExcludeFromSchool (@studentId INT)
AS
BEGIN
	IF (@studentId NOT IN (SELECT s.Id FROM Students AS s))
	BEGIN
		THROW 50001, 'This school has no student with the provided id!', 1
	END

	DELETE StudentsTeachers
		WHERE StudentId = @studentId

	DELETE StudentsSubjects
		WHERE StudentId = @studentId

	DELETE StudentsExams
		WHERE StudentId = @studentId

	DELETE Students
		WHERE Id = @studentId
END