
-- função abs - random - mod

/*FUNÇÃO ABS: Uma função matemática que retorna o valor absoluto (positivo) da expressão numérica especificada. 
( ABS altera valores negativos para valores positivos. ABS não tem efeito em valores zero ou positivos.)*/

select abs(-325)

--FUNÇÃO RANDOM: escolhe um número aleatório entre mais infinito e menos infinito

select random()

-- FUNÇÃO MOD: função que retona o resto da divisão, que é um número entre zero e um -1 do número divisor

select mod(10,4)


-- select feito para escolher um número aleatório entre 0 e 100

select mod(abs(random()),101)

