-- todos os objetos/tabelas - precisam ter um ';' no final 

CREAT TABLE T_ALUNO(
  ra int primary key,
  nome varchar(60) not null,
  cpf number(11) unique not null,
  sexo varchar(1) CHECK(sexo='f' OR sexo='m' OR sexo='i'),
  dt_nascimento date,
  num_endereco int,
  complemento varchar(100),
  fk_cep int references T_ENDERECO(cep)
);

desc t_aluno;

create TABLE T_CONTATO(
    id_contato int primary key,
    grau_parentesco varchar(20) not null,
    telCel_contato varchar (12) not null,
    telFixo_contato varchar(12),
    email varchar (255),
    fk_id_aluno int REFERENCES T_ALUNO(id_aluno)
  
);
desc t_contato;

-- ADICIONAR COLUNA NA TABELA CONTATO
alter table T_CONTATO
    add emergencia varchar(20);
    
-- RENOMEAR COLUNAS
alter table T_CONTATO
    rename column grau_parentesco to parentesco;

-- adc uma constraint a uma coluna existente
alter table T_CONTATO
    add constraint UK_TEL unique(tel_contato);

-- listando constraints em uma determinada tabela
select * from user_constraints where table_name='T_CONTATO';


-- remover coluna
alter table T_CONTATO
    drop column email;


-- renomear tabela
rename T_ALUNO to T_ESTUDANTE;


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


-- REMOVER TABELAS
DROP TABLE T_ALUNO;
DROP TABLE T_ENDEREÇO;
drop table T_CONTATO;


-- COMANDO PARA LISTAR TODAS AS TABELAS
select * from user_tables;


-- visualizar uma tabela
desc t_aluno;




/* 
 ++++ ALTERAR E REMOVER OBJETOS - AULA 29.08 ++++

    Comando ALTER
        adc alter table NOME DA TABELA
            add nome_coluna tipo aceitacao;

        adc nova coluna
            alter table nome da tabela
            add constraint nome_constraint

Ordem de remoção 1° as tabelas fracas e depois as fortes
    INICIO
        tabelas com mais de uma PK e FK
    MEIO
        tabelas com PK e FK
    FIM
        tabelas com PK
        
Ordem de criação 1° as tableas fortes e depois as tabelas fraca

    INICIO
        tabelas com PK
    MEIO
        tabelas com PK e FK
    FIM
        tabelas com mais de uma PK e FK
        
tabela forte: é aquela que PERMITE o relacionamento e normalmente tem uma chave primaria
tabela fraca: é aquela que RECEBE o realcionamento e normalmente tem umaou mais FKs
*/









/*    
    AULA 22.08
    
    id_aluno int primary key,
    nm_aluno varchar (60) not null,
    dt_nascimento date not null,
    cpf varchar(15),
    rg varchar(15),
    sexo char(1) check(sexo = 'f' or sexo = 'm' or sexo = 'i'), -- regra de condição lógica
    CONSTRAINT uk_rg_cpf UNIQUE(cpf, rg) -- chave unica COMPOSTA  
);*/

-- dentro de uma tabela, não pode ter colunas com nomes repetidos
/*
    
        AULA 22.08
        
    - Banco de Dados tem:
    dentro do banco de dados NÃO pode ter Usuário Repetidos
        -   Usuários:
        dentro do Usuário NÃO pode ter Objetos Repetidos
            - tabelas, views, sequences e etc.    
            dentro da Tabela NÃO pode ter Colunas Repetidas (ou duplicados)

*/


/* utilizamos apenas o DROP quando a tabela esta vazia de linhas
 o comando é ->ex.:  DROP TABLE CONTATO;
 Quando a tabela tem linhas usa-se o ALTER para alterar a tabela
 O comando DROP apaga a tabela toda e suas linhas.
 
 Ao apagar, deve-se apagar do último para o primeiro
 
 */
 
 
 