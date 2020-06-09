#!/bin/bash
#constant
FORWARD_MOVE=1
BACKWARD_MOVE=2
NO_MOVE=0
NUMBER_OF_PLAYER=1
WINNING_POSITION=100
START_POSITION=0

#variables
declare -a player1Position
declare -a player2Position
playerOnePosition=$START_POSITION
playerTwoPosition=$START_POSITION
count1=0
count2=0
playerOne() {
        stepCheck=$((RANDOM%6+1))
        movingCheck=$((RANDOM%3))
        case $movingCheck in
                $FORWARD_MOVE)
                        playerOnePosition=$(($playerOnePosition+$stepCheck))
                        if [ $playerOnePosition -gt $WINNING_POSITION ]
                        then
                                playerOnePosition=$((playerOnePosition-stepCheck))
                        fi
                        ;;
                $BACKWARD_MOVE)
                        playerOnePosition=$(($playerOnePosition-$stepCheck))
                        if [ $playerOnePosition -lt $START_POSITION ]
                        then
                                playerOnePosition=$START_POSITION
                        fi
                        ;;
                $NO_MOVE)
                       playerOnePosition=$(($playerOnePosition+0))
                       ;;
        esac

        player1Position[((count1++))]=$playerOnePosition
        ((dice1++))

}

playerTwo() {
        stepCheck=$((RANDOM%6+1))
        movingCheck=$((RANDOM%3))
        case $movingCheck in
                $FORWARD_MOVE)
                        playerTwoPosition=$(($playerTwoPosition+$stepCheck))
                        if [ $playerTwoPosition -gt $WINNING_POSITION ]
                        then
                                playerTwoPosition=$((playerTwoPosition-stepCheck))
                        fi
                        ;;
                $BACKWARD_MOVE)
                        playerTwoPosition=$(($playerTwoPosition-$stepCheck))
                        if [ $playerTwoPosition -lt $START_POSITION ]
                        then
                                playerTwoPosition=$START_POSITION
                        fi
                        ;;
                $NO_MOVE)
                       position=$(($playerTwoPosition+0))
                       ;;
        esac
        player2Position[((count2++))]=$playerTwoPosition



        ((dice2++))
}



while [[ $playerOnePosition -lt $WINNING_POSITION && $playerTwoPosition -lt $WINNING_POSITION ]]
do

        playerOne
        while [ $movingCheck -eq $FORWARD_MOVE ]
        do
                        playerOne
        done

        playerTwo
        while [ $movingCheck -eq $FORWARD_MOVE ]
        do
                        playerTwo
        done

done

for print1 in ${player1Position[@]}
do
        echo player one position is -----// $print1
done

for print2 in ${player2Position[@]}
do
        echo player two position is ------// $print2
done
echo "player one total dice roll is $dice1"
echo "player two total dice roll is $dice2"
if [ $playerOnePosition -eq $WINNING_POSITION ]
then
        echo "=============================player one is winner============================="
else
        echo "=============================player two is winner============================="
fi
