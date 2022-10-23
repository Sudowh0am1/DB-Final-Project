
-- Game Query 1 --
SELECT F_Name, L_Name,T_Name FROM Human, Match_Player, Player, P_Contract
WHERE Match_Player.M_Date = '1398-03-25' AND Home_Team  = 'team B' AND Away_Team = 'team A' 
AND Match_Player.P_ID = Player.P_ID AND Human.ID = Player.P_ID AND L_ID != 15
AND Match_Player.P_ID = P_Contract.P_ID AND M_Date > S_Date AND M_Date < E_Date ORDER BY T_Name


-- Game Query 2 --
SELECT F_Name, L_Name,T_Name, Duty FROM Human, Match_Player, Player, P_Contract, Layout
WHERE Match_Player.M_Date = '1398-03-25' AND Home_Team  = 'team B' AND Away_Team = 'team A' 
AND Match_Player.P_ID = Player.P_ID AND Human.ID = Player.P_ID AND L_ID != 15
AND Match_Player.P_ID = P_Contract.P_ID AND M_Date > S_Date AND M_Date < E_Date
AND Match_Player.L_ID = Layout.Lay_ID ORDER BY T_Name


--Select F_Name, L_Name from Human, Match_Player
--Where Human.ID = Match_Player.P_ID AND ( DATEDIFF (day, M_Date, '1398-03-25') = 0 )
--AND Home_Team  = 'team A' AND Away_Team = 'team B' 

-- Game Query 5 --
SELECT T_Name , Type , COUNT(*) as Number
FROM Mistake, P_Contract
WHERE Home_Team = 'team B' AND Away_Team = 'team A' AND M_Date = '1398-03-25' AND Mistake.P_ID = P_Contract.P_ID
AND S_Date < '1398-03-25' AND E_Date > '1398-03-25'
GROUP BY T_Name , Type 

-- Game Query 3 --
SELECT F_Name , L_Name , T_Name , Goal_Time
FROM Goal, P_Contract , Human
WHERE Home_Team = 'team B' AND Away_Team = 'team A' AND M_Date = '1398-03-25' AND Goal.P_ID = P_Contract.P_ID
AND S_Date < '1398-03-25' AND E_Date > '1398-03-25' AND Goal.P_ID = Human.ID AND P_Contract.P_ID = Human.ID
ORDER BY T_Name

-- Game Query 4 --
SELECT F_Name , L_Name , T_Name , Type , Time
FROM Mistake, P_Contract , Human
WHERE Home_Team = 'team B' AND Away_Team = 'team A' AND M_Date = '1398-03-25' AND Mistake.P_ID = P_Contract.P_ID
AND S_Date < '1398-03-25' AND E_Date > '1398-03-25' AND Mistake.P_ID = Human.ID AND P_Contract.P_ID = Human.ID
ORDER BY T_Name


SELECT F_Name AS firstName_in_player, L_Name AS lastName_in_player, T_Name, ChangeTime,F_Name , L_Name 
FROM P_Contract , Human , Replace , Player, ( SELECT F_Name AS firstName_out_player, L_Name AS lastName_out_player, T_Name, ChangeTime
FROM P_Contract , Human , Replace, Player
WHERE Replace.Home_Team = 'team B' AND Replace.Away_Team = 'team A' AND Replace.M_Date = '1398-03-25'
AND S_Date < '1398-03-25' AND E_Date > '1398-03-25' AND Replace.OutPlayer_ID = P_Contract.P_ID 
AND Player.P_ID = Human.ID AND OutPlayer_ID = Player.P_ID )

WHERE Replace.Home_Team = 'team B' AND Replace.Away_Team = 'team A' AND Replace.M_Date = '1398-03-25'
AND S_Date < '1398-03-25' AND E_Date > '1398-03-25'
AND ( Replace.InPlayer_ID = P_Contract.P_ID ) AND InPlayer_ID = Player.P_ID AND Player.P_ID = Human.ID

