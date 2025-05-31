var database = require("../database/config")


 // funções para obter KPIs:
function obterDuracaoEmprestimoAtual(idUsuario) {
    var instrucaoSql = `SELECT DATEDIFF(CURRENT_DATE(), data_emprestimo) AS 'duracaoEmprestimoAtual' FROM emprestimo WHERE fk_usuario = ${idUsuario} AND data_devolucao IS NULL`
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
    var instrucaoSql = ` SELECT count(*) AS 'qtdFavoritos'FROM livro_favoritado WHERE fk_usuario = ${idUsuario}`
    return database.executar(instrucaoSql)

}

// funções para gerar gráficos:

function obterHistoricoPontuacaoQuiz(idUsuario){
    var instrucaoSql = `SELECT qtd_pontos AS 'pontuacaoPorTentativa' FROM pontuacao_quiz WHERE fk_usuario = ${idUsuario}`
    return database.executar(instrucaoSql)
}

function obterQuantidadeLivrosGeneros(idUsuario){
    var instrucaoSql = `SELECT genero, count(*) AS 'qtdPorGenero' FROM emprestimo INNER JOIN livro ON fk_livro = idLivro WHERE fk_usuario = ${idUsuario} GROUP BY genero`
    return database.executar(instrucaoSql)
}

function obterTop5LivrosMaisFavoritados (){
    var instrucaoSql = `SELECT livro.titulo, count(idLivro) AS 'x favoritos 'FROM livro JOIN livro_favoritado ON idLivro = fk_livro GROUP BY livro.titulo ORDER BY count(idLivro) limit 5 `
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
    obterTop5LivrosMaisFavoritados,
    obterTop3MaisEmprestados
}
