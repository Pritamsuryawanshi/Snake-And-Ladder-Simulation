#!/bin/bash
echo "Welcome to Snake And Ladder simulation"
declare -A diceAndPosition

#CONSTANTS
PLAYER_START_POSITION=0
PLAYER_WINNING_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLE
playerCurrentPosition=$PLAYER_START_POSITION
dice=0

#Checking the options for player's next move
function playerNextMove()
{
	randomValues
	case $playerMove in
		$NO_PLAY)
			playerCurrentPosition=$playerCurrentPosition
			;;
		$LADDER)
			ladderMoves
			;;
		$SNAKE)
			snakeMoves
			;;
	esac
}

#Function to Generate random values
function randomValues()
{
	playerMove=$((RANDOM%3+1))
	dieValue=$((RANDOM%6+1))
}

#Function to perform the ladder's operation
function ladderMoves()
{
	playerCurrentPosition=$(( $playerCurrentPosition + $dieValue ))
	if (( $playerCurrentPosition > $PLAYER_WINNING_POSITION))
	then
		playerCurrentPosition=$(($playerCurrentPosition - $dieValue))
	fi
}

#Function to perform the snake's operation
function snakeMoves()
{
	playerCurrentPosition=$(( $playerCurrentPosition - $dieValue ))
	if (( $playerCurrentPosition < $PLAYER_START_POSITION))
	then
		playerCurrentPosition=$PLAYER_START_POSITION
	fi
}

#Function to store the dice count and the player's position at that time
function diceAndPosition()
{
	((dice++))
	diceAndPosition[dice-$dice]="$playerCurrentPosition"
}

#Function to play till the player wins
function play()
{
	while (( $playerCurrentPosition < $PLAYER_WINNING_POSITION ))
	do
		playerNextMove
		diceAndPosition
	done
}


#MAIN
play
