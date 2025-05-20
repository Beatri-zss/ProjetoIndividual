var database = require("../database/config");

function buscarPerguntas() {

    var instrucaoSql = `SELECT * from pergunta  order by rand() limit 10`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function salvarResultado(fkUsuario, pontuacao){
    var instrucaoSql = `
            INSERT INTO pontuacao_quiz (qtd_pontos, fk_usuario) VALUES ('${pontuacao}', '${fkUsuario}');
        `;
        console.log("Executando a instrução SQL: \n" + instrucaoSql);
        return database.executar(instrucaoSql);
}

// module.exports define o que poderá ser utlizado fora desse arquivo(quizModel.js)
module.exports = {
    buscarPerguntas,
    salvarResultado
}