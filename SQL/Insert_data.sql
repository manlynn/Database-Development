INSERT INTO Venue (venue_id, venue_name, capacity) VALUES 
(101, 'PikkujouluCircus', 70),
(102, 'Finlandia', 3500);

INSERT INTO Artist (artist_id, artist_name, region, email, phone) VALUES 
(001, 'Sia','FIN', 'sia.furler@email.com', '0449812345'),
(002, 'Saara Aalto','FIN','saara.aalto@email.com', '0449856785'),
(003, 'ZZ Top','FIN','zz.top@email.com', '0449854123'),
(007, 'Russian National Ballet','FOR','russia.ballet@email.com', '0449832145'),
(004, 'Jorma Uotinen','FIN','jorma.uotinen@email.com', '0449811111'),
(005, 'Ellinoora','FIN','ellinoora.anni@email.com@email.com', '0449811235'),
(008, 'X Factory','FOR','xfactory@email.com', NULL);

INSERT INTO Request (request_id, description) VALUES
(1001, 'Less Sugar'),
(1002, 'Less Salt'),
(1003, 'Vegetarian'),
(1004, 'No Pork'),
(1005, 'No Sugar');

INSERT INTO Artist_Request (artist_id, request_id) VALUES 
(002,1001),
(002,1003),
(005,1005),
(008,1003);

INSERT INTO Event (event_id, event_name, category, date, ticket_price, venue_id, isCancelled) VALUES 
(101001, 'An Evening With Saara Aalto', 'Concert', '2019-5-19', 108, 101, 'N'),
(102001, 'Finnish Summer', 'Dance', '2019-6-12', 60, 102, 'N'),
(101002, 'X Dance', 'Dance', '2019-6-18', 60, 101, 'Y'),
(101003, 'ZZ Top show', 'Concert', '2019-6-4', 108, 101, 'N'),
(102002, 'The Snow Queen', 'Dance', '2019-6-24', 128, 102, 'N'),
(102003, 'Suomi Love', 'Concert', '2019-5-20', 80, 102, 'N'),
(101004, 'The Vintage Caravan', 'Concert', '2019-5-16', 60, 101, 'N');

INSERT INTO Event_Artist (artist_id, Event_id) VALUES
(004, 102001),
(002, 101002),
(003, 101003),
(001, 102002),
(005, 102003),
(004, 101004),
(002, 101001);

INSERT INTO Booking (booking_number, booking_status, quantity, expiration_date, client_phone) VALUES
(190506001, 'Cancelled', 2, '2019-3-12', NULL),
(190506002, 'Sold', 1, '2019-5-2', '442301711'),
(190506003, 'Cancelled', 1, '2019-5-4', NULL),
(190506004, 'Booked', 4, '2019-6-3', NULL),
(190506005, 'Cancelled', 2 , '2019-4-3', '400212321'),
(190506006, 'Sold', 1, '2019-4-6', NULL),
(190506007, 'Booked', 1, '2019-4-3', NULL),
(190506008, 'Sold', 1, '2019-6-3',NULL),
(190506009, 'Sold', 2, '2019-5-9', NULL),
(190506010, 'Booked', 2, '2019-6-5', NULL),
(190506011, 'Sold', 4, '2019-5-19', NULL),
(190506012, 'Booked', 3, '2019-6-3', NULL),
(190506013, 'Sold', 1, '2019-4-23', '449821345');

INSERT INTO Ticket (ticket_number, ticket_status, event_id, booking_number) VALUES
(1905061001, 'available', 102001, NULL),
(1905061002, 'available', 102001, NULL),
(1905061003, 'sold', 102001, 190506002),
(1905061004, 'available', 102001, NULL),
(1905061005, 'refunded', 102001, 190506006),
(1905061006, 'sold', 102001, 190506004),
(1905061007, 'refunded', 102001, 190506004),
(1905061008, 'sold', 102001, 190506004),
(1905061009, 'refunded', 102001, 190506004),
(1905061010, 'available', 101003, NULL),
(1905061011, 'available', 101003, NULL),
(1905061012, 'booked', 101003, 190506007),
(1905061013, 'sold', 101003, 190506013),
(1905061014, 'sold', 101003, 190506008),
(1905061015, 'booked', 101001, 190506012),
(1905061016, 'booked', 101001, 190506012),
(1905061017, 'booked', 101001, 190506012),
(1905061018, 'sold', 101002, 190506009),
(1905061019, 'sold', 101002, 190506009),
(1905061020, 'booked', 101002, 190506010),
(1905061021, 'booked', 101002, 190506010),
(1905061022, 'sold', 102003, 190506011),
(1905061023, 'sold', 102003, 190506011),
(1905061024, 'sold', 102003, 190506011),
(1905061025, 'sold', 102003, 190506011),
(1905061026, 'sold', 102001, NULL),
(1905061027, 'sold', 102001, NULL),
(1905061028, 'sold', 102001, NULL),
(1905061029, 'available', 101003, NULL),
(1905061030, 'available', 101003, NULL),
(1905061031, 'available', 101003, NULL),
(1905061032, 'sold', 101004, NULL),
(1905061033, 'sold', 101004, NULL);