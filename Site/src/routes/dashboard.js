var express = require ("express")
var router = express.Router()

var dashboardController = require("../controllers/dashboardController")

// KPIs
router.get("/duracaoEmprestimoAtual", function (req,res){
    dashboardController.obterDuracaoEmprestimoAtual(req, res)
})

router.get("/quantidadeEmprestimos", function (req,res){
    dashboardController.obterQuantidadeEmprestimos(req, res)
})

router.get("/pontuacaoMaxima", function (req,res){
    dashboardController.obterPontuacaoMaximaQuiz(req, res)
})

router.get("/quantidadeLivrosFavoritosUsuario", function ( req,res){
    dashboardController.obterQuantidadeLivrosFavoritados(req,res)
})

// Gráficos
router.get("/historicoPontuacao", function (req, res){
    dashboardController.obterHistoricoPontuacaoQuiz(req, res)
})

router.get("/quantidadeLivrosLidosPorGenero", function(req,res){
    dashboardController.obterQuantidadeLivrosLidosGenero(req,res)
})

router.get("/top5LivrosMaisFavoritadosPelosUsuarios", function(req,res){
    dashboardController.obterTop5LivrosMaisFavoritados(req,res)
})

router.get("/top3LivrosMaisEmprestado",function(req,res){
    dashboardController.obterTop3MaisEmprestados(req,res)
})

module.exports = router