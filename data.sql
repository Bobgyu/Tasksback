-- 테이블 생성
CREATE TABLE tasks (
    _id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    date TEXT NOT NULL,
    isCompleted BOOLEAN NOT NULL DEFAULT false,
    isImportant BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    userId TEXT NOT NULL
);

-- 테이블 전체 조회
SELECT * FROM tasks;

-- 데이터 추가
INSERT INTO tasks (_id, title, description, date, isCompleted, isImportant, userId)
VALUES ('1235', '빨래하기', '깨끗하게 하기', '2024-11-06', false, true, '012345676')
('1235', '청소하기', '깨끗하게 하기', '2024-11-07', false, true, '012345667'),
('1235', '잠자기', '깨끗하게 하기', '2024-11-08', false, true, '012345676'),
('1235', '술마시기', '깨끗하게 하기', '2024-11-09', false, true, '012345376');

-- 데이터 조회(필터링) : ASC(오름차순: 디폴트), DESC(내림차순)
SELECT * FROM tasks WHERE userId = '012345676' ORDER BY date DESC(ASC)

-- 데이터 삭제(WHERE 조건 필수)
DELETE FROM tasks WHERE _id='1234'

-- 데이터 업데이트(Where 조건 필수)
UPDATE tasks SET isCompleted = true WHERE _id='1235'

-- 트리거 함수 생성: updated_at 필드를 현재 시간으로 설정
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;




-- 트리거 생성: task 테이블에서 UPDATE가 발생할 때마다 update_updated_at_column 함수를 호출
CREATE TRIGGER update_task_updated_at
BEFORE UPDATE ON task
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();




-- task 테이블의 created_at 필드는 행이 처음 삽입될 때만 설정.
-- updated_at 필드는 행이 업데이트될 때마다 트리거를 통해 현재 시간으로 자동 갱신.
-- BEFORE UPDATE 트리거는 레코드가 업데이트되기 직전에 updated_at 필드를 현재 시간으로 변경.


