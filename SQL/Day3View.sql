Select @@TRANCOUNT /*
begin tran 
select * from Passenger1
truncate table passenger1*/



-------VIEW-----------------
create view passenger_vw
as
select p.PNR_no,p.Ticket_no,r.Journey_date from Passenger p inner join Reservation r on p.PNR_no=r.PNR_no

sp_help passenger_vw
select * from passenger_vw


Alter  view pass_vw
as
select * from Passenger where PNR_no=3 with check option
select * from pass_vw

update pass_vw set [PP No]= 23456 where Ticket_no=6
select * from Passenger

update pass_vw set [PP No]=6584644 where Ticket_no=8
delete from pass_vw where Ticket_no=8

insert into pass_vw values(3,10,'sefd',63,'Male',54925,'V')

Create view Reservation_vw
as
select * from Reservation

select * from Passenger order by PNR_no
select * from passenger where PNR_no in(1,3)

create clustered index p_tno_idx_ on passenger(ticket_no)
create index p_pnrno_idx on passenger(PNR_no)

create synonym passenger_detail for dbo.passenger
select * from dbo.Passenger
select * from passenger_detail

 from Passenger