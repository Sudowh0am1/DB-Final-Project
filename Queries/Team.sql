-- Team Query 1 --
-- lig = y && team = x --

-- team Query 1--
--SELECT Match.Home_Team , Match.Away_Team , Match.Match_Date , League.L_ID , Match_Team.Home_Score ,
--Match_Team.Away_Score , COUNT(time) AS count_mistake
--FROM League , Match , Match_Team , Mistake , P_Contract
--WHERE League.Name = 'Bartar' AND League.L_ID = Match.M_ID AND ( Match.Home_Team = 'team A' OR Match.Away_Team = 'team A')
--AND (Match_Team.Home_Team = Match.Home_Team OR Match_Team.Away_Team = Match.Away_Team) AND Match.Match_Date = Match_Team.M_Date AND 
--(Mistake.Home_Team = Match_Team.Home_Team OR Mistake.Away_Team = Match_Team.Away_Team) AND Match_Team.M_date = Mistake.M_Date AND 
--Mistake.P_ID = P_Contract.P_ID AND (Mistake.M_Date BETWEEN S_Date AND E_Date) AND T_Name = 'team A' 
--GROUP BY Match.Match_Date , Type


--SELECT f_name , l_name , MATCH.M_date , duty
--FROM LAYOUT , MATCH_PLAYER , MATCH , HUMAN , LIGE
--WHERE LIGE.name = 'y' AND LIGE.id = MATCH.lig_id AND (MATCH.home_team = 'team X' or MATCH.away_team = 'team X') AND (MATCH_PLAYER.home_team = 'team X' or MATCH_PLAYER.away_team = 'team X') AND MATCH.M_date = MATCH_PLAYER.M_date AND MATCH_PLAYER.P_id = HUMAN.ID AND L-id != 15 AND L_id = LIGE.id


---- team Query 2--
--SELECT SUM ( SUM (home_score) AS home + SUM (away-score) AS away) AS score
--FROM TECHNICAL_STAFF_TEAM_CONTRACT , MATCH_TEAM
--WHERE T-name = 'team x' AND duty = 'manager' AND (M_date BETWEEN S_date AND E_date) AND 



-- team Query 3--
SELECT F_Name , L_Name , T_Name , S_Date , E_Date , Salary , count_match , count_mistake , count_goal
FROM Player_Team_Contract , HUMAN , (SELECT P_ID, COUNT(MATCH.Home_Team) AS count_match 
												FROM Match , Player_Team_Contract
												WHERE T_Name = 'team A' AND (Match.Home_Team = 'team A' OR Match.Away_Team = 'team A')
												AND S_Date < '1400-04-03' AND E_Date > '1400-04-03'AND S_Date < Match_Date AND
												Match_Date < '1400-04-03' GROUP BY P_ID) AS E
												, (SELECT Player_Team_Contract.P_ID, COUNT(Mistake.Time) AS count_mistake
													FROM Player_Team_Contract , Mistake
													WHERE Player_Team_Contract.T_Name = 'team A' AND
													(Mistake.Home_Team = 'team A' OR Mistake.Away_Team = 'team A')
												AND Player_Team_Contract.S_Date < '1400-04-03' 
												AND Player_Team_Contract.E_Date > '1400-04-03'
												AND Player_Team_Contract.S_Date < M_Date AND M_Date < '1400-04-03' 
												AND Mistake.P_ID = Player_Team_Contract.P_ID AND Player_Team_Contract.T_Name = 'team A'
												GROUP BY Player_Team_Contract.P_ID ) AS M
												, (SELECT Player_Team_Contract.P_ID, COUNT(Goal.Goal_Time) AS count_goal
													FROM Player_Team_Contract , GOAL
													WHERE Player_Team_Contract.T_Name = 'team A' AND
													(GOAL.Home_Team = 'team A' OR GOAL.Away_Team = 'team A')
												AND Player_Team_Contract.S_Date < '1400-04-03' 
												AND Player_Team_Contract.E_Date > '1400-04-03'
												AND Player_Team_Contract.S_Date < M_Date AND M_Date < '1400-04-03' 
												AND GOAL.P_ID = Player_Team_Contract.P_ID AND Player_Team_Contract.T_Name = 'team A'
												GROUP BY Player_Team_Contract.P_ID ) AS G
WHERE T_Name = 'team A' AND S_Date < '1400-04-03' AND E_Date > '1400-04-03' 
AND Player_Team_Contract.P_ID = Human.ID OR (Player_Team_Contract.P_ID = M.P_ID
AND Player_Team_Contract.P_ID = G.P_ID AND Player_Team_Contract.P_ID = E.P_ID);




-- team Query 4--
SELECT F_Name , L_Name , T_Name , S_Date , E_Date , Salary , Duty , count_match , count_mistake , count_goal
FROM Technical_Staff_Team_Contract , HUMAN , (SELECT T_ID, COUNT(MATCH.Home_Team) AS count_match 
												FROM Match , Technical_Staff_Team_Contract 
												WHERE T_Name = 'team A' AND (Match.Home_Team = 'team A' OR Match.Away_Team = 'team A')
												AND S_Date < '1400-04-03' AND E_Date > '1400-04-03'AND S_Date < Match_Date AND
												Match_Date < '1400-04-03' GROUP BY T_ID) AS E
												, (SELECT T_ID, COUNT(Mistake.Time) AS count_mistake
													FROM Technical_Staff_Team_Contract , Mistake , P_Contract
													WHERE Technical_Staff_Team_Contract.T_Name = 'team A' AND
													(Mistake.Home_Team = 'team A' OR Mistake.Away_Team = 'team A')
												AND Technical_Staff_Team_Contract.S_Date < '1400-04-03' 
												AND Technical_Staff_Team_Contract.E_Date > '1400-04-03'
												AND Technical_Staff_Team_Contract.S_Date < M_Date AND M_Date < '1400-04-03' 
												AND Mistake.P_ID = P_Contract.P_ID AND P_Contract.T_Name = 'team A'
												GROUP BY T_ID ) AS M
												, (SELECT T_ID, COUNT(Goal.Goal_Time) AS count_goal
													FROM Technical_Staff_Team_Contract , GOAL , P_Contract
													WHERE Technical_Staff_Team_Contract.T_Name = 'team A' AND
													(GOAL.Home_Team = 'team A' OR GOAL.Away_Team = 'team A')
												AND Technical_Staff_Team_Contract.S_Date < '1400-04-03' 
												AND Technical_Staff_Team_Contract.E_Date > '1400-04-03'
												AND Technical_Staff_Team_Contract.S_Date < M_Date AND M_Date < '1400-04-03' 
												AND GOAL.P_ID = P_Contract.P_ID AND P_Contract.T_Name = 'team A'
												GROUP BY T_ID ) AS G
WHERE T_Name = 'team A' AND S_Date < '1400-04-03' AND E_Date > '1400-04-03' AND Duty = 'Manager'
AND Technical_Staff_Team_Contract.T_ID = E.T_ID
AND Technical_Staff_Team_Contract.T_ID = Human.ID AND Technical_Staff_Team_Contract.T_ID = M.T_ID 
AND Technical_Staff_Team_Contract.T_ID = G.T_ID;











-- team Query 5--
SELECT F_Name , L_Name , T_Name , S_Date , E_Date , Salary , Duty , count_match , count_mistake , count_goal
FROM Technical_Staff_Team_Contract , HUMAN , (SELECT T_ID, COUNT(MATCH.Home_Team) AS count_match 
												FROM Match , Technical_Staff_Team_Contract 
												WHERE T_Name = 'team A' AND (Match.Home_Team = 'team A' OR Match.Away_Team = 'team A')
												AND S_Date < '1400-04-03' AND E_Date > '1400-04-03'AND S_Date < Match_Date AND
												Match_Date < '1400-04-03' GROUP BY T_ID) AS E
												, (SELECT T_ID, COUNT(Mistake.Time) AS count_mistake
													FROM Technical_Staff_Team_Contract , Mistake , P_Contract
													WHERE Technical_Staff_Team_Contract.T_Name = 'team A' AND
													(Mistake.Home_Team = 'team A' OR Mistake.Away_Team = 'team A')
												AND Technical_Staff_Team_Contract.S_Date < '1400-04-03' 
												AND Technical_Staff_Team_Contract.E_Date > '1400-04-03'
												AND Technical_Staff_Team_Contract.S_Date < M_Date AND M_Date < '1400-04-03' 
												AND Mistake.P_ID = P_Contract.P_ID AND P_Contract.T_Name = 'team A'
												GROUP BY T_ID ) AS M
												, (SELECT T_ID, COUNT(Goal.Goal_Time) AS count_goal
													FROM Technical_Staff_Team_Contract , GOAL , P_Contract
													WHERE Technical_Staff_Team_Contract.T_Name = 'team A' AND
													(GOAL.Home_Team = 'team A' OR GOAL.Away_Team = 'team A')
												AND Technical_Staff_Team_Contract.S_Date < '1400-04-03' 
												AND Technical_Staff_Team_Contract.E_Date > '1400-04-03'
												AND Technical_Staff_Team_Contract.S_Date < M_Date AND M_Date < '1400-04-03' 
												AND GOAL.P_ID = P_Contract.P_ID AND P_Contract.T_Name = 'team A'
												GROUP BY T_ID ) AS G
WHERE T_Name = 'team A' AND S_Date < '1400-04-03' AND E_Date > '1400-04-03' AND Technical_Staff_Team_Contract.T_ID = E.T_ID
AND Technical_Staff_Team_Contract.T_ID = Human.ID AND Technical_Staff_Team_Contract.T_ID = M.T_ID 
AND Technical_Staff_Team_Contract.T_ID = G.T_ID;
