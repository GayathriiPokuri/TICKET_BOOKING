create database TBS
use tbs

--VENUE
CREATE TABLE VENUE(
VENUE_ID INT identity PRIMARY KEY,
VENUE_NAME VARCHAR (80),
ADDRESS VARCHAR (200))

--customer
CREATE TABLE CUSTOMER(
CUSTOMER_ID INT identity PRIMARY KEY,
CUSTOMER_NAME VARCHAR(80), 
EMAIL VARCHAR(80),
PHONE_NUMBER INT,
BOOKING_ID INT)
--DROP BOOKING_ID
alter table CUSTOMER
drop column BOOKING_ID

ALTER TABLE CUSTOMER
DROP CONSTRAINT BOOKING_ID;

--booking
CREATE TABLE BOOKING (
BOOKING_ID INT identity PRIMARY KEY,
NUM_TICKETS INT,
TOTAL_COST INT,
BOOKING_DATE DATE,
CUSTOMER_ID INT,
EVENT_ID INT)

--event
CREATE TABLE EVENT(
EVENT_ID INT identity PRIMARY KEY,
EVENT_NAME VARCHAR (90),
EVENT_DATE DATE,
EVENT_TIME TIME,
VENUE_ID INT, 
TOTAL_SEATS INT,
AVAILABLE_SEATS INT,
TICKET_PRICE DECIMAL,
EVENT_TYPE VARCHAR(30),
BOOKING_ID  INT )

--fkey booking
ALTER TABLE BOOKING
ADD CONSTRAINT FK_BOOKING_CUSTOMER
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID)
ALTER TABLE BOOKING
ADD CONSTRAINT FK_BOOKING_EVENT
FOREIGN KEY (EVENT_ID) REFERENCES EVENT(EVENT_ID)
--DROP
alter table BOOKING
drop column EVENT_ID 
--ADD
ALTER TABLE BOOKING
ADD EVENT_ID INT 


SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'EVENT' AND CONSTRAINT_TYPE = 'FOREIGN KEY';

ALTER TABLE EVENT
DROP CONSTRAINT FK_EVENT_BOOKING;
ALTER TABLE CUSTOMER
DROP COLUMN BOOKING_ID

SELECT*FROM CUSTOMER

--fkey adding in customer
ALTER TABLE CUSTOMER
ADD CONSTRAINT FK_CUSTOMER_BOOKING
FOREIGN KEY (BOOKING_ID) REFERENCES BOOKING(BOOKING_ID)


--fkey adding in event table
ALTER TABLE EVENT
add CONSTRAINT FK_EVENT_VENUE
FOREIGN KEY (VENUE_ID) REFERENCES VENUE(VENUE_ID)
ALTER TABLE EVENT
ADD CONSTRAINT FK_EVENT_BOOKING
FOREIGN KEY (BOOKING_ID) REFERENCES BOOKING(BOOKING_ID)
--1 insert 10 records in each table
-- inserting record in venue
insert into venue values('PVR-GROUND','GUNTUR'),
                      ('TREND-SET','VIJAYAWADA'),
                          ( 'STT','ONGOLE'),
                       ('YJ-JUNCTION','GUDIVADA'),
                       ('PVP-MALL','CHINAGANJUM'),
                       ( 'BENZ-CIRCLE','KONDAPI'),
                       ('MG-MALL','VIZAG'),
                       ('RAJIV GANDHI-GROUND','ARAKU'),
                       ('CBN-OFFICE','KADAPA'),
					   ('BK ROAD','HYD')

					   UPDATE EVENT


SET Event_Type = 'CONCERT'
WHERE Event_Type ='CONSERT';

					   
select*from venue
--insert records in event
INSERT INTO EVENT VALUES ('COCHALA','2024-04-13','20:00:00',1,800,350,3500,'CONSERT',1)
insert into event values ('SPRING-FEST','2024-08-23','16:30:00',2,900,350,6000,'CONCERT',2)
INSERT INTO EVENT VALUES('NEW YEAR-SHOW','2024-12-31','19:00:00',3,1000,50,5000,'CONCERT',3)
INSERT INTO EVENT VALUES('PONGAL 2K25','2025-01-18','16:00:00',4,500,10,2000,'CONCERT',7)
INSERT INTO EVENT VALUES('RANG-RANTNAM','2024-10-03','20:00:00',5,2000,1500,9000,'SPORTS',8)
INSERT INTO EVENT VALUES('DEVARA','2024-07-15','11:30:00',6,750,650,1000,'MOVIE',9)
INSERT INTO EVENT VALUES('PUSHPA','2024-04-01','10:00:00',7,800,200,500,'MOVIE',10)
INSERT INTO EVENT VALUES('YUVA','2024-11-26','10:00:00',8,2000,950,1000,'SPORTS',12)
INSERT INTO EVENT VALUES('HIT','2024-01-14','16:30:00',9,3500,250,3000,'CONCERT',14)
INSERT INTO EVENT VALUES('CULT-FIT','2024-12-05','17:30:00',10,1000,550,2500,'SPORTS',15)
--insert record in customer
INSERT INTO CUSTOMER VALUES('Ram','xyz@gmail.com',2345,1),
							('Darshini','darshi@gmail.com',7685,2)						
INSERT INTO CUSTOMER VALUES('GOBI','GOBS@gmail.com',6734,3)
INSERT INTO CUSTOMER VALUES('BABU','BABU@gmail.com',9676,7)
INSERT INTO CUSTOMER VALUES('BHAVI','BHAVI@gmail.com',6302,8)
INSERT INTO CUSTOMER VALUES('NAVYA','NAVYA@gmail.com',7672,9)
INSERT INTO CUSTOMER VALUES('ASHOK','ASHUU@gmail.com',7207,10)
INSERT INTO CUSTOMER VALUES('VARNA','VARNA@gmail.com',7560,12)
INSERT INTO CUSTOMER VALUES('SRI','SRI@gmail.com',4216,14)
-- insert record in booking
INSERT INTO BOOKING VALUES (200,5000,'2024-11-03',1,1),
						   (1000,9000,'2024-01-14',2,2)
						   (500,7500,'2024-02-23',3,3)
INSERT INTO BOOKING VALUES(600,5000,'2024-10-19',1,1)
INSERT INTO BOOKING VALUES(800,6000,'2024-12-23',2,2)
INSERT INTO BOOKING VALUES(1000,6400,'2024-02-13',3,3)
INSERT INTO BOOKING VALUES(750,5500,'2024-11-23',4,6)
INSERT INTO BOOKING VALUES(3000,7000,'2024-06-09',5,7)
INSERT INTO BOOKING VALUES(400,3000,'2024-08-10',6,8)
INSERT INTO BOOKING VALUES(3000,7000,'2024-06-09',7,9)

						drop database CAKE
						SELECT*FROM 

--2.Write a SQL query to list all Events
select*from event
SELECT event_name, event_date, event_time FROM Event;

--3.Write a SQL query to select events with available tickets
SELECT  available_seats 
FROM Event
WHERE available_seats > 0;

--4.Write a SQL query to select events name partial match with ‘cup’
SELECT event_name
FROM Event
WHERE event_name LIKE '%cup%';

--5.Write a SQL query to select events with ticket price range is between 1000 to 2500.
SELECT  ticket_price
FROM Event
WHERE ticket_price BETWEEN 1000 AND 2500;

--6.Write a SQL query to retrieve events with dates falling within a specific range.
SELECT event_date
FROM Event
WHERE event_date BETWEEN '2024-01-01' AND '2024-12-31';

--7.Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.
SELECT available_seats
FROM Event
WHERE available_seats > 0 AND  event_name LIKE '%Concert%';

--8.Write a SQL query to retrieve users in batches of 5, starting from the 6th user.
SELECT *FROM CUSTOMER
ORDER BY customer_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

--9.Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.
SELECT num_tickets
FROM BOOKING
WHERE num_tickets > 4;

--10.Write a SQL query to retrieve customer information whose phone number end with ‘000’
SELECT *FROM CUSTOMER
WHERE phone_number LIKE '%000';

--11.Write a SQL query to retrieve the events in order whose seat capacity more than 15000
select*from event
where total_seats>15000

--12.Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z

select *from event
where not event_name='x''y''z'

--TASK-3

--1. Write a SQL query to List Events and Their Average Ticket Prices.

SELECT EVENT_NAME, AVG(TICKET_PRICE) AS AverageTicketPrice
FROM Event
GROUP BY EVENT_NAME;

--2. Write a SQL query to Calculate the Total Revenue Generated by Events.

SELECT SUM(TICKET_PRICE) AS [TOTAL_Revenue]
FROM EVENT

--3. Write a SQL query to find the event with the highest ticket sales.

 SELECT top 1 TICKET_PRICE, 
SUM(TICKET_PRICE) AS TOTAL_SALES
FROM Event
ORDER BY TOTAL_SALES DESC 
SELECT*FROM EVENT

--4. Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event.   

SELECT*FROM BOOKING

SELECT EVENT_NAME, (TOTAL_SEATS - AVAILABLE_SEATS) AS TicketsSold
FROM Event;

--5. Write a SQL query to Find Events with No Ticket Sales.

SELECT EVENT_NAME
FROM EVENT
WHERE TOTAL_SEATS = AVAILABLE_SEATS;

--6. Write a SQL query to Find the User Who Has Booked the Most Tickets.

SELECT TOP 1 b.CUSTOMER_ID, c.CUSTOMER_NAME, SUM(b.NUM_TICKETS) AS TOTAL_TICKETS_BOOKED
FROM BOOKING b
JOIN CUSTOMER c ON b.CUSTOMER_ID = c.CUSTOMER_ID
GROUP BY b.CUSTOMER_ID, c.CUSTOMER_NAME
ORDER BY TOTAL_TICKETS_BOOKED DESC


--7. Write a SQL query to List Events and the total number of tickets sold for each month.
	
	SELECT 
    e.EVENT_NAME,
    YEAR(b.BOOKING_DATE) AS year,
    MONTH(b.BOOKING_DATE) AS month,
    SUM(b.NUM_TICKETS) AS TOTAL_TICKETS_SOLD
FROM BOOKING b
JOIN Event e ON b.EVENT_ID = e.EVENT_ID
GROUP BY e.EVENT_NAME, YEAR(b.BOOKING_DATE), MONTH(b.BOOKING_DATE)
ORDER BY year DESC, month DESC, e.EVENT_NAME;

--8. Write a SQL query to calculate the average Ticket Price for Events in Each Venue.

SELECT EVENT_TYPE, 
       VENUE_ID,
       AVG(TICKET_PRICE) AS "AVERAGE TicketPrice"
FROM EVENT
GROUP BY VENUE_ID, EVENT_TYPE                                   SELECT*FROM EVENT
ORDER BY VENUE_ID, EVENT_TYPE;


--9. Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type.

SELECT EVENT_TYPE, 
       COUNT(*) AS TotalTicketsSold
FROM EVENT
GROUP BY EVENT_TYPE
ORDER BY TotalTicketsSold;


--10. Write a SQL query to calculate the total Revenue Generated by Events in Each Year.

SELECT 
    YEAR(b.BOOKING_DATE) AS year,
    SUM(b.NUM_TICKETS * e.TICKET_PRICE) AS TOTAL_REVENUE
FROM BOOKING b
JOIN Event e ON b.EVENT_ID = e.EVENT_ID
GROUP BY YEAR(b.BOOKING_DATE)
ORDER BY year DESC;

--11. Write a SQL query to list users who have booked tickets for multiple events.

SELECT*FROM EVENT
SELECT*FROM BOOKING
SELECT*FROM CUSTOMER
SELECT 
    c.CUSTOMER_NAME, 
 
    COUNT(DISTINCT b.EVENT_ID) AS EVENTS_BOOKED
FROM BOOKING b
JOIN CUSTOMER c ON b.CUSTOMER_ID = c.CUSTOMER_ID
GROUP BY c.CUSTOMER_NAME
HAVING COUNT(DISTINCT b.EVENT_ID) > 1;


--12. Write a SQL query to calculate the Total Revenue Generated by Events for Each User.

SELECT 
    c.CUSTOMER_NAME,
    c.EMAIL,
    SUM(b.NUM_TICKETS * e.TICKET_PRICE) AS TOTAL_REVENUE
FROM BOOKING b
JOIN CUSTOMER c ON b.CUSTOMER_ID = c.CUSTOMER_ID
JOIN Event e ON b.EVENT_ID = e.EVENT_ID
GROUP BY c.CUSTOMER_NAME, c.EMAIL
ORDER BY TOTAL_REVENUE DESC;

--13. Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue.

SELECT*FROM CUSTOMER

SELECT*FROM VENUE
SELECT e.EVENT_TYPE, avg(e.TICKET_PRICE) as AVG_TICKET_PRICE                    --D
FROM EVENT e
WHERE e.EVENT_ID = e.VENUE_ID
GROUP BY e.EVENT_TYPE
ORDER BY e.EVENT_TYPE

--14. Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 Days


SELECT*FROM BOOKING
SELECT*FROM CUSTOMER

SELECT c.CUSTOMER_NAME,sum(b.NUM_TICKETS)as TOTAL_TICKETS
FROM BOOKING as b
join CUSTOMER as c 
ON b.CUSTOMER_ID=c.CUSTOMER_ID
GROUP BY c.CUSTOMER_NAME
ORDER BY ( DATEDIFF(day,'2024-10-22',GETDATE()))

--task 4
--1.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery
SELECT 
    v.VENUE_NAME,
    (SELECT AVG(e.TICKET_PRICE)
     FROM Event e
     WHERE e.VENUE_ID = v.VENUE_ID) AS AVERAGE_PRICE_TICKET
FROM VENUE v;


--2.Find Events with More Than 50% of Tickets Sold using subquery
SELECT 
    EVENT_NAME, 
    TOTAL_SEATS, 
    AVAILABLE_SEATS
FROM EVENT
WHERE (TOTAL_SEATS - 
       (SELECT AVAILABLE_SEATS FROM Event AS e2 WHERE e2.EVENT_ID = Event.EVENT_ID)
      ) > (TOTAL_SEATS * 0.5);

--3.Calculate the Total Number of Tickets Sold for Each Event
SELECT E.EVENT_NAME,

(SELECT SUM(NUM_TICKETS)
FROM BOOKING AS B
WHERE E.EVENT_ID=B.EVENT_ID)AS TOTAL_TICKETS_SOLD
FROM EVENT AS E


--4.Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery
SELECT 
    c.CUSTOMER_NAME, 
    c.EMAIL
FROM CUSTOMER c
WHERE NOT EXISTS (
    SELECT ISNULL(NUM_TICKETS,'NO BOOKING')
    FROM BOOKING b 
    WHERE b.CUSTOMER_ID = c.CUSTOMER_ID
);

--5.List Events with No Ticket Sales Using a NOT IN Subquery
SELECT 
    EVENT_NAME, 
    EVENT_DATE
FROM Event
WHERE EVENT_ID NOT IN (
    SELECT DISTINCT EVENT_ID
    FROM BOOKING
);

--6.Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause.
SELECT E.event_type,(SELECT SUM(num_tickets)
FROM Booking B WHERE B.EVENT_ID=E.event_id)AS total_tickets_sold
FROM Event E; 



--7.Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause.
select *from event
select EVENT_ID,TICKET_PRICE
from EVENT
where TICKET_PRICE >(select avg(TICKET_PRICE)from event)

--8.Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery
select*from CUSTOMER
select*from BOOKING
select*from VENUE
SELECT 
    c.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    (SELECT SUM(TOTAL_COST)
     FROM BOOKING
     WHERE c.CUSTOMER_ID = c.CUSTOMER_ID) AS TOTAL_REVENUE
FROM CUSTOMER c;

--9.List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause.
SELECT C.customer_name FROM Customer C WHERE EXISTS (SELECT 1 FROM Booking B
JOIN Event E ON B.event_id = E.event_id
WHERE B.customer_id = C.customer_id
AND E.venue_id = 1); 

--10.Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY

SELECT 
    e.EVENT_TYPE,
    SUM(t.TOTAL_TICKETS) AS TOTAL_SOLD_TICKETS
FROM (
    SELECT 
        EVENT_ID, 
        SUM(NUM_TICKETS) AS TOTAL_TICKETS
    FROM BOOKING
    GROUP BY EVENT_ID
) AS t
JOIN Event e ON t.EVENT_ID = e.EVENT_ID
GROUP BY e.EVENT_TYPE;

--11.Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT

SELECT  c.customer_name,
    DATEPART(YEAR, b.booking_date) AS booking_year,
    DATEPART(MONTH, b.booking_date) AS booking_month,
    SUM(b.num_tickets) AS total_tickets from Booking as b,Customer as c

WHERE 
    c.customer_id IN (
        SELECT b.customer_id
        FROM Booking AS b
        WHERE DATEPART(MONTH, b.booking_date) IS NOT NULL
    )
GROUP BY 
    c.customer_name, DATEPART(YEAR, b.booking_date), DATEPART(MONTH, b.booking_date)
ORDER BY 
    booking_year, booking_month;




--12.Calculate the Average Ticket Price for Events in Each Venue Using a Subquery

SELECT EVENT_NAME,(SELECT AVG(TICKET_PRICE)
FROM EVENT
WHERE EVENT.EVENT_ID=EVENT.VENUE_ID)AS AVG_TICKET_PRICE
FROM EVENT

