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
	
	uint8 obj2_top_coord = object2->posy;
	uint8 obj2_bottom_coord = object2->posy + object2->geo->sizey;
	
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
void check_ball(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball){
	uint8 wall_player_left = get_wall_player(playerLeft, 1);
	uint8 wall_player_right = get_wall_player(playerRight, 0);
	
	uint8 ball_right_side_coord = (ball->posx + ball->geo->sizex);
	uint8 ball_left_side_coord = ball->posx;
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
	
	if (   ( ball_right_side_coord + 1)  == wall_player_right  ) { // playerRight
		if (inside_y_wise(ball, playerRight)) {
			ball->dirx = -(ball->dirx);
			ball->posx = wall_player_right - ball->geo->sizex;
		}
	} else if (    (ball_left_side_coord - 1) == wall_player_left ) { // playerLeft
		if (inside_y_wise(ball, playerLeft)) {
			ball->dirx = -(ball->dirx);
			ball->posx = wall_player_left;
		}
	}
// END CHECK WALLS PLAYERS
	
	
// CHECK FLOOR / BOTTOM
	if (ball_top_coord <= 2) {
		ball->diry = -(ball->diry);
	} else if( ball_bottom_coord >= 62) {
		ball->diry = -(ball->diry);
	}
// END CHECK FLOOR / BOTTOM	
	

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
	// check the postion of the ball related to the players / walls -> change direction if collision / score if goal
	check_ball(playerLeft, playerRight, ball);				
	
	ball->move(ball);
	
	// read keyboard left
	// if:		 2_IS_PRESSED 
	//					playerLeft->set_speed(0,1);
	//			CHECK IF ENABLE TO MOVE
	//									THEN DRAW
	// else if:	 0_IS_PRESSED 
	//					playerLeft->set_speed(0,-1);
	//			CHECK IF ENABLE TO MOVE
	//									THEN DRAW
	
	// read keyboard right
	// if:		2_IS_PRESSED 
	//					playerRight->set_speed(0,1);
	//			CHECK IF ENABLE TO MOVE
	//									THEN DRAW
	// else if:	 0_IS_PRESSED 
	//					playerRight->set_speed(0,-1);
	//			CHECK IF ENABLE TO MOVE
	//									THEN DRAW
	
	
}