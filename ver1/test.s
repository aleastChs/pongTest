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
  15              		.file	"game_logic.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.align	2
  20              		.global	update_ascii_display
  21              		.code	16
  22              		.thumb_func
  24              	update_ascii_display:
  25              	.LFB0:
  26              		.file 1 "C:/github/pongTest/ver1/game_logic.c"
   1:C:/github/pongTest/ver1\game_logic.c **** /*
   2:C:/github/pongTest/ver1\game_logic.c ****  * 
   3:C:/github/pongTest/ver1\game_logic.c ****  * GAME_LOGIC.C
   4:C:/github/pongTest/ver1\game_logic.c ****  * 
   5:C:/github/pongTest/ver1\game_logic.c ****  */ 
   6:C:/github/pongTest/ver1\game_logic.c **** 
   7:C:/github/pongTest/ver1\game_logic.c **** #include "standard_types.h"
   8:C:/github/pongTest/ver1\game_logic.c **** #include "keyboard_logic.h"
   9:C:/github/pongTest/ver1\game_logic.c **** #include "geometry.h"
  10:C:/github/pongTest/ver1\game_logic.c **** #include "game_logic.h"
  11:C:/github/pongTest/ver1\game_logic.c **** #include "delay.h"
  12:C:/github/pongTest/ver1\game_logic.c **** #include "ascii_logic.h"
  13:C:/github/pongTest/ver1\game_logic.c **** #include "player_logic.h"
  14:C:/github/pongTest/ver1\game_logic.c **** 
  15:C:/github/pongTest/ver1\game_logic.c **** /*
  16:C:/github/pongTest/ver1\game_logic.c ****  * GET THE POSITION OF THE PLAYER
  17:C:/github/pongTest/ver1\game_logic.c ****  * 
  18:C:/github/pongTest/ver1\game_logic.c ****  * IF isLeftWall == 0:			do nothing 
  19:C:/github/pongTest/ver1\game_logic.c ****  * ELSE IF isLeft == 1:			add the size of x to the position
  20:C:/github/pongTest/ver1\game_logic.c ****  * 
  21:C:/github/pongTest/ver1\game_logic.c ****  * RETURN THE POSITION IN X
  22:C:/github/pongTest/ver1\game_logic.c ****  */ 
  23:C:/github/pongTest/ver1\game_logic.c **** 
  24:C:/github/pongTest/ver1\game_logic.c **** void update_ascii_display(char textTop[], char textBottom[]) 
  25:C:/github/pongTest/ver1\game_logic.c **** {
  27              		.loc 1 25 0
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
  38 0008 3960     		str	r1, [r7]
  26:C:/github/pongTest/ver1\game_logic.c **** 	char *str;
  27:C:/github/pongTest/ver1\game_logic.c **** 	
  28:C:/github/pongTest/ver1\game_logic.c **** 	ascii_gotoxt(1,1);
  39              		.loc 1 28 0
  40 000a 0121     		movs	r1, #1
  41 000c 0120     		movs	r0, #1
  42 000e FFF7FEFF 		bl	ascii_gotoxt
  29:C:/github/pongTest/ver1\game_logic.c **** 	
  30:C:/github/pongTest/ver1\game_logic.c **** 	str = textTop;
  43              		.loc 1 30 0
  44 0012 7B68     		ldr	r3, [r7, #4]
  45 0014 FB60     		str	r3, [r7, #12]
  31:C:/github/pongTest/ver1\game_logic.c **** 	
  32:C:/github/pongTest/ver1\game_logic.c **** 	while(*str) {
  46              		.loc 1 32 0
  47 0016 06E0     		b	.L2
  48              	.L3:
  33:C:/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  49              		.loc 1 33 0
  50 0018 FB68     		ldr	r3, [r7, #12]
  51 001a 5A1C     		adds	r2, r3, #1
  52 001c FA60     		str	r2, [r7, #12]
  53 001e 1B78     		ldrb	r3, [r3]
  54 0020 1800     		movs	r0, r3
  55 0022 FFF7FEFF 		bl	ascii_write_char
  56              	.L2:
  32:C:/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  57              		.loc 1 32 0
  58 0026 FB68     		ldr	r3, [r7, #12]
  59 0028 1B78     		ldrb	r3, [r3]
  60 002a 002B     		cmp	r3, #0
  61 002c F4D1     		bne	.L3
  34:C:/github/pongTest/ver1\game_logic.c **** 	}
  35:C:/github/pongTest/ver1\game_logic.c **** 	ascii_gotoxt(1,2);
  62              		.loc 1 35 0
  63 002e 0221     		movs	r1, #2
  64 0030 0120     		movs	r0, #1
  65 0032 FFF7FEFF 		bl	ascii_gotoxt
  36:C:/github/pongTest/ver1\game_logic.c **** 	str = textBottom;
  66              		.loc 1 36 0
  67 0036 3B68     		ldr	r3, [r7]
  68 0038 FB60     		str	r3, [r7, #12]
  37:C:/github/pongTest/ver1\game_logic.c **** 	
  38:C:/github/pongTest/ver1\game_logic.c **** 	while(*str) {
  69              		.loc 1 38 0
  70 003a 06E0     		b	.L4
  71              	.L5:
  39:C:/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  72              		.loc 1 39 0
  73 003c FB68     		ldr	r3, [r7, #12]
  74 003e 5A1C     		adds	r2, r3, #1
  75 0040 FA60     		str	r2, [r7, #12]
  76 0042 1B78     		ldrb	r3, [r3]
  77 0044 1800     		movs	r0, r3
  78 0046 FFF7FEFF 		bl	ascii_write_char
  79              	.L4:
  38:C:/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  80              		.loc 1 38 0
  81 004a FB68     		ldr	r3, [r7, #12]
  82 004c 1B78     		ldrb	r3, [r3]
  83 004e 002B     		cmp	r3, #0
  84 0050 F4D1     		bne	.L5
  40:C:/github/pongTest/ver1\game_logic.c **** 	}
  41:C:/github/pongTest/ver1\game_logic.c **** }
  85              		.loc 1 41 0
  86 0052 C046     		nop
  87 0054 BD46     		mov	sp, r7
  88 0056 04B0     		add	sp, sp, #16
  89              		@ sp needed
  90 0058 80BD     		pop	{r7, pc}
  91              		.cfi_endproc
  92              	.LFE0:
  94 005a C046     		.align	2
  95              		.global	get_wall_player
  96              		.code	16
  97              		.thumb_func
  99              	get_wall_player:
 100              	.LFB1:
  42:C:/github/pongTest/ver1\game_logic.c **** 
  43:C:/github/pongTest/ver1\game_logic.c **** uint8 get_wall_player(P_OBJECT player, uint8 isLeftWall) {
 101              		.loc 1 43 0
 102              		.cfi_startproc
 103 005c 80B5     		push	{r7, lr}
 104              		.cfi_def_cfa_offset 8
 105              		.cfi_offset 7, -8
 106              		.cfi_offset 14, -4
 107 005e 84B0     		sub	sp, sp, #16
 108              		.cfi_def_cfa_offset 24
 109 0060 00AF     		add	r7, sp, #0
 110              		.cfi_def_cfa_register 7
 111 0062 7860     		str	r0, [r7, #4]
 112 0064 0A00     		movs	r2, r1
 113 0066 FB1C     		adds	r3, r7, #3
 114 0068 1A70     		strb	r2, [r3]
  44:C:/github/pongTest/ver1\game_logic.c **** 	uint32 x;
  45:C:/github/pongTest/ver1\game_logic.c **** 	
  46:C:/github/pongTest/ver1\game_logic.c **** 	x = player->posx;
 115              		.loc 1 46 0
 116 006a 7B68     		ldr	r3, [r7, #4]
 117 006c DB68     		ldr	r3, [r3, #12]
 118 006e FB60     		str	r3, [r7, #12]
  47:C:/github/pongTest/ver1\game_logic.c **** 	
  48:C:/github/pongTest/ver1\game_logic.c **** 	if(isLeftWall != 0) {
 119              		.loc 1 48 0
 120 0070 FB1C     		adds	r3, r7, #3
 121 0072 1B78     		ldrb	r3, [r3]
 122 0074 002B     		cmp	r3, #0
 123 0076 05D0     		beq	.L7
  49:C:/github/pongTest/ver1\game_logic.c **** 		// if isLeftWall non-zero add size of player
  50:C:/github/pongTest/ver1\game_logic.c **** 		x += player->geo->sizex;
 124              		.loc 1 50 0
 125 0078 7B68     		ldr	r3, [r7, #4]
 126 007a 1B68     		ldr	r3, [r3]
 127 007c 5B68     		ldr	r3, [r3, #4]
 128 007e FA68     		ldr	r2, [r7, #12]
 129 0080 D318     		adds	r3, r2, r3
 130 0082 FB60     		str	r3, [r7, #12]
 131              	.L7:
  51:C:/github/pongTest/ver1\game_logic.c **** 	}
  52:C:/github/pongTest/ver1\game_logic.c **** 	return x;
 132              		.loc 1 52 0
 133 0084 FB68     		ldr	r3, [r7, #12]
 134 0086 DBB2     		uxtb	r3, r3
  53:C:/github/pongTest/ver1\game_logic.c **** }
 135              		.loc 1 53 0
 136 0088 1800     		movs	r0, r3
 137 008a BD46     		mov	sp, r7
 138 008c 04B0     		add	sp, sp, #16
 139              		@ sp needed
 140 008e 80BD     		pop	{r7, pc}
 141              		.cfi_endproc
 142              	.LFE1:
 144              		.align	2
 145              		.global	inside_y_wise
 146              		.code	16
 147              		.thumb_func
 149              	inside_y_wise:
 150              	.LFB2:
  54:C:/github/pongTest/ver1\game_logic.c **** 
  55:C:/github/pongTest/ver1\game_logic.c **** /*
  56:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF OBJECT1 IS INSIDE OBEJCT2 Y - WISE
  57:C:/github/pongTest/ver1\game_logic.c ****  * 
  58:C:/github/pongTest/ver1\game_logic.c ****  * IF SO:		RETURN 1
  59:C:/github/pongTest/ver1\game_logic.c ****  * ELSE:		RETURN 0
  60:C:/github/pongTest/ver1\game_logic.c ****  * 
  61:C:/github/pongTest/ver1\game_logic.c ****  */ 
  62:C:/github/pongTest/ver1\game_logic.c **** uint8 inside_y_wise(P_OBJECT object1, P_OBJECT object2) {
 151              		.loc 1 62 0
 152              		.cfi_startproc
 153 0090 80B5     		push	{r7, lr}
 154              		.cfi_def_cfa_offset 8
 155              		.cfi_offset 7, -8
 156              		.cfi_offset 14, -4
 157 0092 84B0     		sub	sp, sp, #16
 158              		.cfi_def_cfa_offset 24
 159 0094 00AF     		add	r7, sp, #0
 160              		.cfi_def_cfa_register 7
 161 0096 7860     		str	r0, [r7, #4]
 162 0098 3960     		str	r1, [r7]
  63:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj1_top_coord = object1->posy;
 163              		.loc 1 63 0
 164 009a 7B68     		ldr	r3, [r7, #4]
 165 009c 1A69     		ldr	r2, [r3, #16]
 166 009e 0E23     		movs	r3, #14
 167 00a0 FB18     		adds	r3, r7, r3
 168 00a2 1A70     		strb	r2, [r3]
  64:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 169              		.loc 1 64 0
 170 00a4 FFF7FEFF 		bl	delay_250ns
  65:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_top_coord = object2->posy;
 171              		.loc 1 65 0
 172 00a8 3B68     		ldr	r3, [r7]
 173 00aa 1A69     		ldr	r2, [r3, #16]
 174 00ac 0D23     		movs	r3, #13
 175 00ae FB18     		adds	r3, r7, r3
 176 00b0 1A70     		strb	r2, [r3]
  66:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_bottom_coord = obj2_top_coord + object2->geo->sizey;
 177              		.loc 1 66 0
 178 00b2 3B68     		ldr	r3, [r7]
 179 00b4 1B68     		ldr	r3, [r3]
 180 00b6 9B68     		ldr	r3, [r3, #8]
 181 00b8 D9B2     		uxtb	r1, r3
 182 00ba 0C23     		movs	r3, #12
 183 00bc FB18     		adds	r3, r7, r3
 184 00be 0D22     		movs	r2, #13
 185 00c0 BA18     		adds	r2, r7, r2
 186 00c2 1278     		ldrb	r2, [r2]
 187 00c4 8A18     		adds	r2, r1, r2
 188 00c6 1A70     		strb	r2, [r3]
  67:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 189              		.loc 1 67 0
 190 00c8 FFF7FEFF 		bl	delay_250ns
  68:C:/github/pongTest/ver1\game_logic.c **** 	uint8 value = 0;
 191              		.loc 1 68 0
 192 00cc 0F23     		movs	r3, #15
 193 00ce FB18     		adds	r3, r7, r3
 194 00d0 0022     		movs	r2, #0
 195 00d2 1A70     		strb	r2, [r3]
  69:C:/github/pongTest/ver1\game_logic.c **** 	if (obj1_top_coord >= obj2_top_coord && obj1_top_coord <= obj2_bottom_coord) {
 196              		.loc 1 69 0
 197 00d4 0E23     		movs	r3, #14
 198 00d6 FA18     		adds	r2, r7, r3
 199 00d8 0D23     		movs	r3, #13
 200 00da FB18     		adds	r3, r7, r3
 201 00dc 1278     		ldrb	r2, [r2]
 202 00de 1B78     		ldrb	r3, [r3]
 203 00e0 9A42     		cmp	r2, r3
 204 00e2 0BD3     		bcc	.L10
 205              		.loc 1 69 0 is_stmt 0 discriminator 1
 206 00e4 0E23     		movs	r3, #14
 207 00e6 FA18     		adds	r2, r7, r3
 208 00e8 0C23     		movs	r3, #12
 209 00ea FB18     		adds	r3, r7, r3
 210 00ec 1278     		ldrb	r2, [r2]
 211 00ee 1B78     		ldrb	r3, [r3]
 212 00f0 9A42     		cmp	r2, r3
 213 00f2 03D8     		bhi	.L10
  70:C:/github/pongTest/ver1\game_logic.c **** 		value = 1;
 214              		.loc 1 70 0 is_stmt 1
 215 00f4 0F23     		movs	r3, #15
 216 00f6 FB18     		adds	r3, r7, r3
 217 00f8 0122     		movs	r2, #1
 218 00fa 1A70     		strb	r2, [r3]
 219              	.L10:
  71:C:/github/pongTest/ver1\game_logic.c **** 	}
  72:C:/github/pongTest/ver1\game_logic.c **** 	
  73:C:/github/pongTest/ver1\game_logic.c **** 	return value;
 220              		.loc 1 73 0
 221 00fc 0F23     		movs	r3, #15
 222 00fe FB18     		adds	r3, r7, r3
 223 0100 1B78     		ldrb	r3, [r3]
  74:C:/github/pongTest/ver1\game_logic.c **** }
 224              		.loc 1 74 0
 225 0102 1800     		movs	r0, r3
 226 0104 BD46     		mov	sp, r7
 227 0106 04B0     		add	sp, sp, #16
 228              		@ sp needed
 229 0108 80BD     		pop	{r7, pc}
 230              		.cfi_endproc
 231              	.LFE2:
 233 010a C046     		.align	2
 234              		.global	check_ball
 235              		.code	16
 236              		.thumb_func
 238              	check_ball:
 239              	.LFB3:
  75:C:/github/pongTest/ver1\game_logic.c **** 
  76:C:/github/pongTest/ver1\game_logic.c **** /*
  77:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES PLAYER_LEFT / PLAYER_RIGHT 
  78:C:/github/pongTest/ver1\game_logic.c ****  * 
  79:C:/github/pongTest/ver1\game_logic.c ****  * IF SO:		change direction of the ball in X
  80:C:/github/pongTest/ver1\game_logic.c ****  * ELSE:		do nothing
  81:C:/github/pongTest/ver1\game_logic.c ****  * 
  82:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES THE WALL TO THE LEFT / RIGHT  
  83:C:/github/pongTest/ver1\game_logic.c ****  */ 
  84:C:/github/pongTest/ver1\game_logic.c **** void check_ball(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball)
  85:C:/github/pongTest/ver1\game_logic.c **** {
 240              		.loc 1 85 0
 241              		.cfi_startproc
 242 010c 90B5     		push	{r4, r7, lr}
 243              		.cfi_def_cfa_offset 12
 244              		.cfi_offset 4, -12
 245              		.cfi_offset 7, -8
 246              		.cfi_offset 14, -4
 247 010e 87B0     		sub	sp, sp, #28
 248              		.cfi_def_cfa_offset 40
 249 0110 00AF     		add	r7, sp, #0
 250              		.cfi_def_cfa_register 7
 251 0112 F860     		str	r0, [r7, #12]
 252 0114 B960     		str	r1, [r7, #8]
 253 0116 7A60     		str	r2, [r7, #4]
  86:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_left = get_wall_player(playerLeft, 1);
 254              		.loc 1 86 0
 255 0118 1723     		movs	r3, #23
 256 011a FC18     		adds	r4, r7, r3
 257 011c FB68     		ldr	r3, [r7, #12]
 258 011e 0121     		movs	r1, #1
 259 0120 1800     		movs	r0, r3
 260 0122 FFF7FEFF 		bl	get_wall_player
 261 0126 0300     		movs	r3, r0
 262 0128 2370     		strb	r3, [r4]
  87:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 263              		.loc 1 87 0
 264 012a FFF7FEFF 		bl	delay_250ns
  88:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_right = get_wall_player(playerRight, 0);
 265              		.loc 1 88 0
 266 012e 1623     		movs	r3, #22
 267 0130 FC18     		adds	r4, r7, r3
 268 0132 BB68     		ldr	r3, [r7, #8]
 269 0134 0021     		movs	r1, #0
 270 0136 1800     		movs	r0, r3
 271 0138 FFF7FEFF 		bl	get_wall_player
 272 013c 0300     		movs	r3, r0
 273 013e 2370     		strb	r3, [r4]
  89:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 274              		.loc 1 89 0
 275 0140 FFF7FEFF 		bl	delay_250ns
  90:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_right_side_coord = (ball->posx + ball->geo->sizex);
 276              		.loc 1 90 0
 277 0144 7B68     		ldr	r3, [r7, #4]
 278 0146 DB68     		ldr	r3, [r3, #12]
 279 0148 D9B2     		uxtb	r1, r3
 280 014a 7B68     		ldr	r3, [r7, #4]
 281 014c 1B68     		ldr	r3, [r3]
 282 014e 5B68     		ldr	r3, [r3, #4]
 283 0150 DAB2     		uxtb	r2, r3
 284 0152 1523     		movs	r3, #21
 285 0154 FB18     		adds	r3, r7, r3
 286 0156 8A18     		adds	r2, r1, r2
 287 0158 1A70     		strb	r2, [r3]
  91:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_left_side_coord = ball->posx;
 288              		.loc 1 91 0
 289 015a 7B68     		ldr	r3, [r7, #4]
 290 015c DA68     		ldr	r2, [r3, #12]
 291 015e 1423     		movs	r3, #20
 292 0160 FB18     		adds	r3, r7, r3
 293 0162 1A70     		strb	r2, [r3]
  92:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 294              		.loc 1 92 0
 295 0164 FFF7FEFF 		bl	delay_250ns
  93:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_top_coord = ball->posy;
 296              		.loc 1 93 0
 297 0168 7B68     		ldr	r3, [r7, #4]
 298 016a 1A69     		ldr	r2, [r3, #16]
 299 016c 1323     		movs	r3, #19
 300 016e FB18     		adds	r3, r7, r3
 301 0170 1A70     		strb	r2, [r3]
  94:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_bottom_coord = ball->posy + ball->geo->sizey;
 302              		.loc 1 94 0
 303 0172 7B68     		ldr	r3, [r7, #4]
 304 0174 1B69     		ldr	r3, [r3, #16]
 305 0176 D9B2     		uxtb	r1, r3
 306 0178 7B68     		ldr	r3, [r7, #4]
 307 017a 1B68     		ldr	r3, [r3]
 308 017c 9B68     		ldr	r3, [r3, #8]
 309 017e DAB2     		uxtb	r2, r3
 310 0180 1223     		movs	r3, #18
 311 0182 FB18     		adds	r3, r7, r3
 312 0184 8A18     		adds	r2, r1, r2
 313 0186 1A70     		strb	r2, [r3]
  95:C:/github/pongTest/ver1\game_logic.c **** 	
  96:C:/github/pongTest/ver1\game_logic.c **** // CHECK IF GOAL!!!
  97:C:/github/pongTest/ver1\game_logic.c **** 	
  98:C:/github/pongTest/ver1\game_logic.c **** 	if ( ball_right_side_coord >= 126) {
  99:C:/github/pongTest/ver1\game_logic.c **** 		// player left gets a point
 100:C:/github/pongTest/ver1\game_logic.c **** 		// update ascii-display	
 101:C:/github/pongTest/ver1\game_logic.c **** 		
 102:C:/github/pongTest/ver1\game_logic.c **** 		// start a new ball
 103:C:/github/pongTest/ver1\game_logic.c **** 		
 104:C:/github/pongTest/ver1\game_logic.c **** 		
 105:C:/github/pongTest/ver1\game_logic.c **** 	} else if (ball_left_side_coord <= 3) {
 106:C:/github/pongTest/ver1\game_logic.c **** 		
 107:C:/github/pongTest/ver1\game_logic.c **** 		// player right gets a point
 108:C:/github/pongTest/ver1\game_logic.c **** 		// update ascii-display
 109:C:/github/pongTest/ver1\game_logic.c **** 		
 110:C:/github/pongTest/ver1\game_logic.c **** 		// start a new ball
 111:C:/github/pongTest/ver1\game_logic.c **** 		
 112:C:/github/pongTest/ver1\game_logic.c **** 	} 
 113:C:/github/pongTest/ver1\game_logic.c **** 	
 114:C:/github/pongTest/ver1\game_logic.c **** // END CHECK GOAL
 115:C:/github/pongTest/ver1\game_logic.c **** 
 116:C:/github/pongTest/ver1\game_logic.c **** 
 117:C:/github/pongTest/ver1\game_logic.c **** // CHECK WALLS PLAYERS
 118:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 314              		.loc 1 118 0
 315 0188 FFF7FEFF 		bl	delay_250ns
 119:C:/github/pongTest/ver1\game_logic.c **** 	if (   ( ball_right_side_coord + 1)  == wall_player_right  ) 
 316              		.loc 1 119 0
 317 018c 1523     		movs	r3, #21
 318 018e FB18     		adds	r3, r7, r3
 319 0190 1B78     		ldrb	r3, [r3]
 320 0192 5A1C     		adds	r2, r3, #1
 321 0194 1623     		movs	r3, #22
 322 0196 FB18     		adds	r3, r7, r3
 323 0198 1B78     		ldrb	r3, [r3]
 324 019a 9A42     		cmp	r2, r3
 325 019c 19D1     		bne	.L13
 120:C:/github/pongTest/ver1\game_logic.c **** 	{ // playerRight
 121:C:/github/pongTest/ver1\game_logic.c **** 	
 122:C:/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerRight)) 
 326              		.loc 1 122 0
 327 019e BA68     		ldr	r2, [r7, #8]
 328 01a0 7B68     		ldr	r3, [r7, #4]
 329 01a2 1100     		movs	r1, r2
 330 01a4 1800     		movs	r0, r3
 331 01a6 FFF7FEFF 		bl	inside_y_wise
 332 01aa 031E     		subs	r3, r0, #0
 333 01ac 30D0     		beq	.L15
 123:C:/github/pongTest/ver1\game_logic.c **** 		{
 124:C:/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 334              		.loc 1 124 0
 335 01ae 7B68     		ldr	r3, [r7, #4]
 336 01b0 5B68     		ldr	r3, [r3, #4]
 337 01b2 5A42     		rsbs	r2, r3, #0
 338 01b4 7B68     		ldr	r3, [r7, #4]
 339 01b6 5A60     		str	r2, [r3, #4]
 125:C:/github/pongTest/ver1\game_logic.c **** 			delay_250ns();
 340              		.loc 1 125 0
 341 01b8 FFF7FEFF 		bl	delay_250ns
 126:C:/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_right - ball->geo->sizex - 1;
 342              		.loc 1 126 0
 343 01bc 1623     		movs	r3, #22
 344 01be FB18     		adds	r3, r7, r3
 345 01c0 1A78     		ldrb	r2, [r3]
 346 01c2 7B68     		ldr	r3, [r7, #4]
 347 01c4 1B68     		ldr	r3, [r3]
 348 01c6 5B68     		ldr	r3, [r3, #4]
 349 01c8 D31A     		subs	r3, r2, r3
 350 01ca 5A1E     		subs	r2, r3, #1
 351 01cc 7B68     		ldr	r3, [r7, #4]
 352 01ce DA60     		str	r2, [r3, #12]
 353 01d0 1EE0     		b	.L15
 354              	.L13:
 127:C:/github/pongTest/ver1\game_logic.c **** 		}
 128:C:/github/pongTest/ver1\game_logic.c **** 		
 129:C:/github/pongTest/ver1\game_logic.c **** 	} 
 130:C:/github/pongTest/ver1\game_logic.c **** 	else if (    (ball_left_side_coord - 1) == wall_player_left ) 
 355              		.loc 1 130 0
 356 01d2 1423     		movs	r3, #20
 357 01d4 FB18     		adds	r3, r7, r3
 358 01d6 1B78     		ldrb	r3, [r3]
 359 01d8 5A1E     		subs	r2, r3, #1
 360 01da 1723     		movs	r3, #23
 361 01dc FB18     		adds	r3, r7, r3
 362 01de 1B78     		ldrb	r3, [r3]
 363 01e0 9A42     		cmp	r2, r3
 364 01e2 15D1     		bne	.L15
 131:C:/github/pongTest/ver1\game_logic.c **** 	{ // playerLeft
 132:C:/github/pongTest/ver1\game_logic.c **** 		
 133:C:/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerLeft)) 
 365              		.loc 1 133 0
 366 01e4 FA68     		ldr	r2, [r7, #12]
 367 01e6 7B68     		ldr	r3, [r7, #4]
 368 01e8 1100     		movs	r1, r2
 369 01ea 1800     		movs	r0, r3
 370 01ec FFF7FEFF 		bl	inside_y_wise
 371 01f0 031E     		subs	r3, r0, #0
 372 01f2 0DD0     		beq	.L15
 134:C:/github/pongTest/ver1\game_logic.c **** 		{
 135:C:/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 373              		.loc 1 135 0
 374 01f4 7B68     		ldr	r3, [r7, #4]
 375 01f6 5B68     		ldr	r3, [r3, #4]
 376 01f8 5A42     		rsbs	r2, r3, #0
 377 01fa 7B68     		ldr	r3, [r7, #4]
 378 01fc 5A60     		str	r2, [r3, #4]
 136:C:/github/pongTest/ver1\game_logic.c **** 			delay_250ns();
 379              		.loc 1 136 0
 380 01fe FFF7FEFF 		bl	delay_250ns
 137:C:/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_left + 1;
 381              		.loc 1 137 0
 382 0202 1723     		movs	r3, #23
 383 0204 FB18     		adds	r3, r7, r3
 384 0206 1B78     		ldrb	r3, [r3]
 385 0208 0133     		adds	r3, r3, #1
 386 020a 1A00     		movs	r2, r3
 387 020c 7B68     		ldr	r3, [r7, #4]
 388 020e DA60     		str	r2, [r3, #12]
 389              	.L15:
 138:C:/github/pongTest/ver1\game_logic.c **** 		}
 139:C:/github/pongTest/ver1\game_logic.c **** 		
 140:C:/github/pongTest/ver1\game_logic.c **** 	}
 141:C:/github/pongTest/ver1\game_logic.c **** // END CHECK WALLS PLAYERS
 142:C:/github/pongTest/ver1\game_logic.c **** 	
 143:C:/github/pongTest/ver1\game_logic.c **** 	
 144:C:/github/pongTest/ver1\game_logic.c **** // CHECK FLOOR / BOTTOM
 145:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 390              		.loc 1 145 0
 391 0210 FFF7FEFF 		bl	delay_250ns
 146:C:/github/pongTest/ver1\game_logic.c **** 	if (ball_top_coord <= 2) 
 392              		.loc 1 146 0
 393 0214 1323     		movs	r3, #19
 394 0216 FB18     		adds	r3, r7, r3
 395 0218 1B78     		ldrb	r3, [r3]
 396 021a 022B     		cmp	r3, #2
 397 021c 05D8     		bhi	.L16
 147:C:/github/pongTest/ver1\game_logic.c **** 	{
 148:C:/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 398              		.loc 1 148 0
 399 021e 7B68     		ldr	r3, [r7, #4]
 400 0220 9B68     		ldr	r3, [r3, #8]
 401 0222 5A42     		rsbs	r2, r3, #0
 402 0224 7B68     		ldr	r3, [r7, #4]
 403 0226 9A60     		str	r2, [r3, #8]
 149:C:/github/pongTest/ver1\game_logic.c **** 	} 
 150:C:/github/pongTest/ver1\game_logic.c **** 	else if( ball_bottom_coord >= 62) 
 151:C:/github/pongTest/ver1\game_logic.c **** 	{
 152:C:/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 153:C:/github/pongTest/ver1\game_logic.c **** 	}
 154:C:/github/pongTest/ver1\game_logic.c **** // END CHECK FLOOR / BOTTOM	
 155:C:/github/pongTest/ver1\game_logic.c **** 	
 156:C:/github/pongTest/ver1\game_logic.c **** 
 157:C:/github/pongTest/ver1\game_logic.c **** }
 404              		.loc 1 157 0
 405 0228 09E0     		b	.L18
 406              	.L16:
 150:C:/github/pongTest/ver1\game_logic.c **** 	{
 407              		.loc 1 150 0
 408 022a 1223     		movs	r3, #18
 409 022c FB18     		adds	r3, r7, r3
 410 022e 1B78     		ldrb	r3, [r3]
 411 0230 3D2B     		cmp	r3, #61
 412 0232 04D9     		bls	.L18
 152:C:/github/pongTest/ver1\game_logic.c **** 	}
 413              		.loc 1 152 0
 414 0234 7B68     		ldr	r3, [r7, #4]
 415 0236 9B68     		ldr	r3, [r3, #8]
 416 0238 5A42     		rsbs	r2, r3, #0
 417 023a 7B68     		ldr	r3, [r7, #4]
 418 023c 9A60     		str	r2, [r3, #8]
 419              	.L18:
 420              		.loc 1 157 0
 421 023e C046     		nop
 422 0240 BD46     		mov	sp, r7
 423 0242 07B0     		add	sp, sp, #28
 424              		@ sp needed
 425 0244 90BD     		pop	{r4, r7, pc}
 426              		.cfi_endproc
 427              	.LFE3:
 429 0246 C046     		.align	2
 430              		.global	update_player_pos
 431              		.code	16
 432              		.thumb_func
 434              	update_player_pos:
 435              	.LFB4:
 158:C:/github/pongTest/ver1\game_logic.c **** // read keyboard right
 159:C:/github/pongTest/ver1\game_logic.c **** 	// if:		2_IS_PRESSED 
 160:C:/github/pongTest/ver1\game_logic.c **** 	//					playerXX->set_speed(0,1);
 161:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 162:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 163:C:/github/pongTest/ver1\game_logic.c **** 	// else if:	 8_IS_PRESSED 
 164:C:/github/pongTest/ver1\game_logic.c **** 	//					plauerXX->set_speed(0,-1);
 165:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 166:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 167:C:/github/pongTest/ver1\game_logic.c **** 
 168:C:/github/pongTest/ver1\game_logic.c **** void update_player_pos(P_PLAYER playerLeft, P_PLAYER playerRight) 
 169:C:/github/pongTest/ver1\game_logic.c **** {	
 436              		.loc 1 169 0
 437              		.cfi_startproc
 438 0248 90B5     		push	{r4, r7, lr}
 439              		.cfi_def_cfa_offset 12
 440              		.cfi_offset 4, -12
 441              		.cfi_offset 7, -8
 442              		.cfi_offset 14, -4
 443 024a 85B0     		sub	sp, sp, #20
 444              		.cfi_def_cfa_offset 32
 445 024c 00AF     		add	r7, sp, #0
 446              		.cfi_def_cfa_register 7
 447 024e 7860     		str	r0, [r7, #4]
 448 0250 3960     		str	r1, [r7]
 170:C:/github/pongTest/ver1\game_logic.c **** 	
 171:C:/github/pongTest/ver1\game_logic.c **** // Player to The LEFT
 172:C:/github/pongTest/ver1\game_logic.c **** 	playerLeft->key_pressed = get_key(1);
 449              		.loc 1 172 0
 450 0252 0120     		movs	r0, #1
 451 0254 FFF7FEFF 		bl	get_key
 452 0258 0300     		movs	r3, r0
 453 025a 1A00     		movs	r2, r3
 454 025c 7B68     		ldr	r3, [r7, #4]
 455 025e 5A71     		strb	r2, [r3, #5]
 173:C:/github/pongTest/ver1\game_logic.c **** 	
 174:C:/github/pongTest/ver1\game_logic.c **** 	volatile uint8 pressed = playerLeft->key_pressed;
 456              		.loc 1 174 0
 457 0260 7B68     		ldr	r3, [r7, #4]
 458 0262 5A79     		ldrb	r2, [r3, #5]
 459 0264 0F23     		movs	r3, #15
 460 0266 FB18     		adds	r3, r7, r3
 461 0268 1A70     		strb	r2, [r3]
 175:C:/github/pongTest/ver1\game_logic.c **** 	
 176:C:/github/pongTest/ver1\game_logic.c **** 	if ((pressed == 2) && (playerLeft->p_obj->posy >= 2)) 
 462              		.loc 1 176 0
 463 026a 0F23     		movs	r3, #15
 464 026c FB18     		adds	r3, r7, r3
 465 026e 1B78     		ldrb	r3, [r3]
 466 0270 DBB2     		uxtb	r3, r3
 467 0272 022B     		cmp	r3, #2
 468 0274 15D1     		bne	.L20
 469              		.loc 1 176 0 is_stmt 0 discriminator 1
 470 0276 7B68     		ldr	r3, [r7, #4]
 471 0278 1B68     		ldr	r3, [r3]
 472 027a 1B69     		ldr	r3, [r3, #16]
 473 027c 012B     		cmp	r3, #1
 474 027e 10D9     		bls	.L20
 177:C:/github/pongTest/ver1\game_logic.c **** 	{
 178:C:/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->set_speed(playerLeft->p_obj,0,1);
 475              		.loc 1 178 0 is_stmt 1
 476 0280 7B68     		ldr	r3, [r7, #4]
 477 0282 1B68     		ldr	r3, [r3]
 478 0284 1C6A     		ldr	r4, [r3, #32]
 479 0286 7B68     		ldr	r3, [r7, #4]
 480 0288 1B68     		ldr	r3, [r3]
 481 028a 0122     		movs	r2, #1
 482 028c 0021     		movs	r1, #0
 483 028e 1800     		movs	r0, r3
 484 0290 A047     		blx	r4
 179:C:/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->move(playerLeft->p_obj);
 485              		.loc 1 179 0
 486 0292 7B68     		ldr	r3, [r7, #4]
 487 0294 1B68     		ldr	r3, [r3]
 488 0296 DA69     		ldr	r2, [r3, #28]
 489 0298 7B68     		ldr	r3, [r7, #4]
 490 029a 1B68     		ldr	r3, [r3]
 491 029c 1800     		movs	r0, r3
 492 029e 9047     		blx	r2
 493 02a0 20E0     		b	.L21
 494              	.L20:
 180:C:/github/pongTest/ver1\game_logic.c **** 	} 
 181:C:/github/pongTest/ver1\game_logic.c **** 	else if(  (pressed == 8)    && (  (playerLeft->p_obj->posy + playerLeft->p_obj->geo->sizey)   <=  
 495              		.loc 1 181 0
 496 02a2 0F23     		movs	r3, #15
 497 02a4 FB18     		adds	r3, r7, r3
 498 02a6 1B78     		ldrb	r3, [r3]
 499 02a8 DBB2     		uxtb	r3, r3
 500 02aa 082B     		cmp	r3, #8
 501 02ac 1AD1     		bne	.L21
 502              		.loc 1 181 0 is_stmt 0 discriminator 1
 503 02ae 7B68     		ldr	r3, [r7, #4]
 504 02b0 1B68     		ldr	r3, [r3]
 505 02b2 1A69     		ldr	r2, [r3, #16]
 506 02b4 7B68     		ldr	r3, [r7, #4]
 507 02b6 1B68     		ldr	r3, [r3]
 508 02b8 1B68     		ldr	r3, [r3]
 509 02ba 9B68     		ldr	r3, [r3, #8]
 510 02bc D318     		adds	r3, r2, r3
 511 02be 402B     		cmp	r3, #64
 512 02c0 10D8     		bhi	.L21
 182:C:/github/pongTest/ver1\game_logic.c **** 	{
 183:C:/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->set_speed(playerLeft->p_obj,0,-1);
 513              		.loc 1 183 0 is_stmt 1
 514 02c2 7B68     		ldr	r3, [r7, #4]
 515 02c4 1B68     		ldr	r3, [r3]
 516 02c6 1C6A     		ldr	r4, [r3, #32]
 517 02c8 7B68     		ldr	r3, [r7, #4]
 518 02ca 1868     		ldr	r0, [r3]
 519 02cc 0123     		movs	r3, #1
 520 02ce 5B42     		rsbs	r3, r3, #0
 521 02d0 1A00     		movs	r2, r3
 522 02d2 0021     		movs	r1, #0
 523 02d4 A047     		blx	r4
 184:C:/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->move(playerLeft->p_obj);
 524              		.loc 1 184 0
 525 02d6 7B68     		ldr	r3, [r7, #4]
 526 02d8 1B68     		ldr	r3, [r3]
 527 02da DA69     		ldr	r2, [r3, #28]
 528 02dc 7B68     		ldr	r3, [r7, #4]
 529 02de 1B68     		ldr	r3, [r3]
 530 02e0 1800     		movs	r0, r3
 531 02e2 9047     		blx	r2
 532              	.L21:
 185:C:/github/pongTest/ver1\game_logic.c **** 	}
 186:C:/github/pongTest/ver1\game_logic.c **** 	
 187:C:/github/pongTest/ver1\game_logic.c **** 	
 188:C:/github/pongTest/ver1\game_logic.c **** // Player to The Right	
 189:C:/github/pongTest/ver1\game_logic.c **** 	playerRight->key_pressed = get_key(0);
 533              		.loc 1 189 0
 534 02e4 0020     		movs	r0, #0
 535 02e6 FFF7FEFF 		bl	get_key
 536 02ea 0300     		movs	r3, r0
 537 02ec 1A00     		movs	r2, r3
 538 02ee 3B68     		ldr	r3, [r7]
 539 02f0 5A71     		strb	r2, [r3, #5]
 190:C:/github/pongTest/ver1\game_logic.c **** 	pressed = playerRight->key_pressed;
 540              		.loc 1 190 0
 541 02f2 3B68     		ldr	r3, [r7]
 542 02f4 5A79     		ldrb	r2, [r3, #5]
 543 02f6 0F23     		movs	r3, #15
 544 02f8 FB18     		adds	r3, r7, r3
 545 02fa 1A70     		strb	r2, [r3]
 191:C:/github/pongTest/ver1\game_logic.c **** 	
 192:C:/github/pongTest/ver1\game_logic.c **** 	if ((pressed == 2) && (playerRight->p_obj->posy >= 2)) 
 546              		.loc 1 192 0
 547 02fc 0F23     		movs	r3, #15
 548 02fe FB18     		adds	r3, r7, r3
 549 0300 1B78     		ldrb	r3, [r3]
 550 0302 DBB2     		uxtb	r3, r3
 551 0304 022B     		cmp	r3, #2
 552 0306 15D1     		bne	.L22
 553              		.loc 1 192 0 is_stmt 0 discriminator 1
 554 0308 3B68     		ldr	r3, [r7]
 555 030a 1B68     		ldr	r3, [r3]
 556 030c 1B69     		ldr	r3, [r3, #16]
 557 030e 012B     		cmp	r3, #1
 558 0310 10D9     		bls	.L22
 193:C:/github/pongTest/ver1\game_logic.c **** 	{
 194:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->set_speed(playerRight->p_obj,0,1);
 559              		.loc 1 194 0 is_stmt 1
 560 0312 3B68     		ldr	r3, [r7]
 561 0314 1B68     		ldr	r3, [r3]
 562 0316 1C6A     		ldr	r4, [r3, #32]
 563 0318 3B68     		ldr	r3, [r7]
 564 031a 1B68     		ldr	r3, [r3]
 565 031c 0122     		movs	r2, #1
 566 031e 0021     		movs	r1, #0
 567 0320 1800     		movs	r0, r3
 568 0322 A047     		blx	r4
 195:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 569              		.loc 1 195 0
 570 0324 3B68     		ldr	r3, [r7]
 571 0326 1B68     		ldr	r3, [r3]
 572 0328 DA69     		ldr	r2, [r3, #28]
 573 032a 3B68     		ldr	r3, [r7]
 574 032c 1B68     		ldr	r3, [r3]
 575 032e 1800     		movs	r0, r3
 576 0330 9047     		blx	r2
 196:C:/github/pongTest/ver1\game_logic.c **** 	}
 197:C:/github/pongTest/ver1\game_logic.c **** 	else if ((pressed == 8)    && (  (playerRight->p_obj->posy + playerRight->p_obj->geo->sizey)   <= 
 198:C:/github/pongTest/ver1\game_logic.c **** 	{
 199:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->set_speed(playerRight->p_obj,0,-1);
 200:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 201:C:/github/pongTest/ver1\game_logic.c **** 	}
 202:C:/github/pongTest/ver1\game_logic.c **** }
 577              		.loc 1 202 0
 578 0332 20E0     		b	.L24
 579              	.L22:
 197:C:/github/pongTest/ver1\game_logic.c **** 	{
 580              		.loc 1 197 0
 581 0334 0F23     		movs	r3, #15
 582 0336 FB18     		adds	r3, r7, r3
 583 0338 1B78     		ldrb	r3, [r3]
 584 033a DBB2     		uxtb	r3, r3
 585 033c 082B     		cmp	r3, #8
 586 033e 1AD1     		bne	.L24
 197:C:/github/pongTest/ver1\game_logic.c **** 	{
 587              		.loc 1 197 0 is_stmt 0 discriminator 1
 588 0340 3B68     		ldr	r3, [r7]
 589 0342 1B68     		ldr	r3, [r3]
 590 0344 1A69     		ldr	r2, [r3, #16]
 591 0346 3B68     		ldr	r3, [r7]
 592 0348 1B68     		ldr	r3, [r3]
 593 034a 1B68     		ldr	r3, [r3]
 594 034c 9B68     		ldr	r3, [r3, #8]
 595 034e D318     		adds	r3, r2, r3
 596 0350 402B     		cmp	r3, #64
 597 0352 10D8     		bhi	.L24
 199:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 598              		.loc 1 199 0 is_stmt 1
 599 0354 3B68     		ldr	r3, [r7]
 600 0356 1B68     		ldr	r3, [r3]
 601 0358 1C6A     		ldr	r4, [r3, #32]
 602 035a 3B68     		ldr	r3, [r7]
 603 035c 1868     		ldr	r0, [r3]
 604 035e 0123     		movs	r3, #1
 605 0360 5B42     		rsbs	r3, r3, #0
 606 0362 1A00     		movs	r2, r3
 607 0364 0021     		movs	r1, #0
 608 0366 A047     		blx	r4
 200:C:/github/pongTest/ver1\game_logic.c **** 	}
 609              		.loc 1 200 0
 610 0368 3B68     		ldr	r3, [r7]
 611 036a 1B68     		ldr	r3, [r3]
 612 036c DA69     		ldr	r2, [r3, #28]
 613 036e 3B68     		ldr	r3, [r7]
 614 0370 1B68     		ldr	r3, [r3]
 615 0372 1800     		movs	r0, r3
 616 0374 9047     		blx	r2
 617              	.L24:
 618              		.loc 1 202 0
 619 0376 C046     		nop
 620 0378 BD46     		mov	sp, r7
 621 037a 05B0     		add	sp, sp, #20
 622              		@ sp needed
 623 037c 90BD     		pop	{r4, r7, pc}
 624              		.cfi_endproc
 625              	.LFE4:
 627 037e C046     		.align	2
 628              		.global	start_new_ball
 629              		.code	16
 630              		.thumb_func
 632              	start_new_ball:
 633              	.LFB5:
 203:C:/github/pongTest/ver1\game_logic.c **** 
 204:C:/github/pongTest/ver1\game_logic.c **** 
 205:C:/github/pongTest/ver1\game_logic.c **** // Pass the ball 
 206:C:/github/pongTest/ver1\game_logic.c **** // And if toTheRight is 
 207:C:/github/pongTest/ver1\game_logic.c **** //						0:		start the ball to the left direction			
 208:C:/github/pongTest/ver1\game_logic.c **** //						1:		start the ball to the right direction
 209:C:/github/pongTest/ver1\game_logic.c **** void start_new_ball(P_OBJECT b, uint8 toTheRight)
 210:C:/github/pongTest/ver1\game_logic.c **** {
 634              		.loc 1 210 0
 635              		.cfi_startproc
 636 0380 90B5     		push	{r4, r7, lr}
 637              		.cfi_def_cfa_offset 12
 638              		.cfi_offset 4, -12
 639              		.cfi_offset 7, -8
 640              		.cfi_offset 14, -4
 641 0382 83B0     		sub	sp, sp, #12
 642              		.cfi_def_cfa_offset 24
 643 0384 00AF     		add	r7, sp, #0
 644              		.cfi_def_cfa_register 7
 645 0386 7860     		str	r0, [r7, #4]
 646 0388 0A00     		movs	r2, r1
 647 038a FB1C     		adds	r3, r7, #3
 648 038c 1A70     		strb	r2, [r3]
 211:C:/github/pongTest/ver1\game_logic.c **** 	b->posx = 64;
 649              		.loc 1 211 0
 650 038e 7B68     		ldr	r3, [r7, #4]
 651 0390 4022     		movs	r2, #64
 652 0392 DA60     		str	r2, [r3, #12]
 212:C:/github/pongTest/ver1\game_logic.c **** 	b->posy = 20;
 653              		.loc 1 212 0
 654 0394 7B68     		ldr	r3, [r7, #4]
 655 0396 1422     		movs	r2, #20
 656 0398 1A61     		str	r2, [r3, #16]
 213:C:/github/pongTest/ver1\game_logic.c **** 	
 214:C:/github/pongTest/ver1\game_logic.c **** 	b->set_speed(b,-1,b->diry);
 657              		.loc 1 214 0
 658 039a 7B68     		ldr	r3, [r7, #4]
 659 039c 1C6A     		ldr	r4, [r3, #32]
 660 039e 7B68     		ldr	r3, [r7, #4]
 661 03a0 9A68     		ldr	r2, [r3, #8]
 662 03a2 0123     		movs	r3, #1
 663 03a4 5942     		rsbs	r1, r3, #0
 664 03a6 7B68     		ldr	r3, [r7, #4]
 665 03a8 1800     		movs	r0, r3
 666 03aa A047     		blx	r4
 215:C:/github/pongTest/ver1\game_logic.c **** 	
 216:C:/github/pongTest/ver1\game_logic.c **** 	if (toTheRight != 0) 
 667              		.loc 1 216 0
 668 03ac FB1C     		adds	r3, r7, #3
 669 03ae 1B78     		ldrb	r3, [r3]
 670 03b0 002B     		cmp	r3, #0
 671 03b2 07D0     		beq	.L27
 217:C:/github/pongTest/ver1\game_logic.c **** 	{
 218:C:/github/pongTest/ver1\game_logic.c **** 		b->set_speed(b	,	1	,	b->diry);
 672              		.loc 1 218 0
 673 03b4 7B68     		ldr	r3, [r7, #4]
 674 03b6 1C6A     		ldr	r4, [r3, #32]
 675 03b8 7B68     		ldr	r3, [r7, #4]
 676 03ba 9A68     		ldr	r2, [r3, #8]
 677 03bc 7B68     		ldr	r3, [r7, #4]
 678 03be 0121     		movs	r1, #1
 679 03c0 1800     		movs	r0, r3
 680 03c2 A047     		blx	r4
 681              	.L27:
 219:C:/github/pongTest/ver1\game_logic.c **** 	}
 220:C:/github/pongTest/ver1\game_logic.c **** }
 682              		.loc 1 220 0
 683 03c4 C046     		nop
 684 03c6 BD46     		mov	sp, r7
 685 03c8 03B0     		add	sp, sp, #12
 686              		@ sp needed
 687 03ca 90BD     		pop	{r4, r7, pc}
 688              		.cfi_endproc
 689              	.LFE5:
 691              		.align	2
 692              		.global	ping
 693              		.code	16
 694              		.thumb_func
 696              	ping:
 697              	.LFB6:
 221:C:/github/pongTest/ver1\game_logic.c **** 
 222:C:/github/pongTest/ver1\game_logic.c **** /* 
 223:C:/github/pongTest/ver1\game_logic.c ****  * UPDATE THE POSITION OF THE BALL
 224:C:/github/pongTest/ver1\game_logic.c ****  * IF GOAL, 
 225:C:/github/pongTest/ver1\game_logic.c ****  * 						PRINT SCORE TO THE PLAYER 
 226:C:/github/pongTest/ver1\game_logic.c ****  * IF KEYBOARD_PRESSED, 
 227:C:/github/pongTest/ver1\game_logic.c ****  * 						MOVE THE PLAYER
 228:C:/github/pongTest/ver1\game_logic.c ****  * RENDER THE SCREEN
 229:C:/github/pongTest/ver1\game_logic.c ****  */ 
 230:C:/github/pongTest/ver1\game_logic.c **** void ping(P_PLAYER playerLeft, P_PLAYER playerRight, P_OBJECT ball) {
 698              		.loc 1 230 0
 699              		.cfi_startproc
 700 03cc 80B5     		push	{r7, lr}
 701              		.cfi_def_cfa_offset 8
 702              		.cfi_offset 7, -8
 703              		.cfi_offset 14, -4
 704 03ce 84B0     		sub	sp, sp, #16
 705              		.cfi_def_cfa_offset 24
 706 03d0 00AF     		add	r7, sp, #0
 707              		.cfi_def_cfa_register 7
 708 03d2 F860     		str	r0, [r7, #12]
 709 03d4 B960     		str	r1, [r7, #8]
 710 03d6 7A60     		str	r2, [r7, #4]
 231:C:/github/pongTest/ver1\game_logic.c **** 	// check the postion of the ball related to the players / walls -> change direction if collision /
 232:C:/github/pongTest/ver1\game_logic.c **** 	check_ball(playerLeft->p_obj, playerRight->p_obj, ball);				
 711              		.loc 1 232 0
 712 03d8 FB68     		ldr	r3, [r7, #12]
 713 03da 1868     		ldr	r0, [r3]
 714 03dc BB68     		ldr	r3, [r7, #8]
 715 03de 1B68     		ldr	r3, [r3]
 716 03e0 7A68     		ldr	r2, [r7, #4]
 717 03e2 1900     		movs	r1, r3
 718 03e4 FFF7FEFF 		bl	check_ball
 233:C:/github/pongTest/ver1\game_logic.c **** 	delay_micro(5);
 719              		.loc 1 233 0
 720 03e8 0520     		movs	r0, #5
 721 03ea FFF7FEFF 		bl	delay_micro
 234:C:/github/pongTest/ver1\game_logic.c **** 	//ball->move(ball);
 235:C:/github/pongTest/ver1\game_logic.c **** 	delay_micro(5);
 722              		.loc 1 235 0
 723 03ee 0520     		movs	r0, #5
 724 03f0 FFF7FEFF 		bl	delay_micro
 236:C:/github/pongTest/ver1\game_logic.c **** 	update_player_pos(playerLeft,playerRight);
 725              		.loc 1 236 0
 726 03f4 BA68     		ldr	r2, [r7, #8]
 727 03f6 FB68     		ldr	r3, [r7, #12]
 728 03f8 1100     		movs	r1, r2
 729 03fa 1800     		movs	r0, r3
 730 03fc FFF7FEFF 		bl	update_player_pos
 237:C:/github/pongTest/ver1\game_logic.c **** }
 731              		.loc 1 237 0
 732 0400 C046     		nop
 733 0402 BD46     		mov	sp, r7
 734 0404 04B0     		add	sp, sp, #16
 735              		@ sp needed
 736 0406 80BD     		pop	{r7, pc}
 737              		.cfi_endproc
 738              	.LFE6:
 740              		.section	.rodata
 741              		.align	2
 742              	.LC0:
 743 0000 57656C63 		.ascii	"Welcome To The\000"
 743      6F6D6520 
 743      546F2054 
 743      686500
 744 000f 00       		.align	2
 745              	.LC2:
 746 0010 47726561 		.ascii	"Greatest Game Ever?\000"
 746      74657374 
 746      2047616D 
 746      65204576 
 746      65723F00 
 747              		.text
 748              		.align	2
 749              		.global	welcome
 750              		.code	16
 751              		.thumb_func
 753              	welcome:
 754              	.LFB7:
 238:C:/github/pongTest/ver1\game_logic.c **** 
 239:C:/github/pongTest/ver1\game_logic.c **** void welcome(void) {
 755              		.loc 1 239 0
 756              		.cfi_startproc
 757 0408 90B5     		push	{r4, r7, lr}
 758              		.cfi_def_cfa_offset 12
 759              		.cfi_offset 4, -12
 760              		.cfi_offset 7, -8
 761              		.cfi_offset 14, -4
 762 040a 8BB0     		sub	sp, sp, #44
 763              		.cfi_def_cfa_offset 56
 764 040c 00AF     		add	r7, sp, #0
 765              		.cfi_def_cfa_register 7
 240:C:/github/pongTest/ver1\game_logic.c **** 	char welcoming[] = "Welcome To The";
 766              		.loc 1 240 0
 767 040e 1823     		movs	r3, #24
 768 0410 FB18     		adds	r3, r7, r3
 769 0412 0C4A     		ldr	r2, .L30
 770 0414 13CA     		ldmia	r2!, {r0, r1, r4}
 771 0416 13C3     		stmia	r3!, {r0, r1, r4}
 772 0418 1188     		ldrh	r1, [r2]
 773 041a 1980     		strh	r1, [r3]
 774 041c 9278     		ldrb	r2, [r2, #2]
 775 041e 9A70     		strb	r2, [r3, #2]
 241:C:/github/pongTest/ver1\game_logic.c **** 	char game[] = "Greatest Game Ever?";
 776              		.loc 1 241 0
 777 0420 3B1D     		adds	r3, r7, #4
 778 0422 094A     		ldr	r2, .L30+4
 779 0424 13CA     		ldmia	r2!, {r0, r1, r4}
 780 0426 13C3     		stmia	r3!, {r0, r1, r4}
 781 0428 03CA     		ldmia	r2!, {r0, r1}
 782 042a 03C3     		stmia	r3!, {r0, r1}
 242:C:/github/pongTest/ver1\game_logic.c **** 	
 243:C:/github/pongTest/ver1\game_logic.c **** 	update_ascii_display(welcoming, game);
 783              		.loc 1 243 0
 784 042c 3A1D     		adds	r2, r7, #4
 785 042e 1823     		movs	r3, #24
 786 0430 FB18     		adds	r3, r7, r3
 787 0432 1100     		movs	r1, r2
 788 0434 1800     		movs	r0, r3
 789 0436 FFF7FEFF 		bl	update_ascii_display
 244:C:/github/pongTest/ver1\game_logic.c **** }...
 790              		.loc 1 244 0
 791 043a C046     		nop
 792 043c BD46     		mov	sp, r7
 793 043e 0BB0     		add	sp, sp, #44
 794              		@ sp needed
 795 0440 90BD     		pop	{r4, r7, pc}
 796              	.L31:
 797 0442 C046     		.align	2
 798              	.L30:
 799 0444 00000000 		.word	.LC0
 800 0448 10000000 		.word	.LC2
 801              		.cfi_endproc
 802              	.LFE7:
 804              	.Letext0:
 805              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 806              		.file 3 "C:/github/pongTest/ver1/geometry.h"
 807              		.file 4 "C:/github/pongTest/ver1/player_logic.h"
