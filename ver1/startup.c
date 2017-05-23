/*
 * 
 * STARTUP.C
 * 
 */ 

/**************************************************************************************************************************************

											INCLUDES

**************************************************************************************************************************************/
#include "config_gpio.h"
#include "standard_types.h"
#include "delay.h"
#include "display_logic.h"
#include "geometry.h"
#include "keyboard_logic.h"
#include "player_logic.h"
#include "game_logic.h"
#include "ascii_logic.h"

/**************************************************************************************************************************************

											TYPEDEFS

**************************************************************************************************************************************/  
typedef volatile GPIO* gpioptr;
volatile int delay = 1;

/**************************************************************************************************************************************

											DEFINES

**************************************************************************************************************************************/

#define GPIO_E 				((gpioptr)	 	0x40021000)   // definera en pekare av typen GPIO till Port E:s adress
#define GPIO_D 				((gpioptr) 		0x40020C00) 
#define RCC_BASE			((uint32) 		0x40023800)
#define RCC_EHB1ENR			*((uint32*) 	RCC_BASE)
#define ENABLE_GPIO_D		((uint32) 		0b01000)
#define ENABLE_GPIO_E		((uint32)		0b10000)


#define SIM


/**************************************************************************************************************************************

											PREPROCESSOR

**************************************************************************************************************************************/


/**************************************************************************************************************************************

											STARTUP

**************************************************************************************************************************************/

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
 
void startup ( void )
{
asm volatile(
    " LDR R0,=0x2001C000\n"     /* set stack */
    " MOV SP,R0\n"
    " BL main\n"                /* call main */
    ".L1: B .L1\n"              /* never return */
    ) ;
}


/**************************************************************************************************************************************

											CONSTANTS

**************************************************************************************************************************************/



/**************************************************************************************************************************************

										INIT OBJECTS

**************************************************************************************************************************************/

GEOMETRY ball_geometry = { 12,
	4,4,
	{
		{0,1}, {0,2}, {1,0}, {1,1}, {1,2},
		{1,3}, {2,0}, {2,1}, {2,2}, {2,3},
		{3,1}, {3,2}
	}
};

OBJECT ball = 
{
	&ball_geometry,
	0,0,
	12,50,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};


GEOMETRY player_geometry = {
	120,
	4,
	30,
	{
		{0,0},{0,1},{0,2},{0,3},{0,4},{0,5},{0,6},{0,7},{0,8},{0,9},
		{0,10},{0,11},{0,12},{0,13},{0,14},{0,15},{0,16},{0,17},{0,18},{0,19},
		{0,20},{0,21},{0,22},{0,23},{0,24},{0,25},{0,26},{0,27},{0,28},{0,29},

		
		{1,0},{1,1},{1,2},{1,3},{1,4},{1,5},{1,6},{1,7},{1,8},{1,9},
		{1,10},{1,11},{1,12},{1,13},{1,14},{1,15},{1,16},{1,17},{1,18},{1,19},
		{1,20},{1,21},{1,22},{1,23},{1,24},{1,25},{1,26},{1,27},{1,28},{1,29},

		
		
		{2,0},{2,1},{2,2},{2,3},{2,4},{2,5},{2,6},{2,7},{2,8},{2,9},
		{2,10},{2,11},{2,12},{2,13},{2,14},{2,15},{2,16},{2,17},{2,18},{2,19},
		{2,20},{2,21},{2,22},{2,23},{2,24},{2,25},{2,26},{2,27},{2,28},{2,29},		
		
		{3,0},{3,1},{3,2},{3,3},{3,4},{3,5},{3,6},{3,7},{3,8},{3,9},
		{3,10},{3,11},{3,12},{3,13},{3,14},{3,15},{3,16},{3,17},{3,18},{3,19},
		{3,20},{3,21},{3,22},{3,23},{3,24},{3,25},{3,26},{3,27},{3,28},{3,29}
	}
};


OBJECT p1_obj = 
{
	&player_geometry,
	0,0,
	2,25,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};

OBJECT p2_obj = 
{
	&player_geometry,
	0,0,
	123,25,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};

PLAYER p1_player = 
{
	&p1_obj,
	0
};

PLAYER p2_player = 
{
	&p2_obj,
	0
};

P_PLAYER playerLeft  = 	&p1_player;
P_PLAYER playerRight = 	&p2_player;
P_OBJECT pong = &ball;
/**************************************************************************************************************************************

											FUNCTION PROTOTYPES

**************************************************************************************************************************************/


/**************************************************************************************************************************************

											INITS

**************************************************************************************************************************************/


void init_micro_computer(void){
	RCC_EHB1ENR |= ENABLE_GPIO_D | ENABLE_GPIO_E; // enable gpio d and e on the MD407 Card
	
}

// draw every object on the lcd display
// setup the speed of pong
void drawing_init(void){
	draw_object(pong);	
	delay_milli(delay);
	draw_object(playerLeft->p_obj);
	delay_milli(delay);
	draw_object(playerRight->p_obj);
	delay_milli(delay);
	
	
	pong->set_speed(pong,-1,-1);
}


/**************************************************************************************************************************************

											MAIN
											 
											  
											SETUP:
											 * KEYBOARD 1: 		GPIO_D 		LOW
											 * KEYBOARD 2: 		GPIO_D 		HIGH
											 * LCD DISPLAY:		GPIO_E 		LOW + HIGH

**************************************************************************************************************************************/

int main(void)
{
	init_micro_computer();
	
	app_init_display();
	app_init_keyboards();
	
	//graphic_initalize();
	ascii_init();
	
	//graphic_clear_screen();
	
	//drawing_init();
	ascii_clear_display();
	
	welcome();

	/*

	while(1)
	{
		ping(playerLeft->p_obj, playerRight->p_obj, pong);
		//40 milli i hårdvara
		//delay_milli(4*delay);
	}*/
}
