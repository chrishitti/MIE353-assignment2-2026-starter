COPY (
SELECT firstName ||' '|| lastName AS fullName
FROM professor, teaches
WHERE professor.profID = teaches.profID
GROUP BY professor.profID, firstName, lastName
HAVING COUNT(*) = 1
) TO 'src/main/resources/data/output/query3.csv' (FORMAT CSV, HEADER TRUE);
