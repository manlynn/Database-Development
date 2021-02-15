SELECT * FROM Venue;
SELECT * FROM Artist;
SELECT * FROM Event;
SELECT * FROM Request;
SELECT * FROM Artist_Request;
SELECT * FROM Booking;
SELECT * FROM Event_Artist;
SELECT * FROM Ticket;

-- Working Hours in this task --
-- Mingyang Wang 4 hours --
-- Hellsten Lin 1 hours --

--1--
SELECT * FROM Ticket WHERE event_id=101003 AND ticket_status='available';

INSERT INTO Booking (booking_number, booking_status, quantity, expiration_date, client_phone) VALUES
(190506014, 'booked', 1, '2019-05-13', NULL);

UPDATE Ticket SET ticket_status='booked', booking_number=190506014
WHERE ticket_number=1905061010;

--2--
UPDATE Booking SET booking_status='cancelled'
WHERE booking_number=190506014;

SELECT * FROM Ticket WHERE booking_number=190506014;

UPDATE Ticket SET ticket_status='available', booking_number=NULL
WHERE ticket_number=1905061010;

--3--
SELECT * FROM Ticket WHERE booking_number=190506010;

UPDATE Booking SET quantity=1
WHERE booking_number=190506010;

UPDATE Ticket SET ticket_status='available', booking_number=NULL
WHERE ticket_number=1905061020;

--4--
SELECT * FROM Ticket
WHERE booking_number=190506012;

UPDATE Booking SET booking_status='sold'
WHERE booking_number=190506012;

UPDATE Ticket SET ticket_status='sold'
WHERE booking_number=190506012;

--5--
DELETE FROM Booking
WHERE expiration_date<SYSDATETIME() AND booking_status='Cancelled';

--6--
UPDATE Event SET isCancelled='Y'
WHERE event_id=101004;

--7--
SELECT * FROM Booking WHERE (booking_status='booked' OR booking_status='cancelled') AND booking_number IN (SELECT booking_number FROM Ticket WHERE event_id=(SELECT event_id FROM Event
WHERE date<SYSDATETIME()));

DELETE FROM Booking
WHERE booking_number=190506016;

--8--
UPDATE Ticket SET ticket_status='refunded'
WHERE event_id=101004 AND ticket_number=1905061033;

--9--
SELECT artist_name, email
FROM Artist
WHERE artist_name='Sia';

--10--
SELECT event_name, date 
FROM Event
WHERE MONTH(date)= 6;

--11--
SELECT event_name,category, date 
FROM Event
WHERE MONTH(date)= 5 AND category='Concert';

--12--
SELECT artist_name, date, description
FROM Artist
JOIN Event_Artist ON Artist.artist_id=Event_Artist.artist_id
JOIN Event ON Event.event_id=Event_Artist.event_id
JOIN Artist_Request ON Artist.artist_id=Artist_Request.artist_id
JOIN Request ON Request.request_id=Artist_Request.request_id
WHERE artist_name='Saara Aalto'
ORDER BY date;

--13--
SELECT COUNT(*) AS 'SOLD TICKETS' 
FROM Artist
JOIN Event_Artist ON Artist.artist_id=Event_Artist.artist_id
JOIN Event ON Event.event_id=Event_Artist.event_id
JOIN Ticket ON Ticket.event_id=Event.event_id
WHERE artist_name='Jorma Uotinen' AND category='dance' AND event_name='Finnish summer' AND date='2019-06-12'  AND ticket_status='sold';

--14--
SELECT COUNT(*) AS 'Tickets available'
FROM Ticket
JOIN Event ON Event.event_id=Ticket.event_id
JOIN Event_Artist On Event_Artist.event_id=Event.event_id
JOIN Artist ON Artist.artist_id=Event_Artist.artist_id
WHERE ticket_status='available' AND category='Concert' AND date='2019-06-04' AND artist_name='ZZ Top';

--15--
SELECT SUM(ticket_price) AS 'Total income this year'
FROM Ticket
JOIN Event ON Ticket.event_id=Event.event_id
WHERE ticket_status='sold' AND YEAR(date)='2019';
