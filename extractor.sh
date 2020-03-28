#!/bin/bash

# This script extracts bicylce theft number, other theft numbers and total theft number for the city of Groningen and Almere from a .csv file.
# In order to make it executable, download this script, then type chmod u+x extractor.sh in the command line.
# To use it with a file, type ./extractor.sh and the filename you want to use. 

# This function checks if the user has put in a .csv file he wants to read, if not the script asks the user to input one.
FILE=$1
if [ -z "$FILE" ]
then 
	echo "Please a one argument: The .csv file you want to read"
	exit
fi

#This function extracts the number of bike thefts in Groningen.

function bike_gron {
	echo "The number of occurences of bicycle theft in Groningen is:" 
	Bike_gron=$(cat $FILE | tail -n +4 | grep "Diefstal van fiets" | cut -d',' -f4)
	echo $Bike_gron
}

#This function extracts the number of total thefts in Groningen then subtracts the number of bike theft and prints the result.

function other_gron {
	echo "The number of occurences of other theft in Groningen is: "
	Total_gron=$(cat $FILE | tail -n +4 | grep "Alle diefstallen" | cut -d',' -f4)
	echo "$(($Total_gron - $Bike_gron))"
}

#This function prints the number of total thefts in Groningen which has already been extracted in the previous function.

function total_gron {
	echo "Total occurences of theft in Groningen is:"
	echo $Total_gron
}

#This function extracts the number of bike thefts in Almere.

function bike_alm {
	echo "The number of occurences of bicycle theft in Almere is:"
	Bike_alm=$(cat $FILE | tail -n +4 | grep "Diefstal van fiets" | cut -d',' -f3)
	echo $Bike_alm
}

#This function extracts the number of total thefts in Almere then subtracts the number of bike theft and prints the result.

function other_alm {
	echo "The number of occurences of other theft in Almere:"
	Total_alm=$(cat $FILE | tail -n +4 | grep "Alle diefstallen" | cut -d',' -f3)
	echo "$(($Total_alm - $Bike_alm))"
}

#This function prints the number of total thefts in Almere which has already been extracted in the previous function.

function total_alm {
	echo "Total occurences of theft in Almere is:"
	echo $Total_alm
}

# The lines below are the function names, if you type a # before the the function name, it will not be executed.

bike_gron
other_gron
total_gron
bike_alm
other_alm
total_alm
	

