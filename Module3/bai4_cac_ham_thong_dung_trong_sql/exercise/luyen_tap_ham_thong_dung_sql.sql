USE student_management;

SELECT MAX(Credit),SubId
FROM subjects;

SELECT subjects.SubId ,subjects.SubName , mark.Mark
FROM subjects
JOIN mark on subjects.SubId = mark.SubId
GROUP BY subjects.SubId,subjects.SubName
having AVG(Mark) >= ALL (SELECT mark.Mark FROM mark);

