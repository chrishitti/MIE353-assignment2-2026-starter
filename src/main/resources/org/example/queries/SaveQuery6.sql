COPY (
SELECT firstName || ' ' || lastName AS fullName
FROM student, transcript, course
WHERE student.studentID = transcript.studentID
    AND transcript.courseID = course.courseID
    AND course.courseName = 'Data Modelling'
    AND EXISTS(SELECT * 
               FROM transcript, course 
               WHERE student.studentID = transcript.studentID
               AND transcript.courseID = course.courseID 
               AND course.courseName <> 'Data Modelling'
               AND transcript.grade >= 90)
GROUP BY student.studentID, firstName, lastName
) TO 'src/main/resources/data/output/query6.csv' (FORMAT CSV, HEADER TRUE);
