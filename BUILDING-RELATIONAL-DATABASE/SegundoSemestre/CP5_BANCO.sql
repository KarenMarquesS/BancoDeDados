CREATE TABLE T_QF_CLIENTE(
    id_cliente int primary key,
    nm_cliente varchar(60) not null,
    cpf varchar(15) unique not null,
    dt_nascimento date,
    sx_cliente varchar(2) not null,
    st_cliente varchar(1) not null CHECK(st_cliente='A' OR st_cliente='I')
);
 
select * from T_QF_CLIENTE


CREATE TABLE T_QF_AUTENTICA(
    fk_T_QF_CLIENTE_id_cliente int not null,
    id_autentica int primary key,
    login varchar(255) not null,
    senha varchar(30) not null
);

CREATE TABLE T_QF_ENDERECO(
    fk_T_QF_CLIENTE_id_cliente int not null,
    id_endereco int primary key,
    cep varchar(15)not null,
    logradouro varchar(150)not null,
    numero number not null,
    complemento varchar(150),
    bairro varchar(150)not null,
    cidade varchar(150)not null,
    uf varchar(2)not null,
    ponto_referencia varchar(150)
);

CREATE TABLE T_QF_PAGAMENTO(
    id_pagamento int primary key,
    fk_T_QF_PEDIDO_id_pedido int not null,
    forma_pagamento varchar(50) not null,
    vl_pagamento number(5,2) not null,
    dt_hr_pagamento date not null,
    st_pagamento varchar(20) not null CHECK(st_pagamento='S' OR st_pagamento='N')
);

CREATE TABLE T_QF_CUPOM(
    id_cupom int primary key,
    cd_cupom varchar(100) not null,
    vl_desconto number(5,2) not null,
    val_cupom date
);

CREATE TABLE T_QF_PEDIDO(
    id_cliente int not null,
    id_pedido int primary key,
    dt_hr_pedido date not null,
    st_pedido varchar(20) not null CHECK(st_pedido='concluido' OR st_pedido='nao concluido'),
    vl_total number(5,2) not null,
    vl_desconto number(5,2) not null,
    id_cupom int not null,
    obs_gerais varchar(255),
    FOREIGN KEY (id_cliente) REFERENCES T_QF_PEDIDO(id_cliente),
    FOREIGN KEY (id_cupom) REFERENCES T_QF_PEDIDO(id_cupom)
);

CREATE TABLE T_QF_ESTOQUE(
    id_estoque int primary key,
    id_produto int not null,
    qtd_disponivel int not null,
    id_armazem int not null,
    FOREIGN KEY (ID_ARMAZEM) references T_QF_ARMAZEM (id_armazem), 
    FOREIGN KEY (id_produto) references T_QF_PRODUTO (id_produto)
);
 
alter table T_QF_ESTOQUE
    add dt_hr_estoque date not null;
 
CREATE TABLE T_QF_PRODUTO(
    id_produto int primary key,
    ds_produto varchar2(150) unique not null,
    vl_produto number(5,2) not null,
    peso number(5,2) not null,
    dimensoes varchar(20) not null,
    id_marca int,
    FOREIGN KEY (id_marca) references T_QF_MARCA(id_marca)
);
 
alter table T_QF_PRODUTO
    add cor_produto varchar(20) not null;
 
CREATE TABLE T_QF_ITEM_PEDIDO(
    id_produto int not null,
    id_pedido int not null, 
    id_item int generated always
        as identity primary key,
    qt_produto int not null,
    vl_subtotal number (5,2) not null,
    vi_desconto number (5,2),
    foreign key (id_produto) T_QF_PRODUTO(id_produto), 
    foreign key (id_pedido) T_QF_ITEM_PEDIDO(id_produto)
);
 
create table T_QF_ARMAZEM(
    id_armazem int primary key,
    ds_armazem varchar2(100) unique not null,
    local_armazem varchar(100) not null
);
 
create table T_QF_CATEGORIA(
    id_categoria int primary key,
    ds_categoria varchar(1500) unique not null
);
 
create table T_QF_MARCA(
    id_marca int primary key,
    ds_marca varchar(100) unique not null
);
 

/*                           INSERT              */
insert into T_QF_CLIENTE values (1, 'Karen Marques', '123.456.789-01', 
to_date('21-09-1987'),'F', 'I');

insert into T_QF_CLIENTE values (2, 'Róger Albin', '990.876.432-12', 
to_date ('18-10-1990'),'F', 'A');


insert into T_QF_AUTENTICA values (1,1, '@Karen#21', '123RajI');

insert into T_QF_AUTENTICA values (2,2, '#RogAlb2345','#Gh#BoEFj12');
 
    
insert into T_QF_ENDERECO values (1,1, '09876-543', 'R. Moacir Miguel', 134, 'casa', 'Jd.Margarida', 'São Paulo', 'SP', 'Rosas' );

insert into T_QF_ENDERECO values (2,2, '01002-000', 'R. Cacique', 2, 'Redondo', 'Vila Oca', 'Ocauçu', 'AM', 'Marrom');


insert into T_QF_PAGAMENTO values (1,1, 'Dinheiro', 150, to_date('23-08-2023'), 'S' );

insert into T_QF_PAGAMENTO values (2,2, 'Boleto', 300, to_date('01-01-2000'), 'N');

insert into T_QF_CUPOM values (1, 'Promocional', 5, to_date('05-10-2023'));
insert into T_QF_CUPOM values (2, 'PromoCarnaval', 8, to_date('20-02-2000'));

insert into T_QF_PEDIDO values(1,1,1, to_date('23-08-2023'), 'concluido', 150, 5, 'Finalizado');

insert into T_QF_PEDIDO values(2,2,2, to_date('20-02-2000'), 'concluido', 300, 8, 'Finalizado');

insert into T_QF_ARMAZEM
values (1,'seco','São Paulo');
 
insert into T_QF_ARMAZEM
values (2,'seco','Rio de Janeiro');
 
delete from T_QF_ARMAZEM
where id_armazem=1;
 
select *
from T_QF_ARMAZEM;

 
insert into T_QF_ITEM_PEDIDO
values (1,1,1,5,50,2);
 
insert into T_QF_ITEM_PEDIDO
values (2,2,2,1,15,5);
 
delete from T_QF_ITEM_PEDIDO
where id_pedido=1;

insert into T_QF_PRODUTO
values (1,'arroz',10,5,'10x10',1);
 
insert into T_QF_PRODUTO
values (2,'feijao',15,2,'5x8',2);
 
delete from T_QF_PRODUTO
where id_produto=1;
 
SELECT *
from T_QF_PRODUTO;

insert into T_QF_ESTOQUE
values (1,1,500,1,to_date('10-10-2024'));
 
insert into T_QF_ESTOQUE
values (2,2,100,2,to_date('15-10-2024'));
 
delete from T_QF_ESTOQUE
where id_estoque=1;
 
SELECT *
from T_QF_ESTOQUE;



/*Remoção*/

delete from T_QF_CLIENTE  where nome= 'Karen Marques';

delete from T_QF_AUTENTICA where id_autentica= 1;
delete from T_QF_ENDERECO where complemento= 'casa';
delete from T_QF_PAGAMENTO where id_pagamento= 1;
delete from T_QF_CUPOM where st_pagamento= 'concluido';
delete from T_QF_PEDIDO where vl_desconto= 'Promocional';

update T_QF_ENDERECO set complemento='Apto23';

/*  CONSULTA SIMPLES */

SELECT * FROM T_QF_CLIENTE;
SELECT * FROM T_QF_AUTENTICA;
SELECT * FROM T_QF_ENDERECO;
SELECT * FROM T_QF_PAGAMENTO;
SELECT * FROM T_QF_CUPOM;
SELECT * FROM T_QF_PEDIDO;
 
select id_categoria 
from T_QF_CATEGORIA
where id_categoria= 1;

insert into T_QF_CATEGORIA
values (1,'grão');
 
insert into T_QF_CATEGORIA
values (2,'liquido');
 
delete from T_QF_CATEGORIA
where id_categoria=1;
 
select * 
from T_QF_CATEGORIA;

 
insert into T_QF_MARCA
values (1,'Dona Benta');
 
insert into T_QF_MARCA
values (2,'Cristal');
 
delete from T_QF_MARCA
where id_marca=1;
 
update T_QF_MARCA
set ds_marca='Farina';
 
SELECT *
from T_QF_MARCA;
 
SELECT id_marca 
from T_QF_MARCA
where id_produto=1;
 
 
 
 
DROP TABLE T_QF_PEDIDO;
DROP TABLE T_QF_ESTOQUE;
DROP TABLE T_QF_PRODUTO;
DROP TABLE T_QF_ENDERECO;
DROP TABLE T_QF_PAGAMENTO;
DROP TABLE T_QF_AUTENTICA;
DROP TABLE T_QF_ITEM_PEDIDO;
DROP TABLE T_QF_CUPOM;
DROP TABLE T_QF_ARMAZEM;
DROP TABLE T_QF_MARCA;
DROP TABLE T_QF_CATEGORIA;
DROP TABLE T_QF_CLIENTE;

