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
  15              		.file	"geometry.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.align	2
  20              		.global	draw_object
  21              		.code	16
  22              		.thumb_func
  24              	draw_object:
  25              	.LFB0:
  26              		.file 1 "C:/github/pongTest/ver1/geometry.c"
   1:C:/github/pongTest/ver1\geometry.c **** /*
   2:C:/github/pongTest/ver1\geometry.c ****  * 
   3:C:/github/pongTest/ver1\geometry.c ****  * GEMOETRY.C
   4:C:/github/pongTest/ver1\geometry.c ****  * 
   5:C:/github/pongTest/ver1\geometry.c ****  */ 
   6:C:/github/pongTest/ver1\geometry.c **** 
   7:C:/github/pongTest/ver1\geometry.c **** #include "geometry.h"
   8:C:/github/pongTest/ver1\geometry.c **** #include "standard_types.h"
   9:C:/github/pongTest/ver1\geometry.c **** #include "display_logic.h"
  10:C:/github/pongTest/ver1\geometry.c **** 
  11:C:/github/pongTest/ver1\geometry.c **** void draw_object(P_OBJECT o){
  27              		.loc 1 11 0
  28              		.cfi_startproc
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 84B0     		sub	sp, sp, #16
  34              		.cfi_def_cfa_offset 24
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 7860     		str	r0, [r7, #4]
  12:C:/github/pongTest/ver1\geometry.c **** 	uint32 i;
  13:C:/github/pongTest/ver1\geometry.c **** 	for(i = 0; i < o->geo->numpoints; i++) {
  38              		.loc 1 13 0
  39 0008 0023     		movs	r3, #0
  40 000a FB60     		str	r3, [r7, #12]
  41 000c 20E0     		b	.L2
  42              	.L3:
  14:C:/github/pongTest/ver1\geometry.c **** 		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 1);
  43              		.loc 1 14 0 discriminator 3
  44 000e 7B68     		ldr	r3, [r7, #4]
  45 0010 DB68     		ldr	r3, [r3, #12]
  46 0012 DAB2     		uxtb	r2, r3
  47 0014 7B68     		ldr	r3, [r7, #4]
  48 0016 1968     		ldr	r1, [r3]
  49 0018 FB68     		ldr	r3, [r7, #12]
  50 001a 0433     		adds	r3, r3, #4
  51 001c 5B00     		lsls	r3, r3, #1
  52 001e CB18     		adds	r3, r1, r3
  53 0020 0433     		adds	r3, r3, #4
  54 0022 1B78     		ldrb	r3, [r3]
  55 0024 D318     		adds	r3, r2, r3
  56 0026 D8B2     		uxtb	r0, r3
  57 0028 7B68     		ldr	r3, [r7, #4]
  58 002a 1B69     		ldr	r3, [r3, #16]
  59 002c DAB2     		uxtb	r2, r3
  60 002e 7B68     		ldr	r3, [r7, #4]
  61 0030 1968     		ldr	r1, [r3]
  62 0032 FB68     		ldr	r3, [r7, #12]
  63 0034 0433     		adds	r3, r3, #4
  64 0036 5B00     		lsls	r3, r3, #1
  65 0038 CB18     		adds	r3, r1, r3
  66 003a 0533     		adds	r3, r3, #5
  67 003c 1B78     		ldrb	r3, [r3]
  68 003e D318     		adds	r3, r2, r3
  69 0040 DBB2     		uxtb	r3, r3
  70 0042 0122     		movs	r2, #1
  71 0044 1900     		movs	r1, r3
  72 0046 FFF7FEFF 		bl	pixel
  13:C:/github/pongTest/ver1\geometry.c **** 		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 1);
  73              		.loc 1 13 0 discriminator 3
  74 004a FB68     		ldr	r3, [r7, #12]
  75 004c 0133     		adds	r3, r3, #1
  76 004e FB60     		str	r3, [r7, #12]
  77              	.L2:
  13:C:/github/pongTest/ver1\geometry.c **** 		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 1);
  78              		.loc 1 13 0 is_stmt 0 discriminator 1
  79 0050 7B68     		ldr	r3, [r7, #4]
  80 0052 1B68     		ldr	r3, [r3]
  81 0054 1A68     		ldr	r2, [r3]
  82 0056 FB68     		ldr	r3, [r7, #12]
  83 0058 9A42     		cmp	r2, r3
  84 005a D8D8     		bhi	.L3
  15:C:/github/pongTest/ver1\geometry.c **** 	}
  16:C:/github/pongTest/ver1\geometry.c **** }
  85              		.loc 1 16 0 is_stmt 1
  86 005c C046     		nop
  87 005e BD46     		mov	sp, r7
  88 0060 04B0     		add	sp, sp, #16
  89              		@ sp needed
  90 0062 80BD     		pop	{r7, pc}
  91              		.cfi_endproc
  92              	.LFE0:
  94              		.align	2
  95              		.global	clear_object
  96              		.code	16
  97              		.thumb_func
  99              	clear_object:
 100              	.LFB1:
  17:C:/github/pongTest/ver1\geometry.c **** 
  18:C:/github/pongTest/ver1\geometry.c **** void clear_object(P_OBJECT o){
 101              		.loc 1 18 0
 102              		.cfi_startproc
 103 0064 80B5     		push	{r7, lr}
 104              		.cfi_def_cfa_offset 8
 105              		.cfi_offset 7, -8
 106              		.cfi_offset 14, -4
 107 0066 84B0     		sub	sp, sp, #16
 108              		.cfi_def_cfa_offset 24
 109 0068 00AF     		add	r7, sp, #0
 110              		.cfi_def_cfa_register 7
 111 006a 7860     		str	r0, [r7, #4]
  19:C:/github/pongTest/ver1\geometry.c **** 	uint32 i;
  20:C:/github/pongTest/ver1\geometry.c **** 	for(i = 0; i < o->geo->numpoints; i++){
 112              		.loc 1 20 0
 113 006c 0023     		movs	r3, #0
 114 006e FB60     		str	r3, [r7, #12]
 115 0070 20E0     		b	.L5
 116              	.L6:
  21:C:/github/pongTest/ver1\geometry.c **** 		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 0);
 117              		.loc 1 21 0 discriminator 3
 118 0072 7B68     		ldr	r3, [r7, #4]
 119 0074 DB68     		ldr	r3, [r3, #12]
 120 0076 DAB2     		uxtb	r2, r3
 121 0078 7B68     		ldr	r3, [r7, #4]
 122 007a 1968     		ldr	r1, [r3]
 123 007c FB68     		ldr	r3, [r7, #12]
 124 007e 0433     		adds	r3, r3, #4
 125 0080 5B00     		lsls	r3, r3, #1
 126 0082 CB18     		adds	r3, r1, r3
 127 0084 0433     		adds	r3, r3, #4
 128 0086 1B78     		ldrb	r3, [r3]
 129 0088 D318     		adds	r3, r2, r3
 130 008a D8B2     		uxtb	r0, r3
 131 008c 7B68     		ldr	r3, [r7, #4]
 132 008e 1B69     		ldr	r3, [r3, #16]
 133 0090 DAB2     		uxtb	r2, r3
 134 0092 7B68     		ldr	r3, [r7, #4]
 135 0094 1968     		ldr	r1, [r3]
 136 0096 FB68     		ldr	r3, [r7, #12]
 137 0098 0433     		adds	r3, r3, #4
 138 009a 5B00     		lsls	r3, r3, #1
 139 009c CB18     		adds	r3, r1, r3
 140 009e 0533     		adds	r3, r3, #5
 141 00a0 1B78     		ldrb	r3, [r3]
 142 00a2 D318     		adds	r3, r2, r3
 143 00a4 DBB2     		uxtb	r3, r3
 144 00a6 0022     		movs	r2, #0
 145 00a8 1900     		movs	r1, r3
 146 00aa FFF7FEFF 		bl	pixel
  20:C:/github/pongTest/ver1\geometry.c **** 		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 0);
 147              		.loc 1 20 0 discriminator 3
 148 00ae FB68     		ldr	r3, [r7, #12]
 149 00b0 0133     		adds	r3, r3, #1
 150 00b2 FB60     		str	r3, [r7, #12]
 151              	.L5:
  20:C:/github/pongTest/ver1\geometry.c **** 		pixel(o->posx + o->geo->px[i].x, o->posy + o->geo->px[i].y, 0);
 152              		.loc 1 20 0 is_stmt 0 discriminator 1
 153 00b4 7B68     		ldr	r3, [r7, #4]
 154 00b6 1B68     		ldr	r3, [r3]
 155 00b8 1A68     		ldr	r2, [r3]
 156 00ba FB68     		ldr	r3, [r7, #12]
 157 00bc 9A42     		cmp	r2, r3
 158 00be D8D8     		bhi	.L6
  22:C:/github/pongTest/ver1\geometry.c **** 	}
  23:C:/github/pongTest/ver1\geometry.c **** }
 159              		.loc 1 23 0 is_stmt 1
 160 00c0 C046     		nop
 161 00c2 BD46     		mov	sp, r7
 162 00c4 04B0     		add	sp, sp, #16
 163              		@ sp needed
 164 00c6 80BD     		pop	{r7, pc}
 165              		.cfi_endproc
 166              	.LFE1:
 168              		.align	2
 169              		.global	move_object
 170              		.code	16
 171              		.thumb_func
 173              	move_object:
 174              	.LFB2:
  24:C:/github/pongTest/ver1\geometry.c **** 
  25:C:/github/pongTest/ver1\geometry.c **** void move_object(P_OBJECT o){
 175              		.loc 1 25 0
 176              		.cfi_startproc
 177 00c8 80B5     		push	{r7, lr}
 178              		.cfi_def_cfa_offset 8
 179              		.cfi_offset 7, -8
 180              		.cfi_offset 14, -4
 181 00ca 82B0     		sub	sp, sp, #8
 182              		.cfi_def_cfa_offset 16
 183 00cc 00AF     		add	r7, sp, #0
 184              		.cfi_def_cfa_register 7
 185 00ce 7860     		str	r0, [r7, #4]
  26:C:/github/pongTest/ver1\geometry.c **** 	clear_object(o);
 186              		.loc 1 26 0
 187 00d0 7B68     		ldr	r3, [r7, #4]
 188 00d2 1800     		movs	r0, r3
 189 00d4 FFF7FEFF 		bl	clear_object
  27:C:/github/pongTest/ver1\geometry.c **** 	
  28:C:/github/pongTest/ver1\geometry.c **** 	// set new positions
  29:C:/github/pongTest/ver1\geometry.c **** 	o->posx = o->posx + o->dirx;
 190              		.loc 1 29 0
 191 00d8 7B68     		ldr	r3, [r7, #4]
 192 00da DA68     		ldr	r2, [r3, #12]
 193 00dc 7B68     		ldr	r3, [r7, #4]
 194 00de 5B68     		ldr	r3, [r3, #4]
 195 00e0 D218     		adds	r2, r2, r3
 196 00e2 7B68     		ldr	r3, [r7, #4]
 197 00e4 DA60     		str	r2, [r3, #12]
  30:C:/github/pongTest/ver1\geometry.c **** 	o->posy = o->posy + o->diry;
 198              		.loc 1 30 0
 199 00e6 7B68     		ldr	r3, [r7, #4]
 200 00e8 1A69     		ldr	r2, [r3, #16]
 201 00ea 7B68     		ldr	r3, [r7, #4]
 202 00ec 9B68     		ldr	r3, [r3, #8]
 203 00ee D218     		adds	r2, r2, r3
 204 00f0 7B68     		ldr	r3, [r7, #4]
 205 00f2 1A61     		str	r2, [r3, #16]
  31:C:/github/pongTest/ver1\geometry.c **** 	
  32:C:/github/pongTest/ver1\geometry.c **** 	draw_object(o);
 206              		.loc 1 32 0
 207 00f4 7B68     		ldr	r3, [r7, #4]
 208 00f6 1800     		movs	r0, r3
 209 00f8 FFF7FEFF 		bl	draw_object
  33:C:/github/pongTest/ver1\geometry.c **** }
 210              		.loc 1 33 0
 211 00fc C046     		nop
 212 00fe BD46     		mov	sp, r7
 213 0100 02B0     		add	sp, sp, #8
 214              		@ sp needed
 215 0102 80BD     		pop	{r7, pc}
 216              		.cfi_endproc
 217              	.LFE2:
 219              		.align	2
 220              		.global	set_object_speed
 221              		.code	16
 222              		.thumb_func
 224              	set_object_speed:
 225              	.LFB3:
  34:C:/github/pongTest/ver1\geometry.c **** 
  35:C:/github/pongTest/ver1\geometry.c **** void set_object_speed(P_OBJECT o, uint32 speedx, uint32 speedy){
 226              		.loc 1 35 0
 227              		.cfi_startproc
 228 0104 80B5     		push	{r7, lr}
 229              		.cfi_def_cfa_offset 8
 230              		.cfi_offset 7, -8
 231              		.cfi_offset 14, -4
 232 0106 84B0     		sub	sp, sp, #16
 233              		.cfi_def_cfa_offset 24
 234 0108 00AF     		add	r7, sp, #0
 235              		.cfi_def_cfa_register 7
 236 010a F860     		str	r0, [r7, #12]
 237 010c B960     		str	r1, [r7, #8]
 238 010e 7A60     		str	r2, [r7, #4]
  36:C:/github/pongTest/ver1\geometry.c **** 	o->dirx = speedx;
 239              		.loc 1 36 0
 240 0110 FB68     		ldr	r3, [r7, #12]
 241 0112 BA68     		ldr	r2, [r7, #8]
 242 0114 5A60     		str	r2, [r3, #4]
  37:C:/github/pongTest/ver1\geometry.c **** 	o->diry = speedy;
 243              		.loc 1 37 0
 244 0116 FB68     		ldr	r3, [r7, #12]
 245 0118 7A68     		ldr	r2, [r7, #4]
 246 011a 9A60     		str	r2, [r3, #8]
  38:C:/github/pongTest/ver1\geometry.c **** }
 247              		.loc 1 38 0
 248 011c C046     		nop
 249 011e BD46     		mov	sp, r7
 250 0120 04B0     		add	sp, sp, #16
 251              		@ sp needed
 252 0122 80BD     		pop	{r7, pc}
 253              		.cfi_endproc
 254              	.LFE3:
 256              	.Letext0:
 257              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 258              		.file 3 "C:/github/pongTest/ver1/geometry.h"
