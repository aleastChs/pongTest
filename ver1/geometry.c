/*
 * 
 * GEMOETRY.C
 * 
 */ 

#include "geometry.h"
#include "standard_types.h"
#include "display_logic.h"

void draw_object(P_OBJECT o){
	uint32 i;
	for(i = 0; i < o->geo->numpoints; i++) {
		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 1);
	}
}

void clear_object(P_OBJECT o){
	uint32 i;
	for(i = 0; i < o->geo->numpoints; i++){
		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 0);
	}
}

void move_object(P_OBJECT o){
	clear_object(o);
	
	// set new positions
	o->posx = o->posx + o->dirx;
	o->posy = o->posy + o->diry;
	
	draw_object(o);
}

void set_object_speed(P_OBJECT o, uint32 speedx, uint32 speedy){
	o->dirx = speedx;
	o->diry = speedy;
}

