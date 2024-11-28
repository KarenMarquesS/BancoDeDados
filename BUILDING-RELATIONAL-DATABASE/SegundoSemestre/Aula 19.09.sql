DROP TABLE T_ALUNO CASCADE CONSTRAINTS; 
-- ELA POSSUI RELACIONAMENTOS
-- REMOVER OS RELACIONAMENTOS DE PK PARA FK

CREATE TABLE T_ALUNO(
    id_aluno int GENERATED AS IDENTITY CONSTRAINT PK_ALUNO PRIMARY KEY,
    nm_aluno varchar(60), 
    sx_aluno varchar (2),
    dt_nascimento date,
    cep int,
    CONSTRAINT FK_CEP FOREIGN KEY (cep) REFERENCES T_ENDERECO(cep),
    cpf int CONSTRAINT uq_cpf unique
);

-- GENÉRICO
    INSERT INTO T_ALUNO VALUES(DEFAULT, 
     'Francisco Douglas','M', TO_DATE('05-09-2000','DD-MM-YYYY'));

-- NÃO GENÉRICO (OU ESPECIFICO)

INSERT INTO T_ALUNO (nm_aluno, sx_aluno) VALUES ('Maria Eduarda','F');


-- CONSULTANDO LINHAS NA TABELA -- GENÉRICA -- O * TODAS AS COLUNAS

SELECT * FROM T_ALUNO;


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

-- insert com sucesso
INSERT INTO T_ENDERECO 
  VALUES(0131015, 'Av. Paulista', 'Centro', 'São Paulo', 'SP');
  
 
 select * from t_endereco; 
 
 -- insert ocm falhas

 INSERT INTO T_ENDERECO 
  VALUES(0131015, 'Av. Paulista', 'Centro', 'São Paulo', 'SP');
-- FALHA: UNIQUE CONSTRAINT - ORA-0001 A PK ESTA DUPLICADA


INSERT INTO T_ENDERECO 
  VALUES(0131016, 'Av. Paulista', 'Centro', 'São Paulo', 'AM');
-- FALHA: CHECK CONSTRAINT - ORA-02290 A CHECK ESTA COM VALOR INCORRETO
 
 INSERT INTO T_ENDERECO 
  VALUES(0131016, 'Av. Paulista', 'Centro', 'São Paulo');

-- FALHA: 00947 POR FALTAR DADOS NAS COLUNAS 

INSERT INTO T_ENDERECO (id_endereco, logradouro, bairro, uf)
  VALUES(0131015, 'Av. Paulista', 'Centro', 'SP');

-- FALHA: ORA-00904 é relacionado ao nome da coluna que está errado ou é inexistente

INSERT INTO T_ENDERECO (cep, logradouro, bairro, uf)
  VALUES(0131015, 'Av. Paulista', 'Centro', 'SP');
  
-- FALHA: ORA-01400 é relacionada a constraint not null, coluna obrigatória 

-- insert com sucesso
INSERT INTO T_ALUNO (nm_aluno, sx_aluno, cep, cpf) 
    VALUES ('Maria Eduarda','F',0131015, 222333);
    
select * from t_aluno;

-- insert com falhas
INSERT INTO T_ALUNO (nm_aluno, sx_aluno, cep, cpf) 
    VALUES ('Maria Eduarda','F',0131015, 222333);
    
-- FALHA: RELACIONADA A UNIQUE, não pode ter valores duplicados

INSERT INTO T_ALUNO (nm_aluno, sx_aluno, cep, cpf) 
    VALUES ('Maria Eduarda','F',0131016, 222334);
    
-- FALHA: ORA-02291 é relacionada a FK, valor não existe na tabela principal
-- ISSO É RELACIONADO A INTEGRIDADE REFERENCIAL


-- EXIBIR ESTRUTURAS

-- listar todas as tabelas no seu usuario
SELECT table_name from user_tables;

--listar todas as constraints de uma determinada tabela
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name='T_ALUNO';

-- EXIBIR A ESTRUTURA DA TABELA

DESC T_ALUNO;
-- OU
DESCRIBE T_ALUNO;




