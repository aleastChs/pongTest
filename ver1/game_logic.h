/*
 * 
 * GAME_LOGIC.H
 * 
 */ 


#ifndef		GAME_LOGIC_H
#define		GAME_LOGIC_H

#include "standard_types.h"
#include "geometry.h"
#include "player_logic.h"

void update_ascii_display(char textTop[], char textBottom[], uint8 delayMs);
void update_score(P_PLAYER p1, P_PLAYER p2);
uint8 get_wall_player(P_OBJECT player, uint8 isLeftWall);
uint8 inside_y_wise(P_OBJECT object1, P_OBJECT object2);
void check_ball(P_PLAYER playerLeft, P_PLAYER playerRight, P_OBJECT ball);
void ping(P_PLAYER playerLeft, P_PLAYER playerRight, P_OBJECT ball);
void welcome(void);
void get_ready(void);

#endif