-- league Query 1--   -- BARTAR--
SELECT MATCH.Home_Team , MATCH.Away_Team , count_match
FROM MATCH , Match_Team , League , (SELECT Name , COUNT(Match_Date) AS count_match
									FROM MATCH ,League
									WHERE Name = 'Bartar' AND Match.M_ID = L_ID
									GROUP BY Name) AS B
WHERE League.Name = 'Bartar' AND Match.M_ID = L_ID AND MATCH.Home_Team = Match_Team.Home_Team AND MATCH.Away_Team = Match_Team.Away_Team 
AND Match_Date = M_Date 