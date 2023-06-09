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
(6, 'Christine Sinclair', '2020-01-20'),
(7, 'Lucky Guy', '1777-07-07')
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

INSERT INTO PEOPLE (id, name, dob) VALUES
(30, 'Amaya Stein', '2000-01-01'),
(31, 'Neve Clayton', '2000-01-01'),
(32, 'Lawson Murphy', '2000-01-01'),
(33, 'saba Gillespie', '2000-01-01'),
(34, 'Mahdi Armstrong', '2000-01-01'),
(35, 'Ishaan Vang', '2000-01-01'),
(36, 'Jaxon Fletcher', '2000-01-01'),
(37, 'Inayah Heath', '2000-01-01'),
(38, 'Noel Rhodes', '2000-01-01'),
(39, 'India Trujillo', '2000-01-01')
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
('Russian Football Federation', 'futbol.ru', 'Russia', 'ANF'),
('Team that never plays', 'noteam.com', 'Nomanland', 'fakesquad')
;

INSERT INTO REFEREES (rid, experience, country) VALUES
(1000, 10, 'United States'),
(0, 2022, 'Bethlehem'),
(666, 666, 'North Korea'),
(100, 0, 'Canada'),
(777, 2, 'Japan')
;


INSERT INTO PLAYERS (pid, shirtno, position, nassociation) VALUES
(1, 24, 'Striker', 'The Canadian National Association'),
(2, 2, 'Central Midfielder', 'The Canadian National Association'),
(3, 3, 'Forward', 'Portugal National Team'),
(4, 50, NULL, 'Argentine National Football Association'),
(5, 1, 'Striker', 'The Rivia National Association'),
(6, 69, 'midfield', 'The Canadian National Association'),
(7, 7, 'midfield', 'The United Sands National Association'),
(30, 30, NULL,'The Canadian National Association'),
(31, 31, NULL, 'The Canadian National Association'),
(32, 32, NULL, 'The Canadian National Association'),
(33, 33, NULL, 'The Canadian National Association'),
(34, 34, NULL, 'The Canadian National Association'),
(35, 35, NULL, 'The Canadian National Association'),
(36, 36, NULL, 'The Canadian National Association'),
(37, 37, NULL, 'The Canadian National Association'),
(38, 38, NULL, 'The Canadian National Association'),
(39, 39, NULL, 'The Canadian National Association')
;

INSERT INTO COACHES (cid, role, nassociation) VALUES
(27, 'Head coach', 'Portugal National Team'),
(44, 'Assistant coach', 'Portugal National Team'),
(88, 'Head coach', 'Argentine National Football Association'),
(22, 'Assistant coach', 'Argentine National Football Association'),
(13, NULL, 'The Rivia National Association')
;

INSERT INTO MATCH (mid, date, time, duration, roundno, name) VALUES
(20220001, '2023-03-14', '18:00:00', 90, 'round of 16', 'Sydney Football Stadium'),
(20220024, '2023-03-15', '06:00:00', 90, 'round of 16', 'Waikato Stadium'),
(20220013, '2023-03-15', '20:00:00', NULL, NULL, 'Brisbane Stadium'),
(20220005, '2023-03-16', '12:00:00', 103, 'quarter final', 'Olympic Stadium'),
(20220011, '2023-03-16', '13:59:59', NULL, 'quarter final', 'Dunedin Stadium'),
(20220000, '2023-03-16', '23:59:59', 90, 'quarter final', 'Sydney Football Stadium'),

(20221000, '2023-03-17', '08:00:00', NULL,'quarter final', 'Sydney Football Stadium'),
(20221001, '2023-03-18', '06:00:00', NULL, 'semi final ', 'Sydney Football Stadium'),
(20221002,'2023-03-18', '13:00:00', NULL, 'semi final ', 'Sydney Football Stadium'),

(20220077, '2022-03-7', '14:00:00', 90, 'group', 'Sydney Football Stadium'),
(20220076, '2022-03-8', '14:00:00', 90, 'group', 'Sydney Football Stadium'),
(20220075, '2022-03-9', '12:00:00', 90, 'group', 'Brisbane Stadium'),
(20220074, '2022-03-9', '18:00:00', 90, 'group', 'Brisbane Stadium'),
(20220073, '2022-03-10', '14:00:00', 90, 'group', 'Olympic Stadium'),
(20220072, '2022-03-11', '14:00:00', 90, 'group', 'Olympic Stadium'),
(20220071, '2022-03-12', '14:00:00', 90, 'group', 'Olympic Stadium')
;

INSERT INTO GOALS (minute, mid, occurence, penalty) VALUES
(1, 20220005, 1, 0),
(19,20220005, 2, 0),
(23, 20220005, 3, 0),
(45, 20220005, 4, 1),
(102, 20220005, 1, 1),
(5, 20220013, 1, 0),
(24, 20220024, 1, 0),
(50, 20220024, 2, 1)
;

INSERT INTO PSCORE (minute, mid, pid) VALUES
(1, 20220005, 2),
(19, 20220005, 1),
(23, 20220005, 1),
(45, 20220005, 5),
(102, 20220005, 1),
(5, 20220013, 4),
(24, 20220024, 3),
(50, 20220024, 3)
;

INSERT INTO TSCORE (minute, mid, nassociation) VALUES
(1, 20220005, 'The Canadian National Association'),
(19, 20220005, 'The Canadian National Association'),
(23, 20220005, 'The Canadian National Association'),
(45, 20220005, 'The Rivia National Association'),
(102, 20220005, 'Argentine National Football Association'),

(5, 20220013, 'The Rivia National Association'),
(24, 20220024, 'Portugal National Team'),
(50, 20220024, 'Portugal National Team'),
(10, 20220071, 'Russian Football Federation'),
(11, 20220071, 'Russian Football Federation'),
(12, 20220071, 'Russian Football Federation'),
(24, 20220071, 'Argentine National Football Association'),
(30, 20220071, 'Argentine National Football Association'),

(60, 20220072, 'The Canadian National Association'),
(85, 20220072, 'Russian Football Federation'),

(30, 20220073, 'Russian Football Federation'),
(70, 20220073, 'Russian Football Federation'),

(20, 20220074, 'The Rivia National Association'),
(70, 20220074, 'The Rivia National Association'),
(30, 20220074, 'The Rivia National Association'),
(80, 20220074, 'The Rivia National Association'),
(50, 20220074, 'Russian Football Federation'),

(70, 20220075, 'Portugal National Team'),

(70, 20220076, 'The Canadian National Association')
;

INSERT INTO CUSTOMER (email, password) VALUES
('garychess@hotmail.com', 'garygarygarygary'),
('gary.zhang@mail.mcgill.ca', 'ilovemcgill'),
('messiisdagoat@gmail.com', 'marrymemessi1234!'),
('cs421g200@mail.mcgill.ca', 'TimeHearing0i'),
('guestxxx100@hotmail.com', '1234'),
('xxx@xxx.org', 'xxx')
;

INSERT INTO PAYMENT (payid, card, total, email) VALUES
(1000999, '1111 2222 3333 4444', 200, 'garychess@hotmail.com'),
(1009999, '1111 2222 3333 4444', 100, 'garychess@hotmail.com'),
(1111888, '1234 5678 9101 1121', 500, 'messiisdagoat@gmail.com'),

(1001100, '1111 1111 1111 1111', 111, 'guestxxx100@hotmail.com'),
(1010101, '1111 2222 3333 4444', 30, 'garychess@hotmail.com'),
(1111000, '2121 2121 2121 2121', 210, 'cs421g200@mail.mcgill.ca'),

(1111001, '1010 1010 1010 1010', 100, 'xxx@xxx.org'),
(1111010, '1010 1010 1010 1010', 200, 'xxx@xxx.org')
;

INSERT INTO TICKET (seatid, mid, price) VALUES
(1, 20220001, 100.0),
(2, 20220001, 100.0),
(3, 20220001, 100.0),
(4, 20220001, 100.0),
(10, 20220001, 500.0),
(50, 20220001, 1000.0),
(19, 20220005, 30.0),
(3, 20220005, 210.0),
(4, 20220005, 111.0)
;


INSERT INTO PAYFORTICKET (seatid, mid, payid, quantity) VALUES
(1, 20220001, 1000999, 2),
(2, 20220001, 1009999, 1),
(3, 20220001, 1111001, 1),
(4, 20220001, 1111010, NULL),
(10, 20220001, 1111888, 10),
(19, 20220005, 1010101, 1),
(3, 20220005, 1111000, 1),
(4, 20220005, 1001100, 1)
;


INSERT INTO ASSIGNED (rid, mid, role) VALUES
(1000, 20220001, 'Head Referee'),
(0, 20220005, 'Head Referee'),
(666, 20220005, 'Linesmen'),
(100, 20220001,'Fourth Official')
;


INSERT INTO PLAYED (pid, mid, minentered, minleft, yellowcards, redcard, position) VALUES
(3, 20220001, 0, 90, 0, 7, 'Forward'),
(4, 20220001, 0, 90, 0, 6, NULL),
(3, 20220024, 0, 24, 2, 1, 'Forward'),
(7, 20220024, 0, 24, 0, 5, 'midfield'),
(5, 20220005, 0, 102, NULL, NULL, 'Striker'),
(1, 20220005, 0, 102, 0, 0, 'Striker'),
(2, 20220005, 0, 102, 1, 0, 'Central Midfielder'),
(6, 20220005, 0, 102, 2, 0, 'midfield'),

(4, 20220013, 5, 90, 1, 0, NULL),
(4, 20220011, 12, 13, 0, 1, NULL),
(5, 20220011, 10, 12, 0, 0, 'Striker')
;


INSERT INTO INVOLVES (nassociation1, nassociation2, mid) VALUES
('Portugal National Team', 'Argentine National Football Association', 20220001),
('Portugal National Team', 'The United Sands National Association', 20220024),
('The Rivia National Association', 'The Canadian National Association', 20220005),
('The Canadian National Association', 'Argentine National Football Association', 20220013),

('Portugal National Team', 'Argentine National Football Association', 20221000),
('The Canadian National Association', 'Portugal National Team', 20221001),
(NULL, NULL, 20221002),

('Argentine National Football Association', 'The Rivia National Association', 20220011),
('The Rivia National Association', 'Portugal National Team', 20220075),
('The Rivia National Association', 'Russian Football Federation', 20220074),
('The United Sands National Association', 'Russian Football Federation', 20220073),
('The Canadian National Association', 'Russian Football Federation', 20220072),
('Argentine National Football Association', 'Russian Football Federation', 20220071),
('The Canadian National Association', 'The Rivia National Association', 20220076),
('The Canadian National Association', 'Portugal National Team', 20220077)
;


