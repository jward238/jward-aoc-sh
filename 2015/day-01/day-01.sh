#!/usr/bin/bash

INPUT_FILE=$1

INPUT_PATTERN=$(cat $INPUT_FILE)

echo "Running part 1"

FLOOR=0

while read -n 1 CHARACTER
do
	if [[ $CHARACTER == "(" ]]
	then
		(( FLOOR += 1 ))
	elif [[ $CHARACTER == ")" ]]
	then
		(( FLOOR -= 1 ))
	fi
done <<< "$INPUT_PATTERN"

echo "Santa will end up on floor $FLOOR"

sleep 1

echo "Running part 2"

FLOOR=0

LOOP_COUNTER=0

while read -n 1 CHARACTER
do
	(( LOOP_COUNTER += 1 ))

	if [[ $CHARACTER == "(" ]]
        then
                (( FLOOR += 1 ))
        elif [[ $CHARACTER == ")" ]]
        then
                (( FLOOR -= 1 ))
        fi

	if (( FLOOR == -1 ))
	then
		break
	fi
done <<< "$INPUT_PATTERN"

echo "Santa will enter the basement after $LOOP_COUNTER instructions"
