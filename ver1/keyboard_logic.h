/*
 * 
 * KEYBOARD_LOGIC.H
 * 
 */ 

#ifndef KEYBOARD_LOGIC_H
#define KEYBOARD_LOGIC_H

#include "standard_types.h"

const uint8 seg_codes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0xDE, 0x79, 0x71};
const uint8 key[] = { 1, 4, 7, 0xE, 2, 5, 8, 0x0, 3, 0x6, 9, 0xF, 0xA, 0xB, 0xC, 0xD};	// keyboards

uint32 kbd_get_col_high(void);
uint32 kbd_get_col_low(void);
uint8 get_key(uint8 chooseHighOrLow);
void kbd_activate_low(uint32 row);
void kbd_activate_high(uint32 row);


#endif