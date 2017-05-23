   1              		.syntax unified
   2              		.arch armv6-m
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 0
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.syntax unified
  15              		.file	"startup.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.global	delay
  20              		.data
  21              		.align	2
  24              	delay:
  25 0000 01000000 		.word	1
  26              		.section	.start_section,"ax",%progbits
  27              		.align	2
  28              		.global	startup
  29              		.code	16
  30              		.thumb_func
  32              	startup:
  33              	.LFB0:
  34              		.file 1 "C:/github/pongTest/ver1/startup.c"
   1:C:/github/pongTest/ver1\startup.c **** /*
   2:C:/github/pongTest/ver1\startup.c ****  * 
   3:C:/github/pongTest/ver1\startup.c ****  * STARTUP.C
   4:C:/github/pongTest/ver1\startup.c ****  * 
   5:C:/github/pongTest/ver1\startup.c ****  */ 
   6:C:/github/pongTest/ver1\startup.c **** 
   7:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
   8:C:/github/pongTest/ver1\startup.c **** 
   9:C:/github/pongTest/ver1\startup.c **** 											INCLUDES
  10:C:/github/pongTest/ver1\startup.c **** 
  11:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
  12:C:/github/pongTest/ver1\startup.c **** #include "config_gpio.h"
  13:C:/github/pongTest/ver1\startup.c **** #include "standard_types.h"
  14:C:/github/pongTest/ver1\startup.c **** #include "delay.h"
  15:C:/github/pongTest/ver1\startup.c **** #include "display_logic.h"
  16:C:/github/pongTest/ver1\startup.c **** #include "geometry.h"
  17:C:/github/pongTest/ver1\startup.c **** #include "keyboard_logic.h"
  18:C:/github/pongTest/ver1\startup.c **** #include "player_logic.h"
  19:C:/github/pongTest/ver1\startup.c **** #include "game_logic.h"
  20:C:/github/pongTest/ver1\startup.c **** #include "ascii_logic.h"
  21:C:/github/pongTest/ver1\startup.c **** 
  22:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
  23:C:/github/pongTest/ver1\startup.c **** 
  24:C:/github/pongTest/ver1\startup.c **** 											TYPEDEFS
  25:C:/github/pongTest/ver1\startup.c **** 
  26:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
  27:C:/github/pongTest/ver1\startup.c **** typedef volatile GPIO* gpioptr;
  28:C:/github/pongTest/ver1\startup.c **** volatile int delay = 1;
  29:C:/github/pongTest/ver1\startup.c **** 
  30:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
  31:C:/github/pongTest/ver1\startup.c **** 
  32:C:/github/pongTest/ver1\startup.c **** 											DEFINES
  33:C:/github/pongTest/ver1\startup.c **** 
  34:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
  35:C:/github/pongTest/ver1\startup.c **** 
  36:C:/github/pongTest/ver1\startup.c **** #define GPIO_E 				((gpioptr)	 	0x40021000)   // definera en pekare av typen GPIO till Port E:s adr
  37:C:/github/pongTest/ver1\startup.c **** #define GPIO_D 				((gpioptr) 		0x40020C00) 
  38:C:/github/pongTest/ver1\startup.c **** #define RCC_BASE			((uint32) 		0x40023800)
  39:C:/github/pongTest/ver1\startup.c **** #define RCC_EHB1ENR			*((uint32*) 	RCC_BASE)
  40:C:/github/pongTest/ver1\startup.c **** #define ENABLE_GPIO_D		((uint32) 		0b01000)
  41:C:/github/pongTest/ver1\startup.c **** #define ENABLE_GPIO_E		((uint32)		0b10000)
  42:C:/github/pongTest/ver1\startup.c **** 
  43:C:/github/pongTest/ver1\startup.c **** 
  44:C:/github/pongTest/ver1\startup.c **** #define SIM
  45:C:/github/pongTest/ver1\startup.c **** 
  46:C:/github/pongTest/ver1\startup.c **** 
  47:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
  48:C:/github/pongTest/ver1\startup.c **** 
  49:C:/github/pongTest/ver1\startup.c **** 											PREPROCESSOR
  50:C:/github/pongTest/ver1\startup.c **** 
  51:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
  52:C:/github/pongTest/ver1\startup.c **** 
  53:C:/github/pongTest/ver1\startup.c **** 
  54:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
  55:C:/github/pongTest/ver1\startup.c **** 
  56:C:/github/pongTest/ver1\startup.c **** 											STARTUP
  57:C:/github/pongTest/ver1\startup.c **** 
  58:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
  59:C:/github/pongTest/ver1\startup.c **** 
  60:C:/github/pongTest/ver1\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  61:C:/github/pongTest/ver1\startup.c ****  
  62:C:/github/pongTest/ver1\startup.c **** void startup ( void )
  63:C:/github/pongTest/ver1\startup.c **** {
  35              		.loc 1 63 0
  36              		.cfi_startproc
  64:C:/github/pongTest/ver1\startup.c **** asm volatile(
  37              		.loc 1 64 0
  38              		.syntax divided
  39              	@ 64 "C:/github/pongTest/ver1/startup.c" 1
  40 0000 0248     		 LDR R0,=0x2001C000
  41 0002 8546     	 MOV SP,R0
  42 0004 FFF7FEFF 	 BL main
  43 0008 FEE7     	.L1: B .L1
  44              	
  45              	@ 0 "" 2
  65:C:/github/pongTest/ver1\startup.c ****     " LDR R0,=0x2001C000\n"     /* set stack */
  66:C:/github/pongTest/ver1\startup.c ****     " MOV SP,R0\n"
  67:C:/github/pongTest/ver1\startup.c ****     " BL main\n"                /* call main */
  68:C:/github/pongTest/ver1\startup.c ****     ".L1: B .L1\n"              /* never return */
  69:C:/github/pongTest/ver1\startup.c ****     ) ;
  70:C:/github/pongTest/ver1\startup.c **** }
  46              		.loc 1 70 0
  47              		.thumb
  48              		.syntax unified
  49 000a C046     		nop
  50              		.cfi_endproc
  51              	.LFE0:
  53              		.global	ball_geometry
  54              		.data
  55              		.align	2
  58              	ball_geometry:
  59 0004 0C000000 		.word	12
  60 0008 04000000 		.word	4
  61 000c 04000000 		.word	4
  62 0010 00       		.byte	0
  63 0011 01       		.byte	1
  64 0012 00       		.byte	0
  65 0013 02       		.byte	2
  66 0014 01       		.byte	1
  67 0015 00       		.byte	0
  68 0016 01       		.byte	1
  69 0017 01       		.byte	1
  70 0018 01       		.byte	1
  71 0019 02       		.byte	2
  72 001a 01       		.byte	1
  73 001b 03       		.byte	3
  74 001c 02       		.byte	2
  75 001d 00       		.byte	0
  76 001e 02       		.byte	2
  77 001f 01       		.byte	1
  78 0020 02       		.byte	2
  79 0021 02       		.byte	2
  80 0022 02       		.byte	2
  81 0023 03       		.byte	3
  82 0024 03       		.byte	3
  83 0025 01       		.byte	1
  84 0026 03       		.byte	3
  85 0027 02       		.byte	2
  86 0028 00000000 		.space	776
  86      00000000 
  86      00000000 
  86      00000000 
  86      00000000 
  87              		.global	ball
  88              		.align	2
  91              	ball:
  92 0330 00000000 		.word	ball_geometry
  93 0334 00000000 		.word	0
  94 0338 00000000 		.word	0
  95 033c 0C000000 		.word	12
  96 0340 32000000 		.word	50
  97 0344 00000000 		.word	draw_object
  98 0348 00000000 		.word	clear_object
  99 034c 00000000 		.word	move_object
 100 0350 00000000 		.word	set_object_speed
 101              		.global	player_geometry
 102              		.align	2
 105              	player_geometry:
 106 0354 78000000 		.word	120
 107 0358 04000000 		.word	4
 108 035c 1E000000 		.word	30
 109 0360 00       		.byte	0
 110 0361 00       		.byte	0
 111 0362 00       		.byte	0
 112 0363 01       		.byte	1
 113 0364 00       		.byte	0
 114 0365 02       		.byte	2
 115 0366 00       		.byte	0
 116 0367 03       		.byte	3
 117 0368 00       		.byte	0
 118 0369 04       		.byte	4
 119 036a 00       		.byte	0
 120 036b 05       		.byte	5
 121 036c 00       		.byte	0
 122 036d 06       		.byte	6
 123 036e 00       		.byte	0
 124 036f 07       		.byte	7
 125 0370 00       		.byte	0
 126 0371 08       		.byte	8
 127 0372 00       		.byte	0
 128 0373 09       		.byte	9
 129 0374 00       		.byte	0
 130 0375 0A       		.byte	10
 131 0376 00       		.byte	0
 132 0377 0B       		.byte	11
 133 0378 00       		.byte	0
 134 0379 0C       		.byte	12
 135 037a 00       		.byte	0
 136 037b 0D       		.byte	13
 137 037c 00       		.byte	0
 138 037d 0E       		.byte	14
 139 037e 00       		.byte	0
 140 037f 0F       		.byte	15
 141 0380 00       		.byte	0
 142 0381 10       		.byte	16
 143 0382 00       		.byte	0
 144 0383 11       		.byte	17
 145 0384 00       		.byte	0
 146 0385 12       		.byte	18
 147 0386 00       		.byte	0
 148 0387 13       		.byte	19
 149 0388 00       		.byte	0
 150 0389 14       		.byte	20
 151 038a 00       		.byte	0
 152 038b 15       		.byte	21
 153 038c 00       		.byte	0
 154 038d 16       		.byte	22
 155 038e 00       		.byte	0
 156 038f 17       		.byte	23
 157 0390 00       		.byte	0
 158 0391 18       		.byte	24
 159 0392 00       		.byte	0
 160 0393 19       		.byte	25
 161 0394 00       		.byte	0
 162 0395 1A       		.byte	26
 163 0396 00       		.byte	0
 164 0397 1B       		.byte	27
 165 0398 00       		.byte	0
 166 0399 1C       		.byte	28
 167 039a 00       		.byte	0
 168 039b 1D       		.byte	29
 169 039c 01       		.byte	1
 170 039d 00       		.byte	0
 171 039e 01       		.byte	1
 172 039f 01       		.byte	1
 173 03a0 01       		.byte	1
 174 03a1 02       		.byte	2
 175 03a2 01       		.byte	1
 176 03a3 03       		.byte	3
 177 03a4 01       		.byte	1
 178 03a5 04       		.byte	4
 179 03a6 01       		.byte	1
 180 03a7 05       		.byte	5
 181 03a8 01       		.byte	1
 182 03a9 06       		.byte	6
 183 03aa 01       		.byte	1
 184 03ab 07       		.byte	7
 185 03ac 01       		.byte	1
 186 03ad 08       		.byte	8
 187 03ae 01       		.byte	1
 188 03af 09       		.byte	9
 189 03b0 01       		.byte	1
 190 03b1 0A       		.byte	10
 191 03b2 01       		.byte	1
 192 03b3 0B       		.byte	11
 193 03b4 01       		.byte	1
 194 03b5 0C       		.byte	12
 195 03b6 01       		.byte	1
 196 03b7 0D       		.byte	13
 197 03b8 01       		.byte	1
 198 03b9 0E       		.byte	14
 199 03ba 01       		.byte	1
 200 03bb 0F       		.byte	15
 201 03bc 01       		.byte	1
 202 03bd 10       		.byte	16
 203 03be 01       		.byte	1
 204 03bf 11       		.byte	17
 205 03c0 01       		.byte	1
 206 03c1 12       		.byte	18
 207 03c2 01       		.byte	1
 208 03c3 13       		.byte	19
 209 03c4 01       		.byte	1
 210 03c5 14       		.byte	20
 211 03c6 01       		.byte	1
 212 03c7 15       		.byte	21
 213 03c8 01       		.byte	1
 214 03c9 16       		.byte	22
 215 03ca 01       		.byte	1
 216 03cb 17       		.byte	23
 217 03cc 01       		.byte	1
 218 03cd 18       		.byte	24
 219 03ce 01       		.byte	1
 220 03cf 19       		.byte	25
 221 03d0 01       		.byte	1
 222 03d1 1A       		.byte	26
 223 03d2 01       		.byte	1
 224 03d3 1B       		.byte	27
 225 03d4 01       		.byte	1
 226 03d5 1C       		.byte	28
 227 03d6 01       		.byte	1
 228 03d7 1D       		.byte	29
 229 03d8 02       		.byte	2
 230 03d9 00       		.byte	0
 231 03da 02       		.byte	2
 232 03db 01       		.byte	1
 233 03dc 02       		.byte	2
 234 03dd 02       		.byte	2
 235 03de 02       		.byte	2
 236 03df 03       		.byte	3
 237 03e0 02       		.byte	2
 238 03e1 04       		.byte	4
 239 03e2 02       		.byte	2
 240 03e3 05       		.byte	5
 241 03e4 02       		.byte	2
 242 03e5 06       		.byte	6
 243 03e6 02       		.byte	2
 244 03e7 07       		.byte	7
 245 03e8 02       		.byte	2
 246 03e9 08       		.byte	8
 247 03ea 02       		.byte	2
 248 03eb 09       		.byte	9
 249 03ec 02       		.byte	2
 250 03ed 0A       		.byte	10
 251 03ee 02       		.byte	2
 252 03ef 0B       		.byte	11
 253 03f0 02       		.byte	2
 254 03f1 0C       		.byte	12
 255 03f2 02       		.byte	2
 256 03f3 0D       		.byte	13
 257 03f4 02       		.byte	2
 258 03f5 0E       		.byte	14
 259 03f6 02       		.byte	2
 260 03f7 0F       		.byte	15
 261 03f8 02       		.byte	2
 262 03f9 10       		.byte	16
 263 03fa 02       		.byte	2
 264 03fb 11       		.byte	17
 265 03fc 02       		.byte	2
 266 03fd 12       		.byte	18
 267 03fe 02       		.byte	2
 268 03ff 13       		.byte	19
 269 0400 02       		.byte	2
 270 0401 14       		.byte	20
 271 0402 02       		.byte	2
 272 0403 15       		.byte	21
 273 0404 02       		.byte	2
 274 0405 16       		.byte	22
 275 0406 02       		.byte	2
 276 0407 17       		.byte	23
 277 0408 02       		.byte	2
 278 0409 18       		.byte	24
 279 040a 02       		.byte	2
 280 040b 19       		.byte	25
 281 040c 02       		.byte	2
 282 040d 1A       		.byte	26
 283 040e 02       		.byte	2
 284 040f 1B       		.byte	27
 285 0410 02       		.byte	2
 286 0411 1C       		.byte	28
 287 0412 02       		.byte	2
 288 0413 1D       		.byte	29
 289 0414 03       		.byte	3
 290 0415 00       		.byte	0
 291 0416 03       		.byte	3
 292 0417 01       		.byte	1
 293 0418 03       		.byte	3
 294 0419 02       		.byte	2
 295 041a 03       		.byte	3
 296 041b 03       		.byte	3
 297 041c 03       		.byte	3
 298 041d 04       		.byte	4
 299 041e 03       		.byte	3
 300 041f 05       		.byte	5
 301 0420 03       		.byte	3
 302 0421 06       		.byte	6
 303 0422 03       		.byte	3
 304 0423 07       		.byte	7
 305 0424 03       		.byte	3
 306 0425 08       		.byte	8
 307 0426 03       		.byte	3
 308 0427 09       		.byte	9
 309 0428 03       		.byte	3
 310 0429 0A       		.byte	10
 311 042a 03       		.byte	3
 312 042b 0B       		.byte	11
 313 042c 03       		.byte	3
 314 042d 0C       		.byte	12
 315 042e 03       		.byte	3
 316 042f 0D       		.byte	13
 317 0430 03       		.byte	3
 318 0431 0E       		.byte	14
 319 0432 03       		.byte	3
 320 0433 0F       		.byte	15
 321 0434 03       		.byte	3
 322 0435 10       		.byte	16
 323 0436 03       		.byte	3
 324 0437 11       		.byte	17
 325 0438 03       		.byte	3
 326 0439 12       		.byte	18
 327 043a 03       		.byte	3
 328 043b 13       		.byte	19
 329 043c 03       		.byte	3
 330 043d 14       		.byte	20
 331 043e 03       		.byte	3
 332 043f 15       		.byte	21
 333 0440 03       		.byte	3
 334 0441 16       		.byte	22
 335 0442 03       		.byte	3
 336 0443 17       		.byte	23
 337 0444 03       		.byte	3
 338 0445 18       		.byte	24
 339 0446 03       		.byte	3
 340 0447 19       		.byte	25
 341 0448 03       		.byte	3
 342 0449 1A       		.byte	26
 343 044a 03       		.byte	3
 344 044b 1B       		.byte	27
 345 044c 03       		.byte	3
 346 044d 1C       		.byte	28
 347 044e 03       		.byte	3
 348 044f 1D       		.byte	29
 349 0450 00000000 		.space	560
 349      00000000 
 349      00000000 
 349      00000000 
 349      00000000 
 350              		.global	p1_obj
 351              		.align	2
 354              	p1_obj:
 355 0680 00000000 		.word	player_geometry
 356 0684 00000000 		.word	0
 357 0688 00000000 		.word	0
 358 068c 02000000 		.word	2
 359 0690 19000000 		.word	25
 360 0694 00000000 		.word	draw_object
 361 0698 00000000 		.word	clear_object
 362 069c 00000000 		.word	move_object
 363 06a0 00000000 		.word	set_object_speed
 364              		.global	p2_obj
 365              		.align	2
 368              	p2_obj:
 369 06a4 00000000 		.word	player_geometry
 370 06a8 00000000 		.word	0
 371 06ac 00000000 		.word	0
 372 06b0 7B000000 		.word	123
 373 06b4 19000000 		.word	25
 374 06b8 00000000 		.word	draw_object
 375 06bc 00000000 		.word	clear_object
 376 06c0 00000000 		.word	move_object
 377 06c4 00000000 		.word	set_object_speed
 378              		.global	p1_player
 379              		.align	2
 382              	p1_player:
 383 06c8 00000000 		.word	p1_obj
 384 06cc 00       		.byte	0
 385 06cd 00       		.byte	0
 386 06ce 0000     		.space	2
 387              		.global	p2_player
 388              		.align	2
 391              	p2_player:
 392 06d0 00000000 		.word	p2_obj
 393 06d4 00       		.byte	0
 394 06d5 00       		.byte	0
 395 06d6 0000     		.space	2
 396              		.global	playerLeft
 397              		.align	2
 400              	playerLeft:
 401 06d8 00000000 		.word	p1_player
 402              		.global	playerRight
 403              		.align	2
 406              	playerRight:
 407 06dc 00000000 		.word	p2_player
 408              		.global	pong
 409              		.align	2
 412              	pong:
 413 06e0 00000000 		.word	ball
 414              		.text
 415              		.align	2
 416              		.global	init_micro_computer
 417              		.code	16
 418              		.thumb_func
 420              	init_micro_computer:
 421              	.LFB1:
  71:C:/github/pongTest/ver1\startup.c **** 
  72:C:/github/pongTest/ver1\startup.c **** 
  73:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
  74:C:/github/pongTest/ver1\startup.c **** 
  75:C:/github/pongTest/ver1\startup.c **** 											CONSTANTS
  76:C:/github/pongTest/ver1\startup.c **** 
  77:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
  78:C:/github/pongTest/ver1\startup.c **** 
  79:C:/github/pongTest/ver1\startup.c **** 
  80:C:/github/pongTest/ver1\startup.c **** 
  81:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
  82:C:/github/pongTest/ver1\startup.c **** 
  83:C:/github/pongTest/ver1\startup.c **** 										INIT OBJECTS
  84:C:/github/pongTest/ver1\startup.c **** 
  85:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
  86:C:/github/pongTest/ver1\startup.c **** 
  87:C:/github/pongTest/ver1\startup.c **** GEOMETRY ball_geometry = { 12,
  88:C:/github/pongTest/ver1\startup.c **** 	4,4,
  89:C:/github/pongTest/ver1\startup.c **** 	{
  90:C:/github/pongTest/ver1\startup.c **** 		{0,1}, {0,2}, {1,0}, {1,1}, {1,2},
  91:C:/github/pongTest/ver1\startup.c **** 		{1,3}, {2,0}, {2,1}, {2,2}, {2,3},
  92:C:/github/pongTest/ver1\startup.c **** 		{3,1}, {3,2}
  93:C:/github/pongTest/ver1\startup.c **** 	}
  94:C:/github/pongTest/ver1\startup.c **** };
  95:C:/github/pongTest/ver1\startup.c **** 
  96:C:/github/pongTest/ver1\startup.c **** OBJECT ball = 
  97:C:/github/pongTest/ver1\startup.c **** {
  98:C:/github/pongTest/ver1\startup.c **** 	&ball_geometry,
  99:C:/github/pongTest/ver1\startup.c **** 	0,0,
 100:C:/github/pongTest/ver1\startup.c **** 	12,50,
 101:C:/github/pongTest/ver1\startup.c **** 	draw_object,
 102:C:/github/pongTest/ver1\startup.c **** 	clear_object,
 103:C:/github/pongTest/ver1\startup.c **** 	move_object,
 104:C:/github/pongTest/ver1\startup.c **** 	set_object_speed
 105:C:/github/pongTest/ver1\startup.c **** };
 106:C:/github/pongTest/ver1\startup.c **** 
 107:C:/github/pongTest/ver1\startup.c **** 
 108:C:/github/pongTest/ver1\startup.c **** GEOMETRY player_geometry = {
 109:C:/github/pongTest/ver1\startup.c **** 	120,
 110:C:/github/pongTest/ver1\startup.c **** 	4,
 111:C:/github/pongTest/ver1\startup.c **** 	30,
 112:C:/github/pongTest/ver1\startup.c **** 	{
 113:C:/github/pongTest/ver1\startup.c **** 		{0,0},{0,1},{0,2},{0,3},{0,4},{0,5},{0,6},{0,7},{0,8},{0,9},
 114:C:/github/pongTest/ver1\startup.c **** 		{0,10},{0,11},{0,12},{0,13},{0,14},{0,15},{0,16},{0,17},{0,18},{0,19},
 115:C:/github/pongTest/ver1\startup.c **** 		{0,20},{0,21},{0,22},{0,23},{0,24},{0,25},{0,26},{0,27},{0,28},{0,29},
 116:C:/github/pongTest/ver1\startup.c **** 
 117:C:/github/pongTest/ver1\startup.c **** 		
 118:C:/github/pongTest/ver1\startup.c **** 		{1,0},{1,1},{1,2},{1,3},{1,4},{1,5},{1,6},{1,7},{1,8},{1,9},
 119:C:/github/pongTest/ver1\startup.c **** 		{1,10},{1,11},{1,12},{1,13},{1,14},{1,15},{1,16},{1,17},{1,18},{1,19},
 120:C:/github/pongTest/ver1\startup.c **** 		{1,20},{1,21},{1,22},{1,23},{1,24},{1,25},{1,26},{1,27},{1,28},{1,29},
 121:C:/github/pongTest/ver1\startup.c **** 
 122:C:/github/pongTest/ver1\startup.c **** 		
 123:C:/github/pongTest/ver1\startup.c **** 		
 124:C:/github/pongTest/ver1\startup.c **** 		{2,0},{2,1},{2,2},{2,3},{2,4},{2,5},{2,6},{2,7},{2,8},{2,9},
 125:C:/github/pongTest/ver1\startup.c **** 		{2,10},{2,11},{2,12},{2,13},{2,14},{2,15},{2,16},{2,17},{2,18},{2,19},
 126:C:/github/pongTest/ver1\startup.c **** 		{2,20},{2,21},{2,22},{2,23},{2,24},{2,25},{2,26},{2,27},{2,28},{2,29},		
 127:C:/github/pongTest/ver1\startup.c **** 		
 128:C:/github/pongTest/ver1\startup.c **** 		{3,0},{3,1},{3,2},{3,3},{3,4},{3,5},{3,6},{3,7},{3,8},{3,9},
 129:C:/github/pongTest/ver1\startup.c **** 		{3,10},{3,11},{3,12},{3,13},{3,14},{3,15},{3,16},{3,17},{3,18},{3,19},
 130:C:/github/pongTest/ver1\startup.c **** 		{3,20},{3,21},{3,22},{3,23},{3,24},{3,25},{3,26},{3,27},{3,28},{3,29}
 131:C:/github/pongTest/ver1\startup.c **** 	}
 132:C:/github/pongTest/ver1\startup.c **** };
 133:C:/github/pongTest/ver1\startup.c **** 
 134:C:/github/pongTest/ver1\startup.c **** 
 135:C:/github/pongTest/ver1\startup.c **** OBJECT p1_obj = 
 136:C:/github/pongTest/ver1\startup.c **** {
 137:C:/github/pongTest/ver1\startup.c **** 	&player_geometry,
 138:C:/github/pongTest/ver1\startup.c **** 	0,0,
 139:C:/github/pongTest/ver1\startup.c **** 	2,25,
 140:C:/github/pongTest/ver1\startup.c **** 	draw_object,
 141:C:/github/pongTest/ver1\startup.c **** 	clear_object,
 142:C:/github/pongTest/ver1\startup.c **** 	move_object,
 143:C:/github/pongTest/ver1\startup.c **** 	set_object_speed
 144:C:/github/pongTest/ver1\startup.c **** };
 145:C:/github/pongTest/ver1\startup.c **** 
 146:C:/github/pongTest/ver1\startup.c **** OBJECT p2_obj = 
 147:C:/github/pongTest/ver1\startup.c **** {
 148:C:/github/pongTest/ver1\startup.c **** 	&player_geometry,
 149:C:/github/pongTest/ver1\startup.c **** 	0,0,
 150:C:/github/pongTest/ver1\startup.c **** 	123,25,
 151:C:/github/pongTest/ver1\startup.c **** 	draw_object,
 152:C:/github/pongTest/ver1\startup.c **** 	clear_object,
 153:C:/github/pongTest/ver1\startup.c **** 	move_object,
 154:C:/github/pongTest/ver1\startup.c **** 	set_object_speed
 155:C:/github/pongTest/ver1\startup.c **** };
 156:C:/github/pongTest/ver1\startup.c **** 
 157:C:/github/pongTest/ver1\startup.c **** PLAYER p1_player = 
 158:C:/github/pongTest/ver1\startup.c **** {
 159:C:/github/pongTest/ver1\startup.c **** 	&p1_obj,
 160:C:/github/pongTest/ver1\startup.c **** 	0,
 161:C:/github/pongTest/ver1\startup.c **** 	0
 162:C:/github/pongTest/ver1\startup.c **** };
 163:C:/github/pongTest/ver1\startup.c **** 
 164:C:/github/pongTest/ver1\startup.c **** PLAYER p2_player = 
 165:C:/github/pongTest/ver1\startup.c **** {
 166:C:/github/pongTest/ver1\startup.c **** 	&p2_obj,
 167:C:/github/pongTest/ver1\startup.c **** 	0,
 168:C:/github/pongTest/ver1\startup.c **** 	0
 169:C:/github/pongTest/ver1\startup.c **** };
 170:C:/github/pongTest/ver1\startup.c **** 
 171:C:/github/pongTest/ver1\startup.c **** volatile P_PLAYER playerLeft  = 	&p1_player;
 172:C:/github/pongTest/ver1\startup.c **** volatile P_PLAYER playerRight = 	&p2_player;
 173:C:/github/pongTest/ver1\startup.c **** volatile P_OBJECT pong 		  = 	&ball;
 174:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
 175:C:/github/pongTest/ver1\startup.c **** 
 176:C:/github/pongTest/ver1\startup.c **** 											FUNCTION PROTOTYPES
 177:C:/github/pongTest/ver1\startup.c **** 
 178:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
 179:C:/github/pongTest/ver1\startup.c **** 
 180:C:/github/pongTest/ver1\startup.c **** 
 181:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
 182:C:/github/pongTest/ver1\startup.c **** 
 183:C:/github/pongTest/ver1\startup.c **** 											INITS
 184:C:/github/pongTest/ver1\startup.c **** 
 185:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
 186:C:/github/pongTest/ver1\startup.c **** 
 187:C:/github/pongTest/ver1\startup.c **** 
 188:C:/github/pongTest/ver1\startup.c **** void init_micro_computer(void){
 422              		.loc 1 188 0
 423              		.cfi_startproc
 424 0000 80B5     		push	{r7, lr}
 425              		.cfi_def_cfa_offset 8
 426              		.cfi_offset 7, -8
 427              		.cfi_offset 14, -4
 428 0002 00AF     		add	r7, sp, #0
 429              		.cfi_def_cfa_register 7
 189:C:/github/pongTest/ver1\startup.c **** 	RCC_EHB1ENR |= ENABLE_GPIO_D | ENABLE_GPIO_E; // enable gpio d and e on the MD407 Card
 430              		.loc 1 189 0
 431 0004 044B     		ldr	r3, .L3
 432 0006 044A     		ldr	r2, .L3
 433 0008 1268     		ldr	r2, [r2]
 434 000a 1821     		movs	r1, #24
 435 000c 0A43     		orrs	r2, r1
 436 000e 1A60     		str	r2, [r3]
 190:C:/github/pongTest/ver1\startup.c **** 	
 191:C:/github/pongTest/ver1\startup.c **** }
 437              		.loc 1 191 0
 438 0010 C046     		nop
 439 0012 BD46     		mov	sp, r7
 440              		@ sp needed
 441 0014 80BD     		pop	{r7, pc}
 442              	.L4:
 443 0016 C046     		.align	2
 444              	.L3:
 445 0018 00380240 		.word	1073887232
 446              		.cfi_endproc
 447              	.LFE1:
 449              		.align	2
 450              		.global	drawing_init
 451              		.code	16
 452              		.thumb_func
 454              	drawing_init:
 455              	.LFB2:
 192:C:/github/pongTest/ver1\startup.c **** 
 193:C:/github/pongTest/ver1\startup.c **** // draw every object on the lcd display
 194:C:/github/pongTest/ver1\startup.c **** // setup the speed of pong
 195:C:/github/pongTest/ver1\startup.c **** void drawing_init(void){
 456              		.loc 1 195 0
 457              		.cfi_startproc
 458 001c B0B5     		push	{r4, r5, r7, lr}
 459              		.cfi_def_cfa_offset 16
 460              		.cfi_offset 4, -16
 461              		.cfi_offset 5, -12
 462              		.cfi_offset 7, -8
 463              		.cfi_offset 14, -4
 464 001e 00AF     		add	r7, sp, #0
 465              		.cfi_def_cfa_register 7
 196:C:/github/pongTest/ver1\startup.c **** 	draw_object(pong);	
 466              		.loc 1 196 0
 467 0020 164B     		ldr	r3, .L6
 468 0022 1B68     		ldr	r3, [r3]
 469 0024 1800     		movs	r0, r3
 470 0026 FFF7FEFF 		bl	draw_object
 197:C:/github/pongTest/ver1\startup.c **** 	delay_milli(delay);
 471              		.loc 1 197 0
 472 002a 154B     		ldr	r3, .L6+4
 473 002c 1B68     		ldr	r3, [r3]
 474 002e 1800     		movs	r0, r3
 475 0030 FFF7FEFF 		bl	delay_milli
 198:C:/github/pongTest/ver1\startup.c **** 	draw_object(playerLeft->p_obj);
 476              		.loc 1 198 0
 477 0034 134B     		ldr	r3, .L6+8
 478 0036 1B68     		ldr	r3, [r3]
 479 0038 1B68     		ldr	r3, [r3]
 480 003a 1800     		movs	r0, r3
 481 003c FFF7FEFF 		bl	draw_object
 199:C:/github/pongTest/ver1\startup.c **** 	delay_milli(delay);
 482              		.loc 1 199 0
 483 0040 0F4B     		ldr	r3, .L6+4
 484 0042 1B68     		ldr	r3, [r3]
 485 0044 1800     		movs	r0, r3
 486 0046 FFF7FEFF 		bl	delay_milli
 200:C:/github/pongTest/ver1\startup.c **** 	draw_object(playerRight->p_obj);
 487              		.loc 1 200 0
 488 004a 0F4B     		ldr	r3, .L6+12
 489 004c 1B68     		ldr	r3, [r3]
 490 004e 1B68     		ldr	r3, [r3]
 491 0050 1800     		movs	r0, r3
 492 0052 FFF7FEFF 		bl	draw_object
 201:C:/github/pongTest/ver1\startup.c **** 	delay_milli(delay);
 493              		.loc 1 201 0
 494 0056 0A4B     		ldr	r3, .L6+4
 495 0058 1B68     		ldr	r3, [r3]
 496 005a 1800     		movs	r0, r3
 497 005c FFF7FEFF 		bl	delay_milli
 202:C:/github/pongTest/ver1\startup.c **** 	
 203:C:/github/pongTest/ver1\startup.c **** 	
 204:C:/github/pongTest/ver1\startup.c **** 	pong->set_speed(pong,-1,-1);
 498              		.loc 1 204 0
 499 0060 064B     		ldr	r3, .L6
 500 0062 1B68     		ldr	r3, [r3]
 501 0064 1C6A     		ldr	r4, [r3, #32]
 502 0066 054B     		ldr	r3, .L6
 503 0068 1868     		ldr	r0, [r3]
 504 006a 0123     		movs	r3, #1
 505 006c 5A42     		rsbs	r2, r3, #0
 506 006e 0123     		movs	r3, #1
 507 0070 5B42     		rsbs	r3, r3, #0
 508 0072 1900     		movs	r1, r3
 509 0074 A047     		blx	r4
 205:C:/github/pongTest/ver1\startup.c **** }
 510              		.loc 1 205 0
 511 0076 C046     		nop
 512 0078 BD46     		mov	sp, r7
 513              		@ sp needed
 514 007a B0BD     		pop	{r4, r5, r7, pc}
 515              	.L7:
 516              		.align	2
 517              	.L6:
 518 007c 00000000 		.word	pong
 519 0080 00000000 		.word	delay
 520 0084 00000000 		.word	playerLeft
 521 0088 00000000 		.word	playerRight
 522              		.cfi_endproc
 523              	.LFE2:
 525              		.align	2
 526              		.global	main
 527              		.code	16
 528              		.thumb_func
 530              	main:
 531              	.LFB3:
 206:C:/github/pongTest/ver1\startup.c **** 
 207:C:/github/pongTest/ver1\startup.c **** 
 208:C:/github/pongTest/ver1\startup.c **** /**************************************************************************************************
 209:C:/github/pongTest/ver1\startup.c **** 
 210:C:/github/pongTest/ver1\startup.c **** 											MAIN
 211:C:/github/pongTest/ver1\startup.c **** 											 
 212:C:/github/pongTest/ver1\startup.c **** 											  
 213:C:/github/pongTest/ver1\startup.c **** 											SETUP:
 214:C:/github/pongTest/ver1\startup.c **** 											 * KEYBOARD 1: 		GPIO_D 		LOW
 215:C:/github/pongTest/ver1\startup.c **** 											 * KEYBOARD 2: 		GPIO_D 		HIGH
 216:C:/github/pongTest/ver1\startup.c **** 											 * LCD DISPLAY:		GPIO_E 		LOW + HIGH
 217:C:/github/pongTest/ver1\startup.c **** 
 218:C:/github/pongTest/ver1\startup.c **** ***************************************************************************************************
 219:C:/github/pongTest/ver1\startup.c **** 
 220:C:/github/pongTest/ver1\startup.c **** int main(void)
 221:C:/github/pongTest/ver1\startup.c **** {
 532              		.loc 1 221 0
 533              		.cfi_startproc
 534 008c 80B5     		push	{r7, lr}
 535              		.cfi_def_cfa_offset 8
 536              		.cfi_offset 7, -8
 537              		.cfi_offset 14, -4
 538 008e 82B0     		sub	sp, sp, #8
 539              		.cfi_def_cfa_offset 16
 540 0090 00AF     		add	r7, sp, #0
 541              		.cfi_def_cfa_register 7
 222:C:/github/pongTest/ver1\startup.c **** 	init_micro_computer();
 542              		.loc 1 222 0
 543 0092 FFF7FEFF 		bl	init_micro_computer
 223:C:/github/pongTest/ver1\startup.c **** 	
 224:C:/github/pongTest/ver1\startup.c **** 	app_init_display();
 544              		.loc 1 224 0
 545 0096 FFF7FEFF 		bl	app_init_display
 225:C:/github/pongTest/ver1\startup.c **** 	app_init_keyboards();
 546              		.loc 1 225 0
 547 009a FFF7FEFF 		bl	app_init_keyboards
 226:C:/github/pongTest/ver1\startup.c **** 	
 227:C:/github/pongTest/ver1\startup.c **** 	graphic_initalize();
 548              		.loc 1 227 0
 549 009e FFF7FEFF 		bl	graphic_initalize
 228:C:/github/pongTest/ver1\startup.c **** 	//ascii_init();
 229:C:/github/pongTest/ver1\startup.c **** 	
 230:C:/github/pongTest/ver1\startup.c **** 	graphic_clear_screen();
 550              		.loc 1 230 0
 551 00a2 FFF7FEFF 		bl	graphic_clear_screen
 231:C:/github/pongTest/ver1\startup.c **** 	
 232:C:/github/pongTest/ver1\startup.c **** 	drawing_init();
 552              		.loc 1 232 0
 553 00a6 FFF7FEFF 		bl	drawing_init
 554              	.LBB2:
 233:C:/github/pongTest/ver1\startup.c **** 	//ascii_clear_display();
 234:C:/github/pongTest/ver1\startup.c **** 	
 235:C:/github/pongTest/ver1\startup.c **** 	//welcome();
 236:C:/github/pongTest/ver1\startup.c **** 
 237:C:/github/pongTest/ver1\startup.c **** 	
 238:C:/github/pongTest/ver1\startup.c **** 
 239:C:/github/pongTest/ver1\startup.c **** 	for(int i = 0; i <= 10; i++)
 555              		.loc 1 239 0
 556 00aa 0023     		movs	r3, #0
 557 00ac 7B60     		str	r3, [r7, #4]
 558 00ae 0BE0     		b	.L9
 559              	.L10:
 240:C:/github/pongTest/ver1\startup.c **** 	{
 241:C:/github/pongTest/ver1\startup.c **** 		ping(playerLeft, playerRight, pong);
 560              		.loc 1 241 0 discriminator 3
 561 00b0 094B     		ldr	r3, .L12
 562 00b2 1868     		ldr	r0, [r3]
 563 00b4 094B     		ldr	r3, .L12+4
 564 00b6 1968     		ldr	r1, [r3]
 565 00b8 094B     		ldr	r3, .L12+8
 566 00ba 1B68     		ldr	r3, [r3]
 567 00bc 1A00     		movs	r2, r3
 568 00be FFF7FEFF 		bl	ping
 239:C:/github/pongTest/ver1\startup.c **** 	{
 569              		.loc 1 239 0 discriminator 3
 570 00c2 7B68     		ldr	r3, [r7, #4]
 571 00c4 0133     		adds	r3, r3, #1
 572 00c6 7B60     		str	r3, [r7, #4]
 573              	.L9:
 239:C:/github/pongTest/ver1\startup.c **** 	{
 574              		.loc 1 239 0 is_stmt 0 discriminator 1
 575 00c8 7B68     		ldr	r3, [r7, #4]
 576 00ca 0A2B     		cmp	r3, #10
 577 00cc F0DD     		ble	.L10
 578              	.LBE2:
 579 00ce 0023     		movs	r3, #0
 242:C:/github/pongTest/ver1\startup.c **** 		//40 milli i hårdvara
 243:C:/github/pongTest/ver1\startup.c **** 		//delay_milli(4*delay);
 244:C:/github/pongTest/ver1\startup.c **** 	}
 245:C:/github/pongTest/ver1\startup.c **** }
 580              		.loc 1 245 0 is_stmt 1
 581 00d0 1800     		movs	r0, r3
 582 00d2 BD46     		mov	sp, r7
 583 00d4 02B0     		add	sp, sp, #8
 584              		@ sp needed
 585 00d6 80BD     		pop	{r7, pc}
 586              	.L13:
 587              		.align	2
 588              	.L12:
 589 00d8 00000000 		.word	playerLeft
 590 00dc 00000000 		.word	playerRight
 591 00e0 00000000 		.word	pong
 592              		.cfi_endproc
 593              	.LFE3:
 595              	.Letext0:
 596              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 597              		.file 3 "C:/github/pongTest/ver1/geometry.h"
 598              		.file 4 "C:/github/pongTest/ver1/player_logic.h"
