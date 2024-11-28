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
    FOREIGN KEY (id_marca) references T_QF_MARCA(id_marca)---
);

alter table T_QF_PRODUTO
    add cor_produto varchar(20) not null;

CREATE TABLE T_QF_ITEM_PEDIDO(
    produto int,
    fk_T_QF_PEDIDO int references id_pedido not null, 
    id_item int,
    qt_produto int not null,
    vl_subtotal number (5,2) not null,
    vi_desconto number (5,2),
    pf_T_QF_PRODUTO primary key(produto, id_item)
);

create table T_QF_ARMAZEM(
    id_armazem int primary key,
    ds_armazem varchar2(100) unique not null,
    local_armazem varchar(100) not null
);

create table T_QF_CATEGORIA(
    id_categoria int primary key,
    ds_categoria varchar(15000) unique not null
);

create table T_QF_MARCA(
    id_marca int primary key,
    ds_marca varchar(100) unique not null
);




