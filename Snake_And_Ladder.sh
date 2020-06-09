#!/bin/bash
#constant
FORWARD_MOVE=1
BACKWARD_MOVE=2
NO_MOVE=0
NUMBER_OF_PLAYER=1
WINNING_POSITION=100
START_POSITION=0

#variables
position=0

positon=$startPosition
rollDice() {
	stepCheck=$((RANDOM%6+1))
	movingCheck=$((RANDOM%3))
        case $movingCheck in
                $FORWARD_MOVE)
                        position=$(($position+$stepCheck))
			if [ $position -gt $WINNING_POSITION ]
			then
				position=$((position-stepCheck))
			fi
                        echo "$position"
                        ;;
                $BACKWARD_MOVE)
                        position=$(($position-$stepCheck))
                        if [ $position -lt $START_POSITION ]
                        then
                                position=$START_POSITION
                        fi
                        echo "$position"
                        ;;
                $NO_MOVE)
                       position=$(($position+0))
                       ;;
        esac


}

while (( $position < $WINNING_POSITION ))
do

	rollDice

done
echo "player won the game $position"
