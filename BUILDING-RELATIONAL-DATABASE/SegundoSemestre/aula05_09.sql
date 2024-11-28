/*
 
            ====== AULA 05.09 =======

    TEMA - generated
    
aplicado dentro de uma coluna que fica dentro da tabela - isso permite que seja 
incluido chave primaria automatica - o banco que faz essa automoção

o ideial é que o proprio banco cria o proprio ID - pois não será "refém" de outras
fontes

chave primaria - os valores não se repetem - são valores unicos e obrigatorios

para isso é importante definir a cláusula IDENTITY
 
 */

drop table T_ALUNO CASCADE CONSTRAINTS; -- esse CASCADE CONSTRAINTS -> remove os relacionamentos de PK para FK
-- ela possui relacionamento

create table T_ALUNO(
    id_contato int GENERATED AS IDENTITY PRIMARY KEY,
    nm_aluno varchar (60),
    sx_aluno varchar (2),
    dt_nascimento date,
    cep int, constraint FK_CEP FOREIGN KEY (cep)REFERENCES T_ENDERECO(cep),
    cpf int constraint cpf unique       
);

/*ao nomear a Constraint conforme foi feito acima, permite que caso ocorra
algum erro, irá informar o nome da constraint e ficará mais fácil para ajustar*/

-- Nesse formato o unique está como padrão - qdo for necessário colocar NOT NULL

-- INSERT GENÉRICO
                     -- valor padrão  
 insert into T_ALUNO values(default,'Karen Marques', 
    'F', to_date('05-09-2000', 'dd-mm-yyyy') );
 

-- INSERT NÃO GENÉRICO
insert into T_ALUNO (nm_aluno, sx_aluno) values('Maria Eduarda', 'F');
-- nesse caso, as outras colunas terão o valor null


-- COSULTANDO LINHAS DA TABELA -- de forma genérica
-- o * significa que o select irá apresentar todas as colunas

select * from T_ALUNO;


drop table T_ENDERECO CASCADE CONSTRAINTS;

CREATE TABLE T_ENDERECO(
  cep int,
  logradouro varchar(100) CONSTRAINT nn_log NOT NULL ,
  bairro varchar(100) CONSTRAINT nn_bairro NOT NULL ,
  cidade varchar(100) CONSTRAINT nn_cidade NOT NULL ,
  uf varchar(2),
  CONSTRAINT pk_cep PRIMARY KEY (cep),
  CONSTRAINT ck_uf CHECK(UF='SP' OR UF='RJ' 
  OR UF='PR' OR UF='PE' OR UF='AC' OR UF='MG' OR UF='BA' OR UF='AP')
);



-- sem generetion

insert into T_ENDERECO values(02345321, 'AV. Paulista', 'Centro', 'São Paulo',
'SP');


-- insert com falhas

insert into T_ENDERECO (id_endereço, logradouro, bairro, uf)
    values(02345321, 'AV. Paulista', 'Centro', 'São Paulo','SP');

/*
    O erro UNIQUE CONSTRAINT - ocorre pq a chave primaria foi duplicada
    (ORA-0001)

    O erro ( ORA-02290) CHECK CONSTRAINT - ocorre pq a check esta com valor incorreto 
    -> pq ao definir um padrão, o valor inserido não esta presente

    O erro (ORA-00947) FALHA - acusa pq falta de dados nas colunas

    O erro (ORA-00904) acontece quando o nome da coluna esta incorreto ou é 
    inexistente
    
    O erro (ORA-01400) acontece quando alguma coluna ( CONSTRAINT NOT NULL) não recebeu valor

    O erro (ORA-02291) é relacionada a FK, valor não existente na tabela principal
*/

-- esse comando irá mostrar quais tabels foram criadas no minha user - comando especifico dessa plataforma

select table_name from user_tables


-- Apresenta a estrutura da tabela no terminal
desc T_ALUNO
-- ou --
describe T_ALUNO




/*
 ---- sobre INSERT ----

Manipulação de linhas de dados

é apenas para colunas que irão receber dados

    ---- sobre UPDATE ---
 apenas colunas que serão atualizadas
 
    --- sobre DELET ----
apenas colunas que terão dados apagados

 ===> Para as funções acima, quando elas tem o WHERE são não são genérico 
 (pq estão informando as colunas)
 ==> Quando não informa as colunas as funções serão executadas, em todas as 
 colunas e por ordem de criação
*/