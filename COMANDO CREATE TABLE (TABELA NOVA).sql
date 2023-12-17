create table maior_sal as select * from emp where sal> 3360;

create table consolidado_doencas as select doenca, count(*) from p group by doenca -- Snapshot