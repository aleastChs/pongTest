/*
 * 
 * ASCII_LOGIC.H
 * 
 */ 

#ifndef ASCII_LOGIC_H
#define ASCII_LOGIC_H


/**************************************************************************************************************************************

											ASCII FUNCTIONS PROTOTYPES

**************************************************************************************************************************************/
// read
uint8 ascii_read_controller(void);
uint8 ascii_read_data(void);
uint8 ascii_read_status(void);

// write
void ascii_write_controller(uint8 byte);
void ascii_write_char(unsigned char c);
void ascii_write_data(uint8 data);
void ascii_write_cmd (uint8 command);

// delay
void delay_mikro(uint32 us);

// set/clear
void ascii_ctrl_bit_clear(uint8 x);
void ascii_ctrl_bit_set(uint8 x);
void ascii_function_set(uint8 func);
void ascii_clear_display(void);

// others
void ascii_display_controll(uint8 ctrl);
void ascii_entry_mode_set(uint8 mode);
void ascii_gotoxt(int row, int col);

#endif