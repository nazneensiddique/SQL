select * from Passenger
select * from Reservation
select * from Flight
select * from Flight_details


/*select distinct Aircraft_code from flight_details where fare>(select avg(fare) from flight_details where Aircraft_code='IC01') and Aircraft_code!='IC01'
select * from flight_details where fare >any (select fare from flight_details where Aircraft_code='9W02') and Aircraft_code='9W02'
select * from flight_details where fare >all (select fare from flight_details where Aircraft_code='9W02')
select * from Passenger where exists( select 'x' from Reservation where Aircraft_code='IC01')
select p.* from Passenger p where exists( select 'x' from Reservation r where r.Aircraft_code='IC01' and p.PNR_no=r.PNR_no)*/

/*create database empdb6
create table dept( dno int, dname varchar(20),loctation varchar(20)
select * into passenger1 from Passenger
select * into passenger2 from passenger where 1=2
select * from passenger1
select * from passenger2*/


--update passenger1 Set Age=50 where name='Allen Smith'
--update passenger1 set [meal pref] = (select [Meal pref] from Passenger1 where ticket_no=2) where ticket_no=3 
Slect PNR_No from Passenger1 where PNR_no in( select PNR_no from Reservation r where p.PNR_no=r.PNR_no)
delete from Passenger where PNR_no in( Select PNR_no from Reservation where Aircraft_code in(select Aircraft_code from Flight where Destination='che'))
select * from Passenger