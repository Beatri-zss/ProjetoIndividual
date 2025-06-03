var livroModel = require("../models/livroModel");

function listar(req, res) {

  var idUsuario;

  // Verifica se idUsuario != "undefined" pq caso endpoint seja chamado quando usuário não fez login o idUsuario será undefined
  //  que pela a API será tratado como texto por isso está entre aspas
  if (req.query.idUsuario != "undefined") {
    idUsuario = req.query.idUsuario;
  }
  else {
    idUsuario = 0;
  }

  livroModel.listar(idUsuario).then(function (resultado) {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar os livros: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}

function favoritar(req, res) {
  var idLivro = req.body.idLivro;
  var idUsuario = req.body.idUsuario;

  livroModel.verificarFavorito(idLivro, idUsuario).then(function (resultado) {
    if (resultado.length != 0) {
      livroModel.removerFavorito(idLivro, idUsuario).then(function (resultadoRemovido) {
        return res.status(200).json()
      })
    }
    else {
      livroModel.adicionarFavorito(idLivro, idUsuario).then(function (resultadoAdicionado) {
        return res.status(200).json()
      })
    }
  })
}


module.exports = {
  listar,
  favoritar
}