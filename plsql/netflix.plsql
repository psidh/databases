-- to create a procedure we have a create or replace command


CREATE OR REPLACE PROCEDURE Add_New_User(
  p_user_name IN VARCHAR2,
  p_email IN VARCHAR2
) AS

BEGIN
  INSERT INTO Users(user_id, user_name, email, join_date)
  VALUES (Users.seq.NEXTVAL, p_user_name, p_email, SYSDATE);
  COMMIT;

END Add_New_User

-- simple execution
BEGIN

  Add_New_User('John Butter', 'john@butter.com')
END;

-- scenario where we record movies watched by the user

CREATE OR REPLACE PROCEDURE Log_Movie_Watch(
  p_user_id IN NUMBER,
  p_movie_id IN NUMBER
) AS

BEGIN
  INSERT INTO  User_Watched_Movies(watched_id, user_id, movie_id, watched_date)
  VALUES (User_Watched_Movies_seq.NEXTVAL, p_user_id, p_movie_id, SYSDATE);
  COMMIT;

END Log_Movie_Watch;

BEGIN
    Log_Movie_Watch(1, 101);  -- Where user_id = 1, movie_id = 101
END;

--Scenario 3 Managing User Subscriptions

CREATE OR REPLACE PROCEDURE Update_Subscriptions(
  p_user_id IN NUMBER,
  p_subscription_type IN VARCHAR2,
  p_price IN NUMBER
) AS

BEGIN
  UPDATE Subscriptions
  SET subscription_type = p_subscription_type,
     price = p_price
     end_date = ADD_MONTHS(SYSDATE, 1)
  WHERE user_id = p_user_id;
  COMMIT;
END Update_Subscription


BEGIN
    Update_Subscription(1, 'Premium', 19.99);
END;


--Scenario 4: Reporting Total Watch Time by Genre
CREATE OR REPLACE PROCEDURE Get_Total_Watch_Time_By_Genre(
  p_genre IN VARCHAR2

) RETURN NUMBER AS

    total_watch_time NUMBER;

BEGIN
  SELECT SUM(m.duration)
  INTO total_watch_time
  FROM MOVIES m,
  JOIN User.Watched_Movies uwm ON m.movie_id = uwn.movie_id
  WHERE m.genre = p_genre;

  RETURN NVL(total_watch_time, 0);

END Get_Total_Watch_Time_By_Genre;


BEGIN
    DBMS_OUTPUT.PUT_LINE('Total watch time for Action movies: ' || Get_Total_Watch_Time_By_Genre('Action'));
END;

