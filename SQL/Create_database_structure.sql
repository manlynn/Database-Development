-- Working Hours in this task --
-- Mingyang Wang 1 hours --
-- Hellsten Lin 1.5 hours --

CREATE TABLE Venue
(
venue_id INTEGER NOT NULL,
venue_name VARCHAR(255) NOT NULL,
capacity INTEGER NOT NULL,
CONSTRAINT PK_Venue PRIMARY KEY (venue_id),
CHECK(capacity IN (70,3500))
)

CREATE TABLE Artist
(
artist_id INTEGER NOT NULL,
artist_name VARCHAR(255) NOT NULL,
region CHAR(3) NOT NULL, 
phone VARCHAR(20),
email VARCHAR(255) NOT NULL,
CONSTRAINT PK_Artist PRIMARY KEY(artist_id),
CHECK (region IN ('FIN', 'FOR'))
)

CREATE TABLE Request
(
request_id INTEGER NOT NULL,
description VARCHAR(255) NOT NULL,
CONSTRAINT PK_Request PRIMARY KEY(request_id)
)

CREATE TABLE Artist_Request
(
artist_id INTEGER NOT NULL,
request_id INTEGER,
CONSTRAINT PK_Artist_Request PRIMARY KEY (artist_id, request_id),
CONSTRAINT FK_Artist_Request_Artist FOREIGN KEY (artist_id) REFERENCES Artist (artist_id)  ON UPDATE CASCADE, 
CONSTRAINT FK_Artist_Request_Request FOREIGN KEY (request_id) REFERENCES Request (request_id)  ON UPDATE CASCADE
)

CREATE TABLE Event
(
event_id INTEGER NOT NULL,
event_name VARCHAR(255) NOT NULL,
category VARCHAR(255) NOT NULL,
ticket_price NUMERIC NOT NULL,
date DATE NOT NULL,
isCancelled CHAR(1) NOT NULL, 
venue_id INTEGER NOT NULL,
CONSTRAINT PK_Event PRIMARY KEY(event_id),
CONSTRAINT FK_Event_Venue FOREIGN KEY(venue_id) REFERENCES Venue (venue_id) ON UPDATE CASCADE,
CHECK(isCancelled IN ('N','Y'))
)

CREATE TABLE Event_Artist
(
artist_id INTEGER NOT NULL,
event_id INTEGER NOT NULL,
CONSTRAINT PK_Event_Artist PRIMARY KEY (artist_id, event_id),
CONSTRAINT FK_Event_Artist_Artist FOREIGN KEY (artist_id) REFERENCES Artist (artist_id) ON UPDATE CASCADE,
CONSTRAINT FK_Event_Artist_Event FOREIGN KEY (event_id) REFERENCES Event (event_id) ON UPDATE CASCADE
)

CREATE Table Booking
(
booking_number INTEGER NOT NULL,
booking_status VARCHAR(10) NOT NULL, 
quantity  INTEGER NOT NULL,
expiration_date DATE NOT NULL,
client_phone VARCHAR(20),
CONSTRAINT PK_Booking PRIMARY KEY(booking_number),
CHECK(booking_status IN ('booked', 'sold', 'cancelled'))
)

CREATE TABLE Ticket 
(
ticket_number INTEGER NOT NULL,
ticket_status VARCHAR(10), 
event_id INTEGER NOT NULL,
booking_number INTEGER,
CONSTRAINT PK_Ticket PRIMARY KEY(ticket_number),
CONSTRAINT FK_Ticket_Event FOREIGN KEY(event_id) REFERENCES Event(event_id) ON UPDATE CASCADE,
CONSTRAINT FK_Ticket_Booking FOREIGN KEY(booking_number) REFERENCES Booking(booking_number) ON UPDATE CASCADE,
CHECK(ticket_status IN ('available','booked', 'sold', 'refunded'))
)
