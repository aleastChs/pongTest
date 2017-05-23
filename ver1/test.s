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
  20              		.global	get_wall_player
  21              		.code	16
  22              		.thumb_func
  24              	get_wall_player:
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
  12:C:/github/pongTest/ver1\game_logic.c **** 
  13:C:/github/pongTest/ver1\game_logic.c **** /*
  14:C:/github/pongTest/ver1\game_logic.c ****  * GET THE POSITION OF THE PLAYER
  15:C:/github/pongTest/ver1\game_logic.c ****  * 
  16:C:/github/pongTest/ver1\game_logic.c ****  * IF isLeftWall == 0:			do nothing 
  17:C:/github/pongTest/ver1\game_logic.c ****  * ELSE IF isLeft == 1:			add the size of x to the position
  18:C:/github/pongTest/ver1\game_logic.c ****  * 
  19:C:/github/pongTest/ver1\game_logic.c ****  * RETURN THE POSITION IN X
  20:C:/github/pongTest/ver1\game_logic.c ****  */ 
  21:C:/github/pongTest/ver1\game_logic.c **** 
  22:C:/github/pongTest/ver1\game_logic.c **** uint8 get_wall_player(P_OBJECT player, uint8 isLeftWall) {
  27              		.loc 1 22 0
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
  38 0008 0A00     		movs	r2, r1
  39 000a FB1C     		adds	r3, r7, #3
  40 000c 1A70     		strb	r2, [r3]
  23:C:/github/pongTest/ver1\game_logic.c **** 	uint32 x;
  24:C:/github/pongTest/ver1\game_logic.c **** 	
  25:C:/github/pongTest/ver1\game_logic.c **** 	x = player->posx;
  41              		.loc 1 25 0
  42 000e 7B68     		ldr	r3, [r7, #4]
  43 0010 DB68     		ldr	r3, [r3, #12]
  44 0012 FB60     		str	r3, [r7, #12]
  26:C:/github/pongTest/ver1\game_logic.c **** 	
  27:C:/github/pongTest/ver1\game_logic.c **** 	if(isLeftWall != 0) {
  45              		.loc 1 27 0
  46 0014 FB1C     		adds	r3, r7, #3
  47 0016 1B78     		ldrb	r3, [r3]
  48 0018 002B     		cmp	r3, #0
  49 001a 05D0     		beq	.L2
  28:C:/github/pongTest/ver1\game_logic.c **** 		// if isLeftWall non-zero add size of player
  29:C:/github/pongTest/ver1\game_logic.c **** 		x += player->geo->sizex;
  50              		.loc 1 29 0
  51 001c 7B68     		ldr	r3, [r7, #4]
  52 001e 1B68     		ldr	r3, [r3]
  53 0020 5B68     		ldr	r3, [r3, #4]
  54 0022 FA68     		ldr	r2, [r7, #12]
  55 0024 D318     		adds	r3, r2, r3
  56 0026 FB60     		str	r3, [r7, #12]
  57              	.L2:
  30:C:/github/pongTest/ver1\game_logic.c **** 	}
  31:C:/github/pongTest/ver1\game_logic.c **** 	return x;
  58              		.loc 1 31 0
  59 0028 FB68     		ldr	r3, [r7, #12]
  60 002a DBB2     		uxtb	r3, r3
  32:C:/github/pongTest/ver1\game_logic.c **** }
  61              		.loc 1 32 0
  62 002c 1800     		movs	r0, r3
  63 002e BD46     		mov	sp, r7
  64 0030 04B0     		add	sp, sp, #16
  65              		@ sp needed
  66 0032 80BD     		pop	{r7, pc}
  67              		.cfi_endproc
  68              	.LFE0:
  70              		.align	2
  71              		.global	inside_y_wise
  72              		.code	16
  73              		.thumb_func
  75              	inside_y_wise:
  76              	.LFB1:
  33:C:/github/pongTest/ver1\game_logic.c **** 
  34:C:/github/pongTest/ver1\game_logic.c **** /*
  35:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF OBJECT1 IS INSIDE OBEJCT2 Y - WISE
  36:C:/github/pongTest/ver1\game_logic.c ****  * 
  37:C:/github/pongTest/ver1\game_logic.c ****  * IF SO:		RETURN 1
  38:C:/github/pongTest/ver1\game_logic.c ****  * ELSE:		RETURN 0
  39:C:/github/pongTest/ver1\game_logic.c ****  * 
  40:C:/github/pongTest/ver1\game_logic.c ****  */ 
  41:C:/github/pongTest/ver1\game_logic.c **** uint8 inside_y_wise(P_OBJECT object1, P_OBJECT object2) {
  77              		.loc 1 41 0
  78              		.cfi_startproc
  79 0034 80B5     		push	{r7, lr}
  80              		.cfi_def_cfa_offset 8
  81              		.cfi_offset 7, -8
  82              		.cfi_offset 14, -4
  83 0036 84B0     		sub	sp, sp, #16
  84              		.cfi_def_cfa_offset 24
  85 0038 00AF     		add	r7, sp, #0
  86              		.cfi_def_cfa_register 7
  87 003a 7860     		str	r0, [r7, #4]
  88 003c 3960     		str	r1, [r7]
  42:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj1_top_coord = object1->posy;
  89              		.loc 1 42 0
  90 003e 7B68     		ldr	r3, [r7, #4]
  91 0040 1A69     		ldr	r2, [r3, #16]
  92 0042 0E23     		movs	r3, #14
  93 0044 FB18     		adds	r3, r7, r3
  94 0046 1A70     		strb	r2, [r3]
  43:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
  95              		.loc 1 43 0
  96 0048 FFF7FEFF 		bl	delay_250ns
  44:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_top_coord = object2->posy;
  97              		.loc 1 44 0
  98 004c 3B68     		ldr	r3, [r7]
  99 004e 1A69     		ldr	r2, [r3, #16]
 100 0050 0D23     		movs	r3, #13
 101 0052 FB18     		adds	r3, r7, r3
 102 0054 1A70     		strb	r2, [r3]
  45:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_bottom_coord = obj2_top_coord + object2->geo->sizey;
 103              		.loc 1 45 0
 104 0056 3B68     		ldr	r3, [r7]
 105 0058 1B68     		ldr	r3, [r3]
 106 005a 9B68     		ldr	r3, [r3, #8]
 107 005c D9B2     		uxtb	r1, r3
 108 005e 0C23     		movs	r3, #12
 109 0060 FB18     		adds	r3, r7, r3
 110 0062 0D22     		movs	r2, #13
 111 0064 BA18     		adds	r2, r7, r2
 112 0066 1278     		ldrb	r2, [r2]
 113 0068 8A18     		adds	r2, r1, r2
 114 006a 1A70     		strb	r2, [r3]
  46:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 115              		.loc 1 46 0
 116 006c FFF7FEFF 		bl	delay_250ns
  47:C:/github/pongTest/ver1\game_logic.c **** 	uint8 value = 0;
 117              		.loc 1 47 0
 118 0070 0F23     		movs	r3, #15
 119 0072 FB18     		adds	r3, r7, r3
 120 0074 0022     		movs	r2, #0
 121 0076 1A70     		strb	r2, [r3]
  48:C:/github/pongTest/ver1\game_logic.c **** 	if (obj1_top_coord >= obj2_top_coord && obj1_top_coord <= obj2_bottom_coord) {
 122              		.loc 1 48 0
 123 0078 0E23     		movs	r3, #14
 124 007a FA18     		adds	r2, r7, r3
 125 007c 0D23     		movs	r3, #13
 126 007e FB18     		adds	r3, r7, r3
 127 0080 1278     		ldrb	r2, [r2]
 128 0082 1B78     		ldrb	r3, [r3]
 129 0084 9A42     		cmp	r2, r3
 130 0086 0BD3     		bcc	.L5
 131              		.loc 1 48 0 is_stmt 0 discriminator 1
 132 0088 0E23     		movs	r3, #14
 133 008a FA18     		adds	r2, r7, r3
 134 008c 0C23     		movs	r3, #12
 135 008e FB18     		adds	r3, r7, r3
 136 0090 1278     		ldrb	r2, [r2]
 137 0092 1B78     		ldrb	r3, [r3]
 138 0094 9A42     		cmp	r2, r3
 139 0096 03D8     		bhi	.L5
  49:C:/github/pongTest/ver1\game_logic.c **** 		value = 1;
 140              		.loc 1 49 0 is_stmt 1
 141 0098 0F23     		movs	r3, #15
 142 009a FB18     		adds	r3, r7, r3
 143 009c 0122     		movs	r2, #1
 144 009e 1A70     		strb	r2, [r3]
 145              	.L5:
  50:C:/github/pongTest/ver1\game_logic.c **** 	}
  51:C:/github/pongTest/ver1\game_logic.c **** 	
  52:C:/github/pongTest/ver1\game_logic.c **** 	return value;
 146              		.loc 1 52 0
 147 00a0 0F23     		movs	r3, #15
 148 00a2 FB18     		adds	r3, r7, r3
 149 00a4 1B78     		ldrb	r3, [r3]
  53:C:/github/pongTest/ver1\game_logic.c **** }
 150              		.loc 1 53 0
 151 00a6 1800     		movs	r0, r3
 152 00a8 BD46     		mov	sp, r7
 153 00aa 04B0     		add	sp, sp, #16
 154              		@ sp needed
 155 00ac 80BD     		pop	{r7, pc}
 156              		.cfi_endproc
 157              	.LFE1:
 159 00ae C046     		.align	2
 160              		.global	check_ball
 161              		.code	16
 162              		.thumb_func
 164              	check_ball:
 165              	.LFB2:
  54:C:/github/pongTest/ver1\game_logic.c **** 
  55:C:/github/pongTest/ver1\game_logic.c **** /*
  56:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES PLAYER_LEFT / PLAYER_RIGHT 
  57:C:/github/pongTest/ver1\game_logic.c ****  * 
  58:C:/github/pongTest/ver1\game_logic.c ****  * IF SO:		change direction of the ball in X
  59:C:/github/pongTest/ver1\game_logic.c ****  * ELSE:		do nothing
  60:C:/github/pongTest/ver1\game_logic.c ****  * 
  61:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES THE WALL TO THE LEFT / RIGHT  
  62:C:/github/pongTest/ver1\game_logic.c ****  */ 
  63:C:/github/pongTest/ver1\game_logic.c **** void check_ball(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball)
  64:C:/github/pongTest/ver1\game_logic.c **** {
 166              		.loc 1 64 0
 167              		.cfi_startproc
 168 00b0 90B5     		push	{r4, r7, lr}
 169              		.cfi_def_cfa_offset 12
 170              		.cfi_offset 4, -12
 171              		.cfi_offset 7, -8
 172              		.cfi_offset 14, -4
 173 00b2 87B0     		sub	sp, sp, #28
 174              		.cfi_def_cfa_offset 40
 175 00b4 00AF     		add	r7, sp, #0
 176              		.cfi_def_cfa_register 7
 177 00b6 F860     		str	r0, [r7, #12]
 178 00b8 B960     		str	r1, [r7, #8]
 179 00ba 7A60     		str	r2, [r7, #4]
  65:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_left = get_wall_player(playerLeft, 1);
 180              		.loc 1 65 0
 181 00bc 1723     		movs	r3, #23
 182 00be FC18     		adds	r4, r7, r3
 183 00c0 FB68     		ldr	r3, [r7, #12]
 184 00c2 0121     		movs	r1, #1
 185 00c4 1800     		movs	r0, r3
 186 00c6 FFF7FEFF 		bl	get_wall_player
 187 00ca 0300     		movs	r3, r0
 188 00cc 2370     		strb	r3, [r4]
  66:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 189              		.loc 1 66 0
 190 00ce FFF7FEFF 		bl	delay_250ns
  67:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_right = get_wall_player(playerRight, 0);
 191              		.loc 1 67 0
 192 00d2 1623     		movs	r3, #22
 193 00d4 FC18     		adds	r4, r7, r3
 194 00d6 BB68     		ldr	r3, [r7, #8]
 195 00d8 0021     		movs	r1, #0
 196 00da 1800     		movs	r0, r3
 197 00dc FFF7FEFF 		bl	get_wall_player
 198 00e0 0300     		movs	r3, r0
 199 00e2 2370     		strb	r3, [r4]
  68:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 200              		.loc 1 68 0
 201 00e4 FFF7FEFF 		bl	delay_250ns
  69:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_right_side_coord = (ball->posx + ball->geo->sizex);
 202              		.loc 1 69 0
 203 00e8 7B68     		ldr	r3, [r7, #4]
 204 00ea DB68     		ldr	r3, [r3, #12]
 205 00ec D9B2     		uxtb	r1, r3
 206 00ee 7B68     		ldr	r3, [r7, #4]
 207 00f0 1B68     		ldr	r3, [r3]
 208 00f2 5B68     		ldr	r3, [r3, #4]
 209 00f4 DAB2     		uxtb	r2, r3
 210 00f6 1523     		movs	r3, #21
 211 00f8 FB18     		adds	r3, r7, r3
 212 00fa 8A18     		adds	r2, r1, r2
 213 00fc 1A70     		strb	r2, [r3]
  70:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_left_side_coord = ball->posx;
 214              		.loc 1 70 0
 215 00fe 7B68     		ldr	r3, [r7, #4]
 216 0100 DA68     		ldr	r2, [r3, #12]
 217 0102 1423     		movs	r3, #20
 218 0104 FB18     		adds	r3, r7, r3
 219 0106 1A70     		strb	r2, [r3]
  71:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 220              		.loc 1 71 0
 221 0108 FFF7FEFF 		bl	delay_250ns
  72:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_top_coord = ball->posy;
 222              		.loc 1 72 0
 223 010c 7B68     		ldr	r3, [r7, #4]
 224 010e 1A69     		ldr	r2, [r3, #16]
 225 0110 1323     		movs	r3, #19
 226 0112 FB18     		adds	r3, r7, r3
 227 0114 1A70     		strb	r2, [r3]
  73:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_bottom_coord = ball->posy + ball->geo->sizey;
 228              		.loc 1 73 0
 229 0116 7B68     		ldr	r3, [r7, #4]
 230 0118 1B69     		ldr	r3, [r3, #16]
 231 011a D9B2     		uxtb	r1, r3
 232 011c 7B68     		ldr	r3, [r7, #4]
 233 011e 1B68     		ldr	r3, [r3]
 234 0120 9B68     		ldr	r3, [r3, #8]
 235 0122 DAB2     		uxtb	r2, r3
 236 0124 1223     		movs	r3, #18
 237 0126 FB18     		adds	r3, r7, r3
 238 0128 8A18     		adds	r2, r1, r2
 239 012a 1A70     		strb	r2, [r3]
  74:C:/github/pongTest/ver1\game_logic.c **** 	
  75:C:/github/pongTest/ver1\game_logic.c **** // CHECK IF GOAL!!!
  76:C:/github/pongTest/ver1\game_logic.c **** 	
  77:C:/github/pongTest/ver1\game_logic.c **** 	if ( ball_right_side_coord >= 126) {
  78:C:/github/pongTest/ver1\game_logic.c **** 		// player left gets a point
  79:C:/github/pongTest/ver1\game_logic.c **** 		// update ascii-display	
  80:C:/github/pongTest/ver1\game_logic.c **** 		
  81:C:/github/pongTest/ver1\game_logic.c **** 		// start a new ball
  82:C:/github/pongTest/ver1\game_logic.c **** 		
  83:C:/github/pongTest/ver1\game_logic.c **** 		
  84:C:/github/pongTest/ver1\game_logic.c **** 	} else if (ball_left_side_coord <= 3) {
  85:C:/github/pongTest/ver1\game_logic.c **** 		
  86:C:/github/pongTest/ver1\game_logic.c **** 		// player right gets a point
  87:C:/github/pongTest/ver1\game_logic.c **** 		// update ascii-display
  88:C:/github/pongTest/ver1\game_logic.c **** 		
  89:C:/github/pongTest/ver1\game_logic.c **** 		// start a new ball
  90:C:/github/pongTest/ver1\game_logic.c **** 		
  91:C:/github/pongTest/ver1\game_logic.c **** 	} 
  92:C:/github/pongTest/ver1\game_logic.c **** 	
  93:C:/github/pongTest/ver1\game_logic.c **** // END CHECK GOAL
  94:C:/github/pongTest/ver1\game_logic.c **** 
  95:C:/github/pongTest/ver1\game_logic.c **** 
  96:C:/github/pongTest/ver1\game_logic.c **** // CHECK WALLS PLAYERS
  97:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 240              		.loc 1 97 0
 241 012c FFF7FEFF 		bl	delay_250ns
  98:C:/github/pongTest/ver1\game_logic.c **** 	if (   ( ball_right_side_coord + 1)  == wall_player_right  ) 
 242              		.loc 1 98 0
 243 0130 1523     		movs	r3, #21
 244 0132 FB18     		adds	r3, r7, r3
 245 0134 1B78     		ldrb	r3, [r3]
 246 0136 5A1C     		adds	r2, r3, #1
 247 0138 1623     		movs	r3, #22
 248 013a FB18     		adds	r3, r7, r3
 249 013c 1B78     		ldrb	r3, [r3]
 250 013e 9A42     		cmp	r2, r3
 251 0140 19D1     		bne	.L8
  99:C:/github/pongTest/ver1\game_logic.c **** 	{ // playerRight
 100:C:/github/pongTest/ver1\game_logic.c **** 	
 101:C:/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerRight)) 
 252              		.loc 1 101 0
 253 0142 BA68     		ldr	r2, [r7, #8]
 254 0144 7B68     		ldr	r3, [r7, #4]
 255 0146 1100     		movs	r1, r2
 256 0148 1800     		movs	r0, r3
 257 014a FFF7FEFF 		bl	inside_y_wise
 258 014e 031E     		subs	r3, r0, #0
 259 0150 30D0     		beq	.L10
 102:C:/github/pongTest/ver1\game_logic.c **** 		{
 103:C:/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 260              		.loc 1 103 0
 261 0152 7B68     		ldr	r3, [r7, #4]
 262 0154 5B68     		ldr	r3, [r3, #4]
 263 0156 5A42     		rsbs	r2, r3, #0
 264 0158 7B68     		ldr	r3, [r7, #4]
 265 015a 5A60     		str	r2, [r3, #4]
 104:C:/github/pongTest/ver1\game_logic.c **** 			delay_250ns();
 266              		.loc 1 104 0
 267 015c FFF7FEFF 		bl	delay_250ns
 105:C:/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_right - ball->geo->sizex - 1;
 268              		.loc 1 105 0
 269 0160 1623     		movs	r3, #22
 270 0162 FB18     		adds	r3, r7, r3
 271 0164 1A78     		ldrb	r2, [r3]
 272 0166 7B68     		ldr	r3, [r7, #4]
 273 0168 1B68     		ldr	r3, [r3]
 274 016a 5B68     		ldr	r3, [r3, #4]
 275 016c D31A     		subs	r3, r2, r3
 276 016e 5A1E     		subs	r2, r3, #1
 277 0170 7B68     		ldr	r3, [r7, #4]
 278 0172 DA60     		str	r2, [r3, #12]
 279 0174 1EE0     		b	.L10
 280              	.L8:
 106:C:/github/pongTest/ver1\game_logic.c **** 		}
 107:C:/github/pongTest/ver1\game_logic.c **** 		
 108:C:/github/pongTest/ver1\game_logic.c **** 	} 
 109:C:/github/pongTest/ver1\game_logic.c **** 	else if (    (ball_left_side_coord - 1) == wall_player_left ) 
 281              		.loc 1 109 0
 282 0176 1423     		movs	r3, #20
 283 0178 FB18     		adds	r3, r7, r3
 284 017a 1B78     		ldrb	r3, [r3]
 285 017c 5A1E     		subs	r2, r3, #1
 286 017e 1723     		movs	r3, #23
 287 0180 FB18     		adds	r3, r7, r3
 288 0182 1B78     		ldrb	r3, [r3]
 289 0184 9A42     		cmp	r2, r3
 290 0186 15D1     		bne	.L10
 110:C:/github/pongTest/ver1\game_logic.c **** 	{ // playerLeft
 111:C:/github/pongTest/ver1\game_logic.c **** 		
 112:C:/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerLeft)) 
 291              		.loc 1 112 0
 292 0188 FA68     		ldr	r2, [r7, #12]
 293 018a 7B68     		ldr	r3, [r7, #4]
 294 018c 1100     		movs	r1, r2
 295 018e 1800     		movs	r0, r3
 296 0190 FFF7FEFF 		bl	inside_y_wise
 297 0194 031E     		subs	r3, r0, #0
 298 0196 0DD0     		beq	.L10
 113:C:/github/pongTest/ver1\game_logic.c **** 		{
 114:C:/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 299              		.loc 1 114 0
 300 0198 7B68     		ldr	r3, [r7, #4]
 301 019a 5B68     		ldr	r3, [r3, #4]
 302 019c 5A42     		rsbs	r2, r3, #0
 303 019e 7B68     		ldr	r3, [r7, #4]
 304 01a0 5A60     		str	r2, [r3, #4]
 115:C:/github/pongTest/ver1\game_logic.c **** 			delay_250ns();
 305              		.loc 1 115 0
 306 01a2 FFF7FEFF 		bl	delay_250ns
 116:C:/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_left + 1;
 307              		.loc 1 116 0
 308 01a6 1723     		movs	r3, #23
 309 01a8 FB18     		adds	r3, r7, r3
 310 01aa 1B78     		ldrb	r3, [r3]
 311 01ac 0133     		adds	r3, r3, #1
 312 01ae 1A00     		movs	r2, r3
 313 01b0 7B68     		ldr	r3, [r7, #4]
 314 01b2 DA60     		str	r2, [r3, #12]
 315              	.L10:
 117:C:/github/pongTest/ver1\game_logic.c **** 		}
 118:C:/github/pongTest/ver1\game_logic.c **** 		
 119:C:/github/pongTest/ver1\game_logic.c **** 	}
 120:C:/github/pongTest/ver1\game_logic.c **** // END CHECK WALLS PLAYERS
 121:C:/github/pongTest/ver1\game_logic.c **** 	
 122:C:/github/pongTest/ver1\game_logic.c **** 	
 123:C:/github/pongTest/ver1\game_logic.c **** // CHECK FLOOR / BOTTOM
 124:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 316              		.loc 1 124 0
 317 01b4 FFF7FEFF 		bl	delay_250ns
 125:C:/github/pongTest/ver1\game_logic.c **** 	if (ball_top_coord <= 2) 
 318              		.loc 1 125 0
 319 01b8 1323     		movs	r3, #19
 320 01ba FB18     		adds	r3, r7, r3
 321 01bc 1B78     		ldrb	r3, [r3]
 322 01be 022B     		cmp	r3, #2
 323 01c0 05D8     		bhi	.L11
 126:C:/github/pongTest/ver1\game_logic.c **** 	{
 127:C:/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 324              		.loc 1 127 0
 325 01c2 7B68     		ldr	r3, [r7, #4]
 326 01c4 9B68     		ldr	r3, [r3, #8]
 327 01c6 5A42     		rsbs	r2, r3, #0
 328 01c8 7B68     		ldr	r3, [r7, #4]
 329 01ca 9A60     		str	r2, [r3, #8]
 128:C:/github/pongTest/ver1\game_logic.c **** 	} 
 129:C:/github/pongTest/ver1\game_logic.c **** 	else if( ball_bottom_coord >= 62) 
 130:C:/github/pongTest/ver1\game_logic.c **** 	{
 131:C:/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 132:C:/github/pongTest/ver1\game_logic.c **** 	}
 133:C:/github/pongTest/ver1\game_logic.c **** // END CHECK FLOOR / BOTTOM	
 134:C:/github/pongTest/ver1\game_logic.c **** 	
 135:C:/github/pongTest/ver1\game_logic.c **** 
 136:C:/github/pongTest/ver1\game_logic.c **** }
 330              		.loc 1 136 0
 331 01cc 09E0     		b	.L13
 332              	.L11:
 129:C:/github/pongTest/ver1\game_logic.c **** 	{
 333              		.loc 1 129 0
 334 01ce 1223     		movs	r3, #18
 335 01d0 FB18     		adds	r3, r7, r3
 336 01d2 1B78     		ldrb	r3, [r3]
 337 01d4 3D2B     		cmp	r3, #61
 338 01d6 04D9     		bls	.L13
 131:C:/github/pongTest/ver1\game_logic.c **** 	}
 339              		.loc 1 131 0
 340 01d8 7B68     		ldr	r3, [r7, #4]
 341 01da 9B68     		ldr	r3, [r3, #8]
 342 01dc 5A42     		rsbs	r2, r3, #0
 343 01de 7B68     		ldr	r3, [r7, #4]
 344 01e0 9A60     		str	r2, [r3, #8]
 345              	.L13:
 346              		.loc 1 136 0
 347 01e2 C046     		nop
 348 01e4 BD46     		mov	sp, r7
 349 01e6 07B0     		add	sp, sp, #28
 350              		@ sp needed
 351 01e8 90BD     		pop	{r4, r7, pc}
 352              		.cfi_endproc
 353              	.LFE2:
 355 01ea C046     		.align	2
 356              		.global	ping
 357              		.code	16
 358              		.thumb_func
 360              	ping:
 361              	.LFB3:
 137:C:/github/pongTest/ver1\game_logic.c **** 
 138:C:/github/pongTest/ver1\game_logic.c **** 
 139:C:/github/pongTest/ver1\game_logic.c **** /* 
 140:C:/github/pongTest/ver1\game_logic.c ****  * UPDATE THE POSITION OF THE BALL
 141:C:/github/pongTest/ver1\game_logic.c ****  * IF GOAL, 
 142:C:/github/pongTest/ver1\game_logic.c ****  * 						PRINT SCORE TO THE PLAYER 
 143:C:/github/pongTest/ver1\game_logic.c ****  * IF KEYBOARD_PRESSED, 
 144:C:/github/pongTest/ver1\game_logic.c ****  * 						MOVE THE PLAYER
 145:C:/github/pongTest/ver1\game_logic.c ****  * RENDER THE SCREEN
 146:C:/github/pongTest/ver1\game_logic.c ****  */ 
 147:C:/github/pongTest/ver1\game_logic.c **** void ping(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball) {
 362              		.loc 1 147 0
 363              		.cfi_startproc
 364 01ec 80B5     		push	{r7, lr}
 365              		.cfi_def_cfa_offset 8
 366              		.cfi_offset 7, -8
 367              		.cfi_offset 14, -4
 368 01ee 84B0     		sub	sp, sp, #16
 369              		.cfi_def_cfa_offset 24
 370 01f0 00AF     		add	r7, sp, #0
 371              		.cfi_def_cfa_register 7
 372 01f2 F860     		str	r0, [r7, #12]
 373 01f4 B960     		str	r1, [r7, #8]
 374 01f6 7A60     		str	r2, [r7, #4]
 148:C:/github/pongTest/ver1\game_logic.c **** 	// check the postion of the ball related to the players / walls -> change direction if collision /
 149:C:/github/pongTest/ver1\game_logic.c **** 	check_ball(playerLeft, playerRight, ball);				
 375              		.loc 1 149 0
 376 01f8 7A68     		ldr	r2, [r7, #4]
 377 01fa B968     		ldr	r1, [r7, #8]
 378 01fc FB68     		ldr	r3, [r7, #12]
 379 01fe 1800     		movs	r0, r3
 380 0200 FFF7FEFF 		bl	check_ball
 150:C:/github/pongTest/ver1\game_logic.c **** 	delay_micro(5);
 381              		.loc 1 150 0
 382 0204 0520     		movs	r0, #5
 383 0206 FFF7FEFF 		bl	delay_micro
 151:C:/github/pongTest/ver1\game_logic.c **** 	ball->move(ball);
 384              		.loc 1 151 0
 385 020a 7B68     		ldr	r3, [r7, #4]
 386 020c DB69     		ldr	r3, [r3, #28]
 387 020e 7A68     		ldr	r2, [r7, #4]
 388 0210 1000     		movs	r0, r2
 389 0212 9847     		blx	r3
 152:C:/github/pongTest/ver1\game_logic.c **** 	delay_micro(5);
 390              		.loc 1 152 0
 391 0214 0520     		movs	r0, #5
 392 0216 FFF7FEFF 		bl	delay_micro
 153:C:/github/pongTest/ver1\game_logic.c **** 	// read keyboard left
 154:C:/github/pongTest/ver1\game_logic.c **** 	// if:		 2_IS_PRESSED 
 155:C:/github/pongTest/ver1\game_logic.c **** 	//					playerLeft->set_speed(0,1);
 156:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 157:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 158:C:/github/pongTest/ver1\game_logic.c **** 	// else if:	 0_IS_PRESSED 
 159:C:/github/pongTest/ver1\game_logic.c **** 	//					playerLeft->set_speed(0,-1);
 160:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 161:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 162:C:/github/pongTest/ver1\game_logic.c **** 	
 163:C:/github/pongTest/ver1\game_logic.c **** 	// read keyboard right
 164:C:/github/pongTest/ver1\game_logic.c **** 	// if:		2_IS_PRESSED 
 165:C:/github/pongTest/ver1\game_logic.c **** 	//					playerRight->set_speed(0,1);
 166:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 167:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 168:C:/github/pongTest/ver1\game_logic.c **** 	// else if:	 0_IS_PRESSED 
 169:C:/github/pongTest/ver1\game_logic.c **** 	//					playerRight->set_speed(0,-1);
 170:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 171:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 172:C:/github/pongTest/ver1\game_logic.c **** 	
 173:C:/github/pongTest/ver1\game_logic.c **** 	
 174:C:/github/pongTest/ver1\game_logic.c **** }...
 393              		.loc 1 174 0
 394 021a C046     		nop
 395 021c BD46     		mov	sp, r7
 396 021e 04B0     		add	sp, sp, #16
 397              		@ sp needed
 398 0220 80BD     		pop	{r7, pc}
 399              		.cfi_endproc
 400              	.LFE3:
 402              	.Letext0:
 403              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 404              		.file 3 "C:/github/pongTest/ver1/geometry.h"
