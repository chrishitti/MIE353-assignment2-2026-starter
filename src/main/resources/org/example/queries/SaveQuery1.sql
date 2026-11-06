COPY (
SELECT COUNT(studentID) AS studentCount
FROM transcript
WHERE grade >= 80
 AND courseID = 'mie301h1f'
) TO 'src/main/resources/data/output/query1.csv' (FORMAT CSV, HEADER TRUE);
