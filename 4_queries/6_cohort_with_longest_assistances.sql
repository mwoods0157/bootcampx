SELECT name, MAX(average_assistance_time)
FROM (SELECT cohorts.name AS name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_time
FROM students
JOIN cohorts ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = student_id
GROUP BY name
ORDER BY average_assistance_time);

SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;