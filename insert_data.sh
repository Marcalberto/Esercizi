#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat ./games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT W_G O_G
do
  if [[ $YEAR != "year" ]]
  then
    # cerca id team
    ID_WIN=$($PSQL "Select team_id from teams where name='$WINNER';")
    if [[ -z "$ID_WIN" ]]
    then
      CREATE=$($PSQL "insert into teams(name) values ('$WINNER');")
      ID_WIN=$($PSQL "select team_id from teams where name = '$WINNER';")
    fi
    ID_OPP=$($PSQL "Select team_id from teams where name='$OPPONENT';")
    if [[ -z "$ID_OPP" ]]
    then
      CREATE=$($PSQL "insert into teams(name) values ('$OPPONENT');")
      ID_OPP=$($PSQL "select team_id from teams where name = '$OPPONENT';")
    fi
    INSERISCI=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values ($YEAR,'$ROUND',$ID_WIN,$ID_OPP,$W_G,$O_G);")
  fi
  echo -e "\n$YEAR|'$ROUND'|$ID_WIN|$ID_OPP|$W_G|$O_G"  
done

echo -e "\n\nFine immissione dati.\n"
