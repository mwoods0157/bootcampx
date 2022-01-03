CREATE TABLE assignments (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(500),
    content TEXT,
    day INTEGER,
    chapter INTEGER,
    duration INTEGER
);

CREATE TABLE assignment_submissions (
    id SERIAL PRIMARY KEY NOT NULL,
    assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
    student_id INTEGER REFERENCES students(id) on DELETE CASCADE,
    duration INTEGER,
    submission_date DATE
);

