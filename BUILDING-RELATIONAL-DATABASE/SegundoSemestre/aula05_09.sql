/*
 
            ====== AULA 05.09 =======

    TEMA - generated
    
aplicado dentro de uma coluna que fica dentro da tabela - isso permite que seja 
incluido chave primaria automatica - o banco que faz essa automo��o

o ideial � que o proprio banco cria o proprio ID - pois n�o ser� "ref�m" de outras
fontes

chave primaria - os valores n�o se repetem - s�o valores unicos e obrigatorios

para isso � importante definir a cl�usula IDENTITY
 
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
algum erro, ir� informar o nome da constraint e ficar� mais f�cil para ajustar*/

-- Nesse formato o unique est� como padr�o - qdo for necess�rio colocar NOT NULL

-- INSERT GEN�RICO
                     -- valor padr�o  
 insert into T_ALUNO values(default,'Karen Marques', 
    'F', to_date('05-09-2000', 'dd-mm-yyyy') );
 

-- INSERT N�O GEN�RICO
insert into T_ALUNO (nm_aluno, sx_aluno) values('Maria Eduarda', 'F');
-- nesse caso, as outras colunas ter�o o valor null


-- COSULTANDO LINHAS DA TABELA -- de forma gen�rica
-- o * significa que o select ir� apresentar todas as colunas

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

insert into T_ENDERECO values(02345321, 'AV. Paulista', 'Centro', 'S�o Paulo',
'SP');


-- insert com falhas

insert into T_ENDERECO (id_endere�o, logradouro, bairro, uf)
    values(02345321, 'AV. Paulista', 'Centro', 'S�o Paulo','SP');

/*
    O erro UNIQUE CONSTRAINT - ocorre pq a chave primaria foi duplicada
    (ORA-0001)

    O erro ( ORA-02290) CHECK CONSTRAINT - ocorre pq a check esta com valor incorreto 
    -> pq ao definir um padr�o, o valor inserido n�o esta presente

    O erro (ORA-00947) FALHA - acusa pq falta de dados nas colunas

    O erro (ORA-00904) acontece quando o nome da coluna esta incorreto ou � 
    inexistente
    
    O erro (ORA-01400) acontece quando alguma coluna ( CONSTRAINT NOT NULL) n�o recebeu valor

    O erro (ORA-02291) � relacionada a FK, valor n�o existente na tabela principal
*/

-- esse comando ir� mostrar quais tabels foram criadas no minha user - comando especifico dessa plataforma

select table_name from user_tables


-- Apresenta a estrutura da tabela no terminal
desc T_ALUNO
-- ou --
describe T_ALUNO




/*
 ---- sobre INSERT ----

Manipula��o de linhas de dados

� apenas para colunas que ir�o receber dados

    ---- sobre UPDATE ---
 apenas colunas que ser�o atualizadas
 
    --- sobre DELET ----
apenas colunas que ter�o dados apagados

 ===> Para as fun��es acima, quando elas tem o WHERE s�o n�o s�o gen�rico 
 (pq est�o informando as colunas)
 ==> Quando n�o informa as colunas as fun��es ser�o executadas, em todas as 
 colunas e por ordem de cria��o
*/