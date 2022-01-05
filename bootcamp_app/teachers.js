const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT cohorts.name as cohort, DISTINCT teachers.name as teacher
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '$1 || 'JUL02'}'
ORDER BY teacher;
`;

const name = process.argv[2];
const value = [name];

pool.query(queryString, value).then(res => {
  res.rows.forEach(rows => {
    console.log(`${rows.cohort}: ${rows.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));