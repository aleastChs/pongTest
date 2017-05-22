/*
 * 
 * DELAY.C
 * 
 */ 
#include "standard_types.h"
#include "config_sys_tick.h"
 
#define STK_CTRL ((volatile uint32*)(0xE000E010))   
#define STK_LOAD ((volatile uint32*)(0xE000E014))   
#define STK_VAL ((volatile uint32*)(0xE000E018))   
 
typedef volatile STK* stkptr;
#define SysTick ((stkptr) 0xE000E010)
 
 
void delay_250ns(void) {
    SysTick->ctrl = 0;
    SysTick->load = ((168/4) - 1);
    SysTick->val = 0;
    SysTick->ctrl = 5;
    while((SysTick->ctrl) == 0) {
         
    }
    SysTick->ctrl = 0;
}
 
void delay_500ns(void) {
    delay_250ns();
    delay_250ns();
}
 
void delay_micro(uint32 us){
	int i; 
	for(i=0; i < us; i++) {
		delay_250ns();
		delay_250ns();
        delay_250ns();
        delay_250ns();
	}
}
 
void delay_milli(uint32 ms) {
#ifdef  SIMULATOR
    ms /= 1000;
    ms++;
#endif
 
    int i; 
    while(ms--) {
        for(i=0; i < 1000; i++) {
            delay_micro(1);
        }
    }
}