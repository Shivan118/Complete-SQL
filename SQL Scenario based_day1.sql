CREATE DATABASE Company1;

use Company1;

CREATE table candidates(
candidate_id int,
skill varchar(20),
age int);

INSERT INTO candidates(candidate_id,skill,age)VALUES(123, 'Python', 25);
INSERT INTO candidates(candidate_id,skill,age)VALUES(123, 'Tableau', 35);
INSERT INTO candidates(candidate_id,skill,age)VALUES(123, 'PostgreSQL', 24);
INSERT INTO candidates(candidate_id,skill,age)VALUES(234, 'R', 22);
INSERT INTO candidates(candidate_id,skill,age)VALUES(234, 'PowerBI', 65);
INSERT INTO candidates(candidate_id,skill,age)VALUES(234, 'SQl Server', 20);
INSERT INTO candidates(candidate_id,skill,age)VALUES(345, 'Python', 21);
INSERT INTO candidates(candidate_id,skill,age)VALUES(345, 'Tableau', 45);
INSERT INTO candidates(candidate_id,skill,age)VALUES(147, 'Python', 57);
INSERT INTO candidates(candidate_id,skill,age)VALUES(147, 'PostgreSQL', 24);
INSERT INTO candidates(candidate_id,skill,age)VALUES(147, 'Tableau',14 );
INSERT INTO candidates(candidate_id,skill,age)VALUES(147, 'Java',45 );
INSERT INTO candidates(candidate_id,skill,age)VALUES(168, 'Python', 32);
INSERT INTO candidates(candidate_id,skill,age)VALUES(256, 'Tableau',22 );

SELECT * FROM candidates;

SELECT candidate_id from candidates WHERE skill IN('Python', 'Tableau', 'PostgreSQL');


SELECT candidate_id, COUNT(skill) as skill_count from candidates
WHERE skill IN('Python', 'Tableau', 'PostgreSQL')
Group BY candidate_id
having COUNT(skill) = 3
































