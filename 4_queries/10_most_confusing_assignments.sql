SELECT assignments.id, name, day, chapter, COUNT(assistance_requests.*) AS total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY name
ORDER BY total_requests DESC;