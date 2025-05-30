var express = require ("express")
var router = express.Router()

var dashboardController = require("../controllers/dashboardController")

router.get("/kpis", function (req,res){
    dashboardController.obterKpis(req, res)
})

module.exports = router