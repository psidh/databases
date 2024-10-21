CREATE TABLE Users{
    user_id NUMBER PRIMARY KEY,
    user_name VARCHAR2(100),
    email VARCHAR2(50)
    join_date DATE
);

CREATE TABLE Movies(
    movie_id NUMBER PRIMARY KEY,
    movie_title VARCHAR2(100),
    genre VARCHAR2(100),
    release_year NUMBER
);


CREATE TABLE Subscriptions(
  subscription_id  NUMBER PRIMARY KEY,
  user_id NUMBER,
  start_date DATE,
  end_date DATE,
  subscription_type VARCHAR2(10),
  price NUMBER,
  FOREIGN KEY(user_id) REFERENCES Users(user_id)
)
-- adding a user requires  a plsql command

CREATE TABLE User_Watched_Movies(
  watched_id NUMBER PRIMARY KEY,
  user_id NUMBER,
  movie_id NUMBER,
  watch_date DATE,
  FOREIGN KEY(user_id) REFERENCES Users(user_id),
  FOREIGN KEY(movie_id) REFERENCES Movies(movie_id)
);


CREATE TABLE Users{
    user_id NUMBER PRIMARY KEY,
    user_name VARCHAR2(100),
    email VARCHAR2(50)
    join_date DATE
);

CREATE TABLE Movies(
    movie_id NUMBER PRIMARY KEY,
    movie_title VARCHAR2(100),
    genre VARCHAR2(100),
    release_year NUMBER
);


CREATE TABLE Subscriptions(
  subscription_id  NUMBER PRIMARY KEY,
  user_id NUMBER,
  start_date DATE,
  end_date DATE,
  subscription_type VARCHAR2(10),
  price NUMBER,
  FOREIGN KEY(user_id) REFERENCES Users(user_id)
)
-- adding a user requires  a plsql command

CREATE TABLE User_Watched_Movies(
  watched_id NUMBER PRIMARY KEY,
  user_id NUMBER,
  movie_id NUMBER,
  watch_date DATE,
  FOREIGN KEY(user_id) REFERENCES Users(user_id),
  FOREIGN KEY(movie_id) REFERENCES Movies(movie_id)
);










