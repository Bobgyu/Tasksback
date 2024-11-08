const database = require("../database/database");

exports.deleteTask = async (request, response) => {
  const taskId = request.params.taskId;

  try {
    const result = await database.pool.query("DELETE FROM tasks WHERE _id=$1", [
      taskId,
    ]);
    return response.status(200).json({ msg: "Delete Task Success" });
  } catch (error) {
    return response.status(500).json({ msg: "Delete Task Fail: " + error });
  }
};
