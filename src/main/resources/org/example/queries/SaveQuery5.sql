COPY (
SELECT firstName ||' '|| lastName AS fullName
FROM professor
WHERE EXISTS (SELECT *
              FROM teaches
              WHERE professor.profID = teaches.profID)
    AND NOT EXISTS (SELECT *
                    FROM transcript, teaches
                    WHERE professor.profID = teaches.profID
                        AND teaches.courseID = transcript.courseID
                        AND grade < 50)
GROUP BY professor.profID, firstName, lastName
) TO 'src/main/resources/data/output/query5.csv' (FORMAT CSV, HEADER TRUE);
