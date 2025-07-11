var express = require("express");
var router = express.Router();

var livroController = require("../controllers/livroController");

router.get("/listar", function (req, res) {
  livroController.listar(req, res);
});

router.post("/favoritar", function(req,res){
  livroController.favoritar(req,res);
})

module.exports = router;