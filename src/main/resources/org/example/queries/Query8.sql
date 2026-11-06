-- Keep the best grade for each course number within a student's department.
WITH taken AS (
    SELECT t.studentId, c.courseId, t.grade,
           UPPER(regexp_extract(c.courseId, '^([A-Za-z]+)', 1)) AS department,
           CAST(regexp_extract(c.courseId, '^[A-Za-z]+([0-9]+)', 1) AS INTEGER) AS courseNumber,
           CASE WHEN c.gradCourse = 1 THEN 1 ELSE 0 END AS graduate
    FROM transcript t
    JOIN course c ON c.courseId = t.courseId
),
best_attempt AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY studentId, department, courseNumber
               ORDER BY grade DESC NULLS LAST, courseId
           ) AS attemptRank
    FROM taken
),
ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY studentId, department
               ORDER BY graduate, courseNumber
           ) AS lowestRank,
           ROW_NUMBER() OVER (
               PARTITION BY studentId, department
               ORDER BY graduate DESC, courseNumber DESC
           ) AS highestRank,
           COUNT(*) OVER (PARTITION BY studentId, department) AS numberOfCourses
    FROM best_attempt
    WHERE attemptRank = 1
)
SELECT s.firstName || ' ' || s.lastName AS fullName,
       low.department AS departmentCode,
       '(' || low.courseId || ', ' || high.courseId || ')' AS coursePair,
       '(' || COALESCE(CAST(low.grade AS VARCHAR), 'NULL') || ', ' ||
              COALESCE(CAST(high.grade AS VARCHAR), 'NULL') || ')' AS gradePair
FROM ranked low
JOIN ranked high
  ON low.studentId = high.studentId AND low.department = high.department
JOIN student s ON s.studentId = low.studentId
WHERE low.lowestRank = 1 AND high.highestRank = 1 AND low.numberOfCourses >= 2
ORDER BY s.lastName, s.firstName, s.studentId, low.department;
