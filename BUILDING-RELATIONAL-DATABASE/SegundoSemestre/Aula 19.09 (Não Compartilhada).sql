--- VERIFICAR ONDE TEM ERRO 
-- NO INICIO ESTAVA RODANDO

select * from T_ENDERECO;

select * from T_ALUNO;


/* Esse é um insert GENERICO --> QUE PREENCHE TODAS AS COLUNAS DE UMA VEZ - 
    INSERT PROCEDURAL
    A REGRA É QUE - É OBRIGATÓRIO MENCIONAR AS COLUNAS NOT NULL E PK
    EMBORA A COLUNA QUE É PK - QUANDO HÁ GENERATED
*/
insert into T_ENDERECO values (06343000, 'João fasoli', 'jd. marilu',
'Carapicuiba', 'SP')

 INSERT into T_ENDERECO values (06730000, 'Opala', 'Casablanca',
'VGP', 'SP');

-- INSERT ESPECIFICO -> É QUANDO É ESPECIFICADO O NOME DAS COLUNAS

insert into T_ALUNO(nm_aluno, sx_aluno, cep, cpf)
VALUES (0345600, 'AV. BOM ACHADO', 'ACHADINHO', 'SÃO PAULO');

-- ATUALIZAR LINHAS NA TABELA
UPDATE T_ALUNO SET fk_cep = 0345600 WHERE RA= 1;

/* UPDATE NÃO PROCEDURAL (PARA N LINHAS)
    NÃO HÁ WHERE
    WHERE É UMA RESTRIÇÃO DE ATUALIZAÇAO
    QUANDO NAO HÁ O WHERE, ESSA RESTRIÇÃO NÃO EXISTE
    UPDATE T_ALUNO SET nm_aluno='JOSÉ';
*/

-- ATUALIZOU TODAS AS LINHAS
-- POR QUE DEPENDENDO DA CONDIÇÃO LÓGICA, PODE SER FEITO UMA ATUALIZAÇÃO EM MASSA
UPDATE T_ALUNO SET nm_aluno='LUCAS' WHERE RA>=1;


-- UPDATE ESPECIFICO PARA MAIS DE U COLUNA
-- SEPARAR COLUNAS POR VIRGULA APÓS O SET
UPDATE T_ALUNO SET nm_aluno='FRANCISCO', sx_aluno='M', 
    dt_nascimento=to_date('19-09-2024', 'DD-MM-YYYY') WHERE id_aluno=2;
    
-- o UPDATE as vezes causam efeitos irreversíveis.


--========================================================================

/* MÉTODO DELETE
  tbm tem o procedural e não procedural
 ele é especifico por que a clásua where que informa o id da linha
 que sofrerá a ação */

delete from T_ALUNO where id_aluno =2; 


/*
 Dessa forma o delete remove todas as linhas da tabela
 
 O DELETE não apaga nada, caso a tabela "pai" tiver algum dado - só apaga tudo, 
 se a tabela relacionada estiver vazia
 
 Só podemos remover linhas que não estao relacionadas com outras tabelas, caso
 co contrário, haverá o ERRO 2292 sobre a fk
 
*/
delete from T_ALUNO;


/*
    ==== DTL -> data transaction language ====
    commit: confirmar transação
    rollback: desfazer a transação
    
    É utilizada em conjunto com a DML (INSERT, UPDATE E DELETE)
    
    Quando devo usar commmit e rollback?????
    
    commit; 
    -> apenas confirma o código - ele salva
    
    rollback;
    -> desfaz a transaçao -> desfaz oq foi feito
    
    
    esse dois comandos, funcionam tanto para o UPDATE quanto para o DELETE
 
        o rollback -> sempre irá voltar a tabela anterior
        
        
    Não existe rollback após tEr feito o COMMIT - Após ter 
        confirmado, não tem como voltar a trás



  ======== COMANDO TRUNCATE
    
    remove as linhas da tabela forte
    
    -> trucante table T_ENDERECO
    
    NÃO existe rollback para TRUNCATE
    
    apagará tudo de forma permanente
   
*/

TRUNCATE TABLE T_ALUNO;
ROLLBACK; -- NÃO IRÁ FUNCIONAR


/* =======================================================================

        AGORA VAI USAR O MYSQL 
        
    não vou instalar - vou apenas acompanhar a aula
    
    ele vai usar os mesmos dados no MySql para fazer uma comparação
    
    
    usar o comando 
    CREATE DATABASE (cria uma pasta raiz que irá armazenar as tabelas)
    isso é usado para fazer conexão com linguagens de programação
    
    **** no Oracle, não separa as tabelas com pastas ****
    
    No MySql, não permite definir os nomes das constraints nas linhas, apenas 
    no final da tabela
    
    
    
    antes de criar uma tabela, precisa escolher onde irá armazenar, para 
    isso tem duas formas de selecionar o banco que será usado
    
    1- USE, FIAP(banco);
    2- Ou clicar duas vezes sobre o nome do banco
    
    
    > não pode ter bancos com nomes iguais!!!
    
    > posso ter tabelas com nomes iguais em pastas diferentes
    
    
    ==== FAZENDO O INSERT
    o MySql, é case sensitivo - então usar os nomes das tabelas em minusculo
    
    para consultar a tabela pose-se usar o select ou cliclar no icones que 
    aparecem ao lado do nome da tabela após clicar 2x. 
        clicar no icone do raio -> vai abrir a tabela no campo de saida
        
    ====== FAZENDO ROLLBACK
    O MySql - não aceita o Rollback
        por que os commit são feitos de forma automárica, sendo assim, não
        é possível desfazer o que foi feito.
        
    No Oracle - tem o controle das transações..    
        
    ======== FAZENDO DELETE
    delete from t_endereco;
    
    Aqui, existe uma trava de segurança onde não permite executar o Update e 
    Delete sem o WHERE... 
    
    ** Essa trava é possível ser removida atraves de um comando manual **
    caminho para remoção -> edite - preferencia - sql editor - save update
    Não é recomendado remover essa trava.
    
    
    phpMyAdmin - habiente virtual  que pode ser usado para abrir as tabelas, 
    pela web

*/



