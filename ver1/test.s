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
  11:C:/github/pongTest/ver1\game_logic.c **** 
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
  43:C:/github/pongTest/ver1\game_logic.c **** 	
  44:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_top_coord = object2->posy;
  95              		.loc 1 44 0
  96 0048 3B68     		ldr	r3, [r7]
  97 004a 1A69     		ldr	r2, [r3, #16]
  98 004c 0D23     		movs	r3, #13
  99 004e FB18     		adds	r3, r7, r3
 100 0050 1A70     		strb	r2, [r3]
  45:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_bottom_coord = obj2_top_coord + object2->geo->sizey;
 101              		.loc 1 45 0
 102 0052 3B68     		ldr	r3, [r7]
 103 0054 1B68     		ldr	r3, [r3]
 104 0056 9B68     		ldr	r3, [r3, #8]
 105 0058 D9B2     		uxtb	r1, r3
 106 005a 0C23     		movs	r3, #12
 107 005c FB18     		adds	r3, r7, r3
 108 005e 0D22     		movs	r2, #13
 109 0060 BA18     		adds	r2, r7, r2
 110 0062 1278     		ldrb	r2, [r2]
 111 0064 8A18     		adds	r2, r1, r2
 112 0066 1A70     		strb	r2, [r3]
  46:C:/github/pongTest/ver1\game_logic.c **** 	
  47:C:/github/pongTest/ver1\game_logic.c **** 	uint8 value = 0;
 113              		.loc 1 47 0
 114 0068 0F23     		movs	r3, #15
 115 006a FB18     		adds	r3, r7, r3
 116 006c 0022     		movs	r2, #0
 117 006e 1A70     		strb	r2, [r3]
  48:C:/github/pongTest/ver1\game_logic.c **** 	if (obj1_top_coord >= obj2_top_coord && obj1_top_coord <= obj2_bottom_coord) {
 118              		.loc 1 48 0
 119 0070 0E23     		movs	r3, #14
 120 0072 FA18     		adds	r2, r7, r3
 121 0074 0D23     		movs	r3, #13
 122 0076 FB18     		adds	r3, r7, r3
 123 0078 1278     		ldrb	r2, [r2]
 124 007a 1B78     		ldrb	r3, [r3]
 125 007c 9A42     		cmp	r2, r3
 126 007e 0BD3     		bcc	.L5
 127              		.loc 1 48 0 is_stmt 0 discriminator 1
 128 0080 0E23     		movs	r3, #14
 129 0082 FA18     		adds	r2, r7, r3
 130 0084 0C23     		movs	r3, #12
 131 0086 FB18     		adds	r3, r7, r3
 132 0088 1278     		ldrb	r2, [r2]
 133 008a 1B78     		ldrb	r3, [r3]
 134 008c 9A42     		cmp	r2, r3
 135 008e 03D8     		bhi	.L5
  49:C:/github/pongTest/ver1\game_logic.c **** 		value = 1;
 136              		.loc 1 49 0 is_stmt 1
 137 0090 0F23     		movs	r3, #15
 138 0092 FB18     		adds	r3, r7, r3
 139 0094 0122     		movs	r2, #1
 140 0096 1A70     		strb	r2, [r3]
 141              	.L5:
  50:C:/github/pongTest/ver1\game_logic.c **** 	}
  51:C:/github/pongTest/ver1\game_logic.c **** 	
  52:C:/github/pongTest/ver1\game_logic.c **** 	return value;
 142              		.loc 1 52 0
 143 0098 0F23     		movs	r3, #15
 144 009a FB18     		adds	r3, r7, r3
 145 009c 1B78     		ldrb	r3, [r3]
  53:C:/github/pongTest/ver1\game_logic.c **** }
 146              		.loc 1 53 0
 147 009e 1800     		movs	r0, r3
 148 00a0 BD46     		mov	sp, r7
 149 00a2 04B0     		add	sp, sp, #16
 150              		@ sp needed
 151 00a4 80BD     		pop	{r7, pc}
 152              		.cfi_endproc
 153              	.LFE1:
 155 00a6 C046     		.align	2
 156              		.global	check_ball
 157              		.code	16
 158              		.thumb_func
 160              	check_ball:
 161              	.LFB2:
  54:C:/github/pongTest/ver1\game_logic.c **** 
  55:C:/github/pongTest/ver1\game_logic.c **** /*
  56:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES PLAYER_LEFT / PLAYER_RIGHT 
  57:C:/github/pongTest/ver1\game_logic.c ****  * 
  58:C:/github/pongTest/ver1\game_logic.c ****  * IF SO:		change direction of the ball in X
  59:C:/github/pongTest/ver1\game_logic.c ****  * ELSE:		do nothing
  60:C:/github/pongTest/ver1\game_logic.c ****  * 
  61:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES THE WALL TO THE LEFT / RIGHT  
  62:C:/github/pongTest/ver1\game_logic.c ****  */ 
  63:C:/github/pongTest/ver1\game_logic.c **** void check_ball(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball){
 162              		.loc 1 63 0
 163              		.cfi_startproc
 164 00a8 90B5     		push	{r4, r7, lr}
 165              		.cfi_def_cfa_offset 12
 166              		.cfi_offset 4, -12
 167              		.cfi_offset 7, -8
 168              		.cfi_offset 14, -4
 169 00aa 87B0     		sub	sp, sp, #28
 170              		.cfi_def_cfa_offset 40
 171 00ac 00AF     		add	r7, sp, #0
 172              		.cfi_def_cfa_register 7
 173 00ae F860     		str	r0, [r7, #12]
 174 00b0 B960     		str	r1, [r7, #8]
 175 00b2 7A60     		str	r2, [r7, #4]
  64:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_left = get_wall_player(playerLeft, 1);
 176              		.loc 1 64 0
 177 00b4 1723     		movs	r3, #23
 178 00b6 FC18     		adds	r4, r7, r3
 179 00b8 FB68     		ldr	r3, [r7, #12]
 180 00ba 0121     		movs	r1, #1
 181 00bc 1800     		movs	r0, r3
 182 00be FFF7FEFF 		bl	get_wall_player
 183 00c2 0300     		movs	r3, r0
 184 00c4 2370     		strb	r3, [r4]
  65:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_right = get_wall_player(playerRight, 0);
 185              		.loc 1 65 0
 186 00c6 1623     		movs	r3, #22
 187 00c8 FC18     		adds	r4, r7, r3
 188 00ca BB68     		ldr	r3, [r7, #8]
 189 00cc 0021     		movs	r1, #0
 190 00ce 1800     		movs	r0, r3
 191 00d0 FFF7FEFF 		bl	get_wall_player
 192 00d4 0300     		movs	r3, r0
 193 00d6 2370     		strb	r3, [r4]
  66:C:/github/pongTest/ver1\game_logic.c **** 	
  67:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_right_side_coord = (ball->posx + ball->geo->sizex);
 194              		.loc 1 67 0
 195 00d8 7B68     		ldr	r3, [r7, #4]
 196 00da DB68     		ldr	r3, [r3, #12]
 197 00dc D9B2     		uxtb	r1, r3
 198 00de 7B68     		ldr	r3, [r7, #4]
 199 00e0 1B68     		ldr	r3, [r3]
 200 00e2 5B68     		ldr	r3, [r3, #4]
 201 00e4 DAB2     		uxtb	r2, r3
 202 00e6 1523     		movs	r3, #21
 203 00e8 FB18     		adds	r3, r7, r3
 204 00ea 8A18     		adds	r2, r1, r2
 205 00ec 1A70     		strb	r2, [r3]
  68:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_left_side_coord = ball->posx;
 206              		.loc 1 68 0
 207 00ee 7B68     		ldr	r3, [r7, #4]
 208 00f0 DA68     		ldr	r2, [r3, #12]
 209 00f2 1423     		movs	r3, #20
 210 00f4 FB18     		adds	r3, r7, r3
 211 00f6 1A70     		strb	r2, [r3]
  69:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_top_coord = ball->posy;
 212              		.loc 1 69 0
 213 00f8 7B68     		ldr	r3, [r7, #4]
 214 00fa 1A69     		ldr	r2, [r3, #16]
 215 00fc 1323     		movs	r3, #19
 216 00fe FB18     		adds	r3, r7, r3
 217 0100 1A70     		strb	r2, [r3]
  70:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_bottom_coord = ball->posy + ball->geo->sizey;
 218              		.loc 1 70 0
 219 0102 7B68     		ldr	r3, [r7, #4]
 220 0104 1B69     		ldr	r3, [r3, #16]
 221 0106 D9B2     		uxtb	r1, r3
 222 0108 7B68     		ldr	r3, [r7, #4]
 223 010a 1B68     		ldr	r3, [r3]
 224 010c 9B68     		ldr	r3, [r3, #8]
 225 010e DAB2     		uxtb	r2, r3
 226 0110 1223     		movs	r3, #18
 227 0112 FB18     		adds	r3, r7, r3
 228 0114 8A18     		adds	r2, r1, r2
 229 0116 1A70     		strb	r2, [r3]
  71:C:/github/pongTest/ver1\game_logic.c **** 	
  72:C:/github/pongTest/ver1\game_logic.c **** // CHECK IF GOAL!!!
  73:C:/github/pongTest/ver1\game_logic.c **** 	
  74:C:/github/pongTest/ver1\game_logic.c **** 	if ( ball_right_side_coord >= 126) {
  75:C:/github/pongTest/ver1\game_logic.c **** 		// player left gets a point
  76:C:/github/pongTest/ver1\game_logic.c **** 		// update ascii-display	
  77:C:/github/pongTest/ver1\game_logic.c **** 		
  78:C:/github/pongTest/ver1\game_logic.c **** 		// start a new ball
  79:C:/github/pongTest/ver1\game_logic.c **** 		
  80:C:/github/pongTest/ver1\game_logic.c **** 		
  81:C:/github/pongTest/ver1\game_logic.c **** 	} else if (ball_left_side_coord <= 3) {
  82:C:/github/pongTest/ver1\game_logic.c **** 		
  83:C:/github/pongTest/ver1\game_logic.c **** 		// player right gets a point
  84:C:/github/pongTest/ver1\game_logic.c **** 		// update ascii-display
  85:C:/github/pongTest/ver1\game_logic.c **** 		
  86:C:/github/pongTest/ver1\game_logic.c **** 		// start a new ball
  87:C:/github/pongTest/ver1\game_logic.c **** 		
  88:C:/github/pongTest/ver1\game_logic.c **** 	} 
  89:C:/github/pongTest/ver1\game_logic.c **** 	
  90:C:/github/pongTest/ver1\game_logic.c **** // END CHECK GOAL
  91:C:/github/pongTest/ver1\game_logic.c **** 
  92:C:/github/pongTest/ver1\game_logic.c **** 
  93:C:/github/pongTest/ver1\game_logic.c **** // CHECK WALLS PLAYERS
  94:C:/github/pongTest/ver1\game_logic.c **** 	
  95:C:/github/pongTest/ver1\game_logic.c **** 	if (   ( ball_right_side_coord + 1)  == wall_player_right  ) 
 230              		.loc 1 95 0
 231 0118 1523     		movs	r3, #21
 232 011a FB18     		adds	r3, r7, r3
 233 011c 1B78     		ldrb	r3, [r3]
 234 011e 5A1C     		adds	r2, r3, #1
 235 0120 1623     		movs	r3, #22
 236 0122 FB18     		adds	r3, r7, r3
 237 0124 1B78     		ldrb	r3, [r3]
 238 0126 9A42     		cmp	r2, r3
 239 0128 16D1     		bne	.L8
  96:C:/github/pongTest/ver1\game_logic.c **** 	{ // playerRight
  97:C:/github/pongTest/ver1\game_logic.c **** 	
  98:C:/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerRight)) 
 240              		.loc 1 98 0
 241 012a BA68     		ldr	r2, [r7, #8]
 242 012c 7B68     		ldr	r3, [r7, #4]
 243 012e 1100     		movs	r1, r2
 244 0130 1800     		movs	r0, r3
 245 0132 FFF7FEFF 		bl	inside_y_wise
 246 0136 031E     		subs	r3, r0, #0
 247 0138 29D0     		beq	.L10
  99:C:/github/pongTest/ver1\game_logic.c **** 		{
 100:C:/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 248              		.loc 1 100 0
 249 013a 7B68     		ldr	r3, [r7, #4]
 250 013c 5B68     		ldr	r3, [r3, #4]
 251 013e 5A42     		rsbs	r2, r3, #0
 252 0140 7B68     		ldr	r3, [r7, #4]
 253 0142 5A60     		str	r2, [r3, #4]
 101:C:/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_right - ball->geo->sizex;
 254              		.loc 1 101 0
 255 0144 1623     		movs	r3, #22
 256 0146 FB18     		adds	r3, r7, r3
 257 0148 1A78     		ldrb	r2, [r3]
 258 014a 7B68     		ldr	r3, [r7, #4]
 259 014c 1B68     		ldr	r3, [r3]
 260 014e 5B68     		ldr	r3, [r3, #4]
 261 0150 D21A     		subs	r2, r2, r3
 262 0152 7B68     		ldr	r3, [r7, #4]
 263 0154 DA60     		str	r2, [r3, #12]
 264 0156 1AE0     		b	.L10
 265              	.L8:
 102:C:/github/pongTest/ver1\game_logic.c **** 		}
 103:C:/github/pongTest/ver1\game_logic.c **** 		
 104:C:/github/pongTest/ver1\game_logic.c **** 	} 
 105:C:/github/pongTest/ver1\game_logic.c **** 	else if (    (ball_left_side_coord - 1) == wall_player_left ) 
 266              		.loc 1 105 0
 267 0158 1423     		movs	r3, #20
 268 015a FB18     		adds	r3, r7, r3
 269 015c 1B78     		ldrb	r3, [r3]
 270 015e 5A1E     		subs	r2, r3, #1
 271 0160 1723     		movs	r3, #23
 272 0162 FB18     		adds	r3, r7, r3
 273 0164 1B78     		ldrb	r3, [r3]
 274 0166 9A42     		cmp	r2, r3
 275 0168 11D1     		bne	.L10
 106:C:/github/pongTest/ver1\game_logic.c **** 	{ // playerLeft
 107:C:/github/pongTest/ver1\game_logic.c **** 		
 108:C:/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerLeft)) 
 276              		.loc 1 108 0
 277 016a FA68     		ldr	r2, [r7, #12]
 278 016c 7B68     		ldr	r3, [r7, #4]
 279 016e 1100     		movs	r1, r2
 280 0170 1800     		movs	r0, r3
 281 0172 FFF7FEFF 		bl	inside_y_wise
 282 0176 031E     		subs	r3, r0, #0
 283 0178 09D0     		beq	.L10
 109:C:/github/pongTest/ver1\game_logic.c **** 		{
 110:C:/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 284              		.loc 1 110 0
 285 017a 7B68     		ldr	r3, [r7, #4]
 286 017c 5B68     		ldr	r3, [r3, #4]
 287 017e 5A42     		rsbs	r2, r3, #0
 288 0180 7B68     		ldr	r3, [r7, #4]
 289 0182 5A60     		str	r2, [r3, #4]
 111:C:/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_left;
 290              		.loc 1 111 0
 291 0184 1723     		movs	r3, #23
 292 0186 FB18     		adds	r3, r7, r3
 293 0188 1A78     		ldrb	r2, [r3]
 294 018a 7B68     		ldr	r3, [r7, #4]
 295 018c DA60     		str	r2, [r3, #12]
 296              	.L10:
 112:C:/github/pongTest/ver1\game_logic.c **** 		}
 113:C:/github/pongTest/ver1\game_logic.c **** 		
 114:C:/github/pongTest/ver1\game_logic.c **** 	}
 115:C:/github/pongTest/ver1\game_logic.c **** // END CHECK WALLS PLAYERS
 116:C:/github/pongTest/ver1\game_logic.c **** 	
 117:C:/github/pongTest/ver1\game_logic.c **** 	
 118:C:/github/pongTest/ver1\game_logic.c **** // CHECK FLOOR / BOTTOM
 119:C:/github/pongTest/ver1\game_logic.c **** 	if (ball_top_coord <= 2) 
 297              		.loc 1 119 0
 298 018e 1323     		movs	r3, #19
 299 0190 FB18     		adds	r3, r7, r3
 300 0192 1B78     		ldrb	r3, [r3]
 301 0194 022B     		cmp	r3, #2
 302 0196 05D8     		bhi	.L11
 120:C:/github/pongTest/ver1\game_logic.c **** 	{
 121:C:/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 303              		.loc 1 121 0
 304 0198 7B68     		ldr	r3, [r7, #4]
 305 019a 9B68     		ldr	r3, [r3, #8]
 306 019c 5A42     		rsbs	r2, r3, #0
 307 019e 7B68     		ldr	r3, [r7, #4]
 308 01a0 9A60     		str	r2, [r3, #8]
 122:C:/github/pongTest/ver1\game_logic.c **** 	} 
 123:C:/github/pongTest/ver1\game_logic.c **** 	else if( ball_bottom_coord >= 62) 
 124:C:/github/pongTest/ver1\game_logic.c **** 	{
 125:C:/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 126:C:/github/pongTest/ver1\game_logic.c **** 	}
 127:C:/github/pongTest/ver1\game_logic.c **** // END CHECK FLOOR / BOTTOM	
 128:C:/github/pongTest/ver1\game_logic.c **** 	
 129:C:/github/pongTest/ver1\game_logic.c **** 
 130:C:/github/pongTest/ver1\game_logic.c **** }
 309              		.loc 1 130 0
 310 01a2 09E0     		b	.L13
 311              	.L11:
 123:C:/github/pongTest/ver1\game_logic.c **** 	{
 312              		.loc 1 123 0
 313 01a4 1223     		movs	r3, #18
 314 01a6 FB18     		adds	r3, r7, r3
 315 01a8 1B78     		ldrb	r3, [r3]
 316 01aa 3D2B     		cmp	r3, #61
 317 01ac 04D9     		bls	.L13
 125:C:/github/pongTest/ver1\game_logic.c **** 	}
 318              		.loc 1 125 0
 319 01ae 7B68     		ldr	r3, [r7, #4]
 320 01b0 9B68     		ldr	r3, [r3, #8]
 321 01b2 5A42     		rsbs	r2, r3, #0
 322 01b4 7B68     		ldr	r3, [r7, #4]
 323 01b6 9A60     		str	r2, [r3, #8]
 324              	.L13:
 325              		.loc 1 130 0
 326 01b8 C046     		nop
 327 01ba BD46     		mov	sp, r7
 328 01bc 07B0     		add	sp, sp, #28
 329              		@ sp needed
 330 01be 90BD     		pop	{r4, r7, pc}
 331              		.cfi_endproc
 332              	.LFE2:
 334              		.align	2
 335              		.global	ping
 336              		.code	16
 337              		.thumb_func
 339              	ping:
 340              	.LFB3:
 131:C:/github/pongTest/ver1\game_logic.c **** 
 132:C:/github/pongTest/ver1\game_logic.c **** 
 133:C:/github/pongTest/ver1\game_logic.c **** /* 
 134:C:/github/pongTest/ver1\game_logic.c ****  * UPDATE THE POSITION OF THE BALL
 135:C:/github/pongTest/ver1\game_logic.c ****  * IF GOAL, 
 136:C:/github/pongTest/ver1\game_logic.c ****  * 						PRINT SCORE TO THE PLAYER 
 137:C:/github/pongTest/ver1\game_logic.c ****  * IF KEYBOARD_PRESSED, 
 138:C:/github/pongTest/ver1\game_logic.c ****  * 						MOVE THE PLAYER
 139:C:/github/pongTest/ver1\game_logic.c ****  * RENDER THE SCREEN
 140:C:/github/pongTest/ver1\game_logic.c ****  */ 
 141:C:/github/pongTest/ver1\game_logic.c **** void ping(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball) {
 341              		.loc 1 141 0
 342              		.cfi_startproc
 343 01c0 80B5     		push	{r7, lr}
 344              		.cfi_def_cfa_offset 8
 345              		.cfi_offset 7, -8
 346              		.cfi_offset 14, -4
 347 01c2 84B0     		sub	sp, sp, #16
 348              		.cfi_def_cfa_offset 24
 349 01c4 00AF     		add	r7, sp, #0
 350              		.cfi_def_cfa_register 7
 351 01c6 F860     		str	r0, [r7, #12]
 352 01c8 B960     		str	r1, [r7, #8]
 353 01ca 7A60     		str	r2, [r7, #4]
 142:C:/github/pongTest/ver1\game_logic.c **** 	// check the postion of the ball related to the players / walls -> change direction if collision /
 143:C:/github/pongTest/ver1\game_logic.c **** 	check_ball(playerLeft, playerRight, ball);				
 354              		.loc 1 143 0
 355 01cc 7A68     		ldr	r2, [r7, #4]
 356 01ce B968     		ldr	r1, [r7, #8]
 357 01d0 FB68     		ldr	r3, [r7, #12]
 358 01d2 1800     		movs	r0, r3
 359 01d4 FFF7FEFF 		bl	check_ball
 144:C:/github/pongTest/ver1\game_logic.c **** 	
 145:C:/github/pongTest/ver1\game_logic.c **** 	ball->move(ball);
 360              		.loc 1 145 0
 361 01d8 7B68     		ldr	r3, [r7, #4]
 362 01da DB69     		ldr	r3, [r3, #28]
 363 01dc 7A68     		ldr	r2, [r7, #4]
 364 01de 1000     		movs	r0, r2
 365 01e0 9847     		blx	r3
 146:C:/github/pongTest/ver1\game_logic.c **** 	
 147:C:/github/pongTest/ver1\game_logic.c **** 	// read keyboard left
 148:C:/github/pongTest/ver1\game_logic.c **** 	// if:		 2_IS_PRESSED 
 149:C:/github/pongTest/ver1\game_logic.c **** 	//					playerLeft->set_speed(0,1);
 150:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 151:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 152:C:/github/pongTest/ver1\game_logic.c **** 	// else if:	 0_IS_PRESSED 
 153:C:/github/pongTest/ver1\game_logic.c **** 	//					playerLeft->set_speed(0,-1);
 154:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 155:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 156:C:/github/pongTest/ver1\game_logic.c **** 	
 157:C:/github/pongTest/ver1\game_logic.c **** 	// read keyboard right
 158:C:/github/pongTest/ver1\game_logic.c **** 	// if:		2_IS_PRESSED 
 159:C:/github/pongTest/ver1\game_logic.c **** 	//					playerRight->set_speed(0,1);
 160:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 161:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 162:C:/github/pongTest/ver1\game_logic.c **** 	// else if:	 0_IS_PRESSED 
 163:C:/github/pongTest/ver1\game_logic.c **** 	//					playerRight->set_speed(0,-1);
 164:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 165:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 166:C:/github/pongTest/ver1\game_logic.c **** 	
 167:C:/github/pongTest/ver1\game_logic.c **** 	
 168:C:/github/pongTest/ver1\game_logic.c **** }...
 366              		.loc 1 168 0
 367 01e2 C046     		nop
 368 01e4 BD46     		mov	sp, r7
 369 01e6 04B0     		add	sp, sp, #16
 370              		@ sp needed
 371 01e8 80BD     		pop	{r7, pc}
 372              		.cfi_endproc
 373              	.LFE3:
 375              	.Letext0:
 376              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 377              		.file 3 "C:/github/pongTest/ver1/geometry.h"
