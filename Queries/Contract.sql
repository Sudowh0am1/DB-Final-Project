
-- Contract Query 1 --
SELECT F_Name, L_Name, T_Name, S_Date, E_Date, Salary FROM Human, Player_Team_Contract, Player
WHERE Human.ID = Player.P_ID AND Player.P_ID = Player_Team_Contract.P_ID AND T_Name = 'team A' 
AND S_Date < '1401-10-15' AND S_Date > '1395-05-05'

-- Contract Query 2 --
SELECT F_Name, L_Name, T_Name, S_Date, E_Date, Salary FROM Human, Player_Team_Contract, Player
WHERE Human.ID = Player.P_ID AND Player.P_ID = Player_Team_Contract.P_ID 
AND S_Date < '1401-10-15' AND S_Date > '1395-05-05'
ORDER BY T_Name

-- Contract Query 3 --
SELECT F_Name, L_Name, T_Name, S_Date, E_Date, Salary, Duty FROM Human, Technical_Staff_Team_Contract, Technical_Staff
WHERE Human.ID = Technical_Staff.T_ID AND Technical_Staff.T_ID = Technical_Staff_Team_Contract.T_ID
AND S_Date < '1401-10-15' AND S_Date > '1395-05-05'
ORDER BY L_Name

-- Contract Query 4 --
SELECT T_Name, SUM(Salary) AS sum_salaries
FROM Player_Team_Contract
WHERE E_Date > '1400-04-02'
GROUP BY T_Name

-- Contract Query 5 --
SELECT T_Name, SUM(Salary) AS sum_salaries
FROM Technical_Staff_Team_Contract
WHERE E_Date > '1400-04-02'
GROUP BY T_Name
