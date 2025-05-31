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
editora VARCHAR(45) NOT NULL,
data_publicacao DATE NOT NULL,
genero VARCHAR(50) NOT NULL,
descricao VARCHAR(2000) NOT NULL,
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
CONSTRAINT pkComposta_livroFavoritado PRIMARY KEY (fk_usuario, fk_livro),
CONSTRAINT fkUsuario_livroFavoritado FOREIGN KEY (fk_usuario) REFERENCES  usuario(idUsuario),
CONSTRAINT fk_livro_livroFavoritado FOREIGN KEY (fk_livro) REFERENCES livro(idLivro)
); 

-- INSERTS:
-- TABELA USUARIO:
INSERT INTO usuario (idUsuario, nome, sobrenome, email, telefone, senha) VALUES
(1, 'Ana', 'Silva', 'ana.silva@email.com', '11912345678', 'senhaSegura123'),
(2, 'Bruno', 'Santos', 'bruno.santos@email.com', '11998765432','outraSenhaForte456'),
(3, 'Carla', 'Oliveira', 'carla.oliveira@email.com', '11987654321','meuAcesso789'),
(4, 'Daniel', 'Pereira', 'daniel.pereira@email.com', '11934567890','senha123#Teste'),
(5, 'Eduarda', 'Costa', 'eduarda.costa@email.com','11976543210','forteSenha!2024'),
(6, 'Fernando', 'Almeida', 'fernando.almeida@email.com','11965432109','sistemaSeguro@1'),
(7, 'Gabriela', 'Lima', 'gabriela.lima@email.com', '11923456789',  'acessoAdmin!*');

-- TABELA LIVRO:
INSERT livro(titulo, autor, editora, data_publicacao, genero, descricao, url_capa) VALUES
('Jujutsu Kaisen Vol. 0', 'Gege Akutami', 'Panini', '2021-02-01', 'Mangá', 'Tem inicio o Intercambio da Escola Irma de Kyoto. O primeiro dia do torneio em equipe tera como vencedor o grupo que exorcizar primeiro uma maldicao de nivel 2, mas o briguento Todou ataca de surpresa o grupo da Escola de Tokyo, e Itadori recebe a tarefa de enfrenta-lo. O que ele nao esperava e que o restante da equipe da Escola de Kyoto apareceria para se juntar ao confronto!!', 'https://m.media-amazon.com/images/I/61ResbP4aPL._AC_SL1000_.jpg'),
('Jujutsu Kaisen Vol. 1', 'Gege Akutami', 'Panini', '2020-07-08', 'Mangá', 'Apesar do estudante colegial Yuuji Itadori ter grande forca fisica, ele se inscreve no Clube de Ocultismo. Certo dia, eles encontram um "objeto amaldicoado" e retiram o selo, atraindo criaturas chamadas de "maldicoes". Itadori corre em socorro de seus colegas, mas sera que ele sera capaz de abater essas criaturas usando apenas a forca fisica?!', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_o8j2ls1oep5h5dd1eu70smtk19/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 2', 'Gege Akutami', 'Panini', '2020-09-24', 'Mangá', 'Um utero amaldicoado surge repentinamente em um reformatorio. Itadori e seus colegas do primeiro ano foram designados para salvar as pessoas que nao conseguiram fugir do edificio! Mas o grupo depara-se com uma situacao desesperadora: o utero se transformou em um espirito amaldicoado de nivel especial. Itadori tenta revidar, trocando de corpo com Sukuna, mas sera que o plano vai dar certo?!', 'https://m.media-amazon.com/images/I/91MAequ2koL._AC_SL1500_.jpg'),
('Jujutsu Kaisen Vol. 3', 'Gege Akutami', 'Panini', '2020-11-10', 'Mangá', 'Aoi Toudou e Mai Zenin, da Escola Tecnica Superior de Jujutsu de Kyoto, aparecem diante de Fushiguro e Kugisaki! O que Fushiguro respondeu para Toudou, quando questionado sobre o tipo de garota que ele gosta? Enquanto isso, Itadori e enviado para o local em que um espirito amaldicoado provocou um incidente, fazendo com que o feiticeiro treine suas habilidades na pratica!', 'https://m.media-amazon.com/images/I/816m3mfx21L._AC_SL1500_.jpg'),
('Jujutsu Kaisen Vol. 4', 'Gege Akutami', 'Panini', '2021-02-01', 'Mangá', 'Itadori investiga os assassinatos causados por uma maldição e acaba conhecendo Junpei, um garoto que é fascinado por Mahito, o responsável pelas mortes. Qual será a reação de Itadori ao ver o novo amigo transformado em fantoche da maldição?', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_r3gaebi2rp25t3ffkj8t0nuh67/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 5', 'Gege Akutami', 'Panini', '2021-04-16', 'Mangá', 'Tem início o Intercâmbio da Escola Irmã de Kyoto. O primeiro dia do torneio em equipe terá como vencedor o grupo que exorcizar primeiro uma maldição de nível 2, mas o briguento Todou ataca de surpresa o grupo da Escola de Tokyo, e Itadori recebe a tarefa de enfrentá-lo. O que ele não esperava é que o restante da equipe da Escola de Kyoto apareceria para se juntar ao confronto!!', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_t7r8mupril20d2n9hghv12tf1g/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 7', 'Gege Akutami', 'Panini', '2021-07-09', 'Mangá', 'Os feiticeiros repelem o ataque da maldição especial Hanami, mas os dedos do Sukuna e os fetos das Pinturas da Morte, sob a guarda da Escola de Jujutsu, são roubados. Uma nova ameaça surge com a encarnação das Pinturas da Morte. Desconhecendo esse perigo, Itadori e seus amigos são incumbidos da missão de exorcizar uma maldição que ataca perto de portas.', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_mccijejbnh7u51i3umnj1egb3t/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 9', 'Gege Akutami', 'Panini', '2021-09-09', 'Mangá', 'Gojou e Getou receberam a missão de proteger o receptáculo da estrela, mas são atacados de surpresa pelo ´assassino de feiticeiros´, Touji Fushiguro. O que parece ter sido uma derrota completa da dupla de estudantes dá lugar a uma reviravolta. Qual será o desfecho deste caso do passado que fez de Gojou o mais poderoso feiticeiro do mundo e contribuiu para que Getou abandonasse a Escola de Jujutsu?', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_hucajabqdt2r98ta1r8elmtr0o/-S897-FWEBP'),
('Jujutsu Kaisen Vol. 10', 'Gege Akutami', 'Panini', '2021-10-08', 'Mangá', 'Para reaver seu corpo físico, Mekamaru, ou melhor, Kokichi Muta, se alia aos espíritos amaldiçoados. Mas o acordo entre eles é quebrado e o estudante se vê enfrentando Mahito. Será que Muta conseguirá escapar da morte com sua técnica secreta? Enquanto isso, em 31 de outubro, uma cortina recai sobre um distrito de Tokyo, marcando o início do ´Incidente em Shibuya´.', 'https://d14d9vp3wdof84.cloudfront.net/image/589816272436/image_riu7jt5e3h6l11db27mollbc6h/-S897-FWEBP'),
('Boa Noite Punpun Vol. 1', 'Inio Asano', 'JBC', '2007-08-03', 'Mangá', 'Punpun Onodera é um garoto normal, que vive feliz com sua família. Um dia, Aiko Tanaka é transferida para a sua escola. Foi paixão à primeira vista!! Voltando juntos para casa, ela conta que no futuro, “a Terra vai se tornar um planeta inabitável”. É nessa hora que Punpun decide ser um cientista espacial. Porém, bem quando encontra seu objetivo na vida, a sua realidade começa a desmoronar. Considerado por muitos como a obra-prima do aclamado Inio Asano, Boa Noite Punpun é um slice of life que trata de temas delicados como solidão, relações familiares conturbadas e depressão', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2018/12/Boa-Noite-Punpun-01-Capa_p.jpg'),
('Boa Noite Punpun Vol. 2', 'Inio Asano', 'JBC', '2008-12-01', 'Mangá', 'Depois que seu pai foi embora, Punpun começou a morar com a mãe e o tio Yuuichi. O garoto, agora no ginasial, está na mesma classe que seus amigos. Porém, ele não está mais falando com Aiko, a garota por quem era apaixonado desde pequeno. Ela começou a sair com um veterano do clube de badminton e, agora, a vida de Punpun virou um verdadeiro inferno!!', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2018/12/Boa-Noite-Punpun-02-Capa_p-300x455.jpg'),
('Boa Noite Punpun Vol. 3', 'Inio Asano', 'JBC', '2014-11-07', 'Mangá', 'Depois de um ginásio sem muitas emoções, Punpun agora é um estudante colegial. Porém, o tio Yuuichi continua desaparecido!! O que o garoto, sua mãe e Midori farão?! Enquanto planejavam sua mudança e procuravam pelo tio, um incidente faz a vida de Punpun se transformar aos poucos…', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/03/Boa-Noite-Punpun-03-Capa_p-300x455.jpg'),
('Boa Noite Punpun Vol. 4', 'Inio Asano', 'JBC', '2016-12-20', 'Mangá', 'Querendo fugir dos problemas à sua volta, Punpun começa a morar sozinho. Ele tenta viver como um garoto normal, sem causar problemas aos outros, mas o encontro inesperado com a misteriosa garota chamada Sachi vai fazer sua vida dar uma grande reviravolta!', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/03/Boa-Noite-Punpun-04-Capa_p.jpg'),
('Boa Noite Punpun Vol. 5', 'Inio Asano', 'JBC', '2019-08-31', 'Mangá', 'Ao encontrar a felicidade, Punpun finalmente acha o seu lugar. Nessa hora, um incidente e o reencontro com uma certa pessoa fazem a vida do jovem entrar em colapso mais uma vez, e sua alegria começa a ruir aos poucos… Quando tudo parece estar caindo de uma grande montanha-russa, será que é possível achar seu lugar debaixo do Sol?', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/05/Boa-Noite-Punpun-05-Capa_p-300x455.jpg'),
('Boa Noite Punpun Vol. 6', 'Inio Asano', 'JBC', '2019-08-31', 'Mangá', 'Depois de finalmente se encontrar com a garota por quem era apaixonado desde pequeno, Punpun se sente realizado. Porém, esse encontro abriu as portas para um futuro de desespero, do qual eles não podem escapar', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/05/Boa-Noite-Punpun-06-Capa_p-300x455.jpg'),
('Boa Noite Punpun Vol. 7', 'Inio Asano', 'JBC', '2019-08-31', 'Mangá', 'Punpun e Aiko abandonam tudo e fogem para outra cidade. Qual o destino reservado para o casal que apenas quer ser feliz? Eis o volume final de Boa Noite Punpun.', 'https://www.jbchost.com.br/editorajbc/wp-content/uploads/2019/07/Boa-Noite-Punpun-07-Capa_p-300x455.jpg'),
('Homens pretos (não) choram', 'Stefano Volp', 'HarperCollins', '2022-02-15', 'Contos', 'O homem negro tem espaço para ser vulnerável? Esse homem pode chorar e existir ao mesmo tempo? Com três contos inéditos, nesta nova edição de Homens pretos (não) choram , Stefano Volp joga luz sobre as feridas, os medos e a solidão do homem, sobretudo o negro, para buscar respostas sobre uma sociedade incapaz de compreender as vulnerabilidades e sutilezas que existem para além da imagem que se constrói das pessoas.', 'https://m.media-amazon.com/images/I/819rDqgZ2yL._SL1500_.jpg'),
('O beijo do rio', 'Stefano Volp', 'HarperCollins', '2022-07-15', 'Suspense', 'O solitário Daniel é um jornalista negro que escreve para a seção investigativa de uma revista independente. Ao saber da trágica morte de Romeu, seu melhor amigo de infância, ele decide voltar à sua cidade natal, Ubiratã, para investigar o caso, o qual a polícia prontamente concluiu ter sido suicídio. Após dez anos longe, Daniel se vê de volta à pequena cidade onde cresceu. Seu regresso à casa é problemático. Bissexual, ele sempre se sentiu deslocado naquele bairro separado do resto da cidade por um rio. A nova companhia de teatro, figuras políticas da cidade, os membros de uma seita religiosa e famílias que não querem ser incomodadas são viradas de cabeça para baixo com a presença do jornalista e sua investigação criminal.Há, também, algo do passado de Daniel de que ele não consegue – ou não quer – lembrar. Em vez de memórias, tem visões de um menino, que aparece para ele com mensagens indecifráveis. Agora, quanto mais se aproxima da verdade, mais visões tem e mais ele deve descobrir sobre si mesmo.', 'https://m.media-amazon.com/images/I/91ULbf+vDsL._SL1500_.jpg'),
('O segredo das larvas', 'Stefano Volp', 'Record', '2024-05-06', 'Ficção Científica Distópica', 'Em um futuro não tão distante, Freya mora em uma colônia onde pessoas de pele negra são confinadas. Lá, além de lidar com os transtornos mentais da mãe, ela vive constantemente assombrada pela Filtragem, o programa da metrópole que promete selecionar as garotas mais belas para passarem o restante de suas vidas em Éden, desfrutando dos privilégios da capital tão desejada. Apesar de não conhecer o mundo do outro lado da cerca, Freya se recusa a acreditar nessas promessas. Ela tem certeza de que a convocação é um disfarce para os piores pesadelos. Algo terrível acontece nas beiras do mundo e as garotas filtradas correm perigo. Freya sabe de tudo isso porque sua própria mãe foi uma Filtrada. A única que retornou...', 'https://m.media-amazon.com/images/I/81kiI-Did+L._SL1500_.jpg'),
('Nunca vi a chuva', 'Stefano Volp', 'Record', '2023-05-29', 'Ficção', 'Em teoria, Lucas parece ter a vida perfeita. Adotado por uma família rica, ele mora em Portugal, tem amigos e uma namorada que ama. Mas se não há nada do que reclamar, então de onde vem esse vazio que não consegue evitar sentir? Quando as brigas com os pais e uma desilusão amorosa o levam a um limite do qual já se aproximava a passos largos, o jovem decide que não há mais motivo para viver. Prestes a tomar uma decisão da qual não há retorno, uma mensagem em seu celular o faz repensar tudo: um vídeo de alguém idêntico a ele, exceto pelo fato de ter uma deficiência visual. Incrédulo com essa reviravolta, Lucas resolve abandonar a vida em Portugal e partir rumo ao interior do Rio de Janeiro atrás de respostas sobre quem é o seu gêmeo e o que isso pode revelar sobre seu passado. Escrito em forma de diário a partir do olhar e da narrativa inconfundíveis de Stefano Volp, um dos grandes novos nomes da literatura brasileira, Nunca vi a chuva é um relato intimista e profundo de um jovem descobrindo seu caminho e seu lugar no mundo.', 'https://m.media-amazon.com/images/I/816jlkYJutL._SL1500_.jpg'),
('Pequena Coreografia do Adeus', 'Aline Bei', 'Companhia das Letras', '2021-04-26', 'Ficção', 'Julia é filha de pais separados: sua mãe não suporta a ideia de ter sido abandonada pelo marido, enquanto seu pai não suporta a ideia de ter sido casado. Sufocada por uma atmosfera de brigas constantes e falta de afeto, a jovem escritora tenta reconhecer sua individualidade e dar sentido à sua história, tentando se desvencilhar dos traumas familiares.', 'https://m.media-amazon.com/images/I/9157mzaUZ1L._SL1500_.jpg'),
('O Meu Pé de Laranja Lima', 'José Mauro de Vasconcelos', 'Melhoramentos', '2019-05-01', 'Ficção', 'O protagonista Zezé tem 6 anos e mora num bairro modesto, na zona norte do Rio de Janeiro. O pai está desempregado, e a família passa por dificuldades. O menino vive aprontando, sem jamais se conformar com as limitações que o mundo lhe impõe – viaja com sua imaginação, brinca, explora, descobre, responde aos adultos, mete-se em confusões, causa pequenos desastres. As surras que lhe aplicam seu pai e sua irmã mais velha são seu suplício, a ponto de fazê-lo querer desistir da vida. No entanto, o apego ao mundo que criou felizmente sempre fala mais alto. Só não há remédio para a dor, para a perda. E Zezé muito cedo descobrirá isso', 'https://m.media-amazon.com/images/I/816a7zMD+FL._SL1500_.jpg'),
('Vidas Secas', 'Graciliano Ramos', 'Record', '2019-02-04', 'Clássico', 'Lançado originalmente em 1938,  Vidas secas  retrata a vida miserável de uma família de retirantes sertanejos obrigada a se deslocar de tempos em tempos para áreas menos castigadas pela seca. O pai, Fabiano, caminha pela paisagem árida da caatinga do Nordeste brasileiro com a sua mulher, Sinha Vitória, e os dois filhos, que não têm nome, sendo chamados apenas de “filho mais velho” e “filho mais novo”. São também acompanhados pela cachorrinha da família, Baleia, cujo nome é irônico, pois a falta de comida a fez muito magra.', 'https://m.media-amazon.com/images/I/71NYL2AbBIL._SL1500_.jpg'),
('Fahrenheit 451', 'Ray Bradbury', 'Biblioteca Azul', '2012-06-01', 'Ficção Científica', 'Guy Montag é um bombeiro. Sua profissão é atear fogo nos livros. Em um mundo onde as pessoas vivem em função das telas e a literatura está ameaçada de extinção, os livros são objetos proibidos, e seus portadores são considerados criminosos. Montag nunca questionou seu trabalho; vive uma vida comum, cumpre o expediente e retorna ao final do dia para sua esposa e para a rotina do lar. Até que conhece Clarisse, uma jovem de comportamento suspeito, cheia de imaginação e boas histórias. Quando sua esposa entra em colapso mental e Clarisse desaparece, a vida de Montag não poderá mais ser a mesma.', 'https://m.media-amazon.com/images/I/91WKPd60P4L._SL1500_.jpg'),
('O sol é para todos', 'Harper Lee', 'José Olympio', '2006-10-10', 'Ficção', 'Nesta emocionante história ambientada no Sul dos Estados Unidos da década de 1930, região envenenada pela violência do preconceito racial, vemos um mundo de grande beleza e ferozes desigualdades através dos olhos de uma menina de inteligência viva e questionadora, enquanto seu pai, um advogado local, arrisca tudo para defender um homem negro injustamente acusado de cometer um terrível crime.', 'https://m.media-amazon.com/images/I/91WKPd60P4L._SL1500_.jpg'),
('As intermitências da morte', 'José Saramago', 'Companhia das Letras', '2020-09-04', 'Ficção', '"Não há nada no mundo mais nu que um esqueleto", escreve José Saramago diante da representação tradicional da morte. Só mesmo um grande romancista para desnudar ainda mais a terrível figura. Apesar da fatalidade, a morte também tem seus caprichos. E foi nela que o primeiro escritor de língua portuguesa a receber o Prêmio Nobel da Literatura buscou o material para seu novo romance, As intermitências da morte.', 'https://m.media-amazon.com/images/I/71mJqFs-MpL._SL1500_.jpg'),
('Tudo é rio', 'Carla Madeira', 'Record', '2021-02-08', 'Ficção', 'Com uma narrativa madura, precisa e ao mesmo tempo delicada e poética, o romance narra a história do casal Dalva e Venâncio, que tem a vida transformada após uma perda trágica, resultado do ciúme doentio do marido, e de Lucy, a prostituta mais depravada e cobiçada da cidade, que entra no caminho deles, formando um triângulo amoroso.', 'https://m.media-amazon.com/images/I/816Udvs9O7L._SL1500_.jpg'),
('Entendendo Algoritmos', 'Aditya Bhargava', 'Novatec', '2017-04-24', 'Educacional', 'Um guia ilustrado para programadores e outros curiosos. Um algoritmo nada mais é do que um procedimento passo a passo para a resolução de um problema. Os algoritmos que você mais utilizará como um programador já foram descobertos, testados e provados. Se você quer entendê-los, mas se recusa a estudar páginas e mais páginas de provas, este é o livro certo.', 'https://m.media-amazon.com/images/I/71Vkg7GfPFL._SL1296_.jpg'),
('A Revolução dos Bichos', 'George Orwell', 'Companhia das Letras', '2007-01-10', 'Ficção', 'Com o acirramento da Guerra Fria, as mesmas razões que causaram constrangimento na época de sua publicação levaram A revolução dos bichos a ser amplamente usada pelo Ocidente nas décadas seguintes como arma ideológica contra o comunismo. O próprio Orwell, adepto do socialismo e inimigo de qualquer forma de manipulação política, sentiu-se incomodado com a utilização de sua fábula como panfleto.', 'https://m.media-amazon.com/images/I/91BsZhxCRjL._SL1500_.jpg'),
('The Outsiders: Vidas sem rumo', 'Susan Hinton', 'Intrínseca', '2020-04-16', 'Jovens e Adolescentes', 'Publicado pela primeira vez em 1967 e imortalizado em 1983 pelo filme de Francis Ford Coppola, The Outsiders: Vidas sem rumo é um clássico da literatura jovem que transformou o gênero ao tratar, com complexidade e sensibilidade, de uma juventude marginalizada em um cotidiano sombrio e violento.', 'https://m.media-amazon.com/images/I/91-hXAWKWSL._SL1500_.jpg'),
('Sete Minutos Depois da Meia-Noite', 'Patrick Ness', 'Novo Conceito', '2016-11-07', 'Ficção', 'Conor é um garoto de 13 anos e está com muitos problemas na vida. A mãe dele está muito doente, passando por tratamentos rigorosos. Os colegas da escola agem como se ele fosse invisível, exceto por Harry e seus amigos que o provocam diariamente. A avó de Conor, que não é como as outras avós, está chegando para uma longa estadia. E, além do pesadelo terrível que o faz acordar em desespero todas as noites, às 00h07 ele recebe a visita de um monstro que conta histórias sem sentido.', 'https://m.media-amazon.com/images/I/817RXVIiekL._SL1437_.jpg'),
('O Labirinto do Fauno', 'Guillermo del Toro', 'Intrínseca', '2019-07-10', 'Conto de Fadas', 'Quando estreou nos cinemas, O Labirinto do Fauno encantou público e crítica com sua história que mesclava sonho e realidade, trazendo para o universo da fantasia o cruel cotidiano da Espanha fascista de Franco. Mais de dez anos depois, a produção permanece conquistando fãs e mostrando que boas histórias são atemporais. Nesta edição mais do que especial, o escritor, diretor e roteirista mexicano Guillermo del Toro ― a mente por trás do filme e um dos artistas mais inventivos dos últimos tempos ― se une a Cornelia Funke, premiada escritora de contos de fadas modernos e autora da trilogia Mundo de Tinta, para narrar a jornada de uma menina pelo Reino dos Homens e pelo Reino Subterrâneo.', 'https://m.media-amazon.com/images/I/71+yGuF-ioL._SL1450_.jpg'),
('João e Maria', 'Neil Gaiman', 'Intrínseca', '2015-09-08', 'Conto de Fadas', 'Em um texto poético, Gaiman revive a tradição dos contos de fada, dando profundidade à aventura dos irmãos, mas sem abandonar a autenticidade e o talento único de mesclar realismo e fantasia que o transformaram em um dos maiores autores de sua geração. Mattotti, por sua vez, dá um ar inteiramente novo ao clássico. Seus traços criam um jogo de luz e sombra, permitindo que o leitor desvende aos poucos a imagem, assim como os segredos da história de João e Maria.', 'https://m.media-amazon.com/images/I/91wHSbbiwLL._SL1500_.jpg'),
('Deuses americanos', 'Neil Gaiman', 'Intrínseca', '2016-10-24', 'Ficção mitológica', 'A saga de Deuses americanos é contada ao longo da jornada de Shadow Moon, um ex-presidiário de trinta e poucos anos que acabou de ser libertado e cujo único objetivo é voltar para casa e para a esposa, Laura. Os planos de Shadow se transformam em poeira quando ele descobre que Laura morreu em um acidente de carro. Sem lar, sem emprego e sem rumo, ele conhece Wednesday, um homem de olhar enigmático que está sempre com um sorriso no rosto, embora pareça nunca achar graça de nada.', 'https://m.media-amazon.com/images/I/91MBhJ0bZFL._SL1500_.jpg'),
('O conto da aia', 'Margaret Atwood', 'Rocco', '2017-06-07', 'Distopia', 'O romance distópico O conto da aia, de Margaret Atwood, se passa num futuro muito próximo e tem como cenário uma república onde não existem mais jornais, revistas, livros nem filmes. As universidades foram extintas. Também já não há advogados, porque ninguém tem direito a defesa. Os cidadãos considerados criminosos são fuzilados e pendurados mortos no Muro, em praça pública, para servir de exemplo enquanto seus corpos apodrecem à vista de todos. Para merecer esse destino, não é preciso fazer muita coisa – basta, por exemplo, cantar qualquer canção que contenha palavras proibidas pelo regime, como "liberdade". Nesse Estado teocrático e totalitário, as mulheres são as vítimas preferenciais, anuladas por uma opressão sem precedentes. O nome dessa república é Gilead, mas já foi Estados Unidos da América.', 'https://m.media-amazon.com/images/I/91nJArLKIJL._SL1500_.jpg'),
('Caixa de pássaros', 'Josh Malerman', 'Intrínseca', '2015-01-21', 'Distopia', 'Quatro anos depois de as mortes terem começado, há poucos sobreviventes em Michigan. Malorie e seus dois filhos pequenos estão entre eles. O trio faz parte do grupo que tenta resistir em um mundo no qual abrir os olhos pode ser fatal. Vivendo em uma casa abandonada, Malorie e os filhos não sabem o que se passa do lado de fora. Sempre com as janelas e portas cobertas e sem comunicação com o exterior, o local é uma área isolada no meio do caos. Até o momento em que uma misteriosa neblina atinge a região e Malorie toma uma decisão que adiou por muito tempo. Após quatro anos trancados, Malorie e as crianças fogem da casa em um barco a remo na esperança de encontrar um lugar distante do surto que matou todos ao seu redor. De olhos tapados, os três encaram uma viagem assustadora rumo ao desconhecido.', 'https://m.media-amazon.com/images/I/81QQBJu1voL._SL1419_.jpg'),
('Pessoas normais', 'Sally Rooney', 'Companhia das Letras', '2019-09-30', 'Romance', 'Na escola, no interior da Irlanda, Connell e Marianne fingem não se conhecer. Ele é a estrela do time de futebol, ela é solitária e preza por sua privacidade. Mas a mãe de Connell trabalha como empregada na casa dos pais de Marianne, e quando o garoto vai buscar a mãe depois do expediente, uma conexão estranha e indelével cresce entre os dois adolescentes ― contudo, um deles está determinado a esconder a relação.', 'https://m.media-amazon.com/images/I/71jrp43TCcL._SL1500_.jpg'),
('Alice no país das maravilhas', 'Lewis Carroll', 'Cosacnaify', '2018-03-08', 'Contos Infanto Juvenil', 'Essa constelação de jogos de palavras, trocadilhos, alusões culturais de todo tipo não se dirige preferencialmente ao adulto (como a de Sebastião Uchoa Leite) nem à criança brasileira (como a minha), mas se equilibra com êxito (como a de Maria Luísa Borges) numa delicada corda-bamba. Alice é uma obra infinita em suas possibilidades de leitura. Mas esta, ilustrada por Luiz Zerbini, é um deslumbramento para os olhos.', 'https://m.media-amazon.com/images/I/71W71CNo9ZL._SL1358_.jpg'),
('A natureza da mordida', 'Carla Madeira', 'Record', '2022-11-21', 'Ficção Literária', 'Com alternância entre as vozes, a força narrativa objetiva, descritiva e linear de Olívia contrapõe-se às anotações esparsas de Biá, cujos fragmentos de uma memória já falha e pouco confiável conduzem a um ponto de virada na trama que irá revelar ao leitor eventos que marcaram o passado de cada uma, evidenciando o paralelo entre as diferentes formas de abandono sofridas (e perpetradas) pelas duas amigas. Ao conhecer Olívia, o leitor é preparado para compreender Biá e, finalmente, refletir sobre a pergunta: o que faríamos em seu lugar?', 'https://m.media-amazon.com/images/I/71zDFgnh8-L._SL1500_.jpg'),
('A metamorfose', 'Franz Kafka', 'Principis', '2019-09-27', 'Ficção', 'O caixeiro-viajante Gregor acorda metamorfoseado em um enorme inseto e percebe que tudo mudou e não só em sua vida, mas no mundo. Ele, então, acompanha as reações de sua família ao perceberem o estranho ser em que ele se tornou. E, enquanto luta para se manter vivo, reflete sobre o comportamento de seus pais, de sua irmã e sobre a sua nova vida', 'https://m.media-amazon.com/images/I/715JOcuqSSL._SL1021_.jpg'),
('Santo de casa', 'Stefano Volp', 'Record', '2025-02-17', 'Ficção', 'Três irmãos, Alan, Alex e Betina, se reúnem para organizar o velório do pai, Zé Maria, após sua morte trágica. Enquanto a cidade realiza uma procissão para se despedir de um morador benquisto, Rute, a mãe, e os três filhos atravessam as complexidades do luto: apesar da saudade, o patriarca deixou na família marcas de violência e opressão.', 'https://m.media-amazon.com/images/I/71LyJPj6E7L._SY466_.jpg'),
('O avesso da pele', 'Jeferson Tenório', 'Companhia das Letras', '2020-08-10', 'Ficção', 'O avesso da pele é a história de Pedro, que, após a morte do pai, sai em busca de resgatar o passado da família e refazer os caminhos paternos. Com uma narrativa sensível e por vezes brutal, Jeferson Tenório traz à superfície um país marcado pelo racismo e por um sistema educacional falido, e um denso relato sobre as relações entre pais e filhos. O que está em jogo é a vida de um homem abalado pelas inevitáveis fraturas existenciais da sua condição de negro em um país racista, um processo de dor, de acerto de contas, mas também de redenção, superação e liberdade. Com habilidade incomum para conceber e estruturar personagens e de lidar com as complexidades e pequenas tragédias das relações familiares, Jeferson Tenório se consolida como uma das vozes mais potentes e estilisticamente corajosas da literatura brasileira contemporânea.', 'https://m.media-amazon.com/images/I/81p29WCHFaL._SL1500_.jpg'); 

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
(29, 'Que tipo de livros Colleen Hoover escreve?', 'Romances policiais', 'Livros infantis', 'Biografias', 'Livros da Colleen Hoover', 'alternativaD'),
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

-- :
SELECT idLivro, titulo, autor, editora, data_publicacao, genero, descricao, url_capa, NOT EXISTS (
SELECT 1 FROM emprestimo WHERE fk_livro = idLivro AND data_devolucao IS NULL 
) AS disponivel FROM livro ORDER BY titulo;


-- DATEDIFF : PEGA A QUANTIDADE DE DIAS ENTRE DUAS DATAS, NESSE CASO data_devolucao e data_emprestimo
SELECT TRUNCATE(AVG(DATEDIFF(IFNULL(data_devolucao, CURRENT_DATE()), data_emprestimo)), 0) AS 'Duração média dos empréstimos' 
FROM emprestimo WHERE fk_usuario = 1;

-- MOSTRA A QUANTIDADE DE EMPRESTIMO FEITO POR UM USUÁRIO:
SELECT count(fk_usuario) AS 'Quantidade de emprestimos' FROM emprestimo WHERE fk_usuario = 1;

-- MOSTRA A QUANTIDADE  EMPESTIMO POR GÊNERO LITERÁRIO DE UM USUARIO
SELECT genero, count(*) AS 'Quantidade por genero' FROM emprestimo 
INNER JOIN livro
ON fk_livro = idLivro WHERE fk_usuario = 1
GROUP BY genero;

-- MOSTRA A QUANTIDADE DE LIVROS POR AUTOR:
SELECT autor, count(*) AS 'Quantidade de livros por autor' FROM livro  GROUP BY autor;


-- QUERY PARA KPI : "melhor pontuação no quiz"  - MOSTRA A PONTUAÇÃO MÁXIMA NO QUIZ DE UM USUÁRIO :
SELECT max(qtd_pontos) AS 'Pontuação máxima' FROM pontuacao_quiz where fk_usuario = 1;

-- ESSA QUERY PARA O GRÁFICO "Histórico de pontuação do Quiz"
SELECT qtd_pontos as 'Pontuação por tentativa' FROM pontuacao_quiz WHERE fk_usuario = 1;

-- 
SELECT generoFavorito AS 'Genero favorito', count(idUsuario) AS 'Quantidade de usuários' FROM usuario
GROUP BY generoFavorito;

SELECT titulo, count(*)  AS 'QUANTIDADE' From emprestimo INNER JOIN livro
ON fk_livro = idLivro 
GROUP BY titulo  ORDER BY count(*) DESC
 limit 3 ; 
 
 SELECT * FROM emprestimo inner join livro 
 on fk_livro = idLivro;
 
 -- para a tabela de livro_favotitado
 SELECT count(*) FROM livro_favoritado WHERE fk_usuario = 1;
 
 SELECT livro.titulo, concat(usuario.nome, usuario.sobrenome) AS 'Nome do usuário';

SELECT livro.titulo, count(idLivro) AS 'x favoritado ' FROM livro JOIN livro_favoritado 
ON idLivro = fk_livro 
GROUP BY livro.titulo
ORDER BY count(idLivro) 
limit 5;




