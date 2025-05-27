var express = require("express");
var router = express.Router();

var emprestimoController = require("../controllers/emprestimoController");

router.post("/emprestar", function (req, res) {
  emprestimoController.emprestar(req, res);
});

module.exports = router;