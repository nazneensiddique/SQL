declare @n int
declare @m int
select @n=COUNT(*) from Passenger
select @n
go

select * from  Reservation

declare @n1 int
declare @n2 int
select @n1=20
select @n2=30
if @n1> @n2
begin
print 'n1>n2'
end 
else 
print 'n1<n2'
go


declare @n1 int
declare @n2 int
select @n2=10
select @n1=PNR_no from Reservation where PNR_no=@n2
if @n1 = @n2
begin
print 'valid'
end 
else
print 'invalid'
go

create procedure p_cal_tax
as
declare
@flight char(4),
@class char(2),
@fare numeric(4),
@tax numeric(4)

begin
	set @flight='IC01'
	select @fare=fare from Flight_details where Aircraft_code=@flight and Class_code='E'
	set @tax= @fare*5/100
	print @tax
end
go

exec p_cal_tax
select * from Flight_details where Class_code='E' and Aircraft_code='IC01'

--------------------LOOP---------------
	Declare 
	@n int=1
Begin 
	while @n<10
	begin print @n
	set @n= @n+1
	end
print 'end of loop'
end
go
 ---------------------------
	Declare 
	@ctr int=1,
	@n int= 1,
	@name varchar(50)
Begin 
  Select @n=COUNT(*) from Passenger
  while @ctr <= @n
  begin
	Select @name=name from Passenger where Ticket_no= @ctr
				print @name
		set @ctr= @ctr+1
	end
print 'end of loop'
end
go

select * from Passenger


------------cursor------------------------

declare c1 cursor
scroll for 
select * from Passenger
begin
open c1 
fetch first from c1
 while @@FETCH_STATUS=0
 begin
 fetch next from c1
 end
close c1
deallocate c1
end 
go


declare c1 cursor
scroll for 
select * from Passenger
begin
open c1 
fetch first from c1
fetch next from c1
fetch last from c1
fetch prior from c1
fetch absolute 1 from c1
fetch absolute 3 from c1
fetch relative -2 from c1
fetch relative -6 from c1
fetch first from c1
select @@FETCH_STATUS
select @@CURSOR_ROWS
close c1
deallocate c1
end

declare pass_cur cursor scroll
for select pnr_no,name, ticket_no from Passenger
declare @pnr_no int,@name varchar(20), @ticket_no 
int
begin
	open pass_cur
	fetch first from pass_cur into
	@pnr_no, @name, @ticket_no
	while @@fetch_status=0
begin
	print convert(char,@pnr_no)+@name+ ' having a ticket' + convert(char,@ticket_no)
		fetch next from pass_cur into
	@pnr_no,@name,@ticket_no
	if @ticket_no=3
begin
print 'discounted ticket'
end
end 
end
close  pass_cur
deallocate pass_cur
go

declare 
@ac varchar,
@cc varchar ,
@fare int,
@nfare int
declare c1 cursor dynamic  for select aircraft_code, class_code,fare from Flight_details where Class_code ='FC' for update
begin 
open c1
fetch first from c1 into @ac,@cc,@fare
while @@fetch_status=0
begin
if @fare between 4000 and 6999
begin
set @nfare = @fare +@fare*15/100
end
else
if @fare > 7000
begin
set @nfare = @fare +@fare*20/100
end
update Flight_details set Fare= @nfare where CURRENT of c1
fetch next from c1 into @ac, @cc, @fare
end
end
--commit
close c1
deallocate c1

select * from Flight_details where Class_code='fc'


declare
@balance int=10000,
@tranamt int =300000
begin
if @balance < @tranamt
begin 
 raisError('cannot proceeed', 16,1)
-- return @@ErrorCode
--print 'Insufficient'
end
else
begin
print ' success'
end
print 'end of trans'
end 
go


create table e1 (eno int identity(1,1), ename varchar(20), hiredate date default getdate())

alter table e1 add constraint id_pk primary key(eno)

insert into e1 (ename, hiredate) values('abc', DEFAULt)

select * from e1

alter table e1 alter column ename varchar(20)  not null

declare @ename varchar(20)= null, @hire_date date= getdate(), --cannot pass null vale)
@errorcode int,
@eid int =1
 begin
begin try
 insert e1(ename, hiredate) values (@ename, @hire_date)

 select @errorCode =  @@ERROR,
 @eid = @@IDENTITY
 end try
 begin catch
 if @errorcode='515'
 begin
 RaisError (' NOT  proceed  ',16,1)
 end
 end catch
 end


 select * from e1



 insert e1(ename, hiredate) values (null, default)
