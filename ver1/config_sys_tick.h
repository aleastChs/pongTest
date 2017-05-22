/*
 * 
 * CONFIG_SYS_TICK.H
 * 
 */ 

#ifndef CONFIG_SYS_TICK_H
#define CONFIG_SYS_TICK_H
 
#include "standard_types.h"
 
typedef struct {
    uint32  ctrl;
    uint32  load;
    uint32  val;
    uint32  calib;  
} STK;
 
#endif