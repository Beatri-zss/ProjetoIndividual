var database = require("../database/config");

function listar() {

  var instrucaoSql = `SELECT idLivro, titulo, autor, editora, data_publicacao, genero, descricao, url_capa, NOT EXISTS ( SELECT 1 FROM emprestimo WHERE fk_livro = idLivro AND data_devolucao IS NULL) AS disponivel FROM livro ORDER BY titulo`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  listar
}
