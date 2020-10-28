/*create a batch to add a record to reservation table validations before insert record
1- make sure the pnr_no is unique
2- ticket_no  must be unique and must continue with last ticket_no available
3- if a aircarft_code is selected the journey date must match with the journey day of that particular aircarft
give appropriate messages 
if all conditions validated then insert the record to reservation table
*/

select * from Flight_days where Aircraft_code='IC01'

create procedure newquery
as
declare @jd date='2019-05-07', @ac varchar(15)='IC01', @chck int , @ab int
set @ab= DATEPART(dw,@jd)
select @chck= count(*) from Flight_days where Aircraft_code='IC01' and day_code= @ab
if  @chck = 1
begin
print 'Available'
 --Insert into Reservation values(6,'IC01', '2001-05-15', 'FC',1, 'Nariman Point, Mumbai-1',2122122, 'C')
end
else
print 'INVALID'
go

exec newquery

------------------PARAMETER---------------------


create procedure newquery1 (@ac varchar, @jd date)
as
--declare @jd date='2019-05-07', @ac varchar(15)='IC01', @chck int , @ab int
declare @chck int , @ab int
set @ab= DATEPART(dw,@jd)
select @chck= count(*) from Flight_days where Aircraft_code='IC01' and day_code= @ab
if  @chck = 1
begin
print 'VALID'
end
else
print 'INVALID'
go

exec newquery1 'IC01' , '2019-05-09'

--Alter

Alter procedure newquery1 (@ac varchar, @jd date)
with recompile
as
--declare @jd date='2019-05-07', @ac varchar(15)='IC01', @chck int , @ab int
declare @chck int , @ab int
set @ab= DATEPART(dw,@jd)
select @chck= count(*) from Flight_days where Aircraft_code='IC01' and day_code= @ab
if  @chck = 1
begin
print 'VALID'
end
else
print 'INVALID'
go

exec newquery1 'IC01' , '2019-05-09'

select MAX(fare) from Flight_details where Fare <(
select MAX(fare) from Flight_details where Fare< (
select MAX(fare)from Flight_details ))

select fare from Flight_details order by fare

-----Inline

select a.*, destination 
from (select R.pnr_no, p.name, r.Aircraft_code,R.no_of_seats, fare*no_of_seats total_cost from Passenger p inner join Reservation r on p.PNR_no=r.PNR_no inner join Flight_details fd on r.Aircraft_code=fd.Aircraft_code and fd.Class_code=r.Class_code)
a 
inner join Flight on a.Aircraft_code= Flight.Aircraft_code


 ---------- TRIGGER-----------------

 Create trigger dept_ins_trig
	on reservation
after insert
AS
Begin
	   print 'Record inserted'
end
go

Insert into Reservation values(9,'IC01', getdate(), 'FC',4, 'SP, Mumbai',2122122, 'C')

select COUNT(*) reservations into recounter from Reservation

select * from recounter
_________________________
Alter trigger dept_ins_trig
	on reservation
after insert
AS
Begin
	   update recounter set reservations=Reservations +1
end
go
 
0
 Insert into Reservation values(29,'IC01', getdate(), 'FC',4, 'SP, Mumbai',2122122, 'R')


 create Trigger reserv_del_trug
	on reservation
after delete
As
Begin
	update recounter set reservations=reservations-1
end
go

delete from Reservation 
select * from Reservation
select * from recounter 


select  pnr_no, journey_date, journey_date cancel_date into resevertion_history from Reservation where 1=2

select * from resevertion_history
drop trigger reserv_del_trug

create Trigger reserv_del_trig
	on reservation
after delete
As
Begin
declare @p int, @jd date
	update recounter set reservations=reservations-1
	select @p= deleted.pnr_no, @jd=deleted.journey_date from deleted
	insert into resevertion_history values (@p,@jd,GETDATE())
end
go

Alter trigger trig_flight_fare 
on flight_details
after update
as
begin
declare @f int
select @f= INSERTED.fare from INSERTED 
if @f < 1000
begin
@@Raiseerror ('invalid' 16,1)
end
end

update Flight_details set Fare=400 where Aircraft_code='AI03' and Class_code='E'

select * from Flight_details where Aircraft_code='AI03' and Class_code='E'

select * from Passenger

sp_help