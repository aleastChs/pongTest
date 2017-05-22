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

/**************************************************************************************************************************************

											TYPEDEFS

**************************************************************************************************************************************/  
typedef volatile GPIO* gpioptr;
volatile int delay = 10;

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

											OBJECT

**************************************************************************************************************************************/

GEOMETRY ball_geometry = { 12,
	4,4,
	{
		{0,1}, {0,2}, {1,0}, {1,1}, {1,2},
		{1,3}, {2,0}, {2,1}, {2,2}, {2,3},
		{3,1}, {3,2}
	}
};

static OBJECT ball = 
{
	&ball_geometry,
	0,0,
	100,1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};


GEOMETRY player_geometry = {
	400,
	10,
	40,
	{
		{0,0},{0,1},{0,2},{0,3},{0,4},{0,5},{0,6},{0,7},{0,8},{0,9},{1,0},{1,1},{1,2},{1,3},{1,4},{1,5},{1,6},{1,7},{1,8},{1,9},
		{2,0},{2,1},{2,2},{2,3},{2,4},
		{2,5},{2,6},{2,7},{2,8},{2,9},
		{3,0},{3,1},{3,2},{3,3},{3,4},{3,5},{3,6},{3,7},{3,8},{3,9},
		{4,0},{4,1},{4,2},{4,3},{4,4},{4,5},{4,6},{4,7},{4,8},{4,9},
		{5,0},{5,1},{5,2},{5,3},{5,4},{5,5},{5,6},{5,7},{5,8},{5,9},
		{6,0},{6,1},{6,2},{6,3},{6,4},{6,5},{6,6},{6,7},{6,8},{6,9},
		{7,0},{7,1},{7,2},{7,3},{7,4},{7,5},{7,6},{7,7},{7,8},{7,9},
		{8,0},{8,1},{8,2},{8,3},{8,4},{8,5},{8,6},{8,7},{8,8},{8,9},
		{9,0},{9,1},{9,2},{9,3},{9,4},{9,5},{9,6},{9,7},{9,8},{9,9},
		{10,0},{10,1},{10,2},{10,3},{10,4},{10,5},{10,6},{10,7},{10,8},{10,9},
		{11,0},{11,1},{11,2},{11,3},{11,4},{11,5},{11,6},{11,7},{11,8},{11,9},
		{12,0},{12,1},{12,2},{12,3},{12,4},{12,5},{12,6},{12,7},{12,8},{12,9},
		{13,0},{13,1},{13,2},{13,3},{13,4},{13,5},{13,6},{13,7},{13,8},{13,9},
		{14,0},{14,1},{14,2},{14,3},{14,4},{14,5},{14,6},{14,7},{14,8},{14,9},
		{15,0},{15,1},{15,2},{15,3},{15,4},{15,5},{15,6},{15,7},{15,8},{15,9},
		{16,0},{16,1},{16,2},{16,3},{16,4},{16,5},{16,6},{16,7},{16,8},{16,9},
		{17,0},{17,1},{17,2},{17,3},{17,4},{17,5},{17,6},{17,7},{17,8},{17,9},
		{18,0},{18,1},{18,2},{18,3},{18,4},{18,5},{18,6},{18,7},{18,8},{18,9},
		{19,0},{19,1},{19,2},{19,3},{19,4},{19,5},{19,6},{19,7},{19,8},{19,9},
		{20,0},{20,1},{20,2},{20,3},{20,4},{20,5},{20,6},{20,7},{20,8},{20,9},
		{21,0},{21,1},{21,2},{21,3},{21,4},{21,5},{21,6},{21,7},{21,8},{21,9},
		{22,0},{22,1},{22,2},{22,3},{22,4},{22,5},{22,6},{22,7},{22,8},{22,9},
		{23,0},{23,1},{23,2},{23,3},{23,4},{23,5},{23,6},{23,7},{23,8},{23,9},
		{24,0},{24,1},{24,2},{24,3},{24,4},{24,5},{24,6},{24,7},{24,8},{24,9},
		{25,0},{25,1},{25,2},{25,3},{25,4},{25,5},{25,6},{25,7},{25,8},{25,9},
		{26,0},{26,1},{26,2},{26,3},{26,4},{26,5},{26,6},{26,7},{26,8},{26,9},
		{27,0},{27,1},{27,2},{27,3},{27,4},{27,5},{27,6},{27,7},{27,8},{27,9},
		{28,0},{28,1},{28,2},{28,3},{28,4},{28,5},{28,6},{28,7},{28,8},{28,9},
		{29,0},{29,1},{29,2},{29,3},{29,4},{29,5},{29,6},{29,7},{29,8},{29,9},
		{30,0},{30,1},{30,2},{30,3},{30,4},{30,5},{30,6},{30,7},{30,8},{30,9},
		{31,0},{31,1},{31,2},{31,3},{31,4},{31,5},{31,6},{31,7},{31,8},{31,9},
		{32,0},{32,1},{32,2},{32,3},{32,4},{32,5},{32,6},{32,7},{32,8},{32,9},
		{33,0},{33,1},{33,2},{33,3},{33,4},{33,5},{33,6},{33,7},{33,8},{33,9},
		{34,0},{34,1},{34,2},{34,3},{34,4},{34,5},{34,6},{34,7},{34,8},{34,9},
		{35,0},{35,1},{35,2},{35,3},{35,4},{35,5},{35,6},{35,7},{35,8},{35,9},
		{36,0},{36,1},{36,2},{36,3},{36,4},{36,5},{36,6},{36,7},{26,8},{36,9},
		{37,0},{37,1},{37,2},{37,3},{37,4},{37,5},{37,6},{37,7},{37,8},{37,9},
		{38,0},{38,1},{38,2},{38,3},{38,4},{38,5},{38,6},{38,7},{38,8},{38,9},
		{39,0},{39,1},{39,2},{39,3},{39,4},{39,5},{39,6},{39,7},{39,8},{39,9},
		
		
	}
};


static OBJECT p1 = 
{
	&player_geometry,
	0,0,
	25,15,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};

static OBJECT p2 = 
{
	&player_geometry,
	0,0,
	125,35,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};


volatile P_OBJECT pong = &ball;
volatile P_OBJECT playerLeft = &p1;
volatile P_OBJECT playerRight = &p2;
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
	draw_object(playerLeft);
	delay_milli(delay);
	draw_object(playerRight);
	delay_milli(delay);
	
	
	pong->set_speed(pong,1,1);
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
	graphic_initalize();
	
	// ska vara okommenterad i hårdvaran
	graphic_clear_screen();
	drawing_init();
	
	delay_milli(4*delay);


	while(1){
		
		
		
		
		//40 milli i hårdvara
		delay_milli(4*delay);
	}
}
