#ifndef PLAYER_LOGIC_H
#define PLAYER_LOGIC_H

#include "standard_types.h"
#include "geometry.h"

typedef struct {
	P_OBJECT p_obj;
	uint8 score;
	uint8 key_pressed;	
} PLAYER, *P_PLAYER;


void increaseScore(P_PLAYER p);

#endif