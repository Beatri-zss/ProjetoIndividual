create database bibliotecaPessoal;

use bibliotecaPessoal;


-- criação de tabela:
create table usuario(
idUsuario int primary key auto_increment,
nome varchar(45) not null,
sobrenome varchar (45) not null,
email varchar (50) not null,
telefone char(11) not null,
senha varchar (30) not null,
url_foto varchar(200) not null
); 

-- inserir dados na tabela
-- fazer select na tabela
  
  
-- criação de tabela:
create table livro (
idLivro int primary key auto_increment,
nome varchar(45) not null,
autor varchar(45) not null,
editora varchar (45) not null,
data_publicacao date not null,
genero varchar(50) not null,
descricao varchar(500) not null,
url_capa varchar(200) not null,
disponivel boolean not null
);  
-- inserir dados na tabela
-- fazer select na tabela




-- criação de tabela:
create table emprestimo(
idEmprestimo int primary key auto_increment,
data_emprestimo date not null,
data_devolucacao date,
status_livro  varchar(20) not null,
constraint ckStatus check(status_livro in ('emprestado', 'devolvido')),
fk_livro int not null,
fk_usuario int not null,
constraint fk_livro_emprestimo foreign key(fk_livro) references livro(idLivro),
constraint fk_usuario_emprestimo foreign key (fk_usuario) references usuario(idUsuario)
); 
-- inserir dados na tabela
-- fazer select na tabela





-- criação de tabela:
create table comentario(
fk_usuario int,
fk_livro int,
constraint pkComposta_comentario primary key(fk_usuario, fk_livro),
nota int not null,
descricao varchar(150)
); 
-- inserir dados na tabela
-- fazer select na tabela





-- criação de tabela:
create table pergunta(
idPergunta int primary key auto_increment,
enunciado varchar(100) not null,
alternativaA varchar(100) not null,
alternativaB varchar(100) not null,
alternativaC varchar(100) not null,
alternativaD varchar(100) not null,
resposta varchar(50) not null 
);
-- inserir dados na tabela
-- fazer select na tabela




create table pontuacao_quiz(
idPontuacao_quiz int primary key auto_increment,
qtd_pontos int not null,
fk_usuario int not null, 
constraint fk_usuario_pontuacao_quiz foreign key(fk_usuario) references usuario(idUsuario)
); 
-- inserir dados na tabela
-- fazer select na tabela



