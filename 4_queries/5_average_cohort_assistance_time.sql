SELECT cohorts.name AS name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS average_assistance_time
FROM students
JOIN cohorts ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = student_id
GROUP BY name
ORDER BY average_assistance_time;