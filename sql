SELECT team.name, COUNT(player.id) AS nb_player
FROM player
JOIN team ON team.id = player.team_id
GROUP BY team.id
ORDER BY nb_player DESC;
+------------+-----------+
| name       | nb_player |
+------------+-----------+
| Gryffindor |        36 |
| Slytherin  |        21 |
| Ravenclaw  |        15 |
| Hufflepuff |        12 |
+------------+-----------+
4 rows in set (0.000 sec)


SELECT team.name
FROM player
JOIN team ON team.id = player.team_id
GROUP BY team.id
HAVING COUNT(player.id) >= 14
ORDER BY team.name ASC;
+------------+
| name       |
+------------+
| Gryffindor |
| Ravenclaw  |
| Slytherin  |
+------------+
3 rows in set (0.001 sec)



SELECT CONCAT(wizard.firstname, ' ',wizard.lastname) AS gryffindor_player_choosen
FROM wizard
JOIN player ON wizard.id = player.wizard_id
JOIN team ON team.id = player.team_id
WHERE team.name = 'Gryffindor' AND DAYOFWEEK(player.enrollment_date) = 2
ORDER BY player.enrollment_date ASC;
+---------------------------+
| gryffindor_player_choosen |
+---------------------------+
| George Weasley            |
| Alice Longbottom          |
| Cadogan                   |
| Godric Gryffindor         |
| Sirius Black              |
| Aberforth Dumbledore      |
| Augusta Longbottom        |
+---------------------------+
7 rows in set (0.001 sec)
