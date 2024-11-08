const router = require("express").Router();
const { deleteTask } = require("../controllers/deleteTaskCtrl");

router.delete("/deleteTask/:taskId", deleteTask);

module.exports = router;
