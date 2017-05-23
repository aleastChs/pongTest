/*
 * 
 * GAME_LOGIC.C
 * 
 */ 

#include "standard_types.h"
#include "keyboard_logic.h"
#include "geometry.h"
#include "game_logic.h"
#include "delay.h"
#include "ascii_logic.h"
#include "player_logic.h"

/*
 * GET THE POSITION OF THE PLAYER
 * 
 * IF isLeftWall == 0:			do nothing 
 * ELSE IF isLeft == 1:			add the size of x to the position
 * 
 * RETURN THE POSITION IN X
 */ 

void update_ascii_display(char textTop[], char textBottom[]) 
{
	char *str;
	
	ascii_gotoxt(1,1);
	
	str = textTop;
	
	while(*str) {
		ascii_write_char(*str++);
	}
	ascii_gotoxt(1,2);
	str = textBottom;
	
	while(*str) {
		ascii_write_char(*str++);
	}
}

uint8 get_wall_player(P_OBJECT player, uint8 isLeftWall) {
	uint32 x;
	
	x = player->posx;
	
	if(isLeftWall != 0) {
		// if isLeftWall non-zero add size of player
		x += player->geo->sizex;
	}
	return x;
}

/*
 * CHECK IF OBJECT1 IS INSIDE OBEJCT2 Y - WISE
 * 
 * IF SO:		RETURN 1
 * ELSE:		RETURN 0
 * 
 */ 
uint8 inside_y_wise(P_OBJECT object1, P_OBJECT object2) {
	uint8 obj1_top_coord = object1->posy;
	delay_250ns();
	uint8 obj2_top_coord = object2->posy;
	uint8 obj2_bottom_coord = obj2_top_coord + object2->geo->sizey;
	delay_250ns();
	uint8 value = 0;
	if (obj1_top_coord >= obj2_top_coord && obj1_top_coord <= obj2_bottom_coord) {
		value = 1;
	}
	
	return value;
}

/*
 * CHECK IF THE BALL TOUCHES PLAYER_LEFT / PLAYER_RIGHT 
 * 
 * IF SO:		change direction of the ball in X
 * ELSE:		do nothing
 * 
 * CHECK IF THE BALL TOUCHES THE WALL TO THE LEFT / RIGHT  
 */ 
void check_ball(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball)
{
	uint8 wall_player_left = get_wall_player(playerLeft, 1);
	delay_250ns();
	uint8 wall_player_right = get_wall_player(playerRight, 0);
	delay_250ns();
	uint8 ball_right_side_coord = (ball->posx + ball->geo->sizex);
	uint8 ball_left_side_coord = ball->posx;
	delay_250ns();
	uint8 ball_top_coord = ball->posy;
	uint8 ball_bottom_coord = ball->posy + ball->geo->sizey;
	
// CHECK IF GOAL!!!
	
	if ( ball_right_side_coord >= 126) {
		// player left gets a point
		// update ascii-display	
		
		// start a new ball
		
		
	} else if (ball_left_side_coord <= 3) {
		
		// player right gets a point
		// update ascii-display
		
		// start a new ball
		
	} 
	
// END CHECK GOAL


// CHECK WALLS PLAYERS
	delay_250ns();
	if (   ( ball_right_side_coord + 1)  == wall_player_right  ) 
	{ // playerRight
	
		if (inside_y_wise(ball, playerRight)) 
		{
			ball->dirx = -(ball->dirx);
			delay_250ns();
			ball->posx = wall_player_right - ball->geo->sizex - 1;
		}
		
	} 
	else if (    (ball_left_side_coord - 1) == wall_player_left ) 
	{ // playerLeft
		
		if (inside_y_wise(ball, playerLeft)) 
		{
			ball->dirx = -(ball->dirx);
			delay_250ns();
			ball->posx = wall_player_left + 1;
		}
		
	}
// END CHECK WALLS PLAYERS
	
	
// CHECK FLOOR / BOTTOM
	delay_250ns();
	if (ball_top_coord <= 2) 
	{
		ball->diry = -(ball->diry);
	} 
	else if( ball_bottom_coord >= 62) 
	{
		ball->diry = -(ball->diry);
	}
// END CHECK FLOOR / BOTTOM	
	

}
// read keyboard right
	// if:		2_IS_PRESSED 
	//					playerXX->set_speed(0,1);
	//			CHECK IF ENABLE TO MOVE
	//									THEN DRAW
	// else if:	 8_IS_PRESSED 
	//					plauerXX->set_speed(0,-1);
	//			CHECK IF ENABLE TO MOVE
	//									THEN DRAW

void update_player_pos(P_PLAYER playerLeft, P_PLAYER playerRight) 
{	
	
// Player to The LEFT
	playerLeft->key_pressed = get_key(1);
	
	volatile uint8 pressed = playerLeft->key_pressed;
	
	if ((pressed == 2) && (playerLeft->p_obj->posy >= 2)) 
	{
		playerLeft->p_obj->set_speed(playerLeft->p_obj,0,1);
		playerLeft->p_obj->move(playerLeft->p_obj);
	} 
	else if(  (pressed == 8)    && (  (playerLeft->p_obj->posy + playerLeft->p_obj->geo->sizey)   <=    64))
	{
		playerLeft->p_obj->set_speed(playerLeft->p_obj,0,-1);
		playerLeft->p_obj->move(playerLeft->p_obj);
	}
	
	
// Player to The Right	
	playerRight->key_pressed = get_key(0);
	pressed = playerRight->key_pressed;
	
	if ((pressed == 2) && (playerRight->p_obj->posy >= 2)) 
	{
		playerRight->p_obj->set_speed(playerRight->p_obj,0,1);
		playerRight->p_obj->move(playerRight->p_obj);
	}
	else if ((pressed == 8)    && (  (playerRight->p_obj->posy + playerRight->p_obj->geo->sizey)   <=    64)) 
	{
		playerRight->p_obj->set_speed(playerRight->p_obj,0,-1);
		playerRight->p_obj->move(playerRight->p_obj);
	}
}


// Pass the ball 
// And if toTheRight is 
//						0:		start the ball to the left direction			
//						1:		start the ball to the right direction
void start_new_ball(P_OBJECT b, uint8 toTheRight)
{
	b->posx = 64;
	b->posy = 20;
	
	b->set_speed(b,-1,b->diry);
	
	if (toTheRight != 0) 
	{
		b->set_speed(b	,	1	,	b->diry);
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
void ping(P_PLAYER playerLeft, P_PLAYER playerRight, P_OBJECT ball) {
	// check the postion of the ball related to the players / walls -> change direction if collision / score if goal
	check_ball(playerLeft->p_obj, playerRight->p_obj, ball);				
	delay_micro(5);
	//ball->move(ball);
	delay_micro(5);
	update_player_pos(playerLeft,playerRight);
}

void welcome(void) {
	char welcoming[] = "Welcome To The";
	char game[] = "Greatest Game Ever?";
	
	update_ascii_display(welcoming, game);
}