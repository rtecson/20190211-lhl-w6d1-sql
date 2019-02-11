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
  text TEXT,
  FOREIGN KEY(surveyId) REFERENCES survey(id)
);

INSERT INTO question (surveyId, text) VALUES
  (1, "What is 3+2?"),
  (1, "What is 3-2?"),
  (1, "What is 3*2?"),
  (2, "What is 4+3?"),
  (2, "What is 4-3?"),
  (3, "What is 8+3?");

CREATE TABLE answer (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  questionId INTEGER,
  answerText TEXT,
  isCorrect INTEGER,
  FOREIGN KEY(questionId) REFERENCES question(id)
);

INSERT INTO answer (questionId, answerText, isCorrect) VALUES
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
    userId TEXT,
    score REAL,
    FOREIGN KEY(surveyId) REFERENCES survey(id)
);

INSERT INTO submission (surveyId, userId, score) VALUES
  (1, "jack@abc.com", 0.0),
  (1, "diane@def.com", 1.0),
  (1, "jack@abc.com", 0.1667),
  (1, "jack@abc.com", 0.3333);

CREATE TABLE userAnswer (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  submissionId INTEGER,
  questionId INTEGER,
  answerId INTEGER,
  FOREIGN KEY(submissionId) REFERENCES submission(id),
  FOREIGN KEY(questionId) REFERENCES question(id),
  FOREIGN KEY(answerId) REFERENCES answer(id)
);

INSERT INTO userAnswer (submissionId, questionId, answerId) VALUES
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
