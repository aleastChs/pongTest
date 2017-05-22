/*
 * 
 * DISPLAY_LOGIC.H
 * 
 */ 

#ifndef BIT_OPERATIONS_H
#define BIT_OPERATIONS_H
 
#include "standard_types.h"

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

void app_init(void);
void graphic_ctrl_bit_set(uint8 x);
void graphic_ctrl_bit_clear(uint8 x);
void select_controller(uint8 controller);
void graphic_wait_ready(void);
uint8 graphic_read(uint8 controller);
uint8 graphic_read_data(uint8 controller);
void graphic_write(uint8 value, uint8 controller);
void graphic_write_data(uint8 data, uint8 controller);
void graphic_write_command(uint8 command, uint8 controller);
void graphic_initalize(void);
void graphic_clear_screen(void);
void pixel(uint8 x, uint8 y, uint8 set);

#endif