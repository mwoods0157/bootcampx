const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT cohorts.name as cohort, DISTINCT teachers.name as teacher
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
ORDER BY teacher;
`).then(res => {
  res.rows.forEach(user => {
    console.log(`${rows.name}: ${rows.name}`);
  })
}).catch(err => console.error('query error', err.stack));