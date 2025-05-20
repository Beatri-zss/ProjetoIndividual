var quizModel = require("../models/quizModel");

function buscarPerguntas(req, res) {
  quizModel.buscarPerguntas().then((resultado) => {
    if (resultado.length == 10) {
      res.status(200).json(resultado);
    } else {
      res.status(500);
    }
  });
}

function salvarResultado(req, res) {
  var fkUsuario = req.body.idUsuario;
  var pontuacao = req.body.pontuacao;

  quizModel
    .salvarResultado(fkUsuario, pontuacao)
    .then(function (resultado) {
      res.status(200);
    })
    .catch(function (erro) {
      console.log(erro);
      console.log(
        "\nHouve um erro ao realizar o cadastro! Erro: ",
        erro.sqlMessage
      );
      res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
  buscarPerguntas,
  salvarResultado,
};
