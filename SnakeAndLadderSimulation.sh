#!/bin/bash
echo "Welcome to Snake And Ladder simulation"

#CONSTANTS
PLAYER_STARTING_POSITION=0
PLAYER_WINNING_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLES
playerCurrentPosition=$PLAYER_STARTING_POSITION
positionOfPlayer1=$PLAYER_STARTING_POSITION
positionOfPlayer2=$PLAYER_STARTING_POSITION

#Checking the options for player's next move
function playerNextMove()
{
	playerCurrentPosition=$1
	generatingRandomValues
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
	#If either of the player reaches the 100th position first then that player wins and the game's stopped
	if (( $playerCurrentPosition == 100 ))
	then
		echo "$2 wins"
		exit
	fi
}

#Function to Generate random values for die roll and player's next move
function generatingRandomValues()
{
	playerMove=$(( RANDOM%3+1 ))
	dieValue=$(( RANDOM%6+1 ))
}

#Function to perform the ladder's operation
function ladderMoves()
{
	playerCurrentPosition=$(( $playerCurrentPosition + $dieValue ))
	if (( $playerCurrentPosition > $PLAYER_WINNING_POSITION ))
	then
		playerCurrentPosition=$(( $playerCurrentPosition - $dieValue ))
	fi
}

#Function to perform the snake's operation
function snakeMoves()
{
	playerCurrentPosition=$(( $playerCurrentPosition - $dieValue ))
	if (( $playerCurrentPosition < $PLAYER_STARTING_POSITION))
	then
		playerCurrentPosition=$PLAYER_STARTING_POSITION
	fi
}

#Function to play till one of  the player wins
function play()
{
	while (( $positionOfPlayer1 < $PLAYER_WINNING_POSITION && $positionOfPlayer2 < $PLAYER_WINNING_POSITION ))
	do
		playerNextMove $positionOfPlayer1 Player1
		positionOfPlayer1=$playerCurrentPosition

		playerNextMove $positionOfPlayer2 Player2
		positionOfPlayer2=$playerCurrentPosition
	done
}

#MAIN

play
