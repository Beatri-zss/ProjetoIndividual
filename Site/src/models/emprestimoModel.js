var database = require("../database/config");

function pegarEmprestimoAtivoPorIdUsuario(idUsuario) {

  var instrucaoSql = `SELECT * FROM emprestimo where fk_usuario = ${idUsuario} and data_devolucao is null`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function emprestarLivro(idUsuario, idLivro) {
  var instrucaoSql = `insert into emprestimo(fk_livro, fk_usuario) values (${idLivro}, ${idUsuario}) `

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  pegarEmprestimoAtivoPorIdUsuario,
  emprestarLivro
}