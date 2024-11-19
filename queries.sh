#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT (SUM(winner_goals) + SUM(opponent_goals)) as sum_goals FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELCT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELCT ROUND(AVG(winner_goals), 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL SELECT AVG(winner_goals + opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELCT MAX(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELCT COUNT(*) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "($PSQL "SELECT name FROM games INNER JOIN teams ON winner_id = team_id WHERE year = 2018 AND round ='Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "($PSQL "SELECT name FROM teams INNER JOIN games AS gw ON team_id = gw.winner_id INNER JOIN games AS go ON team_id = go.opponent_id WHERE gw.year = 2014 AND gw.round = 'Eighth-Final' GROUP BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "($PSQL "SELECT name FROM teams INNER JOIN games ON team_id = winner_id GROUP BY name")"

echo -e "\nYear and team name of all the champions:"
echo "($PSQL "SELECT year, name FROM games INNER JOIN teams  ON team_id = winner_id WHERE round = 'Final'")"

echo -e "\nList of teams that start with 'Co':"
echo "($PSQL "SELECT * FROM teams WHERE name LIKE 'Co%'")"
