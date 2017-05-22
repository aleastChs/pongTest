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

void set_new_position(P_OBJECT o) {
	o->posx = o->posx + o->dirx;
	o->posy = o->posy + o->diry;
}

void move_object(P_OBJECT o){
	clear_object(o);
	
	set_new_position(o);
	// X-LED
	if(o->posx < 3) {
		o->dirx = -(o->dirx);
		o->posx = 3;
	}
	if((o->posx + o->geo->sizex) >128){
		o->dirx = -(o->dirx);
		o->posx = 128 - o->geo->sizex;
	}
	// Y-LED
	if(o->posy < 3) {
		o->diry = -(o->diry);
		o->posy = 3;
	}
	if((o->posy + o->geo->sizey) > 64){
		o->diry = -(o->diry);
		o->posy = 64 - o->geo->sizey;
	}
	
	draw_object(o);
}

void set_object_speed(P_OBJECT o, uint32 speedx, uint32 speedy){
	o->dirx = speedx;
	o->diry = speedy;
}

