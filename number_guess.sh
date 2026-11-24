#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#numero random
RANUM=$(( (RANDOM % 1000) + 1 ))
#echo $RANUM

echo "Enter your username:"
read NOME

if [[ ${#NOME} -le 22 ]]
then
  IFS='|' read -r NPART BEST < <($PSQL "SELECT count(guesses), min(guesses) from games where gamer='$NOME';")
  if [[ $BEST -gt 0 ]]
  then
    echo "Welcome back, $NOME! You have played $NPART games, and your best game took $BEST guesses."
  else
    echo "Welcome, $NOME! It looks like this is your first time here."
  fi
  
  CONTO=1
  
  echo "Guess the secret number between 1 and 1000:"
  read GUESS

  while [[ ! "$GUESS" =~ ^[0-9]+$ ]]
  do
  echo "That is not an integer, guess again:"
  read GUESS
  done 

  while [[ $GUESS -ne $RANUM ]] 
  do
    if [[ $GUESS -lt $RANUM ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
    CONTO=$((CONTO + 1))
    read GUESS
    while [[ ! "$GUESS" =~ ^[0-9]+$ ]]
    do
      echo "That is not an integer, guess again:"
      read GUESS
    done 
  done
  echo "You guessed it in $CONTO tries. The secret number was $RANUM. Nice job!"
  INSERT=$($PSQL "INSERT INTO games(gamer, guesses) VALUES ('$NOME', $CONTO);")

else
  #NOME TROPPO LUNGO
  echo "Too long of an username, sorry (max 22 characters)."
fi
