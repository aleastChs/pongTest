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
  15              		.file	"keyboard_logic.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.global	seg_codes
  20              		.section	.rodata
  21              		.align	2
  24              	seg_codes:
  25 0000 3F       		.byte	63
  26 0001 06       		.byte	6
  27 0002 5B       		.byte	91
  28 0003 4F       		.byte	79
  29 0004 66       		.byte	102
  30 0005 6D       		.byte	109
  31 0006 7D       		.byte	125
  32 0007 07       		.byte	7
  33 0008 7F       		.byte	127
  34 0009 67       		.byte	103
  35 000a 77       		.byte	119
  36 000b 7C       		.byte	124
  37 000c 39       		.byte	57
  38 000d DE       		.byte	-34
  39 000e 79       		.byte	121
  40 000f 71       		.byte	113
  41              		.global	key
  42              		.align	2
  45              	key:
  46 0010 01       		.byte	1
  47 0011 04       		.byte	4
  48 0012 07       		.byte	7
  49 0013 0E       		.byte	14
  50 0014 02       		.byte	2
  51 0015 05       		.byte	5
  52 0016 08       		.byte	8
  53 0017 00       		.byte	0
  54 0018 03       		.byte	3
  55 0019 06       		.byte	6
  56 001a 09       		.byte	9
  57 001b 0F       		.byte	15
  58 001c 0A       		.byte	10
  59 001d 0B       		.byte	11
  60 001e 0C       		.byte	12
  61 001f 0D       		.byte	13
  62              		.text
  63              		.align	2
  64              		.global	app_init_keyboards
  65              		.code	16
  66              		.thumb_func
  68              	app_init_keyboards:
  69              	.LFB0:
  70              		.file 1 "C:/github/pongTest/ver1/keyboard_logic.c"
   1:C:/github/pongTest/ver1\keyboard_logic.c **** /*
   2:C:/github/pongTest/ver1\keyboard_logic.c ****  * 
   3:C:/github/pongTest/ver1\keyboard_logic.c ****  * KEYBOARD_LOGIC.C
   4:C:/github/pongTest/ver1\keyboard_logic.c ****  * 
   5:C:/github/pongTest/ver1\keyboard_logic.c ****  */ 
   6:C:/github/pongTest/ver1\keyboard_logic.c ****  
   7:C:/github/pongTest/ver1\keyboard_logic.c **** #include "standard_types.h" 
   8:C:/github/pongTest/ver1\keyboard_logic.c **** #include "keyboard_logic.h"
   9:C:/github/pongTest/ver1\keyboard_logic.c **** #include "config_gpio.h"
  10:C:/github/pongTest/ver1\keyboard_logic.c **** #include "delay.h"
  11:C:/github/pongTest/ver1\keyboard_logic.c **** 
  12:C:/github/pongTest/ver1\keyboard_logic.c **** typedef volatile GPIO* gpioptr;
  13:C:/github/pongTest/ver1\keyboard_logic.c **** 
  14:C:/github/pongTest/ver1\keyboard_logic.c **** #define GPIO_D 				((gpioptr) 		0x40020C00) 
  15:C:/github/pongTest/ver1\keyboard_logic.c **** 
  16:C:/github/pongTest/ver1\keyboard_logic.c **** const uint8 seg_codes[16] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C
  17:C:/github/pongTest/ver1\keyboard_logic.c **** const uint8 key[] = { 1, 4, 7, 0xE, 2, 5, 8, 0x0, 3, 0x6, 9, 0xF, 0xA, 0xB, 0xC, 0xD};	// keyboards
  18:C:/github/pongTest/ver1\keyboard_logic.c ****  
  19:C:/github/pongTest/ver1\keyboard_logic.c ****  
  20:C:/github/pongTest/ver1\keyboard_logic.c **** void app_init_keyboards(void) {
  71              		.loc 1 20 0
  72              		.cfi_startproc
  73 0000 80B5     		push	{r7, lr}
  74              		.cfi_def_cfa_offset 8
  75              		.cfi_offset 7, -8
  76              		.cfi_offset 14, -4
  77 0002 00AF     		add	r7, sp, #0
  78              		.cfi_def_cfa_register 7
  21:C:/github/pongTest/ver1\keyboard_logic.c **** 	GPIO_D->moder = 0x55005500;
  79              		.loc 1 21 0
  80 0004 024B     		ldr	r3, .L2
  81 0006 034A     		ldr	r2, .L2+4
  82 0008 1A60     		str	r2, [r3]
  22:C:/github/pongTest/ver1\keyboard_logic.c **** }
  83              		.loc 1 22 0
  84 000a C046     		nop
  85 000c BD46     		mov	sp, r7
  86              		@ sp needed
  87 000e 80BD     		pop	{r7, pc}
  88              	.L3:
  89              		.align	2
  90              	.L2:
  91 0010 000C0240 		.word	1073875968
  92 0014 00550055 		.word	1426085120
  93              		.cfi_endproc
  94              	.LFE0:
  96              		.align	2
  97              		.global	get_key
  98              		.code	16
  99              		.thumb_func
 101              	get_key:
 102              	.LFB1:
  23:C:/github/pongTest/ver1\keyboard_logic.c **** /*
  24:C:/github/pongTest/ver1\keyboard_logic.c ****  * choose low gpio	: 	0
  25:C:/github/pongTest/ver1\keyboard_logic.c ****  * choose high gpio	: 	1
  26:C:/github/pongTest/ver1\keyboard_logic.c ****  */ 
  27:C:/github/pongTest/ver1\keyboard_logic.c **** uint8 get_key(uint8 chooseHighOrLow) 
  28:C:/github/pongTest/ver1\keyboard_logic.c **** {
 103              		.loc 1 28 0
 104              		.cfi_startproc
 105 0018 80B5     		push	{r7, lr}
 106              		.cfi_def_cfa_offset 8
 107              		.cfi_offset 7, -8
 108              		.cfi_offset 14, -4
 109 001a 86B0     		sub	sp, sp, #24
 110              		.cfi_def_cfa_offset 32
 111 001c 00AF     		add	r7, sp, #0
 112              		.cfi_def_cfa_register 7
 113 001e 0200     		movs	r2, r0
 114 0020 FB1D     		adds	r3, r7, #7
 115 0022 1A70     		strb	r2, [r3]
  29:C:/github/pongTest/ver1\keyboard_logic.c **** 	uint8 keyBoard = 0xFF;	//define keyboard
 116              		.loc 1 29 0
 117 0024 1723     		movs	r3, #23
 118 0026 FB18     		adds	r3, r7, r3
 119 0028 FF22     		movs	r2, #255
 120 002a 1A70     		strb	r2, [r3]
 121              	.LBB2:
  30:C:/github/pongTest/ver1\keyboard_logic.c **** 	for(uint8 row = 1; row <=4; row++)		// for each of the rows...
 122              		.loc 1 30 0
 123 002c 1623     		movs	r3, #22
 124 002e FB18     		adds	r3, r7, r3
 125 0030 0122     		movs	r2, #1
 126 0032 1A70     		strb	r2, [r3]
 127 0034 36E0     		b	.L5
 128              	.L9:
 129              	.LBB3:
  31:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
  32:C:/github/pongTest/ver1\keyboard_logic.c **** 		// setup functions pointers
  33:C:/github/pongTest/ver1\keyboard_logic.c **** 		void (*activatePtr)(uint32);
  34:C:/github/pongTest/ver1\keyboard_logic.c **** 		uint32 (*getColPtr)(void);
  35:C:/github/pongTest/ver1\keyboard_logic.c **** 		
  36:C:/github/pongTest/ver1\keyboard_logic.c **** 		
  37:C:/github/pongTest/ver1\keyboard_logic.c **** 		// depending on the input chooseHighOrLow
  38:C:/github/pongTest/ver1\keyboard_logic.c **** 		// assign the different funtions (high/low)
  39:C:/github/pongTest/ver1\keyboard_logic.c **** 		if(chooseHighOrLow == 1){
 130              		.loc 1 39 0
 131 0036 FB1D     		adds	r3, r7, #7
 132 0038 1B78     		ldrb	r3, [r3]
 133 003a 012B     		cmp	r3, #1
 134 003c 03D1     		bne	.L6
 135              	.LBB4:
  40:C:/github/pongTest/ver1\keyboard_logic.c **** 			uint32 kbd_get_col_high(void);
  41:C:/github/pongTest/ver1\keyboard_logic.c **** 			void kbd_activate_high(uint32 row);
  42:C:/github/pongTest/ver1\keyboard_logic.c **** 			
  43:C:/github/pongTest/ver1\keyboard_logic.c **** 			activatePtr 	= kbd_activate_high;
 136              		.loc 1 43 0
 137 003e 1F4B     		ldr	r3, .L11
 138 0040 3B61     		str	r3, [r7, #16]
  44:C:/github/pongTest/ver1\keyboard_logic.c **** 			getColPtr 		= kbd_get_col_high;
 139              		.loc 1 44 0
 140 0042 1F4B     		ldr	r3, .L11+4
 141 0044 FB60     		str	r3, [r7, #12]
 142              	.L6:
 143              	.LBE4:
  45:C:/github/pongTest/ver1\keyboard_logic.c **** 		}
  46:C:/github/pongTest/ver1\keyboard_logic.c **** 		if(chooseHighOrLow == 0){
 144              		.loc 1 46 0
 145 0046 FB1D     		adds	r3, r7, #7
 146 0048 1B78     		ldrb	r3, [r3]
 147 004a 002B     		cmp	r3, #0
 148 004c 03D1     		bne	.L7
 149              	.LBB5:
  47:C:/github/pongTest/ver1\keyboard_logic.c **** 			uint32 kbd_get_col_low(void);
  48:C:/github/pongTest/ver1\keyboard_logic.c **** 			void kbd_activate_low(uint32 row);
  49:C:/github/pongTest/ver1\keyboard_logic.c **** 			
  50:C:/github/pongTest/ver1\keyboard_logic.c **** 			activatePtr 	= kbd_activate_low;
 150              		.loc 1 50 0
 151 004e 1D4B     		ldr	r3, .L11+8
 152 0050 3B61     		str	r3, [r7, #16]
  51:C:/github/pongTest/ver1\keyboard_logic.c **** 			getColPtr 		= kbd_get_col_low;
 153              		.loc 1 51 0
 154 0052 1D4B     		ldr	r3, .L11+12
 155 0054 FB60     		str	r3, [r7, #12]
 156              	.L7:
 157              	.LBE5:
  52:C:/github/pongTest/ver1\keyboard_logic.c **** 		}
  53:C:/github/pongTest/ver1\keyboard_logic.c **** 		
  54:C:/github/pongTest/ver1\keyboard_logic.c **** 		uint32 column = 0x00000000; // reset column variable to zero
 158              		.loc 1 54 0
 159 0056 0023     		movs	r3, #0
 160 0058 BB60     		str	r3, [r7, #8]
  55:C:/github/pongTest/ver1\keyboard_logic.c **** 		delay_500ns();
 161              		.loc 1 55 0
 162 005a FFF7FEFF 		bl	delay_500ns
  56:C:/github/pongTest/ver1\keyboard_logic.c **** 		activatePtr(row);			// ...activate keyboard row
 163              		.loc 1 56 0
 164 005e 1623     		movs	r3, #22
 165 0060 FB18     		adds	r3, r7, r3
 166 0062 1A78     		ldrb	r2, [r3]
 167 0064 3B69     		ldr	r3, [r7, #16]
 168 0066 1000     		movs	r0, r2
 169 0068 9847     		blx	r3
  57:C:/github/pongTest/ver1\keyboard_logic.c **** 		column = getColPtr();		// get the column 
 170              		.loc 1 57 0
 171 006a FB68     		ldr	r3, [r7, #12]
 172 006c 9847     		blx	r3
 173 006e 0300     		movs	r3, r0
 174 0070 BB60     		str	r3, [r7, #8]
  58:C:/github/pongTest/ver1\keyboard_logic.c **** 		
  59:C:/github/pongTest/ver1\keyboard_logic.c **** 		// if the column is nonzero, set keyboard to value of the keys
  60:C:/github/pongTest/ver1\keyboard_logic.c **** 		// else set keyboard is 0xFF
  61:C:/github/pongTest/ver1\keyboard_logic.c **** 		if(column != 0) 
 175              		.loc 1 61 0
 176 0072 BB68     		ldr	r3, [r7, #8]
 177 0074 002B     		cmp	r3, #0
 178 0076 0ED0     		beq	.L8
  62:C:/github/pongTest/ver1\keyboard_logic.c **** 		{
  63:C:/github/pongTest/ver1\keyboard_logic.c **** 			keyBoard = key[4*(column - 1) + (row - 1)];
 179              		.loc 1 63 0
 180 0078 BB68     		ldr	r3, [r7, #8]
 181 007a 144A     		ldr	r2, .L11+16
 182 007c 9446     		mov	ip, r2
 183 007e 6344     		add	r3, r3, ip
 184 0080 9A00     		lsls	r2, r3, #2
 185 0082 1623     		movs	r3, #22
 186 0084 FB18     		adds	r3, r7, r3
 187 0086 1B78     		ldrb	r3, [r3]
 188 0088 D318     		adds	r3, r2, r3
 189 008a 5A1E     		subs	r2, r3, #1
 190 008c 1723     		movs	r3, #23
 191 008e FB18     		adds	r3, r7, r3
 192 0090 0F49     		ldr	r1, .L11+20
 193 0092 8A5C     		ldrb	r2, [r1, r2]
 194 0094 1A70     		strb	r2, [r3]
 195              	.L8:
 196              	.LBE3:
  30:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 197              		.loc 1 30 0 discriminator 2
 198 0096 1623     		movs	r3, #22
 199 0098 FB18     		adds	r3, r7, r3
 200 009a 1A78     		ldrb	r2, [r3]
 201 009c 1623     		movs	r3, #22
 202 009e FB18     		adds	r3, r7, r3
 203 00a0 0132     		adds	r2, r2, #1
 204 00a2 1A70     		strb	r2, [r3]
 205              	.L5:
  30:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 206              		.loc 1 30 0 is_stmt 0 discriminator 1
 207 00a4 1623     		movs	r3, #22
 208 00a6 FB18     		adds	r3, r7, r3
 209 00a8 1B78     		ldrb	r3, [r3]
 210 00aa 042B     		cmp	r3, #4
 211 00ac C3D9     		bls	.L9
 212              	.LBE2:
  64:C:/github/pongTest/ver1\keyboard_logic.c **** 		}
  65:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
  66:C:/github/pongTest/ver1\keyboard_logic.c **** 	
  67:C:/github/pongTest/ver1\keyboard_logic.c **** 	// return keyboard
  68:C:/github/pongTest/ver1\keyboard_logic.c **** 	return keyBoard;
 213              		.loc 1 68 0 is_stmt 1
 214 00ae 1723     		movs	r3, #23
 215 00b0 FB18     		adds	r3, r7, r3
 216 00b2 1B78     		ldrb	r3, [r3]
  69:C:/github/pongTest/ver1\keyboard_logic.c **** }
 217              		.loc 1 69 0
 218 00b4 1800     		movs	r0, r3
 219 00b6 BD46     		mov	sp, r7
 220 00b8 06B0     		add	sp, sp, #24
 221              		@ sp needed
 222 00ba 80BD     		pop	{r7, pc}
 223              	.L12:
 224              		.align	2
 225              	.L11:
 226 00bc 00000000 		.word	kbd_activate_high
 227 00c0 00000000 		.word	kbd_get_col_high
 228 00c4 00000000 		.word	kbd_activate_low
 229 00c8 00000000 		.word	kbd_get_col_low
 230 00cc FFFFFF3F 		.word	1073741823
 231 00d0 00000000 		.word	key
 232              		.cfi_endproc
 233              	.LFE1:
 235              		.align	2
 236              		.global	kbd_activate_low
 237              		.code	16
 238              		.thumb_func
 240              	kbd_activate_low:
 241              	.LFB2:
  70:C:/github/pongTest/ver1\keyboard_logic.c **** 
  71:C:/github/pongTest/ver1\keyboard_logic.c **** // activates one of the for rows with the parameter row
  72:C:/github/pongTest/ver1\keyboard_logic.c **** void kbd_activate_low(uint32 row) 
  73:C:/github/pongTest/ver1\keyboard_logic.c **** {
 242              		.loc 1 73 0
 243              		.cfi_startproc
 244 00d4 80B5     		push	{r7, lr}
 245              		.cfi_def_cfa_offset 8
 246              		.cfi_offset 7, -8
 247              		.cfi_offset 14, -4
 248 00d6 82B0     		sub	sp, sp, #8
 249              		.cfi_def_cfa_offset 16
 250 00d8 00AF     		add	r7, sp, #0
 251              		.cfi_def_cfa_register 7
 252 00da 7860     		str	r0, [r7, #4]
  74:C:/github/pongTest/ver1\keyboard_logic.c **** 	switch(row) 
 253              		.loc 1 74 0
 254 00dc 7B68     		ldr	r3, [r7, #4]
 255 00de 022B     		cmp	r3, #2
 256 00e0 0CD0     		beq	.L15
 257 00e2 02D8     		bhi	.L16
 258 00e4 012B     		cmp	r3, #1
 259 00e6 05D0     		beq	.L17
  75:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
  76:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 1: 
  77:C:/github/pongTest/ver1\keyboard_logic.c **** 			GPIO_D->odrLow = 0x10;
  78:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
  79:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 2: 
  80:C:/github/pongTest/ver1\keyboard_logic.c **** 			GPIO_D->odrLow = 0x20;
  81:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
  82:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 3: 
  83:C:/github/pongTest/ver1\keyboard_logic.c **** 			GPIO_D->odrLow = 0x40;
  84:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
  85:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 4: 
  86:C:/github/pongTest/ver1\keyboard_logic.c **** 			GPIO_D->odrLow = 0x80;
  87:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
  88:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
  89:C:/github/pongTest/ver1\keyboard_logic.c **** }
 260              		.loc 1 89 0
 261 00e8 14E0     		b	.L20
 262              	.L16:
  74:C:/github/pongTest/ver1\keyboard_logic.c **** 	switch(row) 
 263              		.loc 1 74 0
 264 00ea 032B     		cmp	r3, #3
 265 00ec 0AD0     		beq	.L18
 266 00ee 042B     		cmp	r3, #4
 267 00f0 0CD0     		beq	.L19
 268              		.loc 1 89 0
 269 00f2 0FE0     		b	.L20
 270              	.L17:
  77:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 271              		.loc 1 77 0
 272 00f4 094B     		ldr	r3, .L21
 273 00f6 1022     		movs	r2, #16
 274 00f8 1A75     		strb	r2, [r3, #20]
  78:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 2: 
 275              		.loc 1 78 0
 276 00fa 0BE0     		b	.L14
 277              	.L15:
  80:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 278              		.loc 1 80 0
 279 00fc 074B     		ldr	r3, .L21
 280 00fe 2022     		movs	r2, #32
 281 0100 1A75     		strb	r2, [r3, #20]
  81:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 3: 
 282              		.loc 1 81 0
 283 0102 07E0     		b	.L14
 284              	.L18:
  83:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 285              		.loc 1 83 0
 286 0104 054B     		ldr	r3, .L21
 287 0106 4022     		movs	r2, #64
 288 0108 1A75     		strb	r2, [r3, #20]
  84:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 4: 
 289              		.loc 1 84 0
 290 010a 03E0     		b	.L14
 291              	.L19:
  86:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 292              		.loc 1 86 0
 293 010c 034B     		ldr	r3, .L21
 294 010e 8022     		movs	r2, #128
 295 0110 1A75     		strb	r2, [r3, #20]
  87:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 296              		.loc 1 87 0
 297 0112 C046     		nop
 298              	.L14:
 299              	.L20:
 300              		.loc 1 89 0
 301 0114 C046     		nop
 302 0116 BD46     		mov	sp, r7
 303 0118 02B0     		add	sp, sp, #8
 304              		@ sp needed
 305 011a 80BD     		pop	{r7, pc}
 306              	.L22:
 307              		.align	2
 308              	.L21:
 309 011c 000C0240 		.word	1073875968
 310              		.cfi_endproc
 311              	.LFE2:
 313              		.align	2
 314              		.global	kbd_activate_high
 315              		.code	16
 316              		.thumb_func
 318              	kbd_activate_high:
 319              	.LFB3:
  90:C:/github/pongTest/ver1\keyboard_logic.c **** // activates one of the for rows with the parameter row
  91:C:/github/pongTest/ver1\keyboard_logic.c **** void kbd_activate_high(uint32 row) 
  92:C:/github/pongTest/ver1\keyboard_logic.c **** {
 320              		.loc 1 92 0
 321              		.cfi_startproc
 322 0120 80B5     		push	{r7, lr}
 323              		.cfi_def_cfa_offset 8
 324              		.cfi_offset 7, -8
 325              		.cfi_offset 14, -4
 326 0122 82B0     		sub	sp, sp, #8
 327              		.cfi_def_cfa_offset 16
 328 0124 00AF     		add	r7, sp, #0
 329              		.cfi_def_cfa_register 7
 330 0126 7860     		str	r0, [r7, #4]
  93:C:/github/pongTest/ver1\keyboard_logic.c **** 	switch(row) 
 331              		.loc 1 93 0
 332 0128 7B68     		ldr	r3, [r7, #4]
 333 012a 022B     		cmp	r3, #2
 334 012c 0CD0     		beq	.L25
 335 012e 02D8     		bhi	.L26
 336 0130 012B     		cmp	r3, #1
 337 0132 05D0     		beq	.L27
  94:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
  95:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 1: 
  96:C:/github/pongTest/ver1\keyboard_logic.c **** 			GPIO_D->odrHigh = 0x10;
  97:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
  98:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 2: 
  99:C:/github/pongTest/ver1\keyboard_logic.c **** 			GPIO_D->odrHigh = 0x20;
 100:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 101:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 3: 
 102:C:/github/pongTest/ver1\keyboard_logic.c **** 			GPIO_D->odrHigh = 0x40;
 103:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 104:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 4: 
 105:C:/github/pongTest/ver1\keyboard_logic.c **** 			GPIO_D->odrHigh = 0x80;
 106:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 107:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 108:C:/github/pongTest/ver1\keyboard_logic.c **** }
 338              		.loc 1 108 0
 339 0134 14E0     		b	.L30
 340              	.L26:
  93:C:/github/pongTest/ver1\keyboard_logic.c **** 	switch(row) 
 341              		.loc 1 93 0
 342 0136 032B     		cmp	r3, #3
 343 0138 0AD0     		beq	.L28
 344 013a 042B     		cmp	r3, #4
 345 013c 0CD0     		beq	.L29
 346              		.loc 1 108 0
 347 013e 0FE0     		b	.L30
 348              	.L27:
  96:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 349              		.loc 1 96 0
 350 0140 094B     		ldr	r3, .L31
 351 0142 1022     		movs	r2, #16
 352 0144 5A75     		strb	r2, [r3, #21]
  97:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 2: 
 353              		.loc 1 97 0
 354 0146 0BE0     		b	.L24
 355              	.L25:
  99:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 356              		.loc 1 99 0
 357 0148 074B     		ldr	r3, .L31
 358 014a 2022     		movs	r2, #32
 359 014c 5A75     		strb	r2, [r3, #21]
 100:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 3: 
 360              		.loc 1 100 0
 361 014e 07E0     		b	.L24
 362              	.L28:
 102:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 363              		.loc 1 102 0
 364 0150 054B     		ldr	r3, .L31
 365 0152 4022     		movs	r2, #64
 366 0154 5A75     		strb	r2, [r3, #21]
 103:C:/github/pongTest/ver1\keyboard_logic.c **** 		case 4: 
 367              		.loc 1 103 0
 368 0156 03E0     		b	.L24
 369              	.L29:
 105:C:/github/pongTest/ver1\keyboard_logic.c **** 			break;
 370              		.loc 1 105 0
 371 0158 034B     		ldr	r3, .L31
 372 015a 8022     		movs	r2, #128
 373 015c 5A75     		strb	r2, [r3, #21]
 106:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 374              		.loc 1 106 0
 375 015e C046     		nop
 376              	.L24:
 377              	.L30:
 378              		.loc 1 108 0
 379 0160 C046     		nop
 380 0162 BD46     		mov	sp, r7
 381 0164 02B0     		add	sp, sp, #8
 382              		@ sp needed
 383 0166 80BD     		pop	{r7, pc}
 384              	.L32:
 385              		.align	2
 386              	.L31:
 387 0168 000C0240 		.word	1073875968
 388              		.cfi_endproc
 389              	.LFE3:
 391              		.align	2
 392              		.global	kbd_get_col_low
 393              		.code	16
 394              		.thumb_func
 396              	kbd_get_col_low:
 397              	.LFB4:
 109:C:/github/pongTest/ver1\keyboard_logic.c **** 
 110:C:/github/pongTest/ver1\keyboard_logic.c **** 
 111:C:/github/pongTest/ver1\keyboard_logic.c **** // get the column that is pressed 
 112:C:/github/pongTest/ver1\keyboard_logic.c **** uint32 kbd_get_col_low(void)
 113:C:/github/pongTest/ver1\keyboard_logic.c **** {
 398              		.loc 1 113 0
 399              		.cfi_startproc
 400 016c 80B5     		push	{r7, lr}
 401              		.cfi_def_cfa_offset 8
 402              		.cfi_offset 7, -8
 403              		.cfi_offset 14, -4
 404 016e 82B0     		sub	sp, sp, #8
 405              		.cfi_def_cfa_offset 16
 406 0170 00AF     		add	r7, sp, #0
 407              		.cfi_def_cfa_register 7
 114:C:/github/pongTest/ver1\keyboard_logic.c **** 	uint8 c;
 115:C:/github/pongTest/ver1\keyboard_logic.c **** 	c = GPIO_D->idrLow; // read from inputs
 408              		.loc 1 115 0
 409 0172 134A     		ldr	r2, .L39
 410 0174 FB1C     		adds	r3, r7, #3
 411 0176 127C     		ldrb	r2, [r2, #16]
 412 0178 1A70     		strb	r2, [r3]
 116:C:/github/pongTest/ver1\keyboard_logic.c **** 	uint32 col = 0;
 413              		.loc 1 116 0
 414 017a 0023     		movs	r3, #0
 415 017c 7B60     		str	r3, [r7, #4]
 117:C:/github/pongTest/ver1\keyboard_logic.c **** 	// if (c & 0b001) != 0 -> col = 1
 118:C:/github/pongTest/ver1\keyboard_logic.c **** 	// if (c & 0b010) != 0 -> col = 2
 119:C:/github/pongTest/ver1\keyboard_logic.c **** 	if(c & 1) 
 416              		.loc 1 119 0
 417 017e FB1C     		adds	r3, r7, #3
 418 0180 1B78     		ldrb	r3, [r3]
 419 0182 0122     		movs	r2, #1
 420 0184 1340     		ands	r3, r2
 421 0186 01D0     		beq	.L34
 120:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 121:C:/github/pongTest/ver1\keyboard_logic.c **** 		col = 1;
 422              		.loc 1 121 0
 423 0188 0123     		movs	r3, #1
 424 018a 7B60     		str	r3, [r7, #4]
 425              	.L34:
 122:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 123:C:/github/pongTest/ver1\keyboard_logic.c **** 	if(c & 2) 
 426              		.loc 1 123 0
 427 018c FB1C     		adds	r3, r7, #3
 428 018e 1B78     		ldrb	r3, [r3]
 429 0190 0222     		movs	r2, #2
 430 0192 1340     		ands	r3, r2
 431 0194 01D0     		beq	.L35
 124:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 125:C:/github/pongTest/ver1\keyboard_logic.c **** 		col = 2;
 432              		.loc 1 125 0
 433 0196 0223     		movs	r3, #2
 434 0198 7B60     		str	r3, [r7, #4]
 435              	.L35:
 126:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 127:C:/github/pongTest/ver1\keyboard_logic.c **** 	if(c & 4) 
 436              		.loc 1 127 0
 437 019a FB1C     		adds	r3, r7, #3
 438 019c 1B78     		ldrb	r3, [r3]
 439 019e 0422     		movs	r2, #4
 440 01a0 1340     		ands	r3, r2
 441 01a2 01D0     		beq	.L36
 128:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 129:C:/github/pongTest/ver1\keyboard_logic.c **** 		col = 3;
 442              		.loc 1 129 0
 443 01a4 0323     		movs	r3, #3
 444 01a6 7B60     		str	r3, [r7, #4]
 445              	.L36:
 130:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 131:C:/github/pongTest/ver1\keyboard_logic.c **** 	if(c & 8) 
 446              		.loc 1 131 0
 447 01a8 FB1C     		adds	r3, r7, #3
 448 01aa 1B78     		ldrb	r3, [r3]
 449 01ac 0822     		movs	r2, #8
 450 01ae 1340     		ands	r3, r2
 451 01b0 01D0     		beq	.L37
 132:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 133:C:/github/pongTest/ver1\keyboard_logic.c **** 		col = 4;
 452              		.loc 1 133 0
 453 01b2 0423     		movs	r3, #4
 454 01b4 7B60     		str	r3, [r7, #4]
 455              	.L37:
 134:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 135:C:/github/pongTest/ver1\keyboard_logic.c **** 	// return the column
 136:C:/github/pongTest/ver1\keyboard_logic.c **** 	return col;
 456              		.loc 1 136 0
 457 01b6 7B68     		ldr	r3, [r7, #4]
 137:C:/github/pongTest/ver1\keyboard_logic.c **** }
 458              		.loc 1 137 0
 459 01b8 1800     		movs	r0, r3
 460 01ba BD46     		mov	sp, r7
 461 01bc 02B0     		add	sp, sp, #8
 462              		@ sp needed
 463 01be 80BD     		pop	{r7, pc}
 464              	.L40:
 465              		.align	2
 466              	.L39:
 467 01c0 000C0240 		.word	1073875968
 468              		.cfi_endproc
 469              	.LFE4:
 471              		.align	2
 472              		.global	kbd_get_col_high
 473              		.code	16
 474              		.thumb_func
 476              	kbd_get_col_high:
 477              	.LFB5:
 138:C:/github/pongTest/ver1\keyboard_logic.c **** 
 139:C:/github/pongTest/ver1\keyboard_logic.c **** // get the column that is pressed 
 140:C:/github/pongTest/ver1\keyboard_logic.c **** uint32 kbd_get_col_high(void)
 141:C:/github/pongTest/ver1\keyboard_logic.c **** {
 478              		.loc 1 141 0
 479              		.cfi_startproc
 480 01c4 80B5     		push	{r7, lr}
 481              		.cfi_def_cfa_offset 8
 482              		.cfi_offset 7, -8
 483              		.cfi_offset 14, -4
 484 01c6 82B0     		sub	sp, sp, #8
 485              		.cfi_def_cfa_offset 16
 486 01c8 00AF     		add	r7, sp, #0
 487              		.cfi_def_cfa_register 7
 142:C:/github/pongTest/ver1\keyboard_logic.c **** 	uint8 c;
 143:C:/github/pongTest/ver1\keyboard_logic.c **** 	c = GPIO_D->idrHigh; // read from inputs
 488              		.loc 1 143 0
 489 01ca 134A     		ldr	r2, .L47
 490 01cc FB1C     		adds	r3, r7, #3
 491 01ce 527C     		ldrb	r2, [r2, #17]
 492 01d0 1A70     		strb	r2, [r3]
 144:C:/github/pongTest/ver1\keyboard_logic.c **** 	uint32 col = 0;
 493              		.loc 1 144 0
 494 01d2 0023     		movs	r3, #0
 495 01d4 7B60     		str	r3, [r7, #4]
 145:C:/github/pongTest/ver1\keyboard_logic.c **** 	// if (c & 0b001) != 0 -> col = 1
 146:C:/github/pongTest/ver1\keyboard_logic.c **** 	// if (c & 0b010) != 0 -> col = 2
 147:C:/github/pongTest/ver1\keyboard_logic.c **** 	if(c & 1) 
 496              		.loc 1 147 0
 497 01d6 FB1C     		adds	r3, r7, #3
 498 01d8 1B78     		ldrb	r3, [r3]
 499 01da 0122     		movs	r2, #1
 500 01dc 1340     		ands	r3, r2
 501 01de 01D0     		beq	.L42
 148:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 149:C:/github/pongTest/ver1\keyboard_logic.c **** 		col = 1;
 502              		.loc 1 149 0
 503 01e0 0123     		movs	r3, #1
 504 01e2 7B60     		str	r3, [r7, #4]
 505              	.L42:
 150:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 151:C:/github/pongTest/ver1\keyboard_logic.c **** 	if(c & 2) 
 506              		.loc 1 151 0
 507 01e4 FB1C     		adds	r3, r7, #3
 508 01e6 1B78     		ldrb	r3, [r3]
 509 01e8 0222     		movs	r2, #2
 510 01ea 1340     		ands	r3, r2
 511 01ec 01D0     		beq	.L43
 152:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 153:C:/github/pongTest/ver1\keyboard_logic.c **** 		col = 2;
 512              		.loc 1 153 0
 513 01ee 0223     		movs	r3, #2
 514 01f0 7B60     		str	r3, [r7, #4]
 515              	.L43:
 154:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 155:C:/github/pongTest/ver1\keyboard_logic.c **** 	if(c & 4) 
 516              		.loc 1 155 0
 517 01f2 FB1C     		adds	r3, r7, #3
 518 01f4 1B78     		ldrb	r3, [r3]
 519 01f6 0422     		movs	r2, #4
 520 01f8 1340     		ands	r3, r2
 521 01fa 01D0     		beq	.L44
 156:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 157:C:/github/pongTest/ver1\keyboard_logic.c **** 		col = 3;
 522              		.loc 1 157 0
 523 01fc 0323     		movs	r3, #3
 524 01fe 7B60     		str	r3, [r7, #4]
 525              	.L44:
 158:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 159:C:/github/pongTest/ver1\keyboard_logic.c **** 	if(c & 8) 
 526              		.loc 1 159 0
 527 0200 FB1C     		adds	r3, r7, #3
 528 0202 1B78     		ldrb	r3, [r3]
 529 0204 0822     		movs	r2, #8
 530 0206 1340     		ands	r3, r2
 531 0208 01D0     		beq	.L45
 160:C:/github/pongTest/ver1\keyboard_logic.c **** 	{
 161:C:/github/pongTest/ver1\keyboard_logic.c **** 		col = 4;
 532              		.loc 1 161 0
 533 020a 0423     		movs	r3, #4
 534 020c 7B60     		str	r3, [r7, #4]
 535              	.L45:
 162:C:/github/pongTest/ver1\keyboard_logic.c **** 	}
 163:C:/github/pongTest/ver1\keyboard_logic.c **** 	// return the column
 164:C:/github/pongTest/ver1\keyboard_logic.c **** 	return col;
 536              		.loc 1 164 0
 537 020e 7B68     		ldr	r3, [r7, #4]
 165:C:/github/pongTest/ver1\keyboard_logic.c **** }...
 538              		.loc 1 165 0
 539 0210 1800     		movs	r0, r3
 540 0212 BD46     		mov	sp, r7
 541 0214 02B0     		add	sp, sp, #8
 542              		@ sp needed
 543 0216 80BD     		pop	{r7, pc}
 544              	.L48:
 545              		.align	2
 546              	.L47:
 547 0218 000C0240 		.word	1073875968
 548              		.cfi_endproc
 549              	.LFE5:
 551              	.Letext0:
 552              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 553              		.file 3 "C:/github/pongTest/ver1/config_gpio.h"
