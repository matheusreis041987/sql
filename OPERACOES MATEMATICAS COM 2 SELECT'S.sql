

select ((select (sum(preco) * count(garrafas)) as total_Chardonnay  from tadega where vinho like 'Chardon%') - 
(select (sum(preco) * count (garrafas)) as total_PinotNoir from tadega where vinho like 'pinot%')) as dimunuicao_vinhos;

-- =============================================================================================


select ((select sum(salario) from medico2 where data_adm>='01/01/2022') - 
(select sum(salario) from medico2 where data_adm < '01/01/2022')) as diminuição;

select ((select sum(salario) from medico2 where data_adm>='01/01/2022') + 
(select sum(salario) from medico2 where data_adm < '01/01/2022')) as soma;

select ((select sum(salario) from medico2 where data_adm>='01/01/2022') * 
(select sum(salario) from medico2 where data_adm < '01/01/2022')) as multiplicacao;

select ((select sum(salario) from medico2 where data_adm>='01/01/2022') / 
(select sum(salario) from medico2 where data_adm < '01/01/2022')) as divisão;