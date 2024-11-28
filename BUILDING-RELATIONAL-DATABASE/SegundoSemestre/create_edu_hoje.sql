CREATE TABLE Dados_Escolas (
    ano INT,
    sigla_uf VARCHAR(2),
    id_municipio VARCHAR(10),
    id_escola VARCHAR(10),
    rede VARCHAR(10),
    ensino VARCHAR(15),
    anos_escolares VARCHAR(20),
    taxa_aprovacao NUMBER,
    indicador_rendimento DECIMAL(10, 8),
    nota_saeb_matematica NUMBER,
    nota_saeb_lingua_portuguesa NUMBER,
    nota_saeb_media_padronizada NUMBER,
    ideb NUMBER,
    projecao NUMBER
);
drop TABLE Dados_Escolas;
-- CONSULTA SIMPLES
select * from Dados_Escola

/* AULA SOBRE SELECT -> FUCTIONS 

    pagina 31 do PDF  
*/

-- trabalhando com fun��o numerica

--- fun��o ROUND e TRUNC 
------- ambos permitem ajustar a quantidade de casas decimais

select nota_saeb_media_padronizada FROM Dados_Escolas;

SELECT nota_saeb_media_padronizada ;
    round (nota_saeb_media_padronizada, 2)round_nota,
    trunc (nota_saeb_media_padronizada,0)trunc_nota,
    mod(nota_saeb_media_padronizada, 2)mod_nota, -- usada para saber o resto da divis�o
        (nota_saeb_media_padronizada,* (-1) vlr_negativo,
    abs(nota_saeb_media_padronizada,*(-1)vlr_abs, -- encontrando o valor 
    -- absoluto -> removeu o valor negativo
    sqrt(nota_saeb_media_padronizada)raiz_quadrada,
    ceil(nota_saeb_media_padronizada) arr_up -- arredonda os valores para cima
    floor(nota_saeb_media_padronizada) arr_down -- arredonda para baixo
    
        
        
FROM Dados_Escolas;

-- Apelidos -> s�o definidos atraves dos AS (Alias) ou frente do objeto

/*FUN��ES DE TEXTO*/

select 
    rede,
    UPPER(rede) maiuscula,
    LOWER(rede) minuscula,
    INITCAP(rede) primaira linha maiuscula,
from Dados_Escolas;

--=============================================================================

select
    rede, --esta aqui, apenas para compara��o
    concat('escola ', rede), -- concatena texto
    substr(rede, 1, 4), -- recorta texto
    length(rede) -- qtd de caracteres que tem na linha desta coluna
    lpad(rede, 10, '.'), -- a qtd de ocorrncia que ir� acontecer apos a palavra
 /* foram de adicionar texto antes do fim - sem ter palavra repetida*/
    rpad(rede, 10, '.'), -- a mesma coisa, por�m no inicio do texto
    
    ltrim(rede, 't'), 
-- vai remover na coluna o caractere que estiver entre as aspas -no inicio da palavra
    rtrim(rede, 'tal'), -- remove os caracteres no final
    replace(rede, 'to', 'TO') 
    /* substitui os caracteres -> pode ser usados para 
fazer qq substitu��o*/
from Dados_Escolas;

--==============================================================================

select rede from Dados_Escolas;
group by rede;
/*apresenta os valores unicos que tem na coluna, para verificar mais de uma 
coluna, precisa fazer select separado

Agrupar -> � s� por igualdade
*/

--============================================================================
                        /*TIPOS DE FUN��O
                           esta no PDF*/
                           
select * from Dados_Escolas;-- apenas para visualizar a tabela

select min(taxa_aprovacao) from Dados_Escolas;
select max(taxa_aprovacao) from Dados_Escolas;
select avg(taxa_aprovacao) from Dados_Escolas; -- m�dia

select sum(taxa_aprovacao) from Dados_Escolas; --soma dos valores

select stddev(taxa_aprovacao) from Dados_Escolas; --devio padr�o do conjunto


                        --===== USANDO O GROUP BY
        /* permite agrupar os valores*/

/*encontrou a m�dia por grau de ensino*/
select ensino, avg(taxa_aprovacao)media
from Dados_Escolas
group by ensino;

/*encontrou a m�dia por estado*/
select sigla_uf, avg(taxa_aprovacao)media
from Dados_Escolas
group by ensino;

/*encontrou a menor m�dia por estado*/
select sigla_uf, min(taxa_aprovacao)menor
from Dados_Escolas
group by ensino;

/*encontrou a maior m�dia por estado*/
select sigla_uf, max(taxa_aprovacao)maior
from Dados_Escolas
group by ensino;

/*apresenta os valores ordenados da coluna de estados que tiveram a maior nota,
mas n�o s�o os primeiro e sim os ultimos*/
select sigla_uf, max(taxa_aprovacao)maior
from Dados_Escolas
group by ensino;
order by maior asc;

/*apresenta os PRIMEIROS valores ordenados da coluna de estados que
tiveram a maior nota*/
select sigla_uf, max(taxa_aprovacao)maior
from Dados_Escolas
group by ensino;
order by maior desc;


/* o ORDER BY - n�o � "preso" ao group by
** n�o pode esquecer que informar qual a coluna*/

select * from Dados_Escolas;
order by ano asc;

--==============

select * from Dados_Escolas;
order by ano desc;

--===============

select count(sigla_uf)qtd_escolas_estado
from Dados_Escolas
group by ensino;
order by maior desc;

--==========================
-- qtd de escolas em todo o conjunto
select count(sigla_uf)from Dados_Escolas;

--==========

-- quantidade de escolas por ano
select 
    ano, 
    count(ano)qtd_escolas,
    avg(taxa_aprovacao)media
from Dadso_Escolas
group by ano
order by ano desc;

--=======================  
                        /*FILTRANDO OS RESULTADOS*/
                        /*HAVING
    CONDI��O AP�S UMA CONDI��O E ESTA RELACIONADA AO GROUP BY
    usado para fazer as compara��es em conjunto do o group by, em fun��es
    agregadas
    
    Usado em uma p�s condi��o, onde os valores n�o est�o nas linhas
    precisa fazer opera��es para obter o valor
    
    N�o � possivel obter a m�dia, usando WHERE, � necess�rio 
    o group by e o having
    */

select sigla_uf, max(taxa_aprovacao)maior 
from Dados_Escolas
group by ensino
having max(taxa_aprovacao)> 98
order by maior asc;

--=== usando o WHERE
select sigla_uf, max(taxa_aprovacao)maior 
from Dados_Escolas
where taxa_aprovacao>80
group by ensino
having avg(taxa_aprovacao)> 98
order by maior asc;

--==============

select sigla_uf, max(taxa_aprovacao)maior 
from Dados_Escolas
group by ensino
having SIGLA_UF = 'SP'
order by maior asc;




