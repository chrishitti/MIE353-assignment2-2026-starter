COPY (
    SELECT courseId, courseName
    FROM course
    WHERE gradCourse >= 1)
TO 'src/main/resources/data/output/gradCourses.csv';