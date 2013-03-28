CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  is_instructor INTEGER NOT NULL
);

INSERT INTO users (id, fname, lname, is_instructor)
VALUES (NULL, 'Mark', 'Millman', 0), (NULL, 'India', 'Meisner', 0);


CREATE TABLE questions(
  question_id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  author_id INTEGER
);

INSERT INTO questions(question_id, title, body, author_id)
VALUES (NULL, 'Is this working?', 'This is a question', 1);

--
-- CREATE TABLE question_followers();
--
--
-- CREATE TABLE question_replies();
--
--
-- CREATE TABLE question_actions();
--
--
-- CREATE TABLE question_likes();