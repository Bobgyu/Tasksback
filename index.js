const PORT = 8000;

const express = require("express"); // express 모듈을 가져온다
const cors = require("cors"); // cors 모듈을 가져온다

const app = express(); // express 모듈의 기능을 사용하기 위해 app 변수에 객체 할당
app.use(cors()); // http, https 프로토콜을 사용하는 서버 간의 통신을 허용한다
app.use(express.json()); // express 모듈의 json() 매서드를 사용한다

app.get("/", (req, res) => {
  res.send("Hello world Node Test"); // 브라우저에 표시
});

app.use(require("./routes/getRoutes"));

app.listen(PORT, () => console.log(`Sever is running on port ${PORT}`));
