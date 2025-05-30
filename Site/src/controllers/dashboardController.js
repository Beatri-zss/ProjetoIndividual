var dashboardModel = require("../models/dashboardModel")

function obterKpis(req, res) {
    var idUsuario = req.query.idUsuario
    var retorno = {
        duracacaEmprestimoAtual: 0,
        pontuacaoMaxima: 0,
        quantidadeEmprestimo: 0,
    }

    dashboardModel.obterDuracaoEmprestimoAtual(idUsuario).then(resultado => {
        if (resultado.length != 0) {
            retorno.duracacaEmprestimoAtual = resultado[0].duracaoMediaEmprestimo
        }

        dashboardModel.obterPontuacaoMaximaQuiz(idUsuario).then(resultado => {
            if (resultado.length != 0) {
                retorno.pontuacaoMaxima = resultado[0].pontuacaoMaxima
            }
        })

        dashboardModel.obterQuantidadeEmprestimo(idUsuario).then(resultado => {
            if (resultado.length != 0) {
                retorno.quantidadeEmprestimo = resultado[0].qtdEmprestimos
            }
        })

        console.table(retorno)
        res.status(200).json(retorno)
    })


    // dashboardModel.obterQuantidadeLivrosFavoritados(idUsuario).then(resultado => {
    //     if (resultado.length == 0) {
    //         retorno.quantidadeLivrosFavoritados = 0
    //     }
    //     else {
    //         retorno.quantidadeLivrosFavoritados = resultado[0].qtdFavoritos
    //     }
    // })
}

module.exports = {
    obterKpis
}