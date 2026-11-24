#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ELE=$1
if [[ -z $ELE ]]
then
	echo "Please provide an element as an argument"
else
	#es 1: provvedono il nome
  IFS='|' read -r NUM_AT SIMB < <($PSQL "SELECT atomic_number,symbol from elements where name='$ELE';")	
	if [[  -z $NUM_AT ]]
	then
		#es 2: provvedono il simbolo 
		IFS='|' read -r NUM_AT NOME < <($PSQL "SELECT atomic_number, name from elements where symbol='$ELE';")
		if [[ -z $NUM_AT ]]
		then
			#es 3: provvedono il numero atomico
			IFS='|' read -r NOME SIMB < <($PSQL "SELECT name, symbol from elements where atomic_number='$ELE';")
			if [[ -z $NOME ]]
			then
				#se non funziona nessuno
				echo "I could not find that element in the database"
			fi
	  	#trovato come numero atomico
			NUM_AT=$ELE
		else
		#trovato come simbolo
		SIMB=$ELE
		fi
	else
		#trovato come nome
		NOME=$ELE
	fi
  IFS='|' read -r MASS MTP BLP TIPO< <($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, c.type from properties join types as c using (type_id) where atomic_number=$NUM_AT;")
	#una volta trovato tutto
	echo "The element with atomic number $NUM_AT is $NOME ($SIMB). It's a $TIPO, with a mass of $MASS au. $NOME has a melting point of $MTP celsius and a boiling point of $BLP celsius."
fi

####
