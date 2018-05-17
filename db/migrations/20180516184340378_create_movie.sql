-- +micrate Up
CREATE TABLE movies (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  release_year INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS movies;
