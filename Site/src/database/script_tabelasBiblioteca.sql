create database bibliotecaPessoal;
use bibliotecaPessoal;

-- CRIAÇÃO DE TABELAS:
CREATE TABLE usuario(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
sobrenome VARCHAR (45) NOT NULL,
email VARCHAR (50) NOT NULL UNIQUE,
telefone CHAR(11) NOT NULL,
senha VARCHAR (30) NOT NULL
); 

CREATE TABLE livro (
idLivro INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(45) NOT NULL,
autor VARCHAR(45) NOT NULL,
genero VARCHAR(50) NOT NULL,
url_capa VARCHAR(200) NOT NULL
);

CREATE TABLE emprestimo(
idEmprestimo INT PRIMARY KEY AUTO_INCREMENT,
data_emprestimo DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
data_devolucao DATETIME,
fk_livro INT NOT NULL,
fk_usuario INT NOT NULL,
CONSTRAINT fk_livro_emprestimo FOREIGN KEY (fk_livro) REFERENCES livro(idLivro),
CONSTRAINT fk_usuario_emprestimo FOREIGN KEY (fk_usuario) REFERENCES usuario(idUsuario)
);  

CREATE TABLE pergunta(
idPergunta INT PRIMARY KEY AUTO_INCREMENT,
enunciado VARCHAR(100) NOT NULL,
alternativaA VARCHAR(100) NOT NULL,
alternativaB VARCHAR(100) NOT NULL,
alternativaC VARCHAR(100) NOT NULL,
alternativaD VARCHAR(100) NOT NULL,
respostaCorreta VARCHAR(50) NOT NULL 
);
 
 CREATE TABLE pontuacao_quiz(
idPontuacao_quiz INT PRIMARY KEY AUTO_INCREMENT,
qtd_pontos INT NOT NULL,
fk_usuario INT NOT NULL, 
CONSTRAINT fk_usuario_pontuacao_quiz FOREIGN KEY (fk_usuario) REFERENCES usuario(idUsuario)
);  

CREATE TABLE livro_favoritado(
fk_usuario INT,
fk_livro INT,
data_favoritado DATETIME DEFAULT CURRENT_TIMESTAMP(),
CONSTRAINT pkComposta_livroFavoritado PRIMARY KEY (fk_usuario, fk_livro),
CONSTRAINT fkUsuario_livroFavoritado FOREIGN KEY (fk_usuario) REFERENCES  usuario(idUsuario),
CONSTRAINT fk_livro_livroFavoritado FOREIGN KEY (fk_livro) REFERENCES livro(idLivro)
); 

-- INSERTS:
-- TABELA USUARIO:
INSERT INTO usuario (idUsuario, nome, sobrenome, email, telefone, senha) VALUES
(1, 'Beatriz', 'Silva', 'bia22102001@gmail.com', '11912345678', 'Bia123'),
(2, 'Bruno', 'Santos', 'bruno.santos@email.com', '11998765432','outraSenhaForte456'),
(3, 'Carla', 'Oliveira', 'carla.oliveira@email.com', '11987654321','meuAcesso789'),
(4, 'Daniel', 'Pereira', 'daniel.pereira@email.com', '11934567890','senha123#Teste'),
(5, 'Eduarda', 'Costa', 'eduarda.costa@email.com','11976543210','forteSenha!2024'),
(6, 'Fernando', 'Almeida', 'fernando.almeida@email.com','11965432109','sistemaSeguro@1'),
(7, 'Gabriela', 'Lima', 'gabriela.lima@email.com', '11923456789',  'acessoAdmin!*');

-- TABELA LIVRO:
INSERT livro(titulo, autor, genero, url_capa) VALUES
('Jujutsu Kaisen Vol. 0', 'Gege Akutami', 'Mangá', 'https://m.media-amazon.com/images/I/61ResbP4aPL._AC_SL1000_.jpg'),
('Jujutsu Kaisen Vol. 1', 'Gege Akutami', 'Mangá', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_o8j2ls1oep5h5dd1eu70smtk19/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 2', 'Gege Akutami', 'Mangá', 'https://m.media-amazon.com/images/I/91MAequ2koL._AC_SL1500_.jpg'),
('Jujutsu Kaisen Vol. 3', 'Gege Akutami', 'Mangá', 'https://m.media-amazon.com/images/I/816m3mfx21L._AC_SL1500_.jpg'),
('Jujutsu Kaisen Vol. 4', 'Gege Akutami', 'Mangá', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_r3gaebi2rp25t3ffkj8t0nuh67/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 5', 'Gege Akutami', 'Mangá', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_t7r8mupril20d2n9hghv12tf1g/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 7', 'Gege Akutami', 'Mangá', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_mccijejbnh7u51i3umnj1egb3t/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 9', 'Gege Akutami', 'Mangá', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_hucajabqdt2r98ta1r8elmtr0o/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 10', 'Gege Akutami', 'Mangá', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_riu7jt5e3h6l11db27mollbc6h/-S897-FWEBP'),
('Boa Noite Punpun Vol. 1', 'Inio Asano', 'Mangá', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2018/12/Boa-Noite-Punpun-01-Capa_p.jpg'),
('Boa Noite Punpun Vol. 2', 'Inio Asano', 'Mangá', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2018/12/Boa-Noite-Punpun-02-Capa_p-300x455.jpg'),
('Boa Noite Punpun Vol. 3', 'Inio Asano', 'Mangá', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/03/Boa-Noite-Punpun-03-Capa_p-300x455.jpg'),
('Boa Noite Punpun Vol. 4', 'Inio Asano', 'Mangá', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/03/Boa-Noite-Punpun-04-Capa_p.jpg'),
('Boa Noite Punpun Vol. 5', 'Inio Asano', 'Mangá', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/05/Boa-Noite-Punpun-05-Capa_p-300x455.jpg'),
('Boa Noite Punpun Vol. 6', 'Inio Asano', 'Mangá', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/05/Boa-Noite-Punpun-06-Capa_p-300x455.jpg'),
('Boa Noite Punpun Vol. 7', 'Inio Asano', 'Mangá', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/07/Boa-Noite-Punpun-07-Capa_p-300x455.jpg'),
('Homens pretos (não) choram', 'Stefano Volp', 'Contos', 'https://m.media-amazon.com/images/I/819rDqgZ2yL._SL1500_.jpg'),
('O beijo do rio', 'Stefano Volp', 'Suspense', 'https://m.media-amazon.com/images/I/91ULbf+vDsL._SL1500_.jpg'),
('O segredo das larvas', 'Stefano Volp', 'Ficção Científica Distópica', 'https://m.media-amazon.com/images/I/81kiI-Did+L._SL1500_.jpg'),
('Nunca vi a chuva', 'Stefano Volp', 'Ficção', 'https://m.media-amazon.com/images/I/816jlkYJutL._SL1500_.jpg'),
('Pequena Coreografia do Adeus', 'Aline Bei', 'Ficção', 'https://m.media-amazon.com/images/I/9157mzaUZ1L._SL1500_.jpg'),
('O Meu Pé de Laranja Lima', 'José Mauro de Vasconcelos', 'Ficção', 'https://m.media-amazon.com/images/I/816a7zMD+FL._SL1500_.jpg'),
('Vidas Secas', 'Graciliano Ramos', 'Clássico', 'https://m.media-amazon.com/images/I/71NYL2AbBIL._SL1500_.jpg'),
('Fahrenheit 451', 'Ray Bradbury', 'Ficção Científica', 'https://m.media-amazon.com/images/I/41PVVpQf-sL._SY445_SX342_.jpg'),
('O sol é para todos', 'Harper Lee', 'Ficção', 'https://m.media-amazon.com/images/I/91WKPd60P4L._SL1500_.jpg'),
('As intermitências da morte', 'José Saramago', 'Ficção', 'https://m.media-amazon.com/images/I/71mJqFs-MpL._SL1500_.jpg'),
('Tudo é rio', 'Carla Madeira', 'Ficção', 'https://m.media-amazon.com/images/I/816Udvs9O7L._SL1500_.jpg'),
('Entendendo Algoritmos', 'Aditya Bhargava', 'Educacional', 'https://m.media-amazon.com/images/I/71Vkg7GfPFL._SL1296_.jpg'),
('A Revolução dos Bichos', 'George Orwell', 'Ficção', 'https://m.media-amazon.com/images/I/91BsZhxCRjL._SL1500_.jpg'),
('The Outsiders: Vidas sem rumo', 'Susan Hinton', 'Jovens e Adolescentes', 'https://m.media-amazon.com/images/I/91-hXAWKWSL._SL1500_.jpg'),
('Sete Minutos Depois da Meia-Noite', 'Patrick Ness', 'Ficção', 'https://m.media-amazon.com/images/I/817RXVIiekL._SL1437_.jpg'),
('O Labirinto do Fauno', 'Guillermo del Toro', 'Conto de Fadas', 'https://m.media-amazon.com/images/I/71+yGuF-ioL._SL1450_.jpg'),
('João e Maria', 'Neil Gaiman', 'Conto de Fadas', 'https://m.media-amazon.com/images/I/91wHSbbiwLL._SL1500_.jpg'),
('Deuses americanos', 'Neil Gaiman', 'Ficção mitológica', 'https://m.media-amazon.com/images/I/91MBhJ0bZFL._SL1500_.jpg'),
('O conto da aia', 'Margaret Atwood', 'Distopia', 'https://m.media-amazon.com/images/I/91nJArLKIJL._SL1500_.jpg'),
('Caixa de pássaros', 'Josh Malerman', 'Distopia', 'https://m.media-amazon.com/images/I/81QQBJu1voL._SL1419_.jpg'),
('Pessoas normais', 'Sally Rooney', 'Romance', 'https://m.media-amazon.com/images/I/71jrp43TCcL._SL1500_.jpg'),
('Alice no país das maravilhas', 'Lewis Carroll', 'Contos Infanto Juvenil', 'https://m.media-amazon.com/images/I/71W71CNo9ZL._SL1358_.jpg'),
('A natureza da mordida', 'Carla Madeira', 'Ficção Literária', 'https://m.media-amazon.com/images/I/71zDFgnh8-L._SL1500_.jpg'),
('A metamorfose', 'Franz Kafka', 'Ficção', 'https://m.media-amazon.com/images/I/715JOcuqSSL._SL1021_.jpg'),
('Santo de casa', 'Stefano Volp', 'Ficção', 'https://m.media-amazon.com/images/I/71LyJPj6E7L._SY466_.jpg'),
('O avesso da pele', 'Jeferson Tenório', 'Ficção', 'https://m.media-amazon.com/images/I/81p29WCHFaL._SL1500_.jpg'),
('Por lugares incríveis', 'Jennifer Niven', 'Romance', 'https://m.media-amazon.com/images/I/918Maoi6OML._SL1500_.jpg'),
('Auguste Dupin: o primeiro detetive', 'Edgar Allan Poe', 'Suspense Policial', 'https://m.media-amazon.com/images/I/71n9K7G-fUL._SL1500_.jpg'),
('O morro dos ventos uivantes', 'Emily Bronte', 'Romance', 'https://m.media-amazon.com/images/I/71sciIfdDbL._SL1500_.jpg'),
('Frankenstein', 'Mary Shelley', 'Ficção', 'https://m.media-amazon.com/images/I/71rkjneLQ4L._SL1200_.jpg'),
('Pines', 'Blake Crouch', 'Ficção Científica', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1471617928i/15096164.jpg'),
('Todos os contos', 'Clarice Lispector', 'Contos', 'https://m.media-amazon.com/images/I/81oMFht5gGL._SL1297_.jpg'),
('Vou sumir quando a vela se apagar', 'Diogo Bercito', 'Ficção', 'https://intrinseca.com.br/wp-content/uploads/2023/05/vousumirquandoavelaseapagar-G.jpg'),
('O menino do pijama listrado', 'John Boyne', 'Romance', 'https://m.media-amazon.com/images/I/91YD+gCjjyL._SL1500_.jpg'),
('Neuromancer', 'William Gibson', 'Ficção Científica', 'https://m.media-amazon.com/images/I/91Bx5ilP+EL._SL1500_.jpg'),
('Admirável mundo novo', 'Aldous Huxley', 'Distopia', 'https://m.media-amazon.com/images/I/61hOp6UFvCL._SL1500_.jpg'),
('Poesia que transforma', 'Bráulio Bessa', 'Poesia', 'https://m.media-amazon.com/images/I/61DPyFyY-uL._SL1050_.jpg'),
('Mrs. Dalloway', 'Virginia Woolf', 'Romance', 'https://m.media-amazon.com/images/I/91rOgmnZpJS._SL1500_.jpg'),
('Open Water', 'Caleb Azumah Nelson', 'Romance', 'https://m.media-amazon.com/images/I/81I+d9jWawL._SL1500_.jpg'),
('Crime e castigo', 'Fiódor Dostoiévski', 'Romance', 'https://m.media-amazon.com/images/I/71LiZ++Mc+L._SL1360_.jpg')
;

-- TABELA EMPRESTIMO : 
INSERT INTO emprestimo (data_emprestimo, data_devolucao, fk_livro, fk_usuario) VALUES
('2025-01-05', '2025-01-20', 5, 1),
('2025-02-05', '2025-02-25', 12, 1),
('2025-05-20', null, 22, 1);

INSERT INTO emprestimo (data_emprestimo, data_devolucao, fk_livro, fk_usuario) VALUES
('2025-01-05', '2025-01-15', 1, 2),
('2025-05-10', null, 18, 2);

INSERT INTO emprestimo (data_emprestimo, data_devolucao, fk_livro, fk_usuario) VALUES
('2025-01-16', '2025-02-10', 10, 3),
('2025-02-22', '2025-03-01', 20, 3),
('2025-03-03', '2025-03-15', 3, 3),
('2025-05-25', null, 30, 3);

INSERT INTO emprestimo (data_emprestimo, data_devolucao, fk_livro, fk_usuario) VALUES
('2025-05-02', null, 8, 4);

INSERT INTO emprestimo (data_emprestimo, data_devolucao, fk_livro, fk_usuario) VALUES
('2025-01-07', '2025-01-25', 25, 5),
('2025-01-31', '2025-02-28', 15, 5),
('2025-04-28', null, 33, 5);

INSERT INTO emprestimo (data_emprestimo, data_devolucao, fk_livro, fk_usuario) VALUES
('2025-01-08', '2025-01-22', 2, 6),
('2025-03-06', '2025-03-28', 28, 6),
('2025-05-28', null, 38, 6);

INSERT INTO emprestimo (data_emprestimo, data_devolucao, fk_livro, fk_usuario) VALUES
('2025-04-05', '2025-04-15', 17, 7);

-- TABELA PERGUNTAS:
INSERT INTO pergunta (idPergunta, enunciado, alternativaA, alternativaB, alternativaC, alternativaD, respostaCorreta) VALUES
(1, 'Quem escreveu "Dom Quixote"?', 'José Saramago', 'Miguel de Cervantes', 'Machado de Assis', 'William Shakespeare', 'alternativaB'),
(2, 'Quem é o autor de "O Pequeno Príncipe"?', 'Victor Hugo', 'Charles Dickens', 'Antoine de Saint-Exupéry', 'Jean-Paul Sartre', 'alternativaC'),
(3, 'Quem é o autor de "Dom Casmurro"?', 'Machado de Assis', 'Carlos Drummond de Andrade', 'José de Alencar', 'Clarice Lispector', 'alternativaA'),
(4, 'De qual livro é a personagem “Capitu”?', 'Senhora', 'Memórias Póstumas de Brás Cubas', 'Dom Casmurro', 'A Moreninha', 'alternativaC'),
(5, 'De qual livro pertence o trecho: “Quando Gregor Samsa acordou …”?', '1984', 'A Metamorfose', 'O Processo', 'Admirável Mundo Novo', 'alternativaB'),
(6, 'No livro Percy Jackson e o ladrão de raios, quem rouba o raio de Zeus?', 'Luke', 'Grover', 'Annabeth', 'Percy', 'alternativaA'),
(7, 'Percy Jackson é filho de qual deus?', 'Hades', 'Apolo', 'Zeus', 'Poseidon', 'alternativaD'),
(8, 'Qual o acampamento onde ficam os semideuses em Percy Jackson?', 'Acampamento dos Heróis', 'Acampamento Júpiter', 'Acampamento Olimpo', 'Acampamento Meio‑Sangue', 'alternativaD'),
(9, 'Quem é o vilão final na saga Percy Jackson?', 'Gaia', 'Cronos', 'Luke', 'Hades', 'alternativaB'),
(10, 'Qual a casa do Harry Potter?', 'Corvinal', 'Grifinória', 'Sonserina', 'Lufa-Lufa', 'alternativaB'),
(11, 'Qual o patrono do Harry Potter?', 'Fênix', 'Cervo', 'Coruja', 'Lobo', 'alternativaB'),
(12, 'Qual o nome do bicho de estimação do Harry Potter?', 'Edwiges', 'Fofo', 'Trevor', 'Bichento', 'alternativaA'),
(13, 'Em qual livro do Harry Potter o Basilisco aparece?', 'A Câmara Secreta', 'O Cálice de Fogo', 'A Pedra Filosofal', 'O Prisioneiro de Azkaban', 'alternativaA'),
(14, 'Que animal é o basilisco em Harry Potter?', 'Um hipogrifo', 'Um trasgo', 'Um dragão', 'Uma serpente', 'alternativaD'),
(15, 'Qual o nome dos pais de Harry Potter?', 'Tiago e Alice Potter', 'Sirius e Marlene Potter', 'Lilian e Tiago Potter', 'Lilian e Severo Potter', 'alternativaC'),
(16, 'Qual o formato da cicatriz de Harry Potter?', 'Uma lua', 'Uma estrela', 'Um raio', 'Um círculo', 'alternativaC'),
(17, 'Qual feitiço Voldemort lançou que causou a cicatriz de Harry?', 'Avada Kedavra', 'Expelliarmus', 'Crucio', 'Imperio', 'alternativaA'),
(18, 'Qual feitiço faz objetos flutuarem em Harry Potter?', 'Accio', 'Expelliarmus', 'Lumos', 'Wingardium Leviosa', 'alternativaD'),
(19, 'Qual o nome da autoridade máxima em 1984?', 'Grande Mestre', 'Senhor Supremo', 'Big Data', 'O Grande Irmão', 'alternativaD'),
(20, 'Quem é o autor de “David Copperfield”, “Um Conto de Natal”…?', 'George Orwell', 'Charles Dickens', 'Jules Verne', 'Mark Twain', 'alternativaB'),
(21, 'Quem é Frankenstein?', 'Um mecânico', 'Um cientista', 'Um viajante', 'Um monstro', 'alternativaB'),
(22, 'Quem escreveu “Frankenstein”?', 'Bram Stoker', 'Edgar Allan Poe', 'Jane Austen', 'Mary Shelley', 'alternativaD'),
(23, 'Jane Austen escreveu quais livros?', 'Orgulho e Preconceito, Razão e Sensibilidade e Emma', 'Dom Casmurro, Senhora, Lucíola', 'A Ilíada, A Odisseia, Emma', 'Jane Eyre, O Morro dos Ventos Uivantes, Emma', 'alternativaA'),
(24, 'Em que país se passa “O Corcunda de Notre Dame”?', 'Inglaterra', 'Itália', 'França', 'Espanha', 'alternativaC'),
(25, 'Quasímodo é personagem de qual livro?', 'Os Três Mosqueteiros', 'Notre-Dame de Paris', 'Os Miseráveis', 'O Corcunda de Notre Dame', 'alternativaD'),
(26, 'Por que Jean Valjean foi preso?', 'Porque roubou um pão', 'Porque cometeu assassinato', 'Porque traiu o rei', 'Porque fugiu da prisão', 'alternativaA'),
(27, 'Qual o livro mais vendido do mundo?', 'A Bíblia', 'Dom Quixote', 'O Alquimista', 'Harry Potter', 'alternativaA'),
(28, 'Quem adotou Cosette em “Os Miseráveis”?', 'Jean Valjean', 'Javert', 'Fantine', 'Thénardier', 'alternativaA'),
(29, 'Quais desses livros a Colleen Hoover escreveu?', 'Iracema', 'Hipótese do Amor', 'Os Instrumentos Mortais', 'É Assim que Acaba', 'alternativaD'),
(30, 'Quem são os protagonistas de “Heartstopper”?', 'Harry e Louis', 'Simon e Bram', 'Alex e Henry', 'Nick Nelson e Charlie Spring', 'alternativaD'),
(31, 'Qual esporte Nick pratica em “Heartstopper”?', 'Tênis', 'Rugby', 'Futebol', 'Basquete', 'alternativaB'),
(32, 'Quem é a protagonista de “Amor & Gelato”?', 'Anna Oliphant', 'Mia Thermopolis', 'Lina Emerson', 'Ellie Harper', 'alternativaC'),
(33, 'Quem queima os livros em “Fahrenheit 451”?', 'Políticos', 'Militares', 'Professores', 'Bombeiros', 'alternativaD'),
(34, '“Admirável Mundo Novo”, “O Conto da Aia” e “Laranja Mecânica” são…', 'Distopia', 'Fantasia', 'Romance', 'Drama', 'alternativaA'),
(35, 'Quem é o autor de “A Culpa é das Estrelas”?', 'Stephen Chbosky', 'Nicholas Sparks', 'Colleen Hoover', 'John Green', 'alternativaD'),
(36, 'Quem é o protagonista de “Quem é Você, Alasca?”', 'Alasca', 'Miles', 'Chip', 'Takumi', 'alternativaB'),
(37, 'Qual livro de Neil Gaiman virou animação famosa?', 'Sandman', 'Coraline', 'Lobos Dentro das Paredes', 'Deuses Americanos', 'alternativaB'),
(38, 'Qual destas é uma graphic novel de Neil Gaiman?', 'Coraline', 'Sandman', 'Lugar Nenhum', 'O Oceano no Fim do Caminho', 'alternativaB'),
(39, 'Qual o nome verdadeiro do Sandman?', 'Desejo', 'Destino', 'Sonho', 'Morpheu', 'alternativaD'),
(40, 'Quem é a protagonista de “A Hora da Estrela”?', 'Macabéa', 'Maria', 'Clarice', 'Glória', 'alternativaA'),
(41, 'Quem escreveu “O Senhor dos Anéis”?', 'George R.R. Martin', 'J.R.R. Tolkien', 'C.S. Lewis', 'Rick Riordan', 'alternativaB'),
(42, 'Qual o nome da espada de Aragorn?', 'Glamdring', 'Andúril', 'Narsil', 'Excalibur', 'alternativaB'),
(43, 'Qual a identidade do Batman?', 'Bruce Wayne', 'Clark Kent', 'Peter Parker', 'Tony Stark', 'alternativaA'),
(44, 'Quem escreveu “O Iluminado”?', 'Stephen King', 'H.P. Lovecraft', 'Edgar Allan Poe', 'Dan Brown', 'alternativaA'),
(45, 'Quem é a protagonista de “Jogos Vorazes”?', 'Tris Prior', 'Katniss Everdeen', 'Clary Fray', 'Hermione Granger', 'alternativaB'),
(46, 'Qual é o distrito de Katniss?', 'Distrito 12', 'Distrito 2', 'Distrito 4', 'Distrito 11', 'alternativaA'),
(47, 'Quem escreveu “O Código Da Vinci”?', 'Ken Follett', 'Dan Brown', 'Robert Langdon', 'James Dashner', 'alternativaB'),
(48, 'Qual criatura espreita o labirinto em “Maze Runner”?', 'Grievers', 'Demogorgon', 'Rastreador', 'Mandingueiro', 'alternativaA'),
(49, 'Quem é o autor de “As Crônicas de Nárnia”?', 'J.R.R. Tolkien','C.S. Lewis', 'Philip Pullman', 'Rick Riordan', 'alternativaB'),
(53, 'Qual destes livros foi escrito por Graciliano Ramos?', 'Vidas Secas', 'Capitães da Areia', 'O Mulato', 'Senhora', 'alternativaA'),
(57, 'Quem escreveu “Vidas Secas”?', 'Érico Veríssimo', 'Jorge Amado', 'Graciliano Ramos', 'Carlos Drummond de Andrade', 'alternativaC'),
(58, 'Qual é o nome do cachorro em “Vidas Secas”?', 'Fera', 'Baleia', 'Pantera', 'Lua', 'alternativaB');


-- SELECTS :
SELECT * FROM usuario;
SELECT * FROM livro;
SELECT * FROM emprestimo;
SELECT * FROM pontuacao_quiz;
SELECT * FROM livro_favoritado ;

-- PARA MOSTRAR O EMPRESTIMO DO USUÁRIO:
SELECT idEmprestimo, data_emprestimo, data_devolucao, titulo, nome, email FROM emprestimo 
INNER JOIN livro ON fk_livro = idLivro
INNER JOIN usuario ON fk_usuario = idUsuario;

-- MOSTRAR TODOS LIVROS E SE ESTÃO DISPONÍVEIS:
SELECT idLivro, titulo, autor, genero, url_capa, NOT EXISTS (
SELECT 1 FROM emprestimo WHERE fk_livro = idLivro AND data_devolucao IS NULL 
) AS disponivel FROM livro ORDER BY titulo;

-- DATEDIFF: PEGA A QUANTIDADE DE DIAS ENTRE DUAS DATAS, NESSE CASO CURRENT_DATE() e data_emprestimo
SELECT DATEDIFF(CURRENT_DATE(), data_emprestimo)) AS 'Duração empréstimo atual' 
FROM emprestimo WHERE fk_usuario = 1 AND data_devolucao IS NULL;

-- MOSTRA A QUANTIDADE DE EMPRESTIMO FEITO POR UM USUÁRIO:
SELECT count(fk_usuario) AS 'Quantidade de emprestimos' FROM emprestimo WHERE fk_usuario = 1;

-- MOSTRA A QUANTIDADE  EMPESTIMO POR GÊNERO LITERÁRIO DE UM USUARIO
SELECT genero, count(*) AS 'Quantidade por gênero' FROM emprestimo 
INNER JOIN livro
ON fk_livro = idLivro WHERE fk_usuario = 1
GROUP BY genero;

-- MOSTRA A QUANTIDADE DE LIVROS POR AUTOR:
SELECT autor, count(*) AS 'Quantidade de livros por autor' FROM livro  GROUP BY autor;


-- QUERY PARA KPI : "melhor pontuação no quiz"  - MOSTRA A PONTUAÇÃO MÁXIMA NO QUIZ DE UM USUÁRIO :
SELECT ifnull(max(qtd_pontos), 0) AS 'Pontuação máxima' FROM pontuacao_quiz WHERE fk_usuario = 1;

-- ESSA QUERY PARA O GRÁFICO "Histórico de pontuação do Quiz"
SELECT qtd_pontos AS 'Pontuação por tentativa' FROM pontuacao_quiz WHERE fk_usuario = 1;

-- 
SELECT generoFavorito AS 'Genero favorito', count(idUsuario) AS 'Quantidade de usuários' FROM usuario
GROUP BY generoFavorito;

SELECT titulo, count(*)  AS 'QUANTIDADE EMPRESTIMOS' From emprestimo INNER JOIN livro
ON fk_livro = idLivro 
GROUP BY titulo  ORDER BY count(*) DESC
 limit 3 ; 
 
 SELECT * FROM emprestimo inner join livro 
 on fk_livro = idLivro;
 
 -- para a tabela de livro_favotitado
 SELECT count(*) FROM livro_favoritado WHERE fk_usuario = 1;
 
 SELECT livro.titulo, concat(usuario.nome, usuario.sobrenome) AS 'Nome do usuário';

SELECT livro.titulo, count(*) AS 'x favoritado ' FROM livro 
JOIN livro_favoritado ON idLivro = fk_livro 
GROUP BY livro.titulo
ORDER BY count(idLivro) DESC
limit 5;