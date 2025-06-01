# Biblioteca - Projeto Individual

Um projeto foi desenvolvido no 1º Semestre do curso de ADS na SPTech School. Esse projeto é uma biblioteca na qual disponibilizo os meus livros para empréstimo para os alunos da faculdade.

<hr>

## Funcionalidades

• O site conta com páginas de login e cadastro funcionais e conectadas com um banco de dados **mysql**.

• Uma página onde o usuário pode visualizar todo o acervo de livros do site.

• Usuários podem solicitar livros emprestados atráves do site.

• Usuários podem favoritar livros e futuramente poderão consultar esses livros favoritos.

• O site possui um quiz com questões de literatura no geral onde o usuário realizar quantas tentativas quiser e cada tentativa possui 10 questões geradas aleatoriamente a serem respondidas.

• O usuário pode acessar uma dashboard onde pode visualizar KPI's com as seguintes informações:
    <br>
    ° **Quantidade de livros favoritos**
    <br>
    ° **Quantidade de empréstimos realizados**
    <br>
    ° **Duração do empréstimo atual**
    <br>
    ° **Maior Pontuação no Quiz**

• Além das KPI's o usuário pode visualizar 4 gráficos sendo eles:
    <br>
    1. **Um gráfico de linhas com histórico de pontuação no Quiz nas últimas tentativas**
    <br>
    2. **Um gráfico de barras com a quantidade de livros que o usuário leu separados por gênero literário**
    <br>
    3. **Um gráfico de barras com o Ranking dos 5 livros mais favoritados**
    <br>
    4. **Um gráfico de barras com o Ranking dos 5 livros mais emprestados**

<hr>

## Como usar

1. Clone este repositório em sua máquina e acesse a pasta **Site**, por exemplo, após clonar o repositório pelo terminal execute o comando `CD Site`.

2. Crie, no Banco de Dados, as tabelas necessárias para o funcionamento deste projeto.
- Siga as instruções no arquivo **/src/database/script_tabelasBiblioteca.sql**


3. Acesse o arquivo **app.js** e parametrize o ambiente.
- Se você estiver utilizando o Ambiente de Produção (remoto), comente a linha 2 e deixe habilitada a linha 1 onde está o valor **var ambiente_processo = 'producao';**
- Se você estiver utilizando o Ambiente de Desenvolvimento (local), comente a linha 1 e deixe habilitada a linha 2 onde está o valor **var ambiente_processo = 'desenvolvimento';**

4. Adicione as credenciais de Banco de Dados no arquivo **.env** ou em **.end.dev**, seguindo as instruções neste.

5. Acesse este repositório no seu terminal (GitBash ou VSCode) e execute os comandos abaixo:

```
npm i
``` 
_O comando acima irá instalar as bibliotecas necessárias para o funcionamento do projeto. As bibliotecas a serem instaladas estão listadas no arquivo **package.json** então é muito importante que este não seja alterado. Será criada uma nova pasta/diretório chamado **node_modules** quando o comando for finalizado, que é onde as bibliotecas estão localizadas. Não altere a pasta/diretório._

```
npm start
``` 

_O comando acima irá iniciar seu projeto e efetuar os comandos de acordo com a sua parametrização feita nos passos anteriores._

6. Para "ver" seu projeto funcionando, acesse em seu navegador o caminho **informado no terminal**.

7. Caso queira parar a execução, tecle **CTRL+C** no terminal em que o projeto está rodando.