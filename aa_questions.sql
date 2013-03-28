CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  is_instructor INTEGER NOT NULL
);

INSERT INTO users (id, fname, lname, is_instructor)
VALUES (NULL, 'Mark', 'Millman', 1),
       (NULL, 'India', 'Meisner', 1)
       (NULL, 'Josh', 'Willborn', 0);
       (NULL, 'Nick', 'Hong', 0);


CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  user_id INTEGER
);

INSERT INTO questions(question_id, title, body, user_id)
VALUES (NULL, 'Is this working?', 'This is a question', 1);
VALUES (NULL, 'Time!!', 'Are these schedule for real?', 2);
VALUES (NULL, 'Code Review', 'You guys enjoy it so far?', 2);
VALUES (NULL, 'You guys rock', 'Will you give me an autograph?', 4);

CREATE TABLE question_followers(
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,
);

INSERT INTO question_followers(question_id, user_id)
VALUES (NULL, 1, 1);
VALUES (NULL, 1, 2);
VALUES (NULL, 1, 3);
VALUES (NULL, 1, 4);
VALUES (NULL, 3, 2);
VALUES (NULL, 3, 4);
VALUES (NULL, 4, 1);
VALUES (NULL, 4, 2);

-- CREATE TABLE question_replies();
--
--
-- CREATE TABLE question_actions();
--
--
-- CREATE TABLE question_likes();