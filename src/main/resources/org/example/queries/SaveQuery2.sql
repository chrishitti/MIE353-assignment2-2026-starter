COPY (
SELECT courseName
FROM course
WHERE courseID LIKE '___4%'
) TO 'src/main/resources/data/output/query2.csv' (FORMAT CSV, HEADER TRUE);
