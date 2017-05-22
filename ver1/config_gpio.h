/*
 * 
 * CONFIG_GPIO.H
 * 
 */ 

#ifndef CONFIG_GPIO_H
#define CONFIG_GPIO_H
 
#include "standard_types.h"
 
typedef struct {
    uint32  moder;
    uint16  otyper;
    uint16  otReserved;
    uint32  speedr;
    uint32  pupdr;
    uint8   idrLow;
    uint8   idrHigh;
    uint16  idrReserved;
    uint8   odrLow;
    uint8   odrHigh;
    uint16  odrReserved;
} GPIO;
 
#endif