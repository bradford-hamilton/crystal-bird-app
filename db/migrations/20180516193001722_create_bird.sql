-- +micrate Up
CREATE TABLE birds (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  age INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS birds;
