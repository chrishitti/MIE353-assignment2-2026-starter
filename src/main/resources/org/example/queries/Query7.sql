SELECT s1.firstName || ' ' || s1.lastName AS s1FullName, s2.firstName || ' ' || s2.lastName AS s2FullName, COUNT(*) AS numCommonCourses, AVG(t1.grade) AS s1AvgGrade, AVG(t2.grade) AS s2AvgGrade
FROM student s1, student s2, transcript t1, transcript t2
WHERE s1.studentID < s2.studentID
    AND s1.studentID = t1.studentID
    AND s2.studentID = t2.studentID
    AND t1.courseID = t2.courseID
GROUP BY s1.studentID, s2.studentID, s1.firstName, s2.firstName, s1.lastName, s2.lastName
HAVING COUNT(*) >= 3;