/*
 * 
 * ASCII_LOGIC.C
 * 
 */ 

#include "config_gpio.h"
#include "standard_types.h"
#include "delay.h"
#include "display_logic.h"
#include "ascii_logic.h"

typedef volatile GPIO* gpioptr;

#define GPIO_E 				((gpioptr)	 	0x40021000)   // definera en pekare av typen GPIO till Port E:s adress


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

/**************************************************************************************************************************************

											ASCII FUNCTIONS

**************************************************************************************************************************************/


void ascii_ctrl_bit_set(uint8 x) {
    GPIO_E->odrLow |= (B_SELECT | x);
}
/**** ADDRESSERA ASCII_DISPLAY OCH NOLLSTÄLL DE BITAR SOM ÄR 1 i X ****/
void ascii_ctrl_bit_clear(uint8 x) {
    GPIO_E->odrLow = (B_SELECT) | (GPIO_E->odrLow & ~x);
}

void ascii_clear_display(void) {
    while((ascii_read_status() & 0x80) == 0x80)
    {}
	delay_micro(8);
	ascii_write_cmd(0x01);
    delay_milli(2);
}

/******* SET FUNCTIONS*****/

/*** func have four options
 * 1:	nr of rows is 1, size is 5x8
 * 2:	nr of rows is 2, size is 5x8
 * 3:	nr of rows is 1, size is 5x11
 * 4	nr of rows is 2, size is 5x11
 * */
void ascii_function_set(uint8 func) {
    while((ascii_read_status() & 0x80) == 0x80)
    {}
    delay_micro(8);
	switch(func) {
		case 1:
				func = 0x00;
				break;
		case 2:
				func = 0x08;
				break;
		case 3:
				func = 0x04;
				break;
		case 4:
				func = 0x0C;
				break;
	}
	ascii_write_cmd(0x30 | func);
    delay_micro(39);
}

/*** ctrl have eight options
 * 1:	display off, marker off, blinking marker off
 * 2:	display on, marker off, blinking marker off
 * 3:	display off, marker on, blinking marker off
 * 4::	display on, marker on, blinking marker off
 * 5:	display off, marker off, blinking marker on
 * 6:	display off, marker on, blinking marker on
 * 7:	display on, marker off, blinking marker on
 * 8:	display on, marker on, blinking marker on

 * */
void ascii_display_controll(uint8 ctrl) {
    while((ascii_read_status() & 0x80) == 0x80)
    {}
    delay_micro(8);
	switch(ctrl) {
		case 1:
				ctrl = 0x00;
				break;
		case 2:
				ctrl = 0x04;
				break;
		case 3:
				ctrl = 0x02;
				break;
		case 4:
				ctrl = 0x06;
				break;
		case 5:
				ctrl = 0x01;
				break;
		case 6:
				ctrl = 0x03;
				break;
		case 7:
				ctrl = 0x05;
				break;
		case 8:
				ctrl = 0x07;
				break;
	}
	ascii_write_cmd(0x08 | ctrl);
    delay_micro(39);
}

/*** mode have four options
 * 1:	cursor left, shift off
 * 2:	cursor right, shift off
 * 3:	cursor left, shift on
 * 4:	cursor right, shift on
 * */
void ascii_entry_mode_set(uint8 mode) {
    while((ascii_read_status() & 0x80) == 0x80)
    {}
    delay_micro(8);
	switch(mode) {
		case 1:
				mode = 0x00;
				break;
		case 2:
				mode = 0x02;
				break;
		case 3:
				mode = 0x01;
				break;
		case 4:
				mode = 0x03;
				break;
	}
	ascii_write_cmd(0x04 | mode);
    delay_micro(39);
}
/*
 * column [1,2]
 * row [1, ..., 20]
 * postion the cursor
 */ 
void ascii_gotoxt(int row, int col) {
	int adr = row-1;
	if(col == 2) {
		adr = adr + 0x40;
	}
	ascii_write_cmd(0x80|adr);
}

/****** WRITE TO DISPLAY*******/
/*
 * write char to display
 * 
 */ 
void ascii_write_char(unsigned char c){
	while((ascii_read_status() & 0x80) == 0x80)
    {}
	delay_micro(8);
	ascii_write_data(c);
	delay_micro(43);
}

void ascii_write_cmd (uint8 command) {
	while((ascii_read_status() & 0x80) == 0x80)
    {}
    ascii_ctrl_bit_clear(B_RS);
    ascii_ctrl_bit_clear(B_RW);
    ascii_write_controller(command);
}

void ascii_write_data(uint8 data) {
    ascii_ctrl_bit_set(B_RS);
    ascii_ctrl_bit_clear(B_RW);
    ascii_write_controller(data);
}

void ascii_write_controller(uint8 byte){
    ascii_ctrl_bit_set(B_E);
    GPIO_E->odrHigh = byte;
	delay_250ns();
    ascii_ctrl_bit_clear(B_E);
}

uint8 ascii_read_status(void){
    uint8 cmd;
    GPIO_E->moder  = (uint32) 0x00005555; // definera ingångar
	ascii_ctrl_bit_clear(B_RS);
    ascii_ctrl_bit_set(B_RW);
    cmd = ascii_read_controller();
    GPIO_E->moder  =(uint32) 0x55555555;
    return cmd;
}
uint8 ascii_read_data(void){
    uint8 data;
    GPIO_E->moder  = (uint32) 0x00005555; // definera ingångar
    
    ascii_ctrl_bit_set(B_RS);
    ascii_ctrl_bit_set(B_RW);
    data = ascii_read_controller();
    GPIO_E->moder  =(uint32) 0x55555555;
    return data;
}

uint8 ascii_read_controller(void){
    uint8 read;
    ascii_ctrl_bit_set(B_E);
    delay_250ns();
    delay_250ns();
    read = GPIO_E->idrHigh;
    ascii_ctrl_bit_clear(B_E);
    return read;
}
