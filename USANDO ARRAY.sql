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


https://www.youtube.com/watch?time_continue=36&v=w-yqmxdFtig&embeds_referring_euri=https%3A%2F%2Fwww.google.com%2Fsearch%3Fq%3Dcriando%2Barrya%2Bpostgres%26rlz%3D1C1FCXM_pt-PTBR1009BR1009%26oq%3Dcriando%2Barrya%2Bpostgres%26gs_lcrp%3DEgZjaHJvb&source_ve_path=MTM5MTE3LDI4NjY2&feature=emb_logo