begin tran
 delete from Passenger where Ticket_no=8
 rollback