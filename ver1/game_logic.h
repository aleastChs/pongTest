/*
 * 
 * GAME_LOGIC.H
 * 
 */ 


#ifndef		GAME_LOGIC_H
#define		GAME_LOGIC_H

uint8 get_wall_player(P_OBJECT player, uint8 isLeftWall);
uint8 inside_y_wise(P_OBJECT object1, P_OBJECT object2);
void check_ball(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball);
void ping(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball);


#endif