/*
 * 
 * GEOMETRY.H
 * 
 */ 

#ifndef GEOMETRY_H
#define GEOMETRY_H

#include "standard_types.h"



typedef struct {
	uint8 x;
	uint8 y;
} POINT;

#define MAX_POINTS 400

typedef struct {
	uint32 numpoints;
	uint32 sizex;
	uint32 sizey;
	POINT px[MAX_POINTS];
} GEOMETRY, *P_GEOMETRY;



typedef struct tObj {
	P_GEOMETRY geo;
	uint32 dirx, diry;
	uint32 posx, posy;
	void (*draw)(struct tObj*);
	void (*clear)(struct tObj*);
	void (*move)(struct tObj*);
	void (*set_speed)(struct tObj*, uint32, uint32);
} OBJECT, *P_OBJECT;

void set_object_speed(P_OBJECT o, uint32 speedx, uint32 speedy);
void move_object(P_OBJECT o);
void set_new_position(P_OBJECT o);
void clear_object(P_OBJECT o);
void draw_object(P_OBJECT o);





#endif