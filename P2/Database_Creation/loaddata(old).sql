-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.
--INSERT INTO MYTEST01 (id, value) VALUES(4, 1300);
-- A more complex syntax that saves you typing effort.
--INSERT INTO MYTEST01 (id, value) VALUES
-- (7, 5144)
--,(3, 73423)
--,(6, -1222)
--;


INSERT INTO PEOPLE (id, name, dob) VALUES
(1, 'Gary Zhang', '2000-03-24'),
(2,'Snehan Gorain', '2000-10-31'),
(3, 'Cristiano Ronaldo', NULL),
(4, 'Mike Tyson', '1966-06-30'),
(5, 'Geralt of Rivia', '1168-05-05'),
(6, 'Christine Sinclair', '2020-01-20')
;

INSERT INTO PEOPLE (id, name, dob) VALUES
(1000, 'George Foreman', NULL),
(0, 'Jesus', '1000-01-01'),
(666, 'Satan', '6666-06-06'),
(100, 'Justin Bieber', '1994-03-01'),
(777, 'King', NULL)
;

INSERT INTO PEOPLE (id, name, dob) VALUES
(27, 'Faith Ruetas', '2001-07-03'),
(44, 'Wendy Zhao', '2001-11-04'),
(88, 'Jackie Lee', '2001-11-08'),
(22, 'Twenty Two', '2022-02-22'),
(13, NULL, NULL)
;

INSERT INTO STADIUM (sname, location, capacity) VALUES
('Sydney Football Stadium', 'Sydney', 45500),
('Waikato Stadium', 'Waikato', 25800),
('Brisbane Stadium', 'Brisbane', 52500),
('Olympic Stadium','Olympic Village', 56000),
('Dunedin Stadium', 'Dunedin', 30748),
('Mandrogora Stadium', 'Mandrogora', 1000)
;

INSERT INTO TEAMS (nassociation, url, country, squad) VALUES
('Portugal National Team', NULL, 'Portugal', 'PNT'),     
('Argentine National Football Association', 'ANFA.url', 'Argentina', 'ANF'),
('The Rivia National Association', 'RNA.url', 'Rivia', 'RNA'),
('The Canadian National Association', NULL, 'CANADA', 'CNA'),
('The United Sands National Association', 'USNA.url', 'UNITED SANDS', 'USNA'),
('Team that never plays', 'noteam.com', 'Nomanland', 'fakesquad')
;    

INSERT INTO REFEREES (rid, experience, country) VALUES
(1000, 10, 'United States'),
(0, 2022, 'Bethlehem'),
(666, 666, 'North Korea'),
(100, 0, 'Canada'),
(777, 2, 'Japan');

INSERT INTO PLAYERS (pid, shirtno, position, nassociation) VALUES
(1, 24, 'Striker', 'The Canadian National Association'),
(2, 31, 'Central Midfielder', 'The Canadian National Association'),
(3, 7, 'Forward', 'Portugal National Team'),
(4, 50, NULL, 'Argentine National Football Association'),
(5, 1, 'Striker', 'The Rivia National Association'),
(6, 69, 'midfield', 'The Canadian National Association'),
(27, 27, 'midfield', 'The United Sands National Association')
;

INSERT INTO COACHES (cid, role, nassociation) VALUES
(27, 'Head coach', 'Portugal National Team'),
(44, 'Assistant coach', 'Portugal National Team'),
(88, 'Head coach', 'Argentine National Football Association'),
(22, 'Assistant coach', 'Argentine National Football Association'),
(13, NULL, 'The Rivia National Association')
;

INSERT INTO MATCH (mid, date, time, duration, roundno, name) VALUES
(20220001, '2022-01-23', '18:00:00', 90, 2, 'Sydney Football Stadium'),
(20220024, '2022-03-24', '20:03:24', 90, 2, 'Waikato Stadium'),
(20220013, NULL, NULL, NULL, NULL, 'Brisbane Stadium'),
(20220005, '2022-05-13', NULL, 103, 3, 'Olympic Stadium'),
(20220011, NULL, '22:22:22', NULL, 2, 'Dunedin Stadium')
;

INSERT INTO GOALS (minute, mid, occurence, penalty) VALUES
(1, 20220005, 1, 0),
(19,20220005, 3, 0),
(24, 20220024, 3, 0),
(102, 20220005, 1, 1),
(5, 20220013, 1, 0)
;

INSERT INTO PSCORE (minute, mid, pid) VALUES
(1, 20220005, 2),
(19, 20220005, 1),
(24, 20220024, 1),
(102, 20220005, 4),
(5, 20220013, 5),
(45, 20220005, 6),
(23, 20220005, 6),
(50, 20220024, 6)
;

INSERT INTO TSCORE (minute, mid, nassociation) VALUES
(1, 20220005, 'The Canadian National Association'),
(19, 20220005, 'The Canadian National Association'),
(24, 20220024, 'The Canadian National Association'),
(102, 20220005, 'Argentine National Football Association'),
(5, 20220013, 'The Rivia National Association')
;

INSERT INTO CUSTOMER (email, password) VALUES
('garychess@hotmail.com', 'garygarygarygary'),
('gary.zhang@mail.mcgill.ca', 'ilovemcgill'),
('messiisdagoat@gmail.com', 'marrymemessi1234!'),
('cs421g200@mail.mcgill.ca', 'TimeHearing0i'),
('guestxxx100@hotmail.com', '1234')
;

INSERT INTO PAYMENT (payid, card, total, email) VALUES
(1000999, '1111 2222 3333 4444', 200, 'garychess@hotmail.com'),
(1111888, '1234 5678 9101 1121', 500, 'messiisdagoat@gmail.com'),
(1001100, '1111 1111 1111 1111', 111, 'guestxxx100@hotmail.com'),
(1010101, '1111 2222 3333 4444', 30, 'garychess@hotmail.com'),
(1111000, '2121 2121 2121 2121', 210, 'cs421g200@mail.mcgill.ca')
;

INSERT INTO TICKET (seatid, mid, price) VALUES
(1, 20220001, 100.0),
(10, 20220001, 500.0),
(19, 20220005, 30.0),
(3, 20220005, 210.0),
(4, 20220005, 111.0)
;


INSERT INTO PAYFORTICKET (seatid, mid, payid, quantity) VALUES
(1, 20220001, 1000999, 2),
(10, 20220001, 1111888, 10),
(19, 20220005, 1010101, 1),
(3, 20220005, 1111000, 1),
(4, 20220005, 1001100, 1)
;

--INSERT INTO FOR VALUES

INSERT INTO ASSIGNED (rid, mid, role) VALUES
(1000, 20220001, 'Head Referee'),
(0, 20220005, 'Head Referee'),
(666, 20220005, 'Linesmen'),
(100, 20220001,'Fourth Official'),
(777, 20220001, 'Linesmen')
;


INSERT INTO PLAYED (pid, mid, minentered, minleft, yellowcards, redcard, position) VALUES
(1, 20220001, 0, 90, 0, 7, 'Striker'),
(2, 20220001, 0, 90, 0, 6, 'Central Midfielder'),
(4, 20220024, 0, 24, 2, 1, 'Striker'),
(1, 20220024, 0, 24, 0, 5, 'Striker'),
(5, 20220013, 5, 10, NULL, NULL, NULL),
(27, 20220024, 5, 10, 15, 0, 'Striker'),
(1, 20220005, 12, 13, 0, 1, NULL),
(1, 20220013, 10, 12, 0, 0, NULL)
;


INSERT INTO INVOLVES (nassociation1, nassociation2, mid) VALUES
('Portugal National Team',
	'Argentine National Football Association',
	20220001),
('Portugal National Team',
	'The United Sands National Association',
	20220024),
('The Rivia National Association',
	'The Canadian National Association',
	20220005),
('The Canadian National Association',
	'Argentine National Football Association',
	20220013),
('Argentine National Football Association',
	'The Rivia National Association',
	20220011)
;


