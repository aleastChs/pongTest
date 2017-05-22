/*
 * 
 * GAME_LOGIC.C
 * 
 */ 

#include "standard_types.h"
#include "keyboard_logic.h"
#include "geometry.h"
#include "game_logic.h"


/*
 * GET THE POSITION OF THE PLAYER
 * 
 * IF isLeftWall == 0:			do nothing 
 * ELSE IF isLeft == 1:			add the size of x to the position
 * 
 * RETURN THE POSITION IN X
 */ 

uint32 get_wall_player(P_OBJECT player, uint8 isLeftWall) {
	uint32 x;
	
	x = player->posx;
	
	if(isLeftWall != 0) {
		// else add size of player
		x += player->geo->sizex;
	} else {
		// do nothing 
	}
	return x;
}


/*
 * CHECK IF THE BALL TOUCHES PLAYER_LEFT / PLAYER_RIGHT 
 * 
 * IF SO:		change direction of the ball in X
 * ELSE:		do nothing
 * 
 */ 
void check_ball_players(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball){
	uint8 wall_player_left = get_wall_player(playerLeft, 1);
	uint8 wall_player_right = get_wall_player(playerLeft, 0);
	
	if (   ( (ball->posx + ball->geo->sizex) + 1)  == wall_player_right  ) {
		ball->dirx = -(ball->dirx);
	} else if (    ( ball->posx - 1) == wall_player_left ) {
		ball->dirx = -(ball->dirx);
	} else {
		// do nothing 
	}

}


/* 
 * UPDATE THE POSITION OF THE BALL
 * IF GOAL, 
 * 						PRINT SCORE TO THE PLAYER 
 * IF KEYBOARD_PRESSED, 
 * 						MOVE THE PLAYER
 * RENDER THE SCREEN
 */ 
void ping(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball) {
	check_ball_players(playerLeft, playerRight, ball);				// check the postion of the ball related to the players / change it if collision
	
}