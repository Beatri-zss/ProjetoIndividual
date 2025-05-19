var quizModel = require("../models/quizModel");

function buscarPerguntas(req, res){
    quizModel.buscarPerguntas().then(resultado =>{
        if(resultado.length == 10){
            res.status(200).json(resultado)
        }
        else{
            res.status(500)
        }
    })
}

module.exports = {
 buscarPerguntas
}