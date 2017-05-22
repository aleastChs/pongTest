/*
 * 
 * DISPLAY_LOGIC.H
 * 
 */ 

#ifndef BIT_OPERATIONS_H
#define BIT_OPERATIONS_H
 
#include "standard_types.h"

void app_init_display(void);
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