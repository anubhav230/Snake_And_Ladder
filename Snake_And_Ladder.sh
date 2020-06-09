#!/bin/bash -x
#constant
FORWARD_MOVE=1
BACKWARD_MOVE=2
NO_MOVE=0
NUMBER_OF_PLAYER=1

#variables
startPosition=0
position=0
movingCheck=$((RANDOM%3))
stepCheck=$((RANDOM%6+1))
case $movingCheck in
	$FORWARD_MOVE)
		position=$((startPosition+stepCheck))
		echo "player moved $position steps forward"
		;;
	$BACKWARD_MOVE)
		position=$((startPositon+stepCheck))
		echo "player moved $position steps backward"
		;;
	$NO_MOVE)
		position=$((startPosition+0))
		echo "player on same position"

		;;
esac

