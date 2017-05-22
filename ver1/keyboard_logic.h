/*
 * 
 * KEYBOARD_LOGIC.H
 * 
 */ 

#ifndef KEYBOARD_LOGIC_H
#define KEYBOARD_LOGIC_H

#include "standard_types.h"

uint32 kbd_get_col_high(void);
uint32 kbd_get_col_low(void);
uint8 get_key(uint8 chooseHighOrLow);
void kbd_activate_low(uint32 row);
void kbd_activate_high(uint32 row);
void app_init_keyboards(void);

#endif