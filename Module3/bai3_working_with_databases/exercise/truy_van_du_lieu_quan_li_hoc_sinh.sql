USE `student_management`;
SET SQL_SAFE_UPDATES = 0;

SELECT *
FROM Student
WHERE StudentName LIKE "h%";

SELECT *
FROM  Class
WHERE MONTH(StartDate) = 12;

SELECT *
FROM Subjects
WHERE Credit BETWEEN 3 AND 5;

UPDATE Student
SET ClassId = 2
WHERE StudentName = "Hung" ;

SELECT Student.StudentName,Subjects.SubName,Mark.Mark
FROM Student 
INNER JOIN Subjects on Subjects.SubId = Mark.SubId
INNER JOIN Student on Student.StudentId = Mark.StudentId
ORDER BY Mark.Mark DESC;

SELECT Student.StudentName,Subjects.SubName,Mark.Mark
FROM Student 
INNER JOIN Mark on Student.StudentId = Mark.StudentId
INNER JOIN Subjects on Subjects.SubId = Mark.SubId
ORDER BY Mark.Mark DESC;

SELECT S.StudentName,Sub.SubName,M.Mark
FROM Mark M 
INNER JOIN Subjects Sub on Sub.SubId = M.SubId
INNER JOIN Student  S on S.StudentId = M.StudentId
ORDER BY M.Mark DESC,S.StudentName ASC;