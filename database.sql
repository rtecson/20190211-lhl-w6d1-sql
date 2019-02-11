CREATE TABLE survey (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  surveyTitle TEXT
);

INSERT INTO survey (surveyTitle) VALUES ("Survey 1");
INSERT INTO survey (surveyTitle) VALUES ("Survey 2");
INSERT INTO survey (surveyTitle) VALUES ("Survey 3");

CREATE TABLE question (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  surveyId INTEGER,
  questionText TEXT,
  FOREIGN KEY(surveyId) REFERENCES survey(id)
);

INSERT INTO question (surveyId, questionText) VALUES
  (1, "What is 3+2?"),
  (1, "What is 3-2?"),
  (1, "What is 3*2?"),
  (2, "What is 4+3?"),
  (2, "What is 4-3?"),
  (3, "What is 8+3?");

CREATE TABLE options (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  questionId INTEGER,
  optionText TEXT,
  correctAnswer INTEGER,
  FOREIGN KEY(questionId) REFERENCES question(id)
);

INSERT INTO options (questionId, optionText, correctAnswer) VALUES
  (1, "4", 0),
  (1, "5", 1),
  (1, "6", 0),
  (2, "1", 1),
  (2, "1.5", 0),
  (2, "32", 0),
  (2, "81", 0),
  (3, "5", 0),
  (3, "6", 1),
  (4, "7", 1),
  (4, "43", 0),
  (5, "1", 1),
  (5, "81", 0),
  (6, "81", 0),
  (6, "11", 1);

CREATE TABLE submission (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    surveyId INTEGER,
    userKey TEXT,
    score REAL,
    FOREIGN KEY(surveyId) REFERENCES survey(id)
);

INSERT INTO submission (surveyId, userKey, score) VALUES
  (1, "jack@abc.com", 0.0),
  (1, "diane@def.com", 1.0),
  (1, "jack@abc.com", 0.1667),
  (1, "jack@abc.com", 0.3333);

CREATE TABLE answer (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  submissionId INTEGER,
  questionId INTEGER,
  optionId INTEGER,
  FOREIGN KEY(submissionId) REFERENCES submission(id),
  FOREIGN KEY(questionId) REFERENCES question(id),
  FOREIGN KEY(optionId) REFERENCES option(id)
);

INSERT INTO answer (submissionId, questionId, optionId) VALUES
  (1, 1, 1),
  (2, 1, 2),
  (2, 2, 4),
  (2, 3, 9),
  (2, 4, 10),
  (2, 5, 12),
  (2, 6, 15),
  (3, 1, 2),
  (4, 1, 2),
  (4, 2, 4);
