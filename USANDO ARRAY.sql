-- usando a função de array para SQL (Postegres)

create table customer (
	CustId integer primary key,
	LastName character varying (25),
	FirstName character varying (20),
	Address character varying (20),
	Phone character varying (15) array[3]
);

select * from customer

insert into customer values 
(1, 'Reis Costa', 'Matheus', 'Rua Barão', '{"21593339", "997560970", "22256587"}');

insert into customer values 
(2, 'Reis Costa', 'Thiago', 'Rua Barão', '{"555225", "55566885", "55225"}');

select phone[2] from customer;