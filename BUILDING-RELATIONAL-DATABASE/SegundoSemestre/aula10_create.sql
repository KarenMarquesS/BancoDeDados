DROP TABLE Pedidos;
DROP TABLE Clientes;
-- Cria a tabela "Clientes"
CREATE TABLE Clientes (
    ID NUMBER(5) PRIMARY KEY,
    Nome VARCHAR2(255),
    Cidade VARCHAR2(255),
    Sexo VARCHAR2(1),
    idade int
);

-- Insercao de dados na tabela "Clientes"
 INSERT INTO Clientes VALUES (1, 'Joï¿½o', 'Sao Paulo','M',20);
 INSERT INTO Clientes VALUES (2, 'Maria', 'Rio de Janeiro','F',30);
 INSERT INTO Clientes VALUES (3, 'Carlos', 'Belo Horizonte','M',20);
 INSERT INTO Clientes VALUES (4, 'Ana', 'Sao Paulo','F',25);
 INSERT INTO Clientes VALUES (5, 'Rafael', 'Rio de Janeiro','M',50);

-- Cria a tabela "Pedidos"
CREATE TABLE Pedidos (
    id NUMBER(5) PRIMARY KEY,
    cliente_id NUMBER(5),
    ds_produto VARCHAR2(255),
    vl_pedido Number (6,2),
	FOREIGN KEY (cliente_id) REFERENCES 
		Clientes (id)
);

-- Insercao de dados na tabela "Pedidos"
INSERT INTO Pedidos VALUES(101, 1, 'Celular', 1100.00);
INSERT INTO Pedidos VALUES(102, 2, 'Laptop', 4000.00);
INSERT INTO Pedidos VALUES(103, 3, 'Tablet', 3500.00);
INSERT INTO Pedidos VALUES(104, 1, 'TV', 5000.00);
INSERT INTO Pedidos VALUES(105, 4, 'Geladeira', 3000.00);


CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Supervisor_ID INT
);


INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES (1, 'Joao', NULL); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (2, 'Maria', 1); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (3, 'Carlos', 1); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (4, 'Ana', 2);    
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (5, 'Rafael', 2); 


-- SELECT FUNCTIONS E GROUP BY
SELECT * FROM Clientes ORDER BY nome ASC;
SELECT * FROM Clientes ORDER BY nome DESC;

SELECT AVG(idade), COUNT(nome), MIN(idade), MAX(idade), STDDEV(idade), 
    VARIANCE(idade) FROM Clientes;

-- exemplo de subquery
select nome from clientes where id in (select cliente_id from pedidos where 
    vl_pedido > 3000);
    
/*
select cliente_id from pedidos where vl_pedido > 3000

quando rodo apenas esse select irá retornar os id - que serao apresentados na
selação completa

*/
    
--inner join - trazendo o mesmo resultado
select nome from clientes where id in (select cliente_id from pedidos where 
    vl_pedido > 3000);
    

-- Usando o -> Not IN 
/*
    nesse caso é feito o inverso do in -> irá retornar o que for DIFERENTE
    
    neste exemplo, está trazendo os id DIFRESNTES de 1, 2, 3 
*/
select nome from clientes where not id in (select cliente_id from pedidos where 
    vl_pedido > 3000);


-- usando o EXISTS
/*
 vai trazer a ordem do que existe
 
o 1 se refere a existencia de TER -> seria 1 ou 0
*/

select nome from clientes where exists (select 1 from clientes c inner join
    pedidos p on c.id = p.cliente_id);
    

-----uso do NOT EXISTS
/*Nesse exemplo será ZERADO, pq todos os clientes tem pedidos*/
select nome from clientes where not exists (select 1 from clientes c inner join
    pedidos p on c.id = p.cliente_id);

----- uso do ANY
select upper (nome), idade from clientes where idade > any (select idade from 
    clientes where cidade = 'Sao Paulo');

-- uso do ANY calculando a média da idade
select upper (nome), idade from clientes where idade > any (select avg (idade)
    from clientes where cidade = 'Sao Paulo');
    

---- uso do UNION
-- retorno UNIFICANDO DUAS SUBCONSULTAS E TORNANDO-A UMA SÓ
select nome , cidade from clientes where cidade='Sao Paulo'
union
select nome , cidade from clientes where cidade='Rio de Janeiro'


--- uso do ALL
select upper (nome), idade from clientes where idade > all (select avg (idade)
    from clientes where cidade = 'Sao Paulo');
    
--- comparação sem a média
-- nesse exemplo retorna uma idade superior a média de todos os clientes de são paulo
select upper (nome), idade from clientes where idade > all (select idade
    from clientes where cidade = 'Sao Paulo');  





   