SELECT professor.firstName ||' '|| professor.lastName AS fullName
FROM professor, student, teaches, transcript
WHERE professor.profID = teaches.profID
  AND teaches.courseID = transcript.courseID
  AND transcript.studentID = student.studentID
  AND student.firstName = 'Rebecca'
  AND student.lastName = 'Ward'
GROUP BY professor.profID, professor.firstName, professor.lastName;