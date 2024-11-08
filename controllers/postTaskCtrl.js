const database = require("../database/database");
const { v4: uuid4 } = require("uuid");

exports.postTask = async (request, response) => {
  const _id = uuid4();
  const { title, description, date, isCompleted, isImportant, userId } =
    request.body;
  console.log(_id, title, description, date, isCompleted, isImportant, userId);
  // body에 요청한 데이터 확인용 코드

  try {
    await database.pool.query(
      "INSERT INTO tasks (_id, title, description, date, isCompleted, isImportant, userId) VALUES ($1, $2, $3, $4, $5, $6, $7)",
      [_id, title, description, date, isCompleted, isImportant, userId]
    );

    return response.status(200).json({ msg: "데이터가 입력되었습니다." });
  } catch (error) {
    return response.status(500).json({ msg: "데이터 입력 에러: " + error });
  }
};
