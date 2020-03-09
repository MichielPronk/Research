#!/bin/bash

# Milestone 5 Introduction to research methods

TEXT=$1
if [ -z "$TEXT" ]
then
	echo "add an argument"
	exit
fi

function Task2 {	
	echo "The number of occurence of 'de' is:"
	grep -E -o '\w+' $TEXT | grep '^de$' | wc -w
}


Task2
