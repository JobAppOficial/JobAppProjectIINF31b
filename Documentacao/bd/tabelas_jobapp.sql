
create database jobapp3;

use jobapp3;


create table Prestador(

cpf varchar(11) not null,
 
nome varchar(50) not null,
  
contato_email varchar(50) not null,

contato_numCel varchar(20) not null,

endereco_cep varchar(8) not null,

endereco_numCasa varchar(4) not null,
	
conta varchar(20) not null,
    
descricao varchar(2) not null,
   
sexo char (1) not null,
   
 primary key(cpf)
);



create table Cliente(
	
cpf varchar(11) not null,
    
nome varchar(50) not null,
    
endereco_cep varchar(8) not null,

endereco_numCasa varchar(4) not null,
   
contato_email varchar(50) not null,

contato_numCel varchar(20) not null,

sexo char (1) not null,
   
 primary key(cpf)
);

create table Servico(
	
codigo varchar(5) not null,

cpfCliente varchar(11) not null,

cpfPrestador varchar(11) not null,
  
nome varchar(20) not null,
   
classificacao varchar(20) not null,
    
descricao varchar(100) not null,

avaliacao_curtida int not null,

avaliacao_comentario varchar (140) not null, 
    
primary key(codigo),

foreign key(cpfPrestador) references Prestador(cpf),
    
foreign key(cpfCliente) references Cliente(cpf)

);

create table SolicitarServico( 
	    
cpfCliente varchar (11) not null,
    
codigoServico varchar(11) not null,

dataSolicitacao date not null,

tipo char (1) not null,

primary key(cpfCliente, codigoServico),
    
foreign key(codigoServico) references Servico(codigo),
    
foreign key(cpfCliente) references Cliente(cpf)
);

create table ExecutaServico( 

cpfPrestador varchar(11) not null,

cpfCliente varchar(11) not null,
    
codigoServico varchar(5) not null,
	
datainicio date not null,
    
dataFim date not null,
    
primary key(cpfCliente, cpfPrestador, codigoServico),
    
foreign key(cpfPrestador) references Cliente(cpf),

foreign key(cpfCliente) references Prestador(cpf),
    
foreign key(codigoServico) references Servico(codigo)
);

