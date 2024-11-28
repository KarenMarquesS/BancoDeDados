--- VERIFICAR ONDE TEM ERRO 
-- NO INICIO ESTAVA RODANDO

select * from T_ENDERECO;

select * from T_ALUNO;


/* Esse � um insert GENERICO --> QUE PREENCHE TODAS AS COLUNAS DE UMA VEZ - 
    INSERT PROCEDURAL
    A REGRA � QUE - � OBRIGAT�RIO MENCIONAR AS COLUNAS NOT NULL E PK
    EMBORA A COLUNA QUE � PK - QUANDO H� GENERATED
*/
insert into T_ENDERECO values (06343000, 'Jo�o fasoli', 'jd. marilu',
'Carapicuiba', 'SP')

 INSERT into T_ENDERECO values (06730000, 'Opala', 'Casablanca',
'VGP', 'SP');

-- INSERT ESPECIFICO -> � QUANDO � ESPECIFICADO O NOME DAS COLUNAS

insert into T_ALUNO(nm_aluno, sx_aluno, cep, cpf)
VALUES (0345600, 'AV. BOM ACHADO', 'ACHADINHO', 'S�O PAULO');

-- ATUALIZAR LINHAS NA TABELA
UPDATE T_ALUNO SET fk_cep = 0345600 WHERE RA= 1;

/* UPDATE N�O PROCEDURAL (PARA N LINHAS)
    N�O H� WHERE
    WHERE � UMA RESTRI��O DE ATUALIZA�AO
    QUANDO NAO H� O WHERE, ESSA RESTRI��O N�O EXISTE
    UPDATE T_ALUNO SET nm_aluno='JOS�';
*/

-- ATUALIZOU TODAS AS LINHAS
-- POR QUE DEPENDENDO DA CONDI��O L�GICA, PODE SER FEITO UMA ATUALIZA��O EM MASSA
UPDATE T_ALUNO SET nm_aluno='LUCAS' WHERE RA>=1;


-- UPDATE ESPECIFICO PARA MAIS DE U COLUNA
-- SEPARAR COLUNAS POR VIRGULA AP�S O SET
UPDATE T_ALUNO SET nm_aluno='FRANCISCO', sx_aluno='M', 
    dt_nascimento=to_date('19-09-2024', 'DD-MM-YYYY') WHERE id_aluno=2;
    
-- o UPDATE as vezes causam efeitos irrevers�veis.


--========================================================================

/* M�TODO DELETE
  tbm tem o procedural e n�o procedural
 ele � especifico por que a cl�sua where que informa o id da linha
 que sofrer� a a��o */

delete from T_ALUNO where id_aluno =2; 


/*
 Dessa forma o delete remove todas as linhas da tabela
 
 O DELETE n�o apaga nada, caso a tabela "pai" tiver algum dado - s� apaga tudo, 
 se a tabela relacionada estiver vazia
 
 S� podemos remover linhas que n�o estao relacionadas com outras tabelas, caso
 co contr�rio, haver� o ERRO 2292 sobre a fk
 
*/
delete from T_ALUNO;


/*
    ==== DTL -> data transaction language ====
    commit: confirmar transa��o
    rollback: desfazer a transa��o
    
    � utilizada em conjunto com a DML (INSERT, UPDATE E DELETE)
    
    Quando devo usar commmit e rollback?????
    
    commit; 
    -> apenas confirma o c�digo - ele salva
    
    rollback;
    -> desfaz a transa�ao -> desfaz oq foi feito
    
    
    esse dois comandos, funcionam tanto para o UPDATE quanto para o DELETE
 
        o rollback -> sempre ir� voltar a tabela anterior
        
        
    N�o existe rollback ap�s tEr feito o COMMIT - Ap�s ter 
        confirmado, n�o tem como voltar a tr�s



  ======== COMANDO TRUNCATE
    
    remove as linhas da tabela forte
    
    -> trucante table T_ENDERECO
    
    N�O existe rollback para TRUNCATE
    
    apagar� tudo de forma permanente
   
*/

TRUNCATE TABLE T_ALUNO;
ROLLBACK; -- N�O IR� FUNCIONAR


/* =======================================================================

        AGORA VAI USAR O MYSQL 
        
    n�o vou instalar - vou apenas acompanhar a aula
    
    ele vai usar os mesmos dados no MySql para fazer uma compara��o
    
    
    usar o comando 
    CREATE DATABASE (cria uma pasta raiz que ir� armazenar as tabelas)
    isso � usado para fazer conex�o com linguagens de programa��o
    
    **** no Oracle, n�o separa as tabelas com pastas ****
    
    No MySql, n�o permite definir os nomes das constraints nas linhas, apenas 
    no final da tabela
    
    
    
    antes de criar uma tabela, precisa escolher onde ir� armazenar, para 
    isso tem duas formas de selecionar o banco que ser� usado
    
    1- USE, FIAP(banco);
    2- Ou clicar duas vezes sobre o nome do banco
    
    
    > n�o pode ter bancos com nomes iguais!!!
    
    > posso ter tabelas com nomes iguais em pastas diferentes
    
    
    ==== FAZENDO O INSERT
    o MySql, � case sensitivo - ent�o usar os nomes das tabelas em minusculo
    
    para consultar a tabela pose-se usar o select ou cliclar no icones que 
    aparecem ao lado do nome da tabela ap�s clicar 2x. 
        clicar no icone do raio -> vai abrir a tabela no campo de saida
        
    ====== FAZENDO ROLLBACK
    O MySql - n�o aceita o Rollback
        por que os commit s�o feitos de forma autom�rica, sendo assim, n�o
        � poss�vel desfazer o que foi feito.
        
    No Oracle - tem o controle das transa��es..    
        
    ======== FAZENDO DELETE
    delete from t_endereco;
    
    Aqui, existe uma trava de seguran�a onde n�o permite executar o Update e 
    Delete sem o WHERE... 
    
    ** Essa trava � poss�vel ser removida atraves de um comando manual **
    caminho para remo��o -> edite - preferencia - sql editor - save update
    N�o � recomendado remover essa trava.
    
    
    phpMyAdmin - habiente virtual  que pode ser usado para abrir as tabelas, 
    pela web

*/



