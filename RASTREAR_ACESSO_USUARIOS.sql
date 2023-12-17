-- comando para rastrear o acesso de usuários

select * from "Tadega".usagelog


insert into "Tadega".usagelog values
('Usuário ' || current_user || ', com ID ' || session_user || ',  ativo em: ' || current_timestamp);

