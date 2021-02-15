# Database Design and development for a Tiecketing system

## Introduction

The database design is based on the assumption that customers can buy the tickets both directly from Kuru Library and purchase the tickets after booking online.  The requirement meet will be illustrate as follow:
- Entity Venue was created and attribute capacity was included to control the overbooking. This will be verified by program calculating and com-paring the number of left available tickets and the number of bookings. Entity Venue is also designed for future expansion. Attribute ticket_price was included to indicate the each price for each event.

- Entity Artist and Request were designed to store the performers infor-mation and catering/refreshments request perspectively. The relational schemas Event_Artist and Artist_Request were created to indidate the multiple relationship among events, artists and their catering requests.

- The multiplicity constraints among Event, Ticket and Booking restrict that a booking can only contatin tickets to one event.
