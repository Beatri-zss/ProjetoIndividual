var emprestimoModel = require("../models/emprestimoModel")

function emprestar(req, res) {
    var idLivro = req.body.idLivro;
    var idUsuario = req.body.idUsuario;

    emprestimoModel.pegarEmprestimoAtivoPorIdUsuario(idUsuario)
        .then(retorno => {
            if (retorno.length != 0) {
                return res.status(400).send("Você já possui um empréstimo ativo. Qualquer dúvida entre em contato!")
            }

            emprestimoModel.emprestarLivro(idUsuario, idLivro).then(resultado => {

                return res.status(200).send("Solicitação criada!")
            })

        })
        .catch(function (erro) {
            console.log(erro);
            console.log("\n Houve um erro ao realizar o empréstimo! Erro: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        })
}

module.exports = {
    emprestar
}