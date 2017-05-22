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
  22:C:/github/pongTest/ver1\game_logic.c **** uint32 get_wall_player(P_OBJECT player, uint8 isLeftWall) {
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
  28:C:/github/pongTest/ver1\game_logic.c **** 		// else add size of player
  29:C:/github/pongTest/ver1\game_logic.c **** 		x += player->geo->sizex;
  50              		.loc 1 29 0
  51 001c 7B68     		ldr	r3, [r7, #4]
  52 001e 1B68     		ldr	r3, [r3]
  53 0020 5B68     		ldr	r3, [r3, #4]
  54 0022 FA68     		ldr	r2, [r7, #12]
  55 0024 D318     		adds	r3, r2, r3
  56 0026 FB60     		str	r3, [r7, #12]
  57              	.L2:
  30:C:/github/pongTest/ver1\game_logic.c **** 	} else {
  31:C:/github/pongTest/ver1\game_logic.c **** 		// do nothing 
  32:C:/github/pongTest/ver1\game_logic.c **** 	}
  33:C:/github/pongTest/ver1\game_logic.c **** 	return x;
  58              		.loc 1 33 0
  59 0028 FB68     		ldr	r3, [r7, #12]
  34:C:/github/pongTest/ver1\game_logic.c **** }
  60              		.loc 1 34 0
  61 002a 1800     		movs	r0, r3
  62 002c BD46     		mov	sp, r7
  63 002e 04B0     		add	sp, sp, #16
  64              		@ sp needed
  65 0030 80BD     		pop	{r7, pc}
  66              		.cfi_endproc
  67              	.LFE0:
  69 0032 C046     		.align	2
  70              		.global	check_ball_players
  71              		.code	16
  72              		.thumb_func
  74              	check_ball_players:
  75              	.LFB1:
  35:C:/github/pongTest/ver1\game_logic.c **** 
  36:C:/github/pongTest/ver1\game_logic.c **** 
  37:C:/github/pongTest/ver1\game_logic.c **** /*
  38:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES PLAYER_LEFT / PLAYER_RIGHT 
  39:C:/github/pongTest/ver1\game_logic.c ****  * 
  40:C:/github/pongTest/ver1\game_logic.c ****  * IF SO:		change direction of the ball in X
  41:C:/github/pongTest/ver1\game_logic.c ****  * ELSE:		do nothing
  42:C:/github/pongTest/ver1\game_logic.c ****  * 
  43:C:/github/pongTest/ver1\game_logic.c ****  */ 
  44:C:/github/pongTest/ver1\game_logic.c **** void check_ball_players(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball){
  76              		.loc 1 44 0
  77              		.cfi_startproc
  78 0034 80B5     		push	{r7, lr}
  79              		.cfi_def_cfa_offset 8
  80              		.cfi_offset 7, -8
  81              		.cfi_offset 14, -4
  82 0036 86B0     		sub	sp, sp, #24
  83              		.cfi_def_cfa_offset 32
  84 0038 00AF     		add	r7, sp, #0
  85              		.cfi_def_cfa_register 7
  86 003a F860     		str	r0, [r7, #12]
  87 003c B960     		str	r1, [r7, #8]
  88 003e 7A60     		str	r2, [r7, #4]
  45:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_left = get_wall_player(playerLeft, 1);
  89              		.loc 1 45 0
  90 0040 FB68     		ldr	r3, [r7, #12]
  91 0042 0121     		movs	r1, #1
  92 0044 1800     		movs	r0, r3
  93 0046 FFF7FEFF 		bl	get_wall_player
  94 004a 0200     		movs	r2, r0
  95 004c 1723     		movs	r3, #23
  96 004e FB18     		adds	r3, r7, r3
  97 0050 1A70     		strb	r2, [r3]
  46:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_right = get_wall_player(playerLeft, 0);
  98              		.loc 1 46 0
  99 0052 FB68     		ldr	r3, [r7, #12]
 100 0054 0021     		movs	r1, #0
 101 0056 1800     		movs	r0, r3
 102 0058 FFF7FEFF 		bl	get_wall_player
 103 005c 0200     		movs	r2, r0
 104 005e 1623     		movs	r3, #22
 105 0060 FB18     		adds	r3, r7, r3
 106 0062 1A70     		strb	r2, [r3]
  47:C:/github/pongTest/ver1\game_logic.c **** 	
  48:C:/github/pongTest/ver1\game_logic.c **** 	if (   ( (ball->posx + ball->geo->sizex) + 1)  == wall_player_right  ) {
 107              		.loc 1 48 0
 108 0064 7B68     		ldr	r3, [r7, #4]
 109 0066 DA68     		ldr	r2, [r3, #12]
 110 0068 7B68     		ldr	r3, [r7, #4]
 111 006a 1B68     		ldr	r3, [r3]
 112 006c 5B68     		ldr	r3, [r3, #4]
 113 006e D318     		adds	r3, r2, r3
 114 0070 5A1C     		adds	r2, r3, #1
 115 0072 1623     		movs	r3, #22
 116 0074 FB18     		adds	r3, r7, r3
 117 0076 1B78     		ldrb	r3, [r3]
 118 0078 9A42     		cmp	r2, r3
 119 007a 05D1     		bne	.L5
  49:C:/github/pongTest/ver1\game_logic.c **** 		ball->dirx = -(ball->dirx);
 120              		.loc 1 49 0
 121 007c 7B68     		ldr	r3, [r7, #4]
 122 007e 5B68     		ldr	r3, [r3, #4]
 123 0080 5A42     		rsbs	r2, r3, #0
 124 0082 7B68     		ldr	r3, [r7, #4]
 125 0084 5A60     		str	r2, [r3, #4]
  50:C:/github/pongTest/ver1\game_logic.c **** 	} else if (    ( ball->posx - 1) == wall_player_left ) {
  51:C:/github/pongTest/ver1\game_logic.c **** 		ball->dirx = -(ball->dirx);
  52:C:/github/pongTest/ver1\game_logic.c **** 	} else {
  53:C:/github/pongTest/ver1\game_logic.c **** 		// do nothing 
  54:C:/github/pongTest/ver1\game_logic.c **** 	}
  55:C:/github/pongTest/ver1\game_logic.c **** 
  56:C:/github/pongTest/ver1\game_logic.c **** }
 126              		.loc 1 56 0
 127 0086 0CE0     		b	.L7
 128              	.L5:
  50:C:/github/pongTest/ver1\game_logic.c **** 	} else if (    ( ball->posx - 1) == wall_player_left ) {
 129              		.loc 1 50 0
 130 0088 7B68     		ldr	r3, [r7, #4]
 131 008a DB68     		ldr	r3, [r3, #12]
 132 008c 5A1E     		subs	r2, r3, #1
 133 008e 1723     		movs	r3, #23
 134 0090 FB18     		adds	r3, r7, r3
 135 0092 1B78     		ldrb	r3, [r3]
 136 0094 9A42     		cmp	r2, r3
 137 0096 04D1     		bne	.L7
  51:C:/github/pongTest/ver1\game_logic.c **** 	} else {
 138              		.loc 1 51 0
 139 0098 7B68     		ldr	r3, [r7, #4]
 140 009a 5B68     		ldr	r3, [r3, #4]
 141 009c 5A42     		rsbs	r2, r3, #0
 142 009e 7B68     		ldr	r3, [r7, #4]
 143 00a0 5A60     		str	r2, [r3, #4]
 144              	.L7:
 145              		.loc 1 56 0
 146 00a2 C046     		nop
 147 00a4 BD46     		mov	sp, r7
 148 00a6 06B0     		add	sp, sp, #24
 149              		@ sp needed
 150 00a8 80BD     		pop	{r7, pc}
 151              		.cfi_endproc
 152              	.LFE1:
 154 00aa C046     		.align	2
 155              		.global	ping
 156              		.code	16
 157              		.thumb_func
 159              	ping:
 160              	.LFB2:
  57:C:/github/pongTest/ver1\game_logic.c **** 
  58:C:/github/pongTest/ver1\game_logic.c **** 
  59:C:/github/pongTest/ver1\game_logic.c **** /* 
  60:C:/github/pongTest/ver1\game_logic.c ****  * UPDATE THE POSITION OF THE BALL
  61:C:/github/pongTest/ver1\game_logic.c ****  * IF GOAL, 
  62:C:/github/pongTest/ver1\game_logic.c ****  * 						PRINT SCORE TO THE PLAYER 
  63:C:/github/pongTest/ver1\game_logic.c ****  * IF KEYBOARD_PRESSED, 
  64:C:/github/pongTest/ver1\game_logic.c ****  * 						MOVE THE PLAYER
  65:C:/github/pongTest/ver1\game_logic.c ****  * RENDER THE SCREEN
  66:C:/github/pongTest/ver1\game_logic.c ****  */ 
  67:C:/github/pongTest/ver1\game_logic.c **** void ping(P_OBJECT playerLeft, P_OBJECT playerRight, P_OBJECT ball) {
 161              		.loc 1 67 0
 162              		.cfi_startproc
 163 00ac 80B5     		push	{r7, lr}
 164              		.cfi_def_cfa_offset 8
 165              		.cfi_offset 7, -8
 166              		.cfi_offset 14, -4
 167 00ae 84B0     		sub	sp, sp, #16
 168              		.cfi_def_cfa_offset 24
 169 00b0 00AF     		add	r7, sp, #0
 170              		.cfi_def_cfa_register 7
 171 00b2 F860     		str	r0, [r7, #12]
 172 00b4 B960     		str	r1, [r7, #8]
 173 00b6 7A60     		str	r2, [r7, #4]
  68:C:/github/pongTest/ver1\game_logic.c **** 	check_ball_players(playerLeft, playerRight, ball);				// check the postion of the ball related to 
 174              		.loc 1 68 0
 175 00b8 7A68     		ldr	r2, [r7, #4]
 176 00ba B968     		ldr	r1, [r7, #8]
 177 00bc FB68     		ldr	r3, [r7, #12]
 178 00be 1800     		movs	r0, r3
 179 00c0 FFF7FEFF 		bl	check_ball_players
  69:C:/github/pongTest/ver1\game_logic.c **** 	
  70:C:/github/pongTest/ver1\game_logic.c **** }...
 180              		.loc 1 70 0
 181 00c4 C046     		nop
 182 00c6 BD46     		mov	sp, r7
 183 00c8 04B0     		add	sp, sp, #16
 184              		@ sp needed
 185 00ca 80BD     		pop	{r7, pc}
 186              		.cfi_endproc
 187              	.LFE2:
 189              	.Letext0:
 190              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 191              		.file 3 "C:/github/pongTest/ver1/geometry.h"
