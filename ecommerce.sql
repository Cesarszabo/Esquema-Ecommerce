create database ecommerce;
use ecommerce;

create table Cliente(
	IDCliente int auto_increment primary key,	
    NomeCliente varchar(45) not null,
    TipoPessoa enum("PF","PJ") not null,
    Identicacao int(14) unique not null, -- CNPJ ou CPF
    Endereço varchar(45) not null,
    Bairro varchar(45) not null,
    CEP varchar(10) not null,
    Cidade varchar(20) not null
   );
create table Produtos(
IDProduto int auto_increment primary key,
NomeProduto varchar(45) not null,
Categoria varchar(45),
Descricao varchar(45) not null,
Valor float not null
);
create table Pedido(
IDVenda int auto_increment primary key,
DataSolicitado date,
DataEnvio date,
StatusPedido enum("Aberto","Em Andamento","Concluido"),
DataStatus date,
ValorPedido float,
ValorFrete float,
NumeroRastreamento varchar(45)
);
create table TipoPgto(
TipoPgto varchar(45), -- Cartão de credito, cartão de debito, PIX
Identificacao varchar(45), -- numero do cartão ou chave PIX
FkPedidoIdCliente int
);
create table Vendedor(
IDVendedor int primary key	auto_increment,
NomeVendedor varchar(45) not null,
FkVendedorIdCliente int,
FkVendedorIdPedido int 
);
create table RegistroPedidoFornecedor(
QuantidadeProdutos int,
FkPedidoIDVenda int,
FkFornecedorIDFornecedor int,
FkProdutosIDProdutos int
);
create table Fornecedor(
IDFornecedor int auto_increment primary key,
NomeFornecedor varchar(45) not null,
CNPJ int(11) unique not null,
EnderecoFornecedor varchar(45) not null,
Bairro varchar(15) not null,
CEP int(10) not null,
Cidade varchar(15) not null,
FkProdutos_IDProdutos int    
);
create table Estoque(
IdEstoque int auto_increment primary key,
Endereco varchar(45) not null,
Bairro varchar(15) not null,
Cidade varchar(15) not null,
CEP int(10) not null,
FkProdutos_IDProdutos int
);

