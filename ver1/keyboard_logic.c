/*
 * 
 * KEYBOARD_LOGIC.C
 * 
 */ 
 
#include "standard_types.h" 
#include "keyboard_logic.h"
#include "config_gpio.h"
#include "delay.h"

typedef volatile GPIO* gpioptr;

#define GPIO_D 				((gpioptr) 		0x40020C00) 

const uint8 seg_codes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0xDE, 0x79, 0x71};
const uint8 key[] = { 1, 4, 7, 0xE, 2, 5, 8, 0x0, 3, 0x6, 9, 0xF, 0xA, 0xB, 0xC, 0xD};	// keyboards
 
 
void app_init_keyboards(void) {
	GPIO_D->moder 	= (uint32) 0x55005500;		// make 15-12,7-4 to outport, 11-8, 3-0 inport 
	GPIO_D->otyper 	= (uint16) 0x0000;			// push pull to outport 
	GPIO_D->pupdr	= (uint32) 0x00AA00AA;		// pull-down to inports
	// set to zero
	GPIO_D->idrHigh = (uint8)  0x00;			 
	GPIO_D->idrLow  = (uint8)  0x00;
	GPIO_D->odrHigh = (uint8)  0x00;
	GPIO_D->odrLow  = (uint8)  0x00;
}
/*
 * choose low gpio	: 	0
 * choose high gpio	: 	1
 */ 
uint8 get_key(uint8 chooseHighOrLow) 
{
	uint8 keyBoard = 0xFF;	//define keyboard
	for(uint8 row = 1; row <=4; row++)		// for each of the rows...
	{
		// setup functions pointers
		void (*activatePtr)(uint32);
		uint32 (*getColPtr)(void);
		
		
		// depending on the input chooseHighOrLow
		// assign the different funtions (high/low)
		if(chooseHighOrLow == 1){
			uint32 kbd_get_col_high(void);
			void kbd_activate_high(uint32 row);
			
			activatePtr 	= kbd_activate_high;
			getColPtr 		= kbd_get_col_high;
		}
		if(chooseHighOrLow == 0){
			uint32 kbd_get_col_low(void);
			void kbd_activate_low(uint32 row);
			
			activatePtr 	= kbd_activate_low;
			getColPtr 		= kbd_get_col_low;
		}
		
		uint32 column = 0x00000000; // reset column variable to zero
		delay_500ns();
		activatePtr(row);			// ...activate keyboard row
		column = getColPtr();		// get the column 
		
		// if the column is nonzero, set keyboard to value of the keys
		// else set keyboard is 0xFF
		if(column != 0) 
		{
			keyBoard = key[4*(column - 1) + (row - 1)];
		}
	}
	
	// return keyboard
	return keyBoard;
}

// activates one of the for rows with the parameter row
void kbd_activate_low(uint32 row) 
{
	switch(row) 
	{
		case 1: 
			GPIO_D->odrLow = 0x10;
			break;
		case 2: 
			GPIO_D->odrLow = 0x20;
			break;
		case 3: 
			GPIO_D->odrLow = 0x40;
			break;
		case 4: 
			GPIO_D->odrLow = 0x80;
			break;
	}
}
// activates one of the for rows with the parameter row
void kbd_activate_high(uint32 row) 
{
	switch(row) 
	{
		case 1: 
			GPIO_D->odrHigh = 0x10;
			break;
		case 2: 
			GPIO_D->odrHigh = 0x20;
			break;
		case 3: 
			GPIO_D->odrHigh = 0x40;
			break;
		case 4: 
			GPIO_D->odrHigh = 0x80;
			break;
	}
}


// get the column that is pressed 
uint32 kbd_get_col_low(void)
{
	uint8 c;
	c = GPIO_D->idrLow; // read from inputs
	uint32 col = 0;
	// if (c & 0b001) != 0 -> col = 1
	// if (c & 0b010) != 0 -> col = 2
	if(c & 1) 
	{
		col = 1;
	}
	if(c & 2) 
	{
		col = 2;
	}
	if(c & 4) 
	{
		col = 3;
	}
	if(c & 8) 
	{
		col = 4;
	}
	// return the column
	return col;
}

// get the column that is pressed 
uint32 kbd_get_col_high(void)
{
	uint8 c;
	c = GPIO_D->idrHigh; // read from inputs
	uint32 col = 0;
	// if (c & 0b001) != 0 -> col = 1
	// if (c & 0b010) != 0 -> col = 2
	if(c & 1) 
	{
		col = 1;
	}
	if(c & 2) 
	{
		col = 2;
	}
	if(c & 4) 
	{
		col = 3;
	}
	if(c & 8) 
	{
		col = 4;
	}
	// return the column
	return col;
}