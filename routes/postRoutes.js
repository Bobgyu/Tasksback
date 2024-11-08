const router = require("express").Router(); // express 모듈에서 Router 클래스 임포트
const { postTask } = require("../controllers/postTaskCtrl");

router.post("/postTask", postTask);

module.exports = router;
