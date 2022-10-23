
-- Player Query 1 --
SELECT Player_Team_Contract.P_ID, T_Name, S_Date, E_Date, Salary 
FROM Player_Team_Contract --Match_Player
WHERE Player_Team_Contract.P_ID = '1313131313' -- AND Match_Player.P_ID = '1313131313' 