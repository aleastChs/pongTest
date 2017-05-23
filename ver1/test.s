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
  15              		.file	"display_logic.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.align	2
  20              		.global	app_init_display
  21              		.code	16
  22              		.thumb_func
  24              	app_init_display:
  25              	.LFB0:
  26              		.file 1 "C:/github/pongTest/ver1/display_logic.c"
   1:C:/github/pongTest/ver1\display_logic.c **** /*
   2:C:/github/pongTest/ver1\display_logic.c ****  * 
   3:C:/github/pongTest/ver1\display_logic.c ****  * DISPLAY_LOGIC.C
   4:C:/github/pongTest/ver1\display_logic.c ****  * 
   5:C:/github/pongTest/ver1\display_logic.c ****  */ 
   6:C:/github/pongTest/ver1\display_logic.c **** 
   7:C:/github/pongTest/ver1\display_logic.c **** 
   8:C:/github/pongTest/ver1\display_logic.c **** #include "config_gpio.h"
   9:C:/github/pongTest/ver1\display_logic.c **** #include "standard_types.h"
  10:C:/github/pongTest/ver1\display_logic.c **** #include "delay.h"
  11:C:/github/pongTest/ver1\display_logic.c **** #include "display_logic.h"
  12:C:/github/pongTest/ver1\display_logic.c ****  
  13:C:/github/pongTest/ver1\display_logic.c **** typedef volatile GPIO* gpioptr;
  14:C:/github/pongTest/ver1\display_logic.c **** #define GPIO_E ((gpioptr) 0x40021000)   // definera en pekare av typen GPIO till Port E:s adress
  15:C:/github/pongTest/ver1\display_logic.c ****  
  16:C:/github/pongTest/ver1\display_logic.c **** #define B_E         0x40
  17:C:/github/pongTest/ver1\display_logic.c **** #define B_RST       0x20
  18:C:/github/pongTest/ver1\display_logic.c **** #define B_CS2       0x10
  19:C:/github/pongTest/ver1\display_logic.c **** #define B_CS1       0x08
  20:C:/github/pongTest/ver1\display_logic.c **** #define B_SELECT    4
  21:C:/github/pongTest/ver1\display_logic.c **** #define B_RW        2
  22:C:/github/pongTest/ver1\display_logic.c **** #define B_RS        1 
  23:C:/github/pongTest/ver1\display_logic.c ****  
  24:C:/github/pongTest/ver1\display_logic.c **** #define LCD_ON          0x3F // Display on
  25:C:/github/pongTest/ver1\display_logic.c **** #define LCD_OFF         0x3E // Display off
  26:C:/github/pongTest/ver1\display_logic.c **** #define LCD_SET_ADD     0x40
  27:C:/github/pongTest/ver1\display_logic.c **** #define LCD_SET_PAGE    0xB8
  28:C:/github/pongTest/ver1\display_logic.c **** #define LCD_DISP_START  0xC0
  29:C:/github/pongTest/ver1\display_logic.c **** #define LCD_BUSY        0x80
  30:C:/github/pongTest/ver1\display_logic.c ****  
  31:C:/github/pongTest/ver1\display_logic.c **** void app_init_display(void) 
  32:C:/github/pongTest/ver1\display_logic.c **** {   
  27              		.loc 1 32 0
  28              		.cfi_startproc
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 00AF     		add	r7, sp, #0
  34              		.cfi_def_cfa_register 7
  33:C:/github/pongTest/ver1\display_logic.c ****     GPIO_E->moder    = (uint32) 0x55555555;      // make 15-0 to outport
  35              		.loc 1 33 0
  36 0004 024B     		ldr	r3, .L2
  37 0006 034A     		ldr	r2, .L2+4
  38 0008 1A60     		str	r2, [r3]
  34:C:/github/pongTest/ver1\display_logic.c ****      
  35:C:/github/pongTest/ver1\display_logic.c **** }
  39              		.loc 1 35 0
  40 000a C046     		nop
  41 000c BD46     		mov	sp, r7
  42              		@ sp needed
  43 000e 80BD     		pop	{r7, pc}
  44              	.L3:
  45              		.align	2
  46              	.L2:
  47 0010 00100240 		.word	1073876992
  48 0014 55555555 		.word	1431655765
  49              		.cfi_endproc
  50              	.LFE0:
  52              		.align	2
  53              		.global	graphic_ctrl_bit_set
  54              		.code	16
  55              		.thumb_func
  57              	graphic_ctrl_bit_set:
  58              	.LFB1:
  36:C:/github/pongTest/ver1\display_logic.c ****  
  37:C:/github/pongTest/ver1\display_logic.c **** void graphic_ctrl_bit_set(uint8 x){
  59              		.loc 1 37 0
  60              		.cfi_startproc
  61 0018 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 001a 84B0     		sub	sp, sp, #16
  66              		.cfi_def_cfa_offset 24
  67 001c 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 001e 0200     		movs	r2, r0
  70 0020 FB1D     		adds	r3, r7, #7
  71 0022 1A70     		strb	r2, [r3]
  38:C:/github/pongTest/ver1\display_logic.c ****     uint8 c;
  39:C:/github/pongTest/ver1\display_logic.c ****     c = GPIO_E->odrLow;  // hämta nuvarande styrreg
  72              		.loc 1 39 0
  73 0024 124A     		ldr	r2, .L5
  74 0026 0F23     		movs	r3, #15
  75 0028 FB18     		adds	r3, r7, r3
  76 002a 127D     		ldrb	r2, [r2, #20]
  77 002c 1A70     		strb	r2, [r3]
  40:C:/github/pongTest/ver1\display_logic.c ****     c &= ~B_SELECT;         // bit_select ska nollställd, resten ska behålla sitt värde
  78              		.loc 1 40 0
  79 002e 0F23     		movs	r3, #15
  80 0030 FB18     		adds	r3, r7, r3
  81 0032 0F22     		movs	r2, #15
  82 0034 BA18     		adds	r2, r7, r2
  83 0036 1278     		ldrb	r2, [r2]
  84 0038 0421     		movs	r1, #4
  85 003a 8A43     		bics	r2, r1
  86 003c 1A70     		strb	r2, [r3]
  41:C:/github/pongTest/ver1\display_logic.c ****     c |= (~B_SELECT & x);   // ett ställ allt från x förutom b_select
  87              		.loc 1 41 0
  88 003e FB1D     		adds	r3, r7, #7
  89 0040 1B78     		ldrb	r3, [r3]
  90 0042 1A1C     		adds	r2, r3, #0
  91 0044 0423     		movs	r3, #4
  92 0046 9A43     		bics	r2, r3
  93 0048 1300     		movs	r3, r2
  94 004a DAB2     		uxtb	r2, r3
  95 004c 0F23     		movs	r3, #15
  96 004e FB18     		adds	r3, r7, r3
  97 0050 1B78     		ldrb	r3, [r3]
  98 0052 1343     		orrs	r3, r2
  99 0054 DAB2     		uxtb	r2, r3
 100 0056 0F23     		movs	r3, #15
 101 0058 FB18     		adds	r3, r7, r3
 102 005a 1A70     		strb	r2, [r3]
  42:C:/github/pongTest/ver1\display_logic.c ****     GPIO_E->odrLow = c;      // kopiera till styrreg
 103              		.loc 1 42 0
 104 005c 044A     		ldr	r2, .L5
 105 005e 0F23     		movs	r3, #15
 106 0060 FB18     		adds	r3, r7, r3
 107 0062 1B78     		ldrb	r3, [r3]
 108 0064 1375     		strb	r3, [r2, #20]
  43:C:/github/pongTest/ver1\display_logic.c **** }
 109              		.loc 1 43 0
 110 0066 C046     		nop
 111 0068 BD46     		mov	sp, r7
 112 006a 04B0     		add	sp, sp, #16
 113              		@ sp needed
 114 006c 80BD     		pop	{r7, pc}
 115              	.L6:
 116 006e C046     		.align	2
 117              	.L5:
 118 0070 00100240 		.word	1073876992
 119              		.cfi_endproc
 120              	.LFE1:
 122              		.align	2
 123              		.global	graphic_ctrl_bit_clear
 124              		.code	16
 125              		.thumb_func
 127              	graphic_ctrl_bit_clear:
 128              	.LFB2:
  44:C:/github/pongTest/ver1\display_logic.c ****  
  45:C:/github/pongTest/ver1\display_logic.c **** void graphic_ctrl_bit_clear(uint8 x){
 129              		.loc 1 45 0
 130              		.cfi_startproc
 131 0074 80B5     		push	{r7, lr}
 132              		.cfi_def_cfa_offset 8
 133              		.cfi_offset 7, -8
 134              		.cfi_offset 14, -4
 135 0076 84B0     		sub	sp, sp, #16
 136              		.cfi_def_cfa_offset 24
 137 0078 00AF     		add	r7, sp, #0
 138              		.cfi_def_cfa_register 7
 139 007a 0200     		movs	r2, r0
 140 007c FB1D     		adds	r3, r7, #7
 141 007e 1A70     		strb	r2, [r3]
  46:C:/github/pongTest/ver1\display_logic.c ****     uint8 c;
  47:C:/github/pongTest/ver1\display_logic.c ****     c = GPIO_E->odrLow;  // hämta nuvarande styrreg
 142              		.loc 1 47 0
 143 0080 114A     		ldr	r2, .L8
 144 0082 0F23     		movs	r3, #15
 145 0084 FB18     		adds	r3, r7, r3
 146 0086 127D     		ldrb	r2, [r2, #20]
 147 0088 1A70     		strb	r2, [r3]
  48:C:/github/pongTest/ver1\display_logic.c ****     c &= ~B_SELECT;         // bit_select ska nollställd, resten ska behålla sitt värde
 148              		.loc 1 48 0
 149 008a 0F23     		movs	r3, #15
 150 008c FB18     		adds	r3, r7, r3
 151 008e 0F22     		movs	r2, #15
 152 0090 BA18     		adds	r2, r7, r2
 153 0092 1278     		ldrb	r2, [r2]
 154 0094 0421     		movs	r1, #4
 155 0096 8A43     		bics	r2, r1
 156 0098 1A70     		strb	r2, [r3]
  49:C:/github/pongTest/ver1\display_logic.c ****     c &= ~x;                // nollställ styrreg med de bitar som är 1 i x
 157              		.loc 1 49 0
 158 009a FB1D     		adds	r3, r7, #7
 159 009c 1B78     		ldrb	r3, [r3]
 160 009e DB43     		mvns	r3, r3
 161 00a0 D9B2     		uxtb	r1, r3
 162 00a2 0F23     		movs	r3, #15
 163 00a4 FB18     		adds	r3, r7, r3
 164 00a6 1A78     		ldrb	r2, [r3]
 165 00a8 0B1C     		adds	r3, r1, #0
 166 00aa 1340     		ands	r3, r2
 167 00ac DAB2     		uxtb	r2, r3
 168 00ae 0F23     		movs	r3, #15
 169 00b0 FB18     		adds	r3, r7, r3
 170 00b2 1A70     		strb	r2, [r3]
  50:C:/github/pongTest/ver1\display_logic.c ****     GPIO_E->odrLow = c;      // kopiera till styrreg
 171              		.loc 1 50 0
 172 00b4 044A     		ldr	r2, .L8
 173 00b6 0F23     		movs	r3, #15
 174 00b8 FB18     		adds	r3, r7, r3
 175 00ba 1B78     		ldrb	r3, [r3]
 176 00bc 1375     		strb	r3, [r2, #20]
  51:C:/github/pongTest/ver1\display_logic.c **** }
 177              		.loc 1 51 0
 178 00be C046     		nop
 179 00c0 BD46     		mov	sp, r7
 180 00c2 04B0     		add	sp, sp, #16
 181              		@ sp needed
 182 00c4 80BD     		pop	{r7, pc}
 183              	.L9:
 184 00c6 C046     		.align	2
 185              	.L8:
 186 00c8 00100240 		.word	1073876992
 187              		.cfi_endproc
 188              	.LFE2:
 190              		.align	2
 191              		.global	select_controller
 192              		.code	16
 193              		.thumb_func
 195              	select_controller:
 196              	.LFB3:
  52:C:/github/pongTest/ver1\display_logic.c ****  
  53:C:/github/pongTest/ver1\display_logic.c **** void select_controller(uint8 controller){
 197              		.loc 1 53 0
 198              		.cfi_startproc
 199 00cc 80B5     		push	{r7, lr}
 200              		.cfi_def_cfa_offset 8
 201              		.cfi_offset 7, -8
 202              		.cfi_offset 14, -4
 203 00ce 82B0     		sub	sp, sp, #8
 204              		.cfi_def_cfa_offset 16
 205 00d0 00AF     		add	r7, sp, #0
 206              		.cfi_def_cfa_register 7
 207 00d2 0200     		movs	r2, r0
 208 00d4 FB1D     		adds	r3, r7, #7
 209 00d6 1A70     		strb	r2, [r3]
  54:C:/github/pongTest/ver1\display_logic.c ****     switch(controller) {
 210              		.loc 1 54 0
 211 00d8 FB1D     		adds	r3, r7, #7
 212 00da 1B78     		ldrb	r3, [r3]
 213 00dc 082B     		cmp	r3, #8
 214 00de 0CD0     		beq	.L12
 215 00e0 02DC     		bgt	.L13
 216 00e2 002B     		cmp	r3, #0
 217 00e4 05D0     		beq	.L14
  55:C:/github/pongTest/ver1\display_logic.c ****         case 0:
  56:C:/github/pongTest/ver1\display_logic.c ****                 graphic_ctrl_bit_clear(B_CS1 | B_CS2);
  57:C:/github/pongTest/ver1\display_logic.c ****                 break;
  58:C:/github/pongTest/ver1\display_logic.c ****         case B_CS1:
  59:C:/github/pongTest/ver1\display_logic.c ****                 graphic_ctrl_bit_clear(B_CS2);
  60:C:/github/pongTest/ver1\display_logic.c ****                 graphic_ctrl_bit_set(B_CS1);
  61:C:/github/pongTest/ver1\display_logic.c ****                 break;
  62:C:/github/pongTest/ver1\display_logic.c ****         case B_CS2:
  63:C:/github/pongTest/ver1\display_logic.c ****                 graphic_ctrl_bit_clear(B_CS1);
  64:C:/github/pongTest/ver1\display_logic.c ****                 graphic_ctrl_bit_set(B_CS2);
  65:C:/github/pongTest/ver1\display_logic.c ****                 break;
  66:C:/github/pongTest/ver1\display_logic.c ****         case (B_CS1 | B_CS2):
  67:C:/github/pongTest/ver1\display_logic.c ****                 graphic_ctrl_bit_set(B_CS1 | B_CS2);
  68:C:/github/pongTest/ver1\display_logic.c ****                 break;
  69:C:/github/pongTest/ver1\display_logic.c ****     }   
  70:C:/github/pongTest/ver1\display_logic.c **** }
 218              		.loc 1 70 0
 219 00e6 1AE0     		b	.L17
 220              	.L13:
  54:C:/github/pongTest/ver1\display_logic.c ****     switch(controller) {
 221              		.loc 1 54 0
 222 00e8 102B     		cmp	r3, #16
 223 00ea 0DD0     		beq	.L15
 224 00ec 182B     		cmp	r3, #24
 225 00ee 12D0     		beq	.L16
 226              		.loc 1 70 0
 227 00f0 15E0     		b	.L17
 228              	.L14:
  56:C:/github/pongTest/ver1\display_logic.c ****                 break;
 229              		.loc 1 56 0
 230 00f2 1820     		movs	r0, #24
 231 00f4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  57:C:/github/pongTest/ver1\display_logic.c ****         case B_CS1:
 232              		.loc 1 57 0
 233 00f8 11E0     		b	.L11
 234              	.L12:
  59:C:/github/pongTest/ver1\display_logic.c ****                 graphic_ctrl_bit_set(B_CS1);
 235              		.loc 1 59 0
 236 00fa 1020     		movs	r0, #16
 237 00fc FFF7FEFF 		bl	graphic_ctrl_bit_clear
  60:C:/github/pongTest/ver1\display_logic.c ****                 break;
 238              		.loc 1 60 0
 239 0100 0820     		movs	r0, #8
 240 0102 FFF7FEFF 		bl	graphic_ctrl_bit_set
  61:C:/github/pongTest/ver1\display_logic.c ****         case B_CS2:
 241              		.loc 1 61 0
 242 0106 0AE0     		b	.L11
 243              	.L15:
  63:C:/github/pongTest/ver1\display_logic.c ****                 graphic_ctrl_bit_set(B_CS2);
 244              		.loc 1 63 0
 245 0108 0820     		movs	r0, #8
 246 010a FFF7FEFF 		bl	graphic_ctrl_bit_clear
  64:C:/github/pongTest/ver1\display_logic.c ****                 break;
 247              		.loc 1 64 0
 248 010e 1020     		movs	r0, #16
 249 0110 FFF7FEFF 		bl	graphic_ctrl_bit_set
  65:C:/github/pongTest/ver1\display_logic.c ****         case (B_CS1 | B_CS2):
 250              		.loc 1 65 0
 251 0114 03E0     		b	.L11
 252              	.L16:
  67:C:/github/pongTest/ver1\display_logic.c ****                 break;
 253              		.loc 1 67 0
 254 0116 1820     		movs	r0, #24
 255 0118 FFF7FEFF 		bl	graphic_ctrl_bit_set
  68:C:/github/pongTest/ver1\display_logic.c ****     }   
 256              		.loc 1 68 0
 257 011c C046     		nop
 258              	.L11:
 259              	.L17:
 260              		.loc 1 70 0
 261 011e C046     		nop
 262 0120 BD46     		mov	sp, r7
 263 0122 02B0     		add	sp, sp, #8
 264              		@ sp needed
 265 0124 80BD     		pop	{r7, pc}
 266              		.cfi_endproc
 267              	.LFE3:
 269 0126 C046     		.align	2
 270              		.global	graphic_wait_ready
 271              		.code	16
 272              		.thumb_func
 274              	graphic_wait_ready:
 275              	.LFB4:
  71:C:/github/pongTest/ver1\display_logic.c ****  
  72:C:/github/pongTest/ver1\display_logic.c **** void graphic_wait_ready(void){
 276              		.loc 1 72 0
 277              		.cfi_startproc
 278 0128 80B5     		push	{r7, lr}
 279              		.cfi_def_cfa_offset 8
 280              		.cfi_offset 7, -8
 281              		.cfi_offset 14, -4
 282 012a 82B0     		sub	sp, sp, #8
 283              		.cfi_def_cfa_offset 16
 284 012c 00AF     		add	r7, sp, #0
 285              		.cfi_def_cfa_register 7
  73:C:/github/pongTest/ver1\display_logic.c ****     uint8 c;
  74:C:/github/pongTest/ver1\display_logic.c ****     graphic_ctrl_bit_clear(B_E);        // E=0
 286              		.loc 1 74 0
 287 012e 4020     		movs	r0, #64
 288 0130 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  75:C:/github/pongTest/ver1\display_logic.c ****     GPIO_E->moder    = 0x00005555;       // 15-8 ingångar, 7-0 utgångar
 289              		.loc 1 75 0
 290 0134 154B     		ldr	r3, .L24
 291 0136 164A     		ldr	r2, .L24+4
 292 0138 1A60     		str	r2, [r3]
  76:C:/github/pongTest/ver1\display_logic.c ****      
  77:C:/github/pongTest/ver1\display_logic.c ****     graphic_ctrl_bit_clear(B_RS);       // RS = 0
 293              		.loc 1 77 0
 294 013a 0120     		movs	r0, #1
 295 013c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  78:C:/github/pongTest/ver1\display_logic.c ****     graphic_ctrl_bit_set(B_RW);         // RW = 1
 296              		.loc 1 78 0
 297 0140 0220     		movs	r0, #2
 298 0142 FFF7FEFF 		bl	graphic_ctrl_bit_set
  79:C:/github/pongTest/ver1\display_logic.c ****     delay_500ns();
 299              		.loc 1 79 0
 300 0146 FFF7FEFF 		bl	delay_500ns
 301              	.L21:
  80:C:/github/pongTest/ver1\display_logic.c ****      
  81:C:/github/pongTest/ver1\display_logic.c ****     while(1) {
  82:C:/github/pongTest/ver1\display_logic.c ****         graphic_ctrl_bit_set(B_E);      // E = 1
 302              		.loc 1 82 0
 303 014a 4020     		movs	r0, #64
 304 014c FFF7FEFF 		bl	graphic_ctrl_bit_set
  83:C:/github/pongTest/ver1\display_logic.c ****         delay_500ns();
 305              		.loc 1 83 0
 306 0150 FFF7FEFF 		bl	delay_500ns
  84:C:/github/pongTest/ver1\display_logic.c ****         c = GPIO_E->idrHigh & LCD_BUSY;
 307              		.loc 1 84 0
 308 0154 0D4B     		ldr	r3, .L24
 309 0156 5B7C     		ldrb	r3, [r3, #17]
 310 0158 DAB2     		uxtb	r2, r3
 311 015a FB1D     		adds	r3, r7, #7
 312 015c 7F21     		movs	r1, #127
 313 015e 8A43     		bics	r2, r1
 314 0160 1A70     		strb	r2, [r3]
  85:C:/github/pongTest/ver1\display_logic.c ****         graphic_ctrl_bit_clear(B_E);    // E = 0
 315              		.loc 1 85 0
 316 0162 4020     		movs	r0, #64
 317 0164 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  86:C:/github/pongTest/ver1\display_logic.c ****         delay_500ns();
 318              		.loc 1 86 0
 319 0168 FFF7FEFF 		bl	delay_500ns
  87:C:/github/pongTest/ver1\display_logic.c ****         if(c == 0) {
 320              		.loc 1 87 0
 321 016c FB1D     		adds	r3, r7, #7
 322 016e 1B78     		ldrb	r3, [r3]
 323 0170 002B     		cmp	r3, #0
 324 0172 00D0     		beq	.L23
  88:C:/github/pongTest/ver1\display_logic.c ****             // om LCD_BUSY i styrreg == 0, avbryt loop
  89:C:/github/pongTest/ver1\display_logic.c ****             break;
  90:C:/github/pongTest/ver1\display_logic.c ****         }
  91:C:/github/pongTest/ver1\display_logic.c ****     }
 325              		.loc 1 91 0
 326 0174 E9E7     		b	.L21
 327              	.L23:
  89:C:/github/pongTest/ver1\display_logic.c ****         }
 328              		.loc 1 89 0
 329 0176 C046     		nop
  92:C:/github/pongTest/ver1\display_logic.c ****     /******OBSOBSOBS RADEN UNDER STÅR INTE I EXEMPELKODEN!!!!*****/
  93:C:/github/pongTest/ver1\display_logic.c ****     graphic_ctrl_bit_set(B_E);          // E = 1
 330              		.loc 1 93 0
 331 0178 4020     		movs	r0, #64
 332 017a FFF7FEFF 		bl	graphic_ctrl_bit_set
  94:C:/github/pongTest/ver1\display_logic.c ****     GPIO_E->moder    = 0x55555555;       // 15-0 utgångar
 333              		.loc 1 94 0
 334 017e 034B     		ldr	r3, .L24
 335 0180 044A     		ldr	r2, .L24+8
 336 0182 1A60     		str	r2, [r3]
  95:C:/github/pongTest/ver1\display_logic.c **** }
 337              		.loc 1 95 0
 338 0184 C046     		nop
 339 0186 BD46     		mov	sp, r7
 340 0188 02B0     		add	sp, sp, #8
 341              		@ sp needed
 342 018a 80BD     		pop	{r7, pc}
 343              	.L25:
 344              		.align	2
 345              	.L24:
 346 018c 00100240 		.word	1073876992
 347 0190 55550000 		.word	21845
 348 0194 55555555 		.word	1431655765
 349              		.cfi_endproc
 350              	.LFE4:
 352              		.align	2
 353              		.global	graphic_read
 354              		.code	16
 355              		.thumb_func
 357              	graphic_read:
 358              	.LFB5:
  96:C:/github/pongTest/ver1\display_logic.c **** 
  97:C:/github/pongTest/ver1\display_logic.c **** 
  98:C:/github/pongTest/ver1\display_logic.c **** // funktion läs från data
  99:C:/github/pongTest/ver1\display_logic.c **** 
 100:C:/github/pongTest/ver1\display_logic.c **** uint8 graphic_read(uint8 controller){
 359              		.loc 1 100 0
 360              		.cfi_startproc
 361 0198 80B5     		push	{r7, lr}
 362              		.cfi_def_cfa_offset 8
 363              		.cfi_offset 7, -8
 364              		.cfi_offset 14, -4
 365 019a 84B0     		sub	sp, sp, #16
 366              		.cfi_def_cfa_offset 24
 367 019c 00AF     		add	r7, sp, #0
 368              		.cfi_def_cfa_register 7
 369 019e 0200     		movs	r2, r0
 370 01a0 FB1D     		adds	r3, r7, #7
 371 01a2 1A70     		strb	r2, [r3]
 101:C:/github/pongTest/ver1\display_logic.c **** 	uint8 rv;
 102:C:/github/pongTest/ver1\display_logic.c ****     graphic_ctrl_bit_clear(B_E);        // E=0
 372              		.loc 1 102 0
 373 01a4 4020     		movs	r0, #64
 374 01a6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 103:C:/github/pongTest/ver1\display_logic.c ****     GPIO_E->moder    = 0x00005555;       // 15-8 ingångar, 7-0 utgångar
 375              		.loc 1 103 0
 376 01aa 1C4B     		ldr	r3, .L30
 377 01ac 1C4A     		ldr	r2, .L30+4
 378 01ae 1A60     		str	r2, [r3]
 104:C:/github/pongTest/ver1\display_logic.c ****      
 105:C:/github/pongTest/ver1\display_logic.c ****     graphic_ctrl_bit_set(B_RS | B_RW);       // RS = 1
 379              		.loc 1 105 0
 380 01b0 0320     		movs	r0, #3
 381 01b2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 106:C:/github/pongTest/ver1\display_logic.c ****     graphic_ctrl_bit_set(B_RW);         // RW = 1
 382              		.loc 1 106 0
 383 01b6 0220     		movs	r0, #2
 384 01b8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 107:C:/github/pongTest/ver1\display_logic.c **** 	select_controller(controller);
 385              		.loc 1 107 0
 386 01bc FB1D     		adds	r3, r7, #7
 387 01be 1B78     		ldrb	r3, [r3]
 388 01c0 1800     		movs	r0, r3
 389 01c2 FFF7FEFF 		bl	select_controller
 108:C:/github/pongTest/ver1\display_logic.c ****     delay_500ns();
 390              		.loc 1 108 0
 391 01c6 FFF7FEFF 		bl	delay_500ns
 109:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_set(B_E);			// E=1
 392              		.loc 1 109 0
 393 01ca 4020     		movs	r0, #64
 394 01cc FFF7FEFF 		bl	graphic_ctrl_bit_set
 110:C:/github/pongTest/ver1\display_logic.c **** 	
 111:C:/github/pongTest/ver1\display_logic.c **** 	delay_500ns();
 395              		.loc 1 111 0
 396 01d0 FFF7FEFF 		bl	delay_500ns
 112:C:/github/pongTest/ver1\display_logic.c **** 	rv = GPIO_E->idrHigh;
 397              		.loc 1 112 0
 398 01d4 114A     		ldr	r2, .L30
 399 01d6 0F23     		movs	r3, #15
 400 01d8 FB18     		adds	r3, r7, r3
 401 01da 527C     		ldrb	r2, [r2, #17]
 402 01dc 1A70     		strb	r2, [r3]
 113:C:/github/pongTest/ver1\display_logic.c **** 	
 114:C:/github/pongTest/ver1\display_logic.c **** 	GPIO_E->moder = 0x55555555;		// 15-0 utågngar
 403              		.loc 1 114 0
 404 01de 0F4B     		ldr	r3, .L30
 405 01e0 104A     		ldr	r2, .L30+8
 406 01e2 1A60     		str	r2, [r3]
 115:C:/github/pongTest/ver1\display_logic.c **** 	
 116:C:/github/pongTest/ver1\display_logic.c **** 	if(controller & B_CS1) {
 407              		.loc 1 116 0
 408 01e4 FB1D     		adds	r3, r7, #7
 409 01e6 1B78     		ldrb	r3, [r3]
 410 01e8 0822     		movs	r2, #8
 411 01ea 1340     		ands	r3, r2
 412 01ec 04D0     		beq	.L27
 117:C:/github/pongTest/ver1\display_logic.c **** 		select_controller(B_CS1);
 413              		.loc 1 117 0
 414 01ee 0820     		movs	r0, #8
 415 01f0 FFF7FEFF 		bl	select_controller
 118:C:/github/pongTest/ver1\display_logic.c **** 		graphic_wait_ready();
 416              		.loc 1 118 0
 417 01f4 FFF7FEFF 		bl	graphic_wait_ready
 418              	.L27:
 119:C:/github/pongTest/ver1\display_logic.c **** 	}
 120:C:/github/pongTest/ver1\display_logic.c **** 	if(controller & B_CS2) {
 419              		.loc 1 120 0
 420 01f8 FB1D     		adds	r3, r7, #7
 421 01fa 1B78     		ldrb	r3, [r3]
 422 01fc 1022     		movs	r2, #16
 423 01fe 1340     		ands	r3, r2
 424 0200 04D0     		beq	.L28
 121:C:/github/pongTest/ver1\display_logic.c **** 		select_controller(B_CS2);
 425              		.loc 1 121 0
 426 0202 1020     		movs	r0, #16
 427 0204 FFF7FEFF 		bl	select_controller
 122:C:/github/pongTest/ver1\display_logic.c **** 		graphic_wait_ready();
 428              		.loc 1 122 0
 429 0208 FFF7FEFF 		bl	graphic_wait_ready
 430              	.L28:
 123:C:/github/pongTest/ver1\display_logic.c **** 	}
 124:C:/github/pongTest/ver1\display_logic.c **** 	
 125:C:/github/pongTest/ver1\display_logic.c **** 	return rv;
 431              		.loc 1 125 0
 432 020c 0F23     		movs	r3, #15
 433 020e FB18     		adds	r3, r7, r3
 434 0210 1B78     		ldrb	r3, [r3]
 126:C:/github/pongTest/ver1\display_logic.c **** }
 435              		.loc 1 126 0
 436 0212 1800     		movs	r0, r3
 437 0214 BD46     		mov	sp, r7
 438 0216 04B0     		add	sp, sp, #16
 439              		@ sp needed
 440 0218 80BD     		pop	{r7, pc}
 441              	.L31:
 442 021a C046     		.align	2
 443              	.L30:
 444 021c 00100240 		.word	1073876992
 445 0220 55550000 		.word	21845
 446 0224 55555555 		.word	1431655765
 447              		.cfi_endproc
 448              	.LFE5:
 450              		.align	2
 451              		.global	graphic_read_data
 452              		.code	16
 453              		.thumb_func
 455              	graphic_read_data:
 456              	.LFB6:
 127:C:/github/pongTest/ver1\display_logic.c **** 
 128:C:/github/pongTest/ver1\display_logic.c **** uint8 graphic_read_data(uint8 controller){
 457              		.loc 1 128 0
 458              		.cfi_startproc
 459 0228 80B5     		push	{r7, lr}
 460              		.cfi_def_cfa_offset 8
 461              		.cfi_offset 7, -8
 462              		.cfi_offset 14, -4
 463 022a 82B0     		sub	sp, sp, #8
 464              		.cfi_def_cfa_offset 16
 465 022c 00AF     		add	r7, sp, #0
 466              		.cfi_def_cfa_register 7
 467 022e 0200     		movs	r2, r0
 468 0230 FB1D     		adds	r3, r7, #7
 469 0232 1A70     		strb	r2, [r3]
 129:C:/github/pongTest/ver1\display_logic.c **** 	(void) graphic_read(controller);
 470              		.loc 1 129 0
 471 0234 FB1D     		adds	r3, r7, #7
 472 0236 1B78     		ldrb	r3, [r3]
 473 0238 1800     		movs	r0, r3
 474 023a FFF7FEFF 		bl	graphic_read
 130:C:/github/pongTest/ver1\display_logic.c **** 	return graphic_read(controller);
 475              		.loc 1 130 0
 476 023e FB1D     		adds	r3, r7, #7
 477 0240 1B78     		ldrb	r3, [r3]
 478 0242 1800     		movs	r0, r3
 479 0244 FFF7FEFF 		bl	graphic_read
 480 0248 0300     		movs	r3, r0
 131:C:/github/pongTest/ver1\display_logic.c **** }
 481              		.loc 1 131 0
 482 024a 1800     		movs	r0, r3
 483 024c BD46     		mov	sp, r7
 484 024e 02B0     		add	sp, sp, #8
 485              		@ sp needed
 486 0250 80BD     		pop	{r7, pc}
 487              		.cfi_endproc
 488              	.LFE6:
 490 0252 C046     		.align	2
 491              		.global	graphic_write
 492              		.code	16
 493              		.thumb_func
 495              	graphic_write:
 496              	.LFB7:
 132:C:/github/pongTest/ver1\display_logic.c **** 
 133:C:/github/pongTest/ver1\display_logic.c **** void graphic_write(uint8 value, uint8 controller) {
 497              		.loc 1 133 0
 498              		.cfi_startproc
 499 0254 80B5     		push	{r7, lr}
 500              		.cfi_def_cfa_offset 8
 501              		.cfi_offset 7, -8
 502              		.cfi_offset 14, -4
 503 0256 82B0     		sub	sp, sp, #8
 504              		.cfi_def_cfa_offset 16
 505 0258 00AF     		add	r7, sp, #0
 506              		.cfi_def_cfa_register 7
 507 025a 0200     		movs	r2, r0
 508 025c FB1D     		adds	r3, r7, #7
 509 025e 1A70     		strb	r2, [r3]
 510 0260 BB1D     		adds	r3, r7, #6
 511 0262 0A1C     		adds	r2, r1, #0
 512 0264 1A70     		strb	r2, [r3]
 134:C:/github/pongTest/ver1\display_logic.c **** 	GPIO_E->odrHigh = value;
 513              		.loc 1 134 0
 514 0266 154A     		ldr	r2, .L38
 515 0268 FB1D     		adds	r3, r7, #7
 516 026a 1B78     		ldrb	r3, [r3]
 517 026c 5375     		strb	r3, [r2, #21]
 135:C:/github/pongTest/ver1\display_logic.c **** 	select_controller(controller);
 518              		.loc 1 135 0
 519 026e BB1D     		adds	r3, r7, #6
 520 0270 1B78     		ldrb	r3, [r3]
 521 0272 1800     		movs	r0, r3
 522 0274 FFF7FEFF 		bl	select_controller
 136:C:/github/pongTest/ver1\display_logic.c **** 	delay_500ns();
 523              		.loc 1 136 0
 524 0278 FFF7FEFF 		bl	delay_500ns
 137:C:/github/pongTest/ver1\display_logic.c **** 	
 138:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_set(B_E);
 525              		.loc 1 138 0
 526 027c 4020     		movs	r0, #64
 527 027e FFF7FEFF 		bl	graphic_ctrl_bit_set
 139:C:/github/pongTest/ver1\display_logic.c **** 	delay_500ns();
 528              		.loc 1 139 0
 529 0282 FFF7FEFF 		bl	delay_500ns
 140:C:/github/pongTest/ver1\display_logic.c **** 	
 141:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_clear(B_E);
 530              		.loc 1 141 0
 531 0286 4020     		movs	r0, #64
 532 0288 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 142:C:/github/pongTest/ver1\display_logic.c **** 	
 143:C:/github/pongTest/ver1\display_logic.c **** 	if(controller & B_CS1) {
 533              		.loc 1 143 0
 534 028c BB1D     		adds	r3, r7, #6
 535 028e 1B78     		ldrb	r3, [r3]
 536 0290 0822     		movs	r2, #8
 537 0292 1340     		ands	r3, r2
 538 0294 04D0     		beq	.L35
 144:C:/github/pongTest/ver1\display_logic.c **** 		select_controller(B_CS1);
 539              		.loc 1 144 0
 540 0296 0820     		movs	r0, #8
 541 0298 FFF7FEFF 		bl	select_controller
 145:C:/github/pongTest/ver1\display_logic.c **** 		graphic_wait_ready();
 542              		.loc 1 145 0
 543 029c FFF7FEFF 		bl	graphic_wait_ready
 544              	.L35:
 146:C:/github/pongTest/ver1\display_logic.c **** 	}
 147:C:/github/pongTest/ver1\display_logic.c **** 	if(controller & B_CS2) {
 545              		.loc 1 147 0
 546 02a0 BB1D     		adds	r3, r7, #6
 547 02a2 1B78     		ldrb	r3, [r3]
 548 02a4 1022     		movs	r2, #16
 549 02a6 1340     		ands	r3, r2
 550 02a8 04D0     		beq	.L37
 148:C:/github/pongTest/ver1\display_logic.c **** 		select_controller(B_CS2);
 551              		.loc 1 148 0
 552 02aa 1020     		movs	r0, #16
 553 02ac FFF7FEFF 		bl	select_controller
 149:C:/github/pongTest/ver1\display_logic.c **** 		graphic_wait_ready();
 554              		.loc 1 149 0
 555 02b0 FFF7FEFF 		bl	graphic_wait_ready
 556              	.L37:
 150:C:/github/pongTest/ver1\display_logic.c **** 	}
 151:C:/github/pongTest/ver1\display_logic.c **** }
 557              		.loc 1 151 0
 558 02b4 C046     		nop
 559 02b6 BD46     		mov	sp, r7
 560 02b8 02B0     		add	sp, sp, #8
 561              		@ sp needed
 562 02ba 80BD     		pop	{r7, pc}
 563              	.L39:
 564              		.align	2
 565              	.L38:
 566 02bc 00100240 		.word	1073876992
 567              		.cfi_endproc
 568              	.LFE7:
 570              		.align	2
 571              		.global	graphic_write_data
 572              		.code	16
 573              		.thumb_func
 575              	graphic_write_data:
 576              	.LFB8:
 152:C:/github/pongTest/ver1\display_logic.c **** 
 153:C:/github/pongTest/ver1\display_logic.c **** void graphic_write_data(uint8 data, uint8 controller){
 577              		.loc 1 153 0
 578              		.cfi_startproc
 579 02c0 80B5     		push	{r7, lr}
 580              		.cfi_def_cfa_offset 8
 581              		.cfi_offset 7, -8
 582              		.cfi_offset 14, -4
 583 02c2 82B0     		sub	sp, sp, #8
 584              		.cfi_def_cfa_offset 16
 585 02c4 00AF     		add	r7, sp, #0
 586              		.cfi_def_cfa_register 7
 587 02c6 0200     		movs	r2, r0
 588 02c8 FB1D     		adds	r3, r7, #7
 589 02ca 1A70     		strb	r2, [r3]
 590 02cc BB1D     		adds	r3, r7, #6
 591 02ce 0A1C     		adds	r2, r1, #0
 592 02d0 1A70     		strb	r2, [r3]
 154:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_clear(B_E);
 593              		.loc 1 154 0
 594 02d2 4020     		movs	r0, #64
 595 02d4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 155:C:/github/pongTest/ver1\display_logic.c **** 	select_controller(controller);
 596              		.loc 1 155 0
 597 02d8 BB1D     		adds	r3, r7, #6
 598 02da 1B78     		ldrb	r3, [r3]
 599 02dc 1800     		movs	r0, r3
 600 02de FFF7FEFF 		bl	select_controller
 156:C:/github/pongTest/ver1\display_logic.c **** 
 157:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_set(B_RS);
 601              		.loc 1 157 0
 602 02e2 0120     		movs	r0, #1
 603 02e4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 158:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_clear(B_RW);
 604              		.loc 1 158 0
 605 02e8 0220     		movs	r0, #2
 606 02ea FFF7FEFF 		bl	graphic_ctrl_bit_clear
 159:C:/github/pongTest/ver1\display_logic.c **** 	
 160:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write(data, controller);
 607              		.loc 1 160 0
 608 02ee BB1D     		adds	r3, r7, #6
 609 02f0 1A78     		ldrb	r2, [r3]
 610 02f2 FB1D     		adds	r3, r7, #7
 611 02f4 1B78     		ldrb	r3, [r3]
 612 02f6 1100     		movs	r1, r2
 613 02f8 1800     		movs	r0, r3
 614 02fa FFF7FEFF 		bl	graphic_write
 161:C:/github/pongTest/ver1\display_logic.c **** }
 615              		.loc 1 161 0
 616 02fe C046     		nop
 617 0300 BD46     		mov	sp, r7
 618 0302 02B0     		add	sp, sp, #8
 619              		@ sp needed
 620 0304 80BD     		pop	{r7, pc}
 621              		.cfi_endproc
 622              	.LFE8:
 624 0306 C046     		.align	2
 625              		.global	graphic_write_command
 626              		.code	16
 627              		.thumb_func
 629              	graphic_write_command:
 630              	.LFB9:
 162:C:/github/pongTest/ver1\display_logic.c **** 
 163:C:/github/pongTest/ver1\display_logic.c **** void graphic_write_command(uint8 command, uint8 controller){
 631              		.loc 1 163 0
 632              		.cfi_startproc
 633 0308 80B5     		push	{r7, lr}
 634              		.cfi_def_cfa_offset 8
 635              		.cfi_offset 7, -8
 636              		.cfi_offset 14, -4
 637 030a 82B0     		sub	sp, sp, #8
 638              		.cfi_def_cfa_offset 16
 639 030c 00AF     		add	r7, sp, #0
 640              		.cfi_def_cfa_register 7
 641 030e 0200     		movs	r2, r0
 642 0310 FB1D     		adds	r3, r7, #7
 643 0312 1A70     		strb	r2, [r3]
 644 0314 BB1D     		adds	r3, r7, #6
 645 0316 0A1C     		adds	r2, r1, #0
 646 0318 1A70     		strb	r2, [r3]
 164:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_clear(B_E);
 647              		.loc 1 164 0
 648 031a 4020     		movs	r0, #64
 649 031c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 165:C:/github/pongTest/ver1\display_logic.c **** 	select_controller(controller);
 650              		.loc 1 165 0
 651 0320 BB1D     		adds	r3, r7, #6
 652 0322 1B78     		ldrb	r3, [r3]
 653 0324 1800     		movs	r0, r3
 654 0326 FFF7FEFF 		bl	select_controller
 166:C:/github/pongTest/ver1\display_logic.c **** 
 167:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_clear(B_RW	| B_RS);
 655              		.loc 1 167 0
 656 032a 0320     		movs	r0, #3
 657 032c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 168:C:/github/pongTest/ver1\display_logic.c **** 	
 169:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write(command, controller);
 658              		.loc 1 169 0
 659 0330 BB1D     		adds	r3, r7, #6
 660 0332 1A78     		ldrb	r2, [r3]
 661 0334 FB1D     		adds	r3, r7, #7
 662 0336 1B78     		ldrb	r3, [r3]
 663 0338 1100     		movs	r1, r2
 664 033a 1800     		movs	r0, r3
 665 033c FFF7FEFF 		bl	graphic_write
 170:C:/github/pongTest/ver1\display_logic.c **** }
 666              		.loc 1 170 0
 667 0340 C046     		nop
 668 0342 BD46     		mov	sp, r7
 669 0344 02B0     		add	sp, sp, #8
 670              		@ sp needed
 671 0346 80BD     		pop	{r7, pc}
 672              		.cfi_endproc
 673              	.LFE9:
 675              		.align	2
 676              		.global	graphic_initalize
 677              		.code	16
 678              		.thumb_func
 680              	graphic_initalize:
 681              	.LFB10:
 171:C:/github/pongTest/ver1\display_logic.c **** 
 172:C:/github/pongTest/ver1\display_logic.c **** void graphic_initalize(void){
 682              		.loc 1 172 0
 683              		.cfi_startproc
 684 0348 80B5     		push	{r7, lr}
 685              		.cfi_def_cfa_offset 8
 686              		.cfi_offset 7, -8
 687              		.cfi_offset 14, -4
 688 034a 00AF     		add	r7, sp, #0
 689              		.cfi_def_cfa_register 7
 173:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_set(B_E);
 690              		.loc 1 173 0
 691 034c 4020     		movs	r0, #64
 692 034e FFF7FEFF 		bl	graphic_ctrl_bit_set
 174:C:/github/pongTest/ver1\display_logic.c **** 	delay_micro(10);
 693              		.loc 1 174 0
 694 0352 0A20     		movs	r0, #10
 695 0354 FFF7FEFF 		bl	delay_micro
 175:C:/github/pongTest/ver1\display_logic.c **** 	
 176:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 696              		.loc 1 176 0
 697 0358 7820     		movs	r0, #120
 698 035a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 177:C:/github/pongTest/ver1\display_logic.c **** 	delay_micro(10);
 699              		.loc 1 177 0
 700 035e 0A20     		movs	r0, #10
 701 0360 FFF7FEFF 		bl	delay_micro
 178:C:/github/pongTest/ver1\display_logic.c **** 	//delay_milli(30);
 179:C:/github/pongTest/ver1\display_logic.c **** 	
 180:C:/github/pongTest/ver1\display_logic.c **** 	graphic_ctrl_bit_set(B_RST);
 702              		.loc 1 180 0
 703 0364 2020     		movs	r0, #32
 704 0366 FFF7FEFF 		bl	graphic_ctrl_bit_set
 181:C:/github/pongTest/ver1\display_logic.c **** 	
 182:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_OFF			, B_CS1 | B_CS2);
 705              		.loc 1 182 0
 706 036a 1821     		movs	r1, #24
 707 036c 3E20     		movs	r0, #62
 708 036e FFF7FEFF 		bl	graphic_write_command
 183:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_ON			, B_CS1 | B_CS2);
 709              		.loc 1 183 0
 710 0372 1821     		movs	r1, #24
 711 0374 3F20     		movs	r0, #63
 712 0376 FFF7FEFF 		bl	graphic_write_command
 184:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_DISP_START	, B_CS1 | B_CS2);
 713              		.loc 1 184 0
 714 037a 1821     		movs	r1, #24
 715 037c C020     		movs	r0, #192
 716 037e FFF7FEFF 		bl	graphic_write_command
 185:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_SET_ADD		, B_CS1 | B_CS2);
 717              		.loc 1 185 0
 718 0382 1821     		movs	r1, #24
 719 0384 4020     		movs	r0, #64
 720 0386 FFF7FEFF 		bl	graphic_write_command
 186:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_SET_PAGE		, B_CS1 | B_CS2);
 721              		.loc 1 186 0
 722 038a 1821     		movs	r1, #24
 723 038c B820     		movs	r0, #184
 724 038e FFF7FEFF 		bl	graphic_write_command
 187:C:/github/pongTest/ver1\display_logic.c **** 	select_controller(0);
 725              		.loc 1 187 0
 726 0392 0020     		movs	r0, #0
 727 0394 FFF7FEFF 		bl	select_controller
 188:C:/github/pongTest/ver1\display_logic.c **** 
 189:C:/github/pongTest/ver1\display_logic.c **** }
 728              		.loc 1 189 0
 729 0398 C046     		nop
 730 039a BD46     		mov	sp, r7
 731              		@ sp needed
 732 039c 80BD     		pop	{r7, pc}
 733              		.cfi_endproc
 734              	.LFE10:
 736 039e C046     		.align	2
 737              		.global	graphic_clear_screen
 738              		.code	16
 739              		.thumb_func
 741              	graphic_clear_screen:
 742              	.LFB11:
 190:C:/github/pongTest/ver1\display_logic.c **** 
 191:C:/github/pongTest/ver1\display_logic.c **** void graphic_clear_screen(void){
 743              		.loc 1 191 0
 744              		.cfi_startproc
 745 03a0 80B5     		push	{r7, lr}
 746              		.cfi_def_cfa_offset 8
 747              		.cfi_offset 7, -8
 748              		.cfi_offset 14, -4
 749 03a2 82B0     		sub	sp, sp, #8
 750              		.cfi_def_cfa_offset 16
 751 03a4 00AF     		add	r7, sp, #0
 752              		.cfi_def_cfa_register 7
 192:C:/github/pongTest/ver1\display_logic.c **** 	uint8 page, add;
 193:C:/github/pongTest/ver1\display_logic.c **** 	for(page = 0; page <= 7; page++) {
 753              		.loc 1 193 0
 754 03a6 FB1D     		adds	r3, r7, #7
 755 03a8 0022     		movs	r2, #0
 756 03aa 1A70     		strb	r2, [r3]
 757 03ac 23E0     		b	.L44
 758              	.L47:
 194:C:/github/pongTest/ver1\display_logic.c **** 		graphic_write_command(LCD_SET_PAGE | page	, B_CS1 | B_CS2);
 759              		.loc 1 194 0
 760 03ae FB1D     		adds	r3, r7, #7
 761 03b0 1B78     		ldrb	r3, [r3]
 762 03b2 4822     		movs	r2, #72
 763 03b4 5242     		rsbs	r2, r2, #0
 764 03b6 1343     		orrs	r3, r2
 765 03b8 DBB2     		uxtb	r3, r3
 766 03ba 1821     		movs	r1, #24
 767 03bc 1800     		movs	r0, r3
 768 03be FFF7FEFF 		bl	graphic_write_command
 195:C:/github/pongTest/ver1\display_logic.c **** 		graphic_write_command(LCD_SET_ADD  | 0		, B_CS1 | B_CS2);
 769              		.loc 1 195 0
 770 03c2 1821     		movs	r1, #24
 771 03c4 4020     		movs	r0, #64
 772 03c6 FFF7FEFF 		bl	graphic_write_command
 196:C:/github/pongTest/ver1\display_logic.c **** 		for(add = 0; add <= 63; add++){
 773              		.loc 1 196 0
 774 03ca BB1D     		adds	r3, r7, #6
 775 03cc 0022     		movs	r2, #0
 776 03ce 1A70     		strb	r2, [r3]
 777 03d0 08E0     		b	.L45
 778              	.L46:
 197:C:/github/pongTest/ver1\display_logic.c **** 			graphic_write_data(0					, B_CS1 | B_CS2);
 779              		.loc 1 197 0 discriminator 3
 780 03d2 1821     		movs	r1, #24
 781 03d4 0020     		movs	r0, #0
 782 03d6 FFF7FEFF 		bl	graphic_write_data
 196:C:/github/pongTest/ver1\display_logic.c **** 		for(add = 0; add <= 63; add++){
 783              		.loc 1 196 0 discriminator 3
 784 03da BB1D     		adds	r3, r7, #6
 785 03dc 1A78     		ldrb	r2, [r3]
 786 03de BB1D     		adds	r3, r7, #6
 787 03e0 0132     		adds	r2, r2, #1
 788 03e2 1A70     		strb	r2, [r3]
 789              	.L45:
 196:C:/github/pongTest/ver1\display_logic.c **** 		for(add = 0; add <= 63; add++){
 790              		.loc 1 196 0 is_stmt 0 discriminator 1
 791 03e4 BB1D     		adds	r3, r7, #6
 792 03e6 1B78     		ldrb	r3, [r3]
 793 03e8 3F2B     		cmp	r3, #63
 794 03ea F2D9     		bls	.L46
 193:C:/github/pongTest/ver1\display_logic.c **** 		graphic_write_command(LCD_SET_PAGE | page	, B_CS1 | B_CS2);
 795              		.loc 1 193 0 is_stmt 1 discriminator 2
 796 03ec FB1D     		adds	r3, r7, #7
 797 03ee 1A78     		ldrb	r2, [r3]
 798 03f0 FB1D     		adds	r3, r7, #7
 799 03f2 0132     		adds	r2, r2, #1
 800 03f4 1A70     		strb	r2, [r3]
 801              	.L44:
 193:C:/github/pongTest/ver1\display_logic.c **** 		graphic_write_command(LCD_SET_PAGE | page	, B_CS1 | B_CS2);
 802              		.loc 1 193 0 is_stmt 0 discriminator 1
 803 03f6 FB1D     		adds	r3, r7, #7
 804 03f8 1B78     		ldrb	r3, [r3]
 805 03fa 072B     		cmp	r3, #7
 806 03fc D7D9     		bls	.L47
 198:C:/github/pongTest/ver1\display_logic.c **** 		}
 199:C:/github/pongTest/ver1\display_logic.c **** 	}
 200:C:/github/pongTest/ver1\display_logic.c **** }
 807              		.loc 1 200 0 is_stmt 1
 808 03fe C046     		nop
 809 0400 BD46     		mov	sp, r7
 810 0402 02B0     		add	sp, sp, #8
 811              		@ sp needed
 812 0404 80BD     		pop	{r7, pc}
 813              		.cfi_endproc
 814              	.LFE11:
 816 0406 C046     		.align	2
 817              		.global	pixel
 818              		.code	16
 819              		.thumb_func
 821              	pixel:
 822              	.LFB12:
 201:C:/github/pongTest/ver1\display_logic.c **** 
 202:C:/github/pongTest/ver1\display_logic.c **** void pixel(uint8 x, uint8 y, uint8 set){
 823              		.loc 1 202 0
 824              		.cfi_startproc
 825 0408 90B5     		push	{r4, r7, lr}
 826              		.cfi_def_cfa_offset 12
 827              		.cfi_offset 4, -12
 828              		.cfi_offset 7, -8
 829              		.cfi_offset 14, -4
 830 040a 87B0     		sub	sp, sp, #28
 831              		.cfi_def_cfa_offset 40
 832 040c 00AF     		add	r7, sp, #0
 833              		.cfi_def_cfa_register 7
 834 040e 0400     		movs	r4, r0
 835 0410 0800     		movs	r0, r1
 836 0412 1100     		movs	r1, r2
 837 0414 FB1D     		adds	r3, r7, #7
 838 0416 221C     		adds	r2, r4, #0
 839 0418 1A70     		strb	r2, [r3]
 840 041a BB1D     		adds	r3, r7, #6
 841 041c 021C     		adds	r2, r0, #0
 842 041e 1A70     		strb	r2, [r3]
 843 0420 7B1D     		adds	r3, r7, #5
 844 0422 0A1C     		adds	r2, r1, #0
 845 0424 1A70     		strb	r2, [r3]
 203:C:/github/pongTest/ver1\display_logic.c **** 	uint8 mask, temp, controller;
 204:C:/github/pongTest/ver1\display_logic.c **** 	uint32 index;
 205:C:/github/pongTest/ver1\display_logic.c **** 	
 206:C:/github/pongTest/ver1\display_logic.c **** 	if((x<1) || (y<1) || (x>128) || (y > 64)) return;
 846              		.loc 1 206 0
 847 0426 FB1D     		adds	r3, r7, #7
 848 0428 1B78     		ldrb	r3, [r3]
 849 042a 002B     		cmp	r3, #0
 850 042c 00D1     		bne	.LCB723
 851 042e C9E0     		b	.L69	@long jump
 852              	.LCB723:
 853              		.loc 1 206 0 is_stmt 0 discriminator 1
 854 0430 BB1D     		adds	r3, r7, #6
 855 0432 1B78     		ldrb	r3, [r3]
 856 0434 002B     		cmp	r3, #0
 857 0436 00D1     		bne	.LCB727
 858 0438 C4E0     		b	.L69	@long jump
 859              	.LCB727:
 860              		.loc 1 206 0 discriminator 2
 861 043a FB1D     		adds	r3, r7, #7
 862 043c 1B78     		ldrb	r3, [r3]
 863 043e 802B     		cmp	r3, #128
 864 0440 00D9     		bls	.LCB731
 865 0442 BFE0     		b	.L69	@long jump
 866              	.LCB731:
 867              		.loc 1 206 0 discriminator 3
 868 0444 BB1D     		adds	r3, r7, #6
 869 0446 1B78     		ldrb	r3, [r3]
 870 0448 402B     		cmp	r3, #64
 871 044a 00D9     		bls	.LCB735
 872 044c BAE0     		b	.L69	@long jump
 873              	.LCB735:
 207:C:/github/pongTest/ver1\display_logic.c **** 	
 208:C:/github/pongTest/ver1\display_logic.c **** 	index = (y-1)/8;
 874              		.loc 1 208 0 is_stmt 1
 875 044e BB1D     		adds	r3, r7, #6
 876 0450 1B78     		ldrb	r3, [r3]
 877 0452 013B     		subs	r3, r3, #1
 878 0454 002B     		cmp	r3, #0
 879 0456 00DA     		bge	.L52
 880 0458 0733     		adds	r3, r3, #7
 881              	.L52:
 882 045a DB10     		asrs	r3, r3, #3
 883 045c 3B61     		str	r3, [r7, #16]
 209:C:/github/pongTest/ver1\display_logic.c **** 	
 210:C:/github/pongTest/ver1\display_logic.c **** 	switch((y-1)%8){
 884              		.loc 1 210 0
 885 045e BB1D     		adds	r3, r7, #6
 886 0460 1B78     		ldrb	r3, [r3]
 887 0462 013B     		subs	r3, r3, #1
 888 0464 594A     		ldr	r2, .L70
 889 0466 1340     		ands	r3, r2
 890 0468 04D5     		bpl	.L53
 891 046a 013B     		subs	r3, r3, #1
 892 046c 0822     		movs	r2, #8
 893 046e 5242     		rsbs	r2, r2, #0
 894 0470 1343     		orrs	r3, r2
 895 0472 0133     		adds	r3, r3, #1
 896              	.L53:
 897 0474 072B     		cmp	r3, #7
 898 0476 2CD8     		bhi	.L54
 899 0478 9A00     		lsls	r2, r3, #2
 900 047a 554B     		ldr	r3, .L70+4
 901 047c D318     		adds	r3, r2, r3
 902 047e 1B68     		ldr	r3, [r3]
 903 0480 9F46     		mov	pc, r3
 904              		.section	.rodata
 905              		.align	2
 906              	.L56:
 907 0000 82040000 		.word	.L55
 908 0004 8C040000 		.word	.L57
 909 0008 96040000 		.word	.L58
 910 000c A0040000 		.word	.L59
 911 0010 AA040000 		.word	.L60
 912 0014 B4040000 		.word	.L61
 913 0018 BE040000 		.word	.L62
 914 001c C8040000 		.word	.L63
 915              		.text
 916              	.L55:
 211:C:/github/pongTest/ver1\display_logic.c **** 		case 0: mask=1; break;
 917              		.loc 1 211 0
 918 0482 1723     		movs	r3, #23
 919 0484 FB18     		adds	r3, r7, r3
 920 0486 0122     		movs	r2, #1
 921 0488 1A70     		strb	r2, [r3]
 922 048a 22E0     		b	.L54
 923              	.L57:
 212:C:/github/pongTest/ver1\display_logic.c **** 		case 1: mask=2; break;
 924              		.loc 1 212 0
 925 048c 1723     		movs	r3, #23
 926 048e FB18     		adds	r3, r7, r3
 927 0490 0222     		movs	r2, #2
 928 0492 1A70     		strb	r2, [r3]
 929 0494 1DE0     		b	.L54
 930              	.L58:
 213:C:/github/pongTest/ver1\display_logic.c **** 		case 2: mask=4; break;
 931              		.loc 1 213 0
 932 0496 1723     		movs	r3, #23
 933 0498 FB18     		adds	r3, r7, r3
 934 049a 0422     		movs	r2, #4
 935 049c 1A70     		strb	r2, [r3]
 936 049e 18E0     		b	.L54
 937              	.L59:
 214:C:/github/pongTest/ver1\display_logic.c **** 		case 3: mask=8; break;
 938              		.loc 1 214 0
 939 04a0 1723     		movs	r3, #23
 940 04a2 FB18     		adds	r3, r7, r3
 941 04a4 0822     		movs	r2, #8
 942 04a6 1A70     		strb	r2, [r3]
 943 04a8 13E0     		b	.L54
 944              	.L60:
 215:C:/github/pongTest/ver1\display_logic.c **** 		case 4: mask=0x10; break;
 945              		.loc 1 215 0
 946 04aa 1723     		movs	r3, #23
 947 04ac FB18     		adds	r3, r7, r3
 948 04ae 1022     		movs	r2, #16
 949 04b0 1A70     		strb	r2, [r3]
 950 04b2 0EE0     		b	.L54
 951              	.L61:
 216:C:/github/pongTest/ver1\display_logic.c **** 		case 5: mask=0x20; break;
 952              		.loc 1 216 0
 953 04b4 1723     		movs	r3, #23
 954 04b6 FB18     		adds	r3, r7, r3
 955 04b8 2022     		movs	r2, #32
 956 04ba 1A70     		strb	r2, [r3]
 957 04bc 09E0     		b	.L54
 958              	.L62:
 217:C:/github/pongTest/ver1\display_logic.c **** 		case 6: mask=0x40; break;
 959              		.loc 1 217 0
 960 04be 1723     		movs	r3, #23
 961 04c0 FB18     		adds	r3, r7, r3
 962 04c2 4022     		movs	r2, #64
 963 04c4 1A70     		strb	r2, [r3]
 964 04c6 04E0     		b	.L54
 965              	.L63:
 218:C:/github/pongTest/ver1\display_logic.c **** 		case 7: mask=0x80; break;
 966              		.loc 1 218 0
 967 04c8 1723     		movs	r3, #23
 968 04ca FB18     		adds	r3, r7, r3
 969 04cc 8022     		movs	r2, #128
 970 04ce 1A70     		strb	r2, [r3]
 971 04d0 C046     		nop
 972              	.L54:
 219:C:/github/pongTest/ver1\display_logic.c **** 	}
 220:C:/github/pongTest/ver1\display_logic.c **** 	
 221:C:/github/pongTest/ver1\display_logic.c **** 	if(set == 0) {
 973              		.loc 1 221 0
 974 04d2 7B1D     		adds	r3, r7, #5
 975 04d4 1B78     		ldrb	r3, [r3]
 976 04d6 002B     		cmp	r3, #0
 977 04d8 06D1     		bne	.L64
 222:C:/github/pongTest/ver1\display_logic.c **** 		mask = ~mask;
 978              		.loc 1 222 0
 979 04da 1723     		movs	r3, #23
 980 04dc FB18     		adds	r3, r7, r3
 981 04de 1722     		movs	r2, #23
 982 04e0 BA18     		adds	r2, r7, r2
 983 04e2 1278     		ldrb	r2, [r2]
 984 04e4 D243     		mvns	r2, r2
 985 04e6 1A70     		strb	r2, [r3]
 986              	.L64:
 223:C:/github/pongTest/ver1\display_logic.c **** 	}
 224:C:/github/pongTest/ver1\display_logic.c **** 	
 225:C:/github/pongTest/ver1\display_logic.c **** 	if(x > 64) {
 987              		.loc 1 225 0
 988 04e8 FB1D     		adds	r3, r7, #7
 989 04ea 1B78     		ldrb	r3, [r3]
 990 04ec 402B     		cmp	r3, #64
 991 04ee 09D9     		bls	.L65
 226:C:/github/pongTest/ver1\display_logic.c **** 		controller = B_CS2;
 992              		.loc 1 226 0
 993 04f0 1623     		movs	r3, #22
 994 04f2 FB18     		adds	r3, r7, r3
 995 04f4 1022     		movs	r2, #16
 996 04f6 1A70     		strb	r2, [r3]
 227:C:/github/pongTest/ver1\display_logic.c **** 		x = x - 65;
 997              		.loc 1 227 0
 998 04f8 FB1D     		adds	r3, r7, #7
 999 04fa FA1D     		adds	r2, r7, #7
 1000 04fc 1278     		ldrb	r2, [r2]
 1001 04fe 413A     		subs	r2, r2, #65
 1002 0500 1A70     		strb	r2, [r3]
 1003 0502 08E0     		b	.L66
 1004              	.L65:
 228:C:/github/pongTest/ver1\display_logic.c **** 	} else {
 229:C:/github/pongTest/ver1\display_logic.c **** 		controller = B_CS1;
 1005              		.loc 1 229 0
 1006 0504 1623     		movs	r3, #22
 1007 0506 FB18     		adds	r3, r7, r3
 1008 0508 0822     		movs	r2, #8
 1009 050a 1A70     		strb	r2, [r3]
 230:C:/github/pongTest/ver1\display_logic.c **** 		x = x - 1;
 1010              		.loc 1 230 0
 1011 050c FB1D     		adds	r3, r7, #7
 1012 050e FA1D     		adds	r2, r7, #7
 1013 0510 1278     		ldrb	r2, [r2]
 1014 0512 013A     		subs	r2, r2, #1
 1015 0514 1A70     		strb	r2, [r3]
 1016              	.L66:
 231:C:/github/pongTest/ver1\display_logic.c **** 	}
 232:C:/github/pongTest/ver1\display_logic.c **** 	
 233:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_SET_ADD 		| x, controller);
 1017              		.loc 1 233 0
 1018 0516 FB1D     		adds	r3, r7, #7
 1019 0518 1B78     		ldrb	r3, [r3]
 1020 051a 4022     		movs	r2, #64
 1021 051c 1343     		orrs	r3, r2
 1022 051e DAB2     		uxtb	r2, r3
 1023 0520 1623     		movs	r3, #22
 1024 0522 FB18     		adds	r3, r7, r3
 1025 0524 1B78     		ldrb	r3, [r3]
 1026 0526 1900     		movs	r1, r3
 1027 0528 1000     		movs	r0, r2
 1028 052a FFF7FEFF 		bl	graphic_write_command
 234:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_SET_PAGE		| index, controller);
 1029              		.loc 1 234 0
 1030 052e 3B69     		ldr	r3, [r7, #16]
 1031 0530 DBB2     		uxtb	r3, r3
 1032 0532 4822     		movs	r2, #72
 1033 0534 5242     		rsbs	r2, r2, #0
 1034 0536 1343     		orrs	r3, r2
 1035 0538 DAB2     		uxtb	r2, r3
 1036 053a 1623     		movs	r3, #22
 1037 053c FB18     		adds	r3, r7, r3
 1038 053e 1B78     		ldrb	r3, [r3]
 1039 0540 1900     		movs	r1, r3
 1040 0542 1000     		movs	r0, r2
 1041 0544 FFF7FEFF 		bl	graphic_write_command
 235:C:/github/pongTest/ver1\display_logic.c **** 	temp = graphic_read_data(controller);
 1042              		.loc 1 235 0
 1043 0548 0F23     		movs	r3, #15
 1044 054a FC18     		adds	r4, r7, r3
 1045 054c 1623     		movs	r3, #22
 1046 054e FB18     		adds	r3, r7, r3
 1047 0550 1B78     		ldrb	r3, [r3]
 1048 0552 1800     		movs	r0, r3
 1049 0554 FFF7FEFF 		bl	graphic_read_data
 1050 0558 0300     		movs	r3, r0
 1051 055a 2370     		strb	r3, [r4]
 236:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_SET_ADD 		| x, controller);
 1052              		.loc 1 236 0
 1053 055c FB1D     		adds	r3, r7, #7
 1054 055e 1B78     		ldrb	r3, [r3]
 1055 0560 4022     		movs	r2, #64
 1056 0562 1343     		orrs	r3, r2
 1057 0564 DAB2     		uxtb	r2, r3
 1058 0566 1623     		movs	r3, #22
 1059 0568 FB18     		adds	r3, r7, r3
 1060 056a 1B78     		ldrb	r3, [r3]
 1061 056c 1900     		movs	r1, r3
 1062 056e 1000     		movs	r0, r2
 1063 0570 FFF7FEFF 		bl	graphic_write_command
 237:C:/github/pongTest/ver1\display_logic.c **** 	
 238:C:/github/pongTest/ver1\display_logic.c **** 	if(set) {
 1064              		.loc 1 238 0
 1065 0574 7B1D     		adds	r3, r7, #5
 1066 0576 1B78     		ldrb	r3, [r3]
 1067 0578 002B     		cmp	r3, #0
 1068 057a 0AD0     		beq	.L67
 239:C:/github/pongTest/ver1\display_logic.c **** 		mask = mask | temp;
 1069              		.loc 1 239 0
 1070 057c 1723     		movs	r3, #23
 1071 057e FB18     		adds	r3, r7, r3
 1072 0580 1722     		movs	r2, #23
 1073 0582 B918     		adds	r1, r7, r2
 1074 0584 0F22     		movs	r2, #15
 1075 0586 BA18     		adds	r2, r7, r2
 1076 0588 0978     		ldrb	r1, [r1]
 1077 058a 1278     		ldrb	r2, [r2]
 1078 058c 0A43     		orrs	r2, r1
 1079 058e 1A70     		strb	r2, [r3]
 1080 0590 09E0     		b	.L68
 1081              	.L67:
 240:C:/github/pongTest/ver1\display_logic.c **** 	} else {
 241:C:/github/pongTest/ver1\display_logic.c **** 		mask = mask & temp;
 1082              		.loc 1 241 0
 1083 0592 1723     		movs	r3, #23
 1084 0594 FB18     		adds	r3, r7, r3
 1085 0596 1722     		movs	r2, #23
 1086 0598 BA18     		adds	r2, r7, r2
 1087 059a 0F21     		movs	r1, #15
 1088 059c 7918     		adds	r1, r7, r1
 1089 059e 1278     		ldrb	r2, [r2]
 1090 05a0 0978     		ldrb	r1, [r1]
 1091 05a2 0A40     		ands	r2, r1
 1092 05a4 1A70     		strb	r2, [r3]
 1093              	.L68:
 242:C:/github/pongTest/ver1\display_logic.c **** 	}
 243:C:/github/pongTest/ver1\display_logic.c **** 	
 244:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_data(mask, controller);
 1094              		.loc 1 244 0
 1095 05a6 1623     		movs	r3, #22
 1096 05a8 FB18     		adds	r3, r7, r3
 1097 05aa 1A78     		ldrb	r2, [r3]
 1098 05ac 1723     		movs	r3, #23
 1099 05ae FB18     		adds	r3, r7, r3
 1100 05b0 1B78     		ldrb	r3, [r3]
 1101 05b2 1100     		movs	r1, r2
 1102 05b4 1800     		movs	r0, r3
 1103 05b6 FFF7FEFF 		bl	graphic_write_data
 245:C:/github/pongTest/ver1\display_logic.c **** 	
 246:C:/github/pongTest/ver1\display_logic.c **** 	
 247:C:/github/pongTest/ver1\display_logic.c **** 	graphic_write_command(LCD_ON			, B_CS1 | B_CS2);
 1104              		.loc 1 247 0
 1105 05ba 1821     		movs	r1, #24
 1106 05bc 3F20     		movs	r0, #63
 1107 05be FFF7FEFF 		bl	graphic_write_command
 1108 05c2 00E0     		b	.L48
 1109              	.L69:
 206:C:/github/pongTest/ver1\display_logic.c **** 	
 1110              		.loc 1 206 0
 1111 05c4 C046     		nop
 1112              	.L48:
 248:C:/github/pongTest/ver1\display_logic.c **** }...
 1113              		.loc 1 248 0
 1114 05c6 BD46     		mov	sp, r7
 1115 05c8 07B0     		add	sp, sp, #28
 1116              		@ sp needed
 1117 05ca 90BD     		pop	{r4, r7, pc}
 1118              	.L71:
 1119              		.align	2
 1120              	.L70:
 1121 05cc 07000080 		.word	-2147483641
 1122 05d0 00000000 		.word	.L56
 1123              		.cfi_endproc
 1124              	.LFE12:
 1126              	.Letext0:
 1127              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 1128              		.file 3 "C:/github/pongTest/ver1/config_gpio.h"
