select * from tadega where ano > 1995;
select * from tadega where ano in (1997, 1998, 1996, 1993);
select * from tadega where preco between 50 and 110;
select * from tadega where vinho like 'p%';


select * from paciente where doenca in ('COVID', 'Sarampo', 'Diabetes');

-- ------------------------------------------------------
select * from emp2 where en in (select en from emp);


