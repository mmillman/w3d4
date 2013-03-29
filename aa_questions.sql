CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  is_instructor INTEGER NOT NULL
);

INSERT INTO users (id, fname, lname, is_instructor)
VALUES (NULL, 'Mark', 'Millman', 1),
       (NULL, 'India', 'Meisner', 1),
       (NULL, 'Josh', 'Willborn', 0),
       (NULL, 'Nick', 'Hong', 0);


CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  user_id INTEGER
);

INSERT INTO questions(id, title, body, user_id)
VALUES (NULL, 'Is this working?', 'This is a question', 1),
       (NULL, 'Time!!', 'Are these schedules for real?', 2),
       (NULL, 'Code Review', 'You guys enjoy it so far?', 2),
       (NULL, 'You guys rock', 'Will you give me an autograph?', 4);

CREATE TABLE question_followers (
  id INTEGER PRIMARY KEY,
  question_id INTEGER,
  user_id INTEGER,
  UNIQUE(question_id, user_id)
);

INSERT INTO question_followers(id, question_id, user_id)
VALUES (NULL, 1, 1),
       (NULL, 3, 4),
       (NULL, 1, 4),
       (NULL, 3, 3),
       (NULL, 4, 1),
       (NULL, 3, 1),
       (NULL, 3, 2),
       (NULL, 2, 1),
       (NULL, 4, 3),
       (NULL, 4, 2);


CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT
);

INSERT INTO replies(id, question_id, parent_id, body)
VALUES (NULL, 1, NULL, "A1 Q1"),
       (NULL, 1, 1, "R1 A1 Q1"),
       (NULL, 1, 2, "R1 R1 A1 Q1"),
       (NULL, 1, 3, "RI R1 R1 A1 Q1"),
       (NULL, 1, 1, "R2 A1 Q1"),
       (NULL, 1, NULL, "A2 Q1"),
       (NULL, 1, 6, "R1 A2 Q1"),

       (NULL, 2, NULL, "A1 Q2"), -- 8
       (NULL, 2, NULL, "A2 Q2"),
       (NULL, 2, NULL, "A3 Q2"),
       (NULL, 2, 9, "R1 A2 Q2"),
       (NULL, 2, 9, "R2 A2 Q2"),
       (NULL, 2, 8, "R1 A1 Q2"),
       (NULL, 2, 9, "R3 A2 Q2");


CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,
  UNIQUE(user_id, question_id)
);

INSERT INTO question_likes(id, user_id, question_id)
VALUES (NULL, 1, 1),
       (NULL, 1, 2),
       (NULL, 2, 2),
       (NULL, 4, 2),
       (NULL, 1, 4);


















