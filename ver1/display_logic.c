/*
 * 
 * DISPLAY_LOGIC.C
 * 
 */ 


#include "config_gpio.h"
#include "standard_types.h"
#include "delay.h"
#include "display_logic.h"
 
typedef volatile GPIO* gpioptr;
#define GPIO_E ((gpioptr) 0x40021000)   // definera en pekare av typen GPIO till Port E:s adress
 
#define B_E         0x40
#define B_RST       0x20
#define B_CS2       0x10
#define B_CS1       0x08
#define B_SELECT    4
#define B_RW        2
#define B_RS        1 
 
#define LCD_ON          0x3F // Display on
#define LCD_OFF         0x3E // Display off
#define LCD_SET_ADD     0x40
#define LCD_SET_PAGE    0xB8
#define LCD_DISP_START  0xC0
#define LCD_BUSY        0x80
 
void app_init_display(void) 
{   
    GPIO_E->moder    = (uint32) 0x55555555;      // make 7-0 to outport
     
}
 
void graphic_ctrl_bit_set(uint8 x){
    uint8 c;
    c = GPIO_E->odrLow;  // hämta nuvarande styrreg
    c &= ~B_SELECT;         // bit_select ska nollställd, resten ska behålla sitt värde
    c |= (~B_SELECT & x);   // ett ställ allt från x förutom b_select
    GPIO_E->odrLow = c;      // kopiera till styrreg
}
 
void graphic_ctrl_bit_clear(uint8 x){
    uint8 c;
    c = GPIO_E->odrLow;  // hämta nuvarande styrreg
    c &= ~B_SELECT;         // bit_select ska nollställd, resten ska behålla sitt värde
    c &= ~x;                // nollställ styrreg med de bitar som är 1 i x
    GPIO_E->odrLow = c;      // kopiera till styrreg
}
 
void select_controller(uint8 controller){
    switch(controller) {
        case 0:
                graphic_ctrl_bit_clear(B_CS1 | B_CS2);
                break;
        case B_CS1:
                graphic_ctrl_bit_clear(B_CS2);
                graphic_ctrl_bit_set(B_CS1);
                break;
        case B_CS2:
                graphic_ctrl_bit_clear(B_CS1);
                graphic_ctrl_bit_set(B_CS2);
                break;
        case (B_CS1 | B_CS2):
                graphic_ctrl_bit_set(B_CS1 | B_CS2);
                break;
    }   
}
 
void graphic_wait_ready(void){
    uint8 c;
    graphic_ctrl_bit_clear(B_E);        // E=0
    GPIO_E->moder    = 0x00005555;       // 15-8 ingångar, 7-0 utgångar
     
    graphic_ctrl_bit_clear(B_RS);       // RS = 0
    graphic_ctrl_bit_set(B_RW);         // RW = 1
    delay_500ns();
     
    while(1) {
        graphic_ctrl_bit_set(B_E);      // E = 1
        delay_500ns();
        c = GPIO_E->idrHigh & LCD_BUSY;
        graphic_ctrl_bit_clear(B_E);    // E = 0
        delay_500ns();
        if(c == 0) {
            // om LCD_BUSY i styrreg == 0, avbryt loop
            break;
        }
    }
    /******OBSOBSOBS RADEN UNDER STÅR INTE I EXEMPELKODEN!!!!*****/
    graphic_ctrl_bit_set(B_E);          // E = 1
    GPIO_E->moder    = 0x55555555;       // 15-0 utgångar
}


// funktion läs från data

uint8 graphic_read(uint8 controller){
	uint8 rv;
    graphic_ctrl_bit_clear(B_E);        // E=0
    GPIO_E->moder    = 0x00005555;       // 15-8 ingångar, 7-0 utgångar
     
    graphic_ctrl_bit_set(B_RS | B_RW);       // RS = 1
    graphic_ctrl_bit_set(B_RW);         // RW = 1
	select_controller(controller);
    delay_500ns();
	graphic_ctrl_bit_set(B_E);			// E=1
	
	delay_500ns();
	rv = GPIO_E->idrHigh;
	
	GPIO_E->moder = 0x55555555;		// 15-0 utågngar
	
	if(controller & B_CS1) {
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2) {
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	
	return rv;
}

uint8 graphic_read_data(uint8 controller){
	(void) graphic_read(controller);
	return graphic_read(controller);
}

void graphic_write(uint8 value, uint8 controller) {
	GPIO_E->odrHigh = value;
	select_controller(controller);
	delay_500ns();
	
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	
	graphic_ctrl_bit_clear(B_E);
	
	if(controller & B_CS1) {
		select_controller(B_CS1);
		graphic_wait_ready();
	}
	if(controller & B_CS2) {
		select_controller(B_CS2);
		graphic_wait_ready();
	}
}

void graphic_write_data(uint8 data, uint8 controller){
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);

	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	
	graphic_write(data, controller);
}

void graphic_write_command(uint8 command, uint8 controller){
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);

	graphic_ctrl_bit_clear(B_RW	| B_RS);
	
	graphic_write(command, controller);
}

void graphic_initalize(void){
	graphic_ctrl_bit_set(B_E);
	delay_micro(10);
	
	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
	delay_milli(30);
	
	graphic_ctrl_bit_set(B_RST);
	
	graphic_write_command(LCD_OFF			, B_CS1 | B_CS2);
	graphic_write_command(LCD_ON			, B_CS1 | B_CS2);
	graphic_write_command(LCD_DISP_START	, B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_ADD		, B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_PAGE		, B_CS1 | B_CS2);
	select_controller(0);

}

void graphic_clear_screen(void){
	uint8 page, add;
	for(page = 0; page <= 7; page++) {
		graphic_write_command(LCD_SET_PAGE | page	, B_CS1 | B_CS2);
		graphic_write_command(LCD_SET_ADD  | 0		, B_CS1 | B_CS2);
		for(add = 0; add <= 63; add++){
			graphic_write_data(0					, B_CS1 | B_CS2);
		}
	}
}

void pixel(uint8 x, uint8 y, uint8 set){
	uint8 mask, temp, controller;
	uint32 index;
	
	if((x<1) || (y<1) || (x>128) || (y > 64)) return;
	
	index = (y-1)/8;
	
	switch((y-1)%8){
		case 0: mask=1; break;
		case 1: mask=2; break;
		case 2: mask=4; break;
		case 3: mask=8; break;
		case 4: mask=0x10; break;
		case 5: mask=0x20; break;
		case 6: mask=0x40; break;
		case 7: mask=0x80; break;
	}
	
	if(set == 0) {
		mask = ~mask;
	}
	
	if(x > 64) {
		controller = B_CS2;
		x = x - 65;
	} else {
		controller = B_CS1;
		x = x - 1;
	}
	
	graphic_write_command(LCD_SET_ADD 		| x, controller);
	graphic_write_command(LCD_SET_PAGE		| index, controller);
	temp = graphic_read_data(controller);
	graphic_write_command(LCD_SET_ADD 		| x, controller);
	
	if(set) {
		mask = mask | temp;
	} else {
		mask = mask & temp;
	}
	
	graphic_write_data(mask, controller);
	
	
	graphic_write_command(LCD_ON			, B_CS1 | B_CS2);
}