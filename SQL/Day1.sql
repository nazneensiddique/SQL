--Select * from Passenger where PNR_no=1 or [Meal Pref]='V'
--Select * from Passenger where PNR_no=1 and [Meal Pref]='V'
--select * from Passenger where Age >30 and Ticket_no>2
--Select * from Reservation where No_of_seats>3 
--Select * from Reservation where Aircraft_code='IC01'
--Select * from Reservation where PNR_no in(1,3,4) and Status<>'R'
--select * from Reservation where Aircraft_code <> 'IC01' and No_of_seats < 4
--select * from Reservation where not( Aircraft_code = 'IC01' and No_of_seats < 4)
--select * from Reservation where not( Aircraft_code = 'IC01') and No_of_seats < 4
--select * from Reservation where Journey_date > '2001-04-20'
--select * from Reservation where Aircraft_code='IC01' and PNR_no <6 and Class_code in('EX','FC')
--select * from Passenger where Name Like '%smith'
--select name from Passenger where Name like '____smith'
--update Passenger set [Meal Pref]= null where PNR_no=1 and Ticket_no in(1,3)
--select * from Passenger
--Select * from Passenger where [Meal Pref] is not null
--Select * from Passenger where [Meal Pref] is null
--select * from Passenger where age between 23 and 40
--select * from Passenger ORDER BY  PNR_no, age desc
--select name pass_name, age from Passenger where name like '%smith' order by pass_name
--select distinct Aircraft_code from Reservation --(unique key)
--select top 5 age from Passenger



/* Fuction*/
--select len('abchghgygybuhnkhgtydvtguhbd')
--select GETDATE()
--select DATEADD(mm,3,getdate())
--select DATEADD(dd,3,getdate())
--select DATEDIFF(dd,getdate(),'2019-06-05')
--select DATENAME(dw,getdate())
--Select DATEPART(day,getdate())    date 

--select PNR_no, no_of_seats, journey_date, DATENAME(dw, Journey_date) day_of_journey from Reservation where DATENAME(dw,Journey_date)= 'Thursday'

--select ABS(-566)
--select CEILING(56.5)
--select FLOOR(56.7)
--select POWER(2,4)
--select SIGN(-2)
--Select ROUND(43.563,2)
--select SQRT(25)


--select CHARINDEX('@','abctghtgf@zyx.csom@')
--select name, PNR_no,Age, CONCAT(PNR_no, right(Name,3)) + STR(age) as code from Passenger
--select name, PNR_no,Age, CONCAT(PNR_no, right(Name,3), age) as code from Passenger
--Select SUBSTRING('heretech',3,5)
--select REVERSE('nazneen')
--select CHAR(56)
--select REPLICATE('$',10)
--select UPPER(name),REPLICATE(lower(name),len(name)),LEN(name) from Passenger
--select RIGHT('infotech',4)
--select STUFF('computecg',6,5,'wohghgd')

