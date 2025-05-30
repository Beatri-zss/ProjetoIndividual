var dashboardModel = require("../models/dashboardModel");

function obterDuracaoEmprestimoAtual(req, res) {
  var idUsuario = req.query.idUsuario;

  dashboardModel.obterDuracaoEmprestimoAtual(idUsuario).then((resultado) => {
    if (resultado.length == 0) {
      res.status(204).json(0);
    } else {
      res.status(200).json(resultado[0].duracaoEmprestimoAtual);
    }
  });
}

function obterPontuacaoMaximaQuiz(req, res) {
  var idUsuario = req.query.idUsuario;

  dashboardModel.obterPontuacaoMaximaQuiz(idUsuario).then((resultado) => {
    if (resultado.length == 0) {
      res.status(204).json();
    } else {
      res.status(200).json(resultado[0].pontuacaoMaxima);
    }
  });
}

function obterQuantidadeEmprestimos(req, res) {
  var idUsuario = req.query.idUsuario;

  dashboardModel.obterQuantidadeEmprestimo(idUsuario).then((resultado) => {
    if (resultado.length == 0) {
      res.status(204).json(0);
    } else {
      res.status(200).json(resultado[0].qtdEmprestimos);
    }
  });
}

function obterQuantidadeLivrosFavoritados(req, res) {
  var idUsuario = req.query.idUsuario;

  dashboardModel
    .obterQuantidadeLivrosFavoritados(idUsuario)
    .then((resultado) => {
      if (resultado.length == 0) {
        retorno.quantidadeLivrosFavoritados = 0;
      } else {
        retorno.quantidadeLivrosFavoritados = resultado[0].qtdFavoritos;
      }
    });
}

function obterHistoricoPontuacaoQuiz(req, res) {
  var idUsuario = req.query.idUsuario;

  dashboardModel.obterHistoricoPontuacaoQuiz(idUsuario).then((resultado) => {
    if (resultado.length == 0) res.status(204).json([]);
    else res.status(200).json(resultado);
  });
}

function obterQuantidadeLivrosLidosGenero(req, res) {
  var idUsuario = req.query.idUsuario;

  dashboardModel
    .obterQuantidadeLivrosGeneros(idUsuario)
    .then(function (resultado) {
      if (resultado.length == 0) res.status(204).json([]);
      else res.status(200).json(resultado);
    });
}

function obterTop5LivrosMaisFavoritados(req, res) {
  dashboardModel.obterTop5LivrosMaisFavoritados().then(function (resultado) {
    if (resultado.length == 0) res.status(204).json([]);
    else res.status(200).json(resultado);
  });
}

function obterTop3MaisEmprestados(req, res) {
  dashboardModel.obterTop3MaisEmprestados().then(function (resultado) {
    if (resultado.length == 0) res.status(204).json([]);
    else res.status(200).json(resultado);
  });
}

module.exports = {
  // KPIS
  obterQuantidadeLivrosFavoritados,
  obterPontuacaoMaximaQuiz,
  obterQuantidadeEmprestimos,
  obterDuracaoEmprestimoAtual,

  //GRÁFICOS
  obterQuantidadeLivrosLidosGenero,
  obterHistoricoPontuacaoQuiz,
  obterTop5LivrosMaisFavoritados,
  obterTop3MaisEmprestados,
};
