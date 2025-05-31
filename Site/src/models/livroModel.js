var database = require("../database/config");

function listar(idUsuario) {

  var instrucaoSql = `SELECT idLivro, titulo, autor, editora, data_publicacao, genero, descricao, url_capa, NOT EXISTS ( SELECT 1 FROM emprestimo WHERE fk_livro = idLivro AND data_devolucao IS NULL) AS disponivel, EXISTS(SELECT 1 FROM livro_favoritado WHERE fk_livro = idLivro AND fk_usuario = ${idUsuario}) AS 'favoritado' FROM livro ORDER BY titulo`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function verificarFavorito(idLivro, idUsuario) {
  var instrucaoSql = `SELECT * FROM livro_favoritado WHERE fk_livro = ${idLivro} AND fk_usuario = ${idUsuario}`
  return database.executar(instrucaoSql)
}

function adicionarFavorito(idLivro, idUsuario) {
  var instrucaoSql = `INSERT INTO livro_favoritado(fk_livro,fk_usuario) VALUES (${idLivro}, ${idUsuario})`
  return database.executar(instrucaoSql)
}

function removerFavorito(idLivro, idUsuario) {
  var instrucaoSql = `DELETE FROM livro_favoritado WHERE fk_livro = ${idLivro} AND fk_usuario = ${idUsuario}`
  return database.executar(instrucaoSql)
}

module.exports = {
  listar,
  verificarFavorito,
  adicionarFavorito,
  removerFavorito
}
