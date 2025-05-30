var database = require("../database/config")


 // funções para obter KPIs:
function obterDuracaoEmprestimoAtual(idUsuario) {
    var instrucaoSql = `SELECT DATEDIFF(CURRENT_DATE(), data_emprestimo) AS 'duracaoMediaEmprestimo' FROM emprestimo WHERE fk_usuario = ${idUsuario} AND data_devolucao IS NULL`
    return database.executar(instrucaoSql)
}

function obterQuantidadeEmprestimo(idUsuario){
     var instrucaoSql = `SELECT count(fk_usuario) AS 'qtdEmprestimos' FROM emprestimo WHERE fk_usuario = ${idUsuario}`
     return database.executar(instrucaoSql)
}

function obterPontuacaoMaximaQuiz (idUsuario){
    var instrucaoSql = `SELECT max(qtd_pontos) AS 'pontuacaoMaxima' FROM pontuacao_quiz where fk_usuario = ${idUsuario}`
    return database.executar(instrucaoSql)
}

function obterQuantidadeLivrosFavoritados (idUsuario){
    var instrucaoSql = ` SELECT count(*) AS 'qtdFavoritos'FROM favoritos WHERE fk_usuario = ${idUsuario}`
    return database.executar(instrucaoSql)

}

// funções para gerar gráficos:

function obterHistoricoPontuacaoQuiz(idUsuario){
    var instrucaoSql = `SELECT qtd_pontos AS 'pontuacaoPorTentativa' FROM pontuacao_quiz WHERE fk_usuario = ${idUsuario}`
    return database.executar(instrucaoSql)
}

function obterQuantidadeLivrosGeneros(idUsuario){
    var instrucaoSql = `SELECT genero, count(*) AS 'qtdPorGenero' FROM emprestimo INNER JOIN livroON fk_livro = idLivro WHERE fk_usuario = ${idUsuario} GROUP BY genero`
    return database.executar(instrucaoSql)
}

function obterGenerosFavoritosUsuarios(){
    var instrucaoSql = `SELECT generoFavorito AS 'generofavorito', count(idUsuario) AS 'qtdUsuarios' FROM usuario GROUP BY generoFavorito`
    return database.executar(instrucaoSql)
}

function obterTop3MaisEmprestados(){
    var instrucaoSql = `SELECT titulo, count(*)  AS 'qtdEmprestimos' From emprestimo INNER JOIN livro ON fk_livro = idLivro GROUP BY titulo  ORDER BY count(*) DESC limit 3`
    return database.executar(instrucaoSql)
}

module.exports = {
    obterDuracaoEmprestimoAtual,
    obterQuantidadeEmprestimo,
    obterPontuacaoMaximaQuiz,
    obterQuantidadeLivrosFavoritados,
    obterHistoricoPontuacaoQuiz,
    obterQuantidadeLivrosGeneros,
    obterGenerosFavoritosUsuarios,
    obterTop3MaisEmprestados
}
