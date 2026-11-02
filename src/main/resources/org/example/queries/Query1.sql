SELECT COUNT(studentID) AS studentCount
FROM transcript
WHERE grade >= 80
 AND courseID = 'mie301h1f';