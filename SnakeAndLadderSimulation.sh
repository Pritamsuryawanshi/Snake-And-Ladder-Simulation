#!/bin/bash -x
echo "Welcome to Snake And Ladder simulation"

#CONSTANT
PLAYER_START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLE
dieValue=$((RANDOM%6+1))
playerMove=$((RANDOM%3+1))
playerCurrentPosition=$PLAYER_START_POSITION

	#Checking the options for player's next move
function playerNextMove()
{
	case $playerMove in
		$NO_PLAY)
			playerCurrentPosition=$playerCurrentPosition
			;;
		$LADDER)
			playerCurrentPosition=$(( playerCurrentPosition + dieValue ))
			;;
		$SNAKE)
			playerCurrentPosition=$(( playerCurrentPosition - dieValue ))
			;;
	esac
}

playerNextMove
