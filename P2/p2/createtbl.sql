-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.

CREATE TABLE PEOPLE(
   id INTEGER NOT NULL PRIMARY KEY,
   name VARCHAR(30),
   dob DATE
);

CREATE TABLE REFEREES(
     rid INTEGER NOT NULL,
     experience INTEGER,
     country VARCHAR(30),
     PRIMARY KEY(rid),
     FOREIGN KEY(rid) REFERENCES PEOPLE(id)
);

CREATE TABLE TEAMS(
  nassociation VARCHAR(60) NOT NULL PRIMARY KEY,
  url VARCHAR(90),
  country VARCHAR(30) NOT NULL,
  squad VARCHAR(30) NOT NULL
);


CREATE TABLE PLAYERS(
    pid INTEGER NOT NULL,
    shirtno INTEGER NOT NULL,
    position VARCHAR(50),
    nassociation VARCHAR(60) NOT NULL,
    PRIMARY KEY(pid),
    FOREIGN KEY(pid) REFERENCES PEOPLE(id),
    FOREIGN KEY(nassociation) REFERENCES TEAMS
);


CREATE TABLE COACHES(
    cid INTEGER NOT NULL PRIMARY KEY,
    role VARCHAR(30),
    nassociation VARCHAR(60) NOT NULL REFERENCES TEAMS,
    FOREIGN KEY(cid) REFERENCES PEOPLE
);


CREATE TABLE STADIUM(
    sname VARCHAR(60) NOT NULL PRIMARY KEY,
    location VARCHAR(60) NOT NULL,
    capacity INTEGER NOT NULL
);


CREATE TABLE MATCH(
  mid INTEGER NOT NULL PRIMARY KEY,
  date DATE,
/*CONSTRAINT check_match_date CHECK (date BETWEEN '2022-11-20' AND '2022-12-18'),*/
  time TIME NOT NULL,
  duration INTEGER,
  roundno VARCHAR(30),
  name VARCHAR(60) REFERENCES STADIUM
);

CREATE TABLE INVOLVES(
     nassociation1 VARCHAR(60) REFERENCES TEAMS(nassociation),
     nassociation2 VARCHAR(60) REFERENCES TEAMS(nassociation),
     mid INTEGER NOT NULL PRIMARY KEY REFERENCES MATCH,
     CHECK ( NOT nassociation1 = nassociation2 )
);





CREATE TABLE GOALS(
  minute INTEGER NOT NULL,
  mid INTEGER NOT NULL,
  occurence INTEGER NOT NULL,
  penalty BOOLEAN NOT NULL,
  PRIMARY KEY(minute, mid),
  FOREIGN KEY(mid) REFERENCES MATCH
);


CREATE TABLE PSCORE(
   minute INTEGER NOT NULL,
   mid INTEGER NOT NULL,
   pid INTEGER NOT NULL,
   PRIMARY KEY(minute, mid),
   FOREIGN KEY(mid) REFERENCES MATCH,
   FOREIGN KEY(pid) REFERENCES PLAYERS
);


CREATE TABLE TSCORE(
   minute INTEGER NOT NULL,
   mid INTEGER NOT NULL REFERENCES MATCH,
   nassociation VARCHAR(60) NOT NULL REFERENCES TEAMS,
   PRIMARY KEY(minute, mid)
);

CREATE TABLE CUSTOMER(
     email VARCHAR(60) NOT NULL PRIMARY KEY,
     password VARCHAR(60) NOT NULL
);


CREATE TABLE PAYMENT(
    payid INTEGER NOT NULL PRIMARY KEY,
    card VARCHAR(20) NOT NULL,
    total INTEGER NOT NULL,
    email VARCHAR(60) NOT NULL REFERENCES CUSTOMER
);

CREATE TABLE TICKET(
   seatid INTEGER NOT NULL,
   mid INTEGER NOT NULL REFERENCES MATCH,
   price DECIMAL(6,2) NOT NULL,
   PRIMARY KEY(seatid, mid)
);


CREATE TABLE PAYFORTICKET(
         seatid INTEGER NOT NULL,
         mid INTEGER NOT NULL,
         payid INTEGER REFERENCES PAYMENT,
         quantity INTEGER,
         PRIMARY KEY(seatid, mid),
         FOREIGN KEY(seatid, mid) REFERENCES TICKET,
         FOREIGN KEY(mid) REFERENCES MATCH
);


CREATE TABLE ASSIGNED(
     rid INTEGER NOT NULL REFERENCES REFEREES,
     mid INTEGER NOT NULL REFERENCES MATCH,
     role VARCHAR(30),
     PRIMARY KEY(rid, mid)
);


CREATE TABLE PLAYED(
   pid INTEGER NOT NULL REFERENCES PLAYERS,
   mid INTEGER NOT NULL REFERENCES MATCH,
   minentered INTEGER,
   minleft INTEGER,
   CHECK (minentered < minleft),
   yellowcards INTEGER,
   redcard INTEGER,
   position VARCHAR(50),
   PRIMARY KEY(pid, mid)
);
