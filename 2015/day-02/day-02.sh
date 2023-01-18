#!/usr/bin/bash

INPUT_FILE=$1

INPUT_PATTERN=$(cat $INPUT_FILE)

echo "Running part 1"

while read PACKAGE_MEASUREMENTS
do
	PACKAGE_LENGTH=$(cut -d "x" -f1 <<< "$PACKAGE_MEASUREMENTS")
	PACKAGE_WIDTH=$(cut -d "x" -f2 <<< "$PACKAGE_MEASUREMENTS")
	PACKAGE_HEIGHT=$(cut -d "x" -f3 <<< "$PACKAGE_MEASUREMENTS")

	(( PACKAGE_SURFACE_AREA = 2*PACKAGE_LENGTH*PACKAGE_WIDTH + 2*PACKAGE_WIDTH*PACKAGE_HEIGHT + 2*PACKAGE_HEIGHT*PACKAGE_LENGTH ))

	echo $PACKAGE_SURFACE_AREA

done <<< "$INPUT_PATTERN"