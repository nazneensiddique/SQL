/*select * from Flight
select * from Flight_days
select * from Flight_details*/

/*Select * from Flight where Destination='del'
select * from Flight where Type='Airbus'
--select * from  Flight_days where DATENAME(dw,day_code)= 'Tuesday'
select *  from  Flight_days where day_code=2
select * from Flight_details where Fare < 4000*/

/*select  * from Flight
--select COUNT(*) from Flight
--select COUNT(*) from Flight where Type='Airbus'
--select COUNT(name), COUNT(Ticket_no), count ([meal pref]) from Passenger  /* without NULL value in the table*/
--select * from Passenger
--select ISNULL ([Meal pref], 'NM') from Passenger
--select [Meal pref] from Passenger
--select COUNT(name), COUNT(Ticket_no), count (isnull([meal pref], 'na')) from Passenger  with NULL value in the table */

/*select SUM(seats) no_seats from Flight_details where Aircraft_code= 'IC01'
select * from Flight_details
select Count(seats) no_seats from Flight_details where Aircraft_code= 'IC01'
select SUM(seats) no_seats, MIN(fare) min_fare, MAX(fare) max_fare,AVG(fare) avg_fare from Flight_details where Aircraft_code= 'IC01'*/

/*GROUPBY 
select Aircraft_code, SUM(seats) no_seats, MIN(fare) min_fare, MAX(fare) max_fare,AVG(fare) avg_fare from Flight_details where Aircraft_code in( 'IC01', 'BA02') group by Aircraft_code
select Aircraft_code, SUM(seats) no_seats from Flight_details group by Aircraft_code
select Aircraft_code, SUM(seats) no_seats from Flight_details group by Aircraft_code having SUM(seats)>500
select Aircraft_code, COUNT(PNR_no) no_Res, SUM(No_of_seats) totalSeats from Reservation group by Aircraft_code
select * from Reservation

select PNR_no, COUNT(pnr_no) from Passenger group by PNR_no
select COUNT(pnr_no) from Passenger where Age>30 
select COUNT(Ticket_no) from Passenger group by PNR_no 
Select Sex,  COUNT(Sex) from Passenger group by Sex
 select Aircraft_code, COUNT(class_code) from Flight_details group by Aircraft_code
 select  PNR_no, Sex, COUNT(*) from Passenger group by PNR_no, Sex order by PNR_no
 select * from Flight_days
 select * from Day_master

 select * from Passenger
 select *  from Reservation
 select * from Passenger cross join Reservation
 select passenger.PNR_no, Ticket_no, Aircraft_code from Passenger inner join Reservation on Passenger.PNR_no= Reservation.PNR_no*/
 --select Aircraft_code, Day_name from  Flight_days inner join Day_master on Flight_days.day_code= Day_master.Day_code where flight_days.day_code=2
 --select Aircraft_code,  Day_name from Flight_days inner join Day_master on Flight_days.day_code= Day_master.Day_code
 --select Name, Ticket_no, [Meal PREF], Meal_name  FROM Passenger inner join Meal on Passenger.[Meal Pref]= Meal.Meal_code
 --select * from Meal
 --select p.PNR_no, p.Ticket_no ,p.Name, Meal_name, r.Aircraft_code from Passenger p inner join Reservation r on p.PNR_no=r.PNR_no inner join Meal on p.[Meal Pref]=Meal_code

 /*select PNR_no, No_of_seats, Reservation.Aircraft_code, Flight_details.Class_code,fare*no_of_seats total from Reservation inner join Flight_details on Reservation.Aircraft_code=Flight_details.Aircraft_code and Reservation.Class_code=Flight_details.Class_code
 select * from Flight_details
 select *  from Flight*/

 /*select * from Flight where Category='I'
 select * from Reservation*/
-- select * from Reservation inner join Flight on Flight.Aircraft_code=Reservation.Aircraft_code  where Category='I'
 --select * from Reservation inner join Flight on Flight.Aircraft_code=Reservation.Aircraft_code where Destination='Che'
 --select No_of_seats*Fare from Reservation inner join flight_details on Reservation.Aircraft_code= Flight_details.Aircraft_code and Reservation.Class_code=Flight_details.Class_code inner join Flight on Flight.Aircraft_code= Reservation.Aircraft_code   where Journey_hrs>10
 --select r.No_of_seats*f.Fare from Reservation r inner join Flight_details f on r.Aircraft_code = f.Aircraft_code and r.Class_code= f.Class_code inner join Flight f1 on r.Aircraft_code = f1.Aircraft_code where Journey_hrs>'10'
 --select * from  Passenger inner join Meal on Meal_code= [Meal Pref] 
 /*select Passenger.*, Meal_code from Passenger left outer join  Meal on  [Meal Pref]=Meal_code
 select Passenger.*, Meal_code from Passenger right outer join  Meal on  [Meal Pref]=Meal_code
 select Passenger.*, Meal_code from Passenger full outer join  Meal on  [Meal Pref]=Meal_code

 select * from Passenger
 select * from Flight
 select * from Reservation

 --select PNR_no, source,Flight.Aircraft_code, Reservation.Aircraft_code, destination from Flight left outer join Reservation on Flight.Aircraft_code= Reservation.Aircraft_code
select * from Passenger 
select p1.name ,p1.age, p2.name,p2.age from passenger p1 inner join passenger p2 on p1.age> p2.age
where p2.name='Pam smith' 
select f1.aircraft_code,f1.Destination, f2.Aircraft_code, f2.Destination from Flight f1 inner join Flight f2 on f1.Destination=f2.Destination WHERE f2.Aircraft_code='IC01'
and f1.Aircraft_code<>'IC01'
select * from Passenger, Reservation where Reservation.PNR_no=Passenger.PNR_no*/

--SUBQUERY
select * from Reservation where Aircraft_code in(select aircraft_code from Flight_details group by Aircraft_code having COUNT(*) > 2)
select * from Reservation where Aircraft_code in(select Aircraft_code from Flight where Destination='che')
Select * from  Passenger where [Meal Pref] in (select [Meal Pref] from Passenger where Ticket_no=4)
select * from Reservation where No_of_seats>3
select * from Reservation where Aircraft_Code in(select Aircraft_code from Flight where Category='I') and No_of_seats>3
select * from Reservation
Select * from Passenger
select * from Flight
select Journey_hrs from Flight where Aircraft_code in(select Aircraft_code from Flight_days where day_code= 2)
--select * from Reservation where Aircraft_code in(select Journey_hrs from Flight where Aircraft_code in(select Aircraft_code from Flight_days where day_code= 2))
