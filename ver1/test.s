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
  15:C:/github/pongTest/ver1\game_logic.c **** 
  16:C:/github/pongTest/ver1\game_logic.c **** void update_ascii_display(char textTop[], char textBottom[]) 
  17:C:/github/pongTest/ver1\game_logic.c **** {
  27              		.loc 1 17 0
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
  18:C:/github/pongTest/ver1\game_logic.c **** 	char *str;
  19:C:/github/pongTest/ver1\game_logic.c **** 	
  20:C:/github/pongTest/ver1\game_logic.c **** 	ascii_gotoxt(1,1);
  39              		.loc 1 20 0
  40 000a 0121     		movs	r1, #1
  41 000c 0120     		movs	r0, #1
  42 000e FFF7FEFF 		bl	ascii_gotoxt
  21:C:/github/pongTest/ver1\game_logic.c **** 	
  22:C:/github/pongTest/ver1\game_logic.c **** 	str = textTop;
  43              		.loc 1 22 0
  44 0012 7B68     		ldr	r3, [r7, #4]
  45 0014 FB60     		str	r3, [r7, #12]
  23:C:/github/pongTest/ver1\game_logic.c **** 	
  24:C:/github/pongTest/ver1\game_logic.c **** 	while(*str) {
  46              		.loc 1 24 0
  47 0016 06E0     		b	.L2
  48              	.L3:
  25:C:/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  49              		.loc 1 25 0
  50 0018 FB68     		ldr	r3, [r7, #12]
  51 001a 5A1C     		adds	r2, r3, #1
  52 001c FA60     		str	r2, [r7, #12]
  53 001e 1B78     		ldrb	r3, [r3]
  54 0020 1800     		movs	r0, r3
  55 0022 FFF7FEFF 		bl	ascii_write_char
  56              	.L2:
  24:C:/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  57              		.loc 1 24 0
  58 0026 FB68     		ldr	r3, [r7, #12]
  59 0028 1B78     		ldrb	r3, [r3]
  60 002a 002B     		cmp	r3, #0
  61 002c F4D1     		bne	.L3
  26:C:/github/pongTest/ver1\game_logic.c **** 	}
  27:C:/github/pongTest/ver1\game_logic.c **** 	ascii_gotoxt(1,2);
  62              		.loc 1 27 0
  63 002e 0221     		movs	r1, #2
  64 0030 0120     		movs	r0, #1
  65 0032 FFF7FEFF 		bl	ascii_gotoxt
  28:C:/github/pongTest/ver1\game_logic.c **** 	str = textBottom;
  66              		.loc 1 28 0
  67 0036 3B68     		ldr	r3, [r7]
  68 0038 FB60     		str	r3, [r7, #12]
  29:C:/github/pongTest/ver1\game_logic.c **** 	
  30:C:/github/pongTest/ver1\game_logic.c **** 	while(*str) {
  69              		.loc 1 30 0
  70 003a 06E0     		b	.L4
  71              	.L5:
  31:C:/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  72              		.loc 1 31 0
  73 003c FB68     		ldr	r3, [r7, #12]
  74 003e 5A1C     		adds	r2, r3, #1
  75 0040 FA60     		str	r2, [r7, #12]
  76 0042 1B78     		ldrb	r3, [r3]
  77 0044 1800     		movs	r0, r3
  78 0046 FFF7FEFF 		bl	ascii_write_char
  79              	.L4:
  30:C:/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  80              		.loc 1 30 0
  81 004a FB68     		ldr	r3, [r7, #12]
  82 004c 1B78     		ldrb	r3, [r3]
  83 004e 002B     		cmp	r3, #0
  84 0050 F4D1     		bne	.L5
  32:C:/github/pongTest/ver1\game_logic.c **** 	}
  33:C:/github/pongTest/ver1\game_logic.c **** }
  85              		.loc 1 33 0
  86 0052 C046     		nop
  87 0054 BD46     		mov	sp, r7
  88 0056 04B0     		add	sp, sp, #16
  89              		@ sp needed
  90 0058 80BD     		pop	{r7, pc}
  91              		.cfi_endproc
  92              	.LFE0:
  94 005a C046     		.align	2
  95              		.global	update_score
  96              		.code	16
  97              		.thumb_func
  99              	update_score:
 100              	.LFB1:
  34:C:/github/pongTest/ver1\game_logic.c **** 
  35:C:/github/pongTest/ver1\game_logic.c **** void update_score(P_PLAYER p1, P_PLAYER p2) 
  36:C:/github/pongTest/ver1\game_logic.c **** {
 101              		.loc 1 36 0
 102              		.cfi_startproc
 103 005c 80B5     		push	{r7, lr}
 104              		.cfi_def_cfa_offset 8
 105              		.cfi_offset 7, -8
 106              		.cfi_offset 14, -4
 107 005e 8CB0     		sub	sp, sp, #48
 108              		.cfi_def_cfa_offset 56
 109 0060 00AF     		add	r7, sp, #0
 110              		.cfi_def_cfa_register 7
 111 0062 7860     		str	r0, [r7, #4]
 112 0064 3960     		str	r1, [r7]
  37:C:/github/pongTest/ver1\game_logic.c **** 	char score1 = (char) (p1->score);
 113              		.loc 1 37 0
 114 0066 2F23     		movs	r3, #47
 115 0068 FB18     		adds	r3, r7, r3
 116 006a 7A68     		ldr	r2, [r7, #4]
 117 006c 1279     		ldrb	r2, [r2, #4]
 118 006e 1A70     		strb	r2, [r3]
  38:C:/github/pongTest/ver1\game_logic.c **** 	char score2 = (char) (p2->score);
 119              		.loc 1 38 0
 120 0070 2E23     		movs	r3, #46
 121 0072 FB18     		adds	r3, r7, r3
 122 0074 3A68     		ldr	r2, [r7]
 123 0076 1279     		ldrb	r2, [r2, #4]
 124 0078 1A70     		strb	r2, [r3]
  39:C:/github/pongTest/ver1\game_logic.c **** 	
  40:C:/github/pongTest/ver1\game_logic.c **** 	char p1_text[] = {'S','c','o','r','e',' ','l','e','f','t',' ','i','s',':',' ',' ',score1,'\0'};	
 125              		.loc 1 40 0
 126 007a 1C23     		movs	r3, #28
 127 007c FB18     		adds	r3, r7, r3
 128 007e 5322     		movs	r2, #83
 129 0080 1A70     		strb	r2, [r3]
 130 0082 1C23     		movs	r3, #28
 131 0084 FB18     		adds	r3, r7, r3
 132 0086 6322     		movs	r2, #99
 133 0088 5A70     		strb	r2, [r3, #1]
 134 008a 1C23     		movs	r3, #28
 135 008c FB18     		adds	r3, r7, r3
 136 008e 6F22     		movs	r2, #111
 137 0090 9A70     		strb	r2, [r3, #2]
 138 0092 1C23     		movs	r3, #28
 139 0094 FB18     		adds	r3, r7, r3
 140 0096 7222     		movs	r2, #114
 141 0098 DA70     		strb	r2, [r3, #3]
 142 009a 1C23     		movs	r3, #28
 143 009c FB18     		adds	r3, r7, r3
 144 009e 6522     		movs	r2, #101
 145 00a0 1A71     		strb	r2, [r3, #4]
 146 00a2 1C23     		movs	r3, #28
 147 00a4 FB18     		adds	r3, r7, r3
 148 00a6 2022     		movs	r2, #32
 149 00a8 5A71     		strb	r2, [r3, #5]
 150 00aa 1C23     		movs	r3, #28
 151 00ac FB18     		adds	r3, r7, r3
 152 00ae 6C22     		movs	r2, #108
 153 00b0 9A71     		strb	r2, [r3, #6]
 154 00b2 1C23     		movs	r3, #28
 155 00b4 FB18     		adds	r3, r7, r3
 156 00b6 6522     		movs	r2, #101
 157 00b8 DA71     		strb	r2, [r3, #7]
 158 00ba 1C23     		movs	r3, #28
 159 00bc FB18     		adds	r3, r7, r3
 160 00be 6622     		movs	r2, #102
 161 00c0 1A72     		strb	r2, [r3, #8]
 162 00c2 1C23     		movs	r3, #28
 163 00c4 FB18     		adds	r3, r7, r3
 164 00c6 7422     		movs	r2, #116
 165 00c8 5A72     		strb	r2, [r3, #9]
 166 00ca 1C23     		movs	r3, #28
 167 00cc FB18     		adds	r3, r7, r3
 168 00ce 2022     		movs	r2, #32
 169 00d0 9A72     		strb	r2, [r3, #10]
 170 00d2 1C23     		movs	r3, #28
 171 00d4 FB18     		adds	r3, r7, r3
 172 00d6 6922     		movs	r2, #105
 173 00d8 DA72     		strb	r2, [r3, #11]
 174 00da 1C23     		movs	r3, #28
 175 00dc FB18     		adds	r3, r7, r3
 176 00de 7322     		movs	r2, #115
 177 00e0 1A73     		strb	r2, [r3, #12]
 178 00e2 1C23     		movs	r3, #28
 179 00e4 FB18     		adds	r3, r7, r3
 180 00e6 3A22     		movs	r2, #58
 181 00e8 5A73     		strb	r2, [r3, #13]
 182 00ea 1C23     		movs	r3, #28
 183 00ec FB18     		adds	r3, r7, r3
 184 00ee 2022     		movs	r2, #32
 185 00f0 9A73     		strb	r2, [r3, #14]
 186 00f2 1C23     		movs	r3, #28
 187 00f4 FB18     		adds	r3, r7, r3
 188 00f6 2022     		movs	r2, #32
 189 00f8 DA73     		strb	r2, [r3, #15]
 190 00fa 1C23     		movs	r3, #28
 191 00fc FB18     		adds	r3, r7, r3
 192 00fe 2F22     		movs	r2, #47
 193 0100 BA18     		adds	r2, r7, r2
 194 0102 1278     		ldrb	r2, [r2]
 195 0104 1A74     		strb	r2, [r3, #16]
 196 0106 1C23     		movs	r3, #28
 197 0108 FB18     		adds	r3, r7, r3
 198 010a 0022     		movs	r2, #0
 199 010c 5A74     		strb	r2, [r3, #17]
  41:C:/github/pongTest/ver1\game_logic.c **** 	char p2_text[] = {'S','c','o','r','e',' ','r','i','g','h','t',' ','i','s',':',' ',score2,'\0'};
 200              		.loc 1 41 0
 201 010e 0823     		movs	r3, #8
 202 0110 FB18     		adds	r3, r7, r3
 203 0112 5322     		movs	r2, #83
 204 0114 1A70     		strb	r2, [r3]
 205 0116 0823     		movs	r3, #8
 206 0118 FB18     		adds	r3, r7, r3
 207 011a 6322     		movs	r2, #99
 208 011c 5A70     		strb	r2, [r3, #1]
 209 011e 0823     		movs	r3, #8
 210 0120 FB18     		adds	r3, r7, r3
 211 0122 6F22     		movs	r2, #111
 212 0124 9A70     		strb	r2, [r3, #2]
 213 0126 0823     		movs	r3, #8
 214 0128 FB18     		adds	r3, r7, r3
 215 012a 7222     		movs	r2, #114
 216 012c DA70     		strb	r2, [r3, #3]
 217 012e 0823     		movs	r3, #8
 218 0130 FB18     		adds	r3, r7, r3
 219 0132 6522     		movs	r2, #101
 220 0134 1A71     		strb	r2, [r3, #4]
 221 0136 0823     		movs	r3, #8
 222 0138 FB18     		adds	r3, r7, r3
 223 013a 2022     		movs	r2, #32
 224 013c 5A71     		strb	r2, [r3, #5]
 225 013e 0823     		movs	r3, #8
 226 0140 FB18     		adds	r3, r7, r3
 227 0142 7222     		movs	r2, #114
 228 0144 9A71     		strb	r2, [r3, #6]
 229 0146 0823     		movs	r3, #8
 230 0148 FB18     		adds	r3, r7, r3
 231 014a 6922     		movs	r2, #105
 232 014c DA71     		strb	r2, [r3, #7]
 233 014e 0823     		movs	r3, #8
 234 0150 FB18     		adds	r3, r7, r3
 235 0152 6722     		movs	r2, #103
 236 0154 1A72     		strb	r2, [r3, #8]
 237 0156 0823     		movs	r3, #8
 238 0158 FB18     		adds	r3, r7, r3
 239 015a 6822     		movs	r2, #104
 240 015c 5A72     		strb	r2, [r3, #9]
 241 015e 0823     		movs	r3, #8
 242 0160 FB18     		adds	r3, r7, r3
 243 0162 7422     		movs	r2, #116
 244 0164 9A72     		strb	r2, [r3, #10]
 245 0166 0823     		movs	r3, #8
 246 0168 FB18     		adds	r3, r7, r3
 247 016a 2022     		movs	r2, #32
 248 016c DA72     		strb	r2, [r3, #11]
 249 016e 0823     		movs	r3, #8
 250 0170 FB18     		adds	r3, r7, r3
 251 0172 6922     		movs	r2, #105
 252 0174 1A73     		strb	r2, [r3, #12]
 253 0176 0823     		movs	r3, #8
 254 0178 FB18     		adds	r3, r7, r3
 255 017a 7322     		movs	r2, #115
 256 017c 5A73     		strb	r2, [r3, #13]
 257 017e 0823     		movs	r3, #8
 258 0180 FB18     		adds	r3, r7, r3
 259 0182 3A22     		movs	r2, #58
 260 0184 9A73     		strb	r2, [r3, #14]
 261 0186 0823     		movs	r3, #8
 262 0188 FB18     		adds	r3, r7, r3
 263 018a 2022     		movs	r2, #32
 264 018c DA73     		strb	r2, [r3, #15]
 265 018e 0823     		movs	r3, #8
 266 0190 FB18     		adds	r3, r7, r3
 267 0192 2E22     		movs	r2, #46
 268 0194 BA18     		adds	r2, r7, r2
 269 0196 1278     		ldrb	r2, [r2]
 270 0198 1A74     		strb	r2, [r3, #16]
 271 019a 0823     		movs	r3, #8
 272 019c FB18     		adds	r3, r7, r3
 273 019e 0022     		movs	r2, #0
 274 01a0 5A74     		strb	r2, [r3, #17]
  42:C:/github/pongTest/ver1\game_logic.c **** 	
  43:C:/github/pongTest/ver1\game_logic.c **** 	update_ascii_display(p1_text, p2_text);
 275              		.loc 1 43 0
 276 01a2 0823     		movs	r3, #8
 277 01a4 FA18     		adds	r2, r7, r3
 278 01a6 1C23     		movs	r3, #28
 279 01a8 FB18     		adds	r3, r7, r3
 280 01aa 1100     		movs	r1, r2
 281 01ac 1800     		movs	r0, r3
 282 01ae FFF7FEFF 		bl	update_ascii_display
  44:C:/github/pongTest/ver1\game_logic.c **** }
 283              		.loc 1 44 0
 284 01b2 C046     		nop
 285 01b4 BD46     		mov	sp, r7
 286 01b6 0CB0     		add	sp, sp, #48
 287              		@ sp needed
 288 01b8 80BD     		pop	{r7, pc}
 289              		.cfi_endproc
 290              	.LFE1:
 292 01ba C046     		.align	2
 293              		.global	get_wall_player
 294              		.code	16
 295              		.thumb_func
 297              	get_wall_player:
 298              	.LFB2:
  45:C:/github/pongTest/ver1\game_logic.c **** 
  46:C:/github/pongTest/ver1\game_logic.c **** /*
  47:C:/github/pongTest/ver1\game_logic.c ****  * GET THE POSITION OF THE PLAYER
  48:C:/github/pongTest/ver1\game_logic.c ****  * 
  49:C:/github/pongTest/ver1\game_logic.c ****  * IF isLeftWall == 0:			do nothing 
  50:C:/github/pongTest/ver1\game_logic.c ****  * ELSE IF isLeft == 1:			add the size of x to the position
  51:C:/github/pongTest/ver1\game_logic.c ****  * 
  52:C:/github/pongTest/ver1\game_logic.c ****  * RETURN THE POSITION IN X
  53:C:/github/pongTest/ver1\game_logic.c ****  */ 
  54:C:/github/pongTest/ver1\game_logic.c **** uint8 get_wall_player(P_OBJECT player, uint8 isLeftWall) {
 299              		.loc 1 54 0
 300              		.cfi_startproc
 301 01bc 80B5     		push	{r7, lr}
 302              		.cfi_def_cfa_offset 8
 303              		.cfi_offset 7, -8
 304              		.cfi_offset 14, -4
 305 01be 84B0     		sub	sp, sp, #16
 306              		.cfi_def_cfa_offset 24
 307 01c0 00AF     		add	r7, sp, #0
 308              		.cfi_def_cfa_register 7
 309 01c2 7860     		str	r0, [r7, #4]
 310 01c4 0A00     		movs	r2, r1
 311 01c6 FB1C     		adds	r3, r7, #3
 312 01c8 1A70     		strb	r2, [r3]
  55:C:/github/pongTest/ver1\game_logic.c **** 	uint32 x;
  56:C:/github/pongTest/ver1\game_logic.c **** 	
  57:C:/github/pongTest/ver1\game_logic.c **** 	x = player->posx;
 313              		.loc 1 57 0
 314 01ca 7B68     		ldr	r3, [r7, #4]
 315 01cc DB68     		ldr	r3, [r3, #12]
 316 01ce FB60     		str	r3, [r7, #12]
  58:C:/github/pongTest/ver1\game_logic.c **** 	
  59:C:/github/pongTest/ver1\game_logic.c **** 	if(isLeftWall != 0) {
 317              		.loc 1 59 0
 318 01d0 FB1C     		adds	r3, r7, #3
 319 01d2 1B78     		ldrb	r3, [r3]
 320 01d4 002B     		cmp	r3, #0
 321 01d6 05D0     		beq	.L8
  60:C:/github/pongTest/ver1\game_logic.c **** 		// if isLeftWall non-zero add size of player
  61:C:/github/pongTest/ver1\game_logic.c **** 		x += player->geo->sizex;
 322              		.loc 1 61 0
 323 01d8 7B68     		ldr	r3, [r7, #4]
 324 01da 1B68     		ldr	r3, [r3]
 325 01dc 5B68     		ldr	r3, [r3, #4]
 326 01de FA68     		ldr	r2, [r7, #12]
 327 01e0 D318     		adds	r3, r2, r3
 328 01e2 FB60     		str	r3, [r7, #12]
 329              	.L8:
  62:C:/github/pongTest/ver1\game_logic.c **** 	}
  63:C:/github/pongTest/ver1\game_logic.c **** 	return x;
 330              		.loc 1 63 0
 331 01e4 FB68     		ldr	r3, [r7, #12]
 332 01e6 DBB2     		uxtb	r3, r3
  64:C:/github/pongTest/ver1\game_logic.c **** }
 333              		.loc 1 64 0
 334 01e8 1800     		movs	r0, r3
 335 01ea BD46     		mov	sp, r7
 336 01ec 04B0     		add	sp, sp, #16
 337              		@ sp needed
 338 01ee 80BD     		pop	{r7, pc}
 339              		.cfi_endproc
 340              	.LFE2:
 342              		.align	2
 343              		.global	inside_y_wise
 344              		.code	16
 345              		.thumb_func
 347              	inside_y_wise:
 348              	.LFB3:
  65:C:/github/pongTest/ver1\game_logic.c **** 
  66:C:/github/pongTest/ver1\game_logic.c **** /*
  67:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF OBJECT1 IS INSIDE OBEJCT2 Y - WISE
  68:C:/github/pongTest/ver1\game_logic.c ****  * 
  69:C:/github/pongTest/ver1\game_logic.c ****  * IF SO:		RETURN 1
  70:C:/github/pongTest/ver1\game_logic.c ****  * ELSE:		RETURN 0
  71:C:/github/pongTest/ver1\game_logic.c ****  * 
  72:C:/github/pongTest/ver1\game_logic.c ****  */ 
  73:C:/github/pongTest/ver1\game_logic.c **** uint8 inside_y_wise(P_OBJECT object1, P_OBJECT object2) {
 349              		.loc 1 73 0
 350              		.cfi_startproc
 351 01f0 80B5     		push	{r7, lr}
 352              		.cfi_def_cfa_offset 8
 353              		.cfi_offset 7, -8
 354              		.cfi_offset 14, -4
 355 01f2 84B0     		sub	sp, sp, #16
 356              		.cfi_def_cfa_offset 24
 357 01f4 00AF     		add	r7, sp, #0
 358              		.cfi_def_cfa_register 7
 359 01f6 7860     		str	r0, [r7, #4]
 360 01f8 3960     		str	r1, [r7]
  74:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj1_top_coord = object1->posy;
 361              		.loc 1 74 0
 362 01fa 7B68     		ldr	r3, [r7, #4]
 363 01fc 1A69     		ldr	r2, [r3, #16]
 364 01fe 0E23     		movs	r3, #14
 365 0200 FB18     		adds	r3, r7, r3
 366 0202 1A70     		strb	r2, [r3]
  75:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 367              		.loc 1 75 0
 368 0204 FFF7FEFF 		bl	delay_250ns
  76:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_top_coord = object2->posy;
 369              		.loc 1 76 0
 370 0208 3B68     		ldr	r3, [r7]
 371 020a 1A69     		ldr	r2, [r3, #16]
 372 020c 0D23     		movs	r3, #13
 373 020e FB18     		adds	r3, r7, r3
 374 0210 1A70     		strb	r2, [r3]
  77:C:/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_bottom_coord = obj2_top_coord + object2->geo->sizey;
 375              		.loc 1 77 0
 376 0212 3B68     		ldr	r3, [r7]
 377 0214 1B68     		ldr	r3, [r3]
 378 0216 9B68     		ldr	r3, [r3, #8]
 379 0218 D9B2     		uxtb	r1, r3
 380 021a 0C23     		movs	r3, #12
 381 021c FB18     		adds	r3, r7, r3
 382 021e 0D22     		movs	r2, #13
 383 0220 BA18     		adds	r2, r7, r2
 384 0222 1278     		ldrb	r2, [r2]
 385 0224 8A18     		adds	r2, r1, r2
 386 0226 1A70     		strb	r2, [r3]
  78:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 387              		.loc 1 78 0
 388 0228 FFF7FEFF 		bl	delay_250ns
  79:C:/github/pongTest/ver1\game_logic.c **** 	uint8 value = 0;
 389              		.loc 1 79 0
 390 022c 0F23     		movs	r3, #15
 391 022e FB18     		adds	r3, r7, r3
 392 0230 0022     		movs	r2, #0
 393 0232 1A70     		strb	r2, [r3]
  80:C:/github/pongTest/ver1\game_logic.c **** 	if (obj1_top_coord >= obj2_top_coord && obj1_top_coord <= obj2_bottom_coord) {
 394              		.loc 1 80 0
 395 0234 0E23     		movs	r3, #14
 396 0236 FA18     		adds	r2, r7, r3
 397 0238 0D23     		movs	r3, #13
 398 023a FB18     		adds	r3, r7, r3
 399 023c 1278     		ldrb	r2, [r2]
 400 023e 1B78     		ldrb	r3, [r3]
 401 0240 9A42     		cmp	r2, r3
 402 0242 0BD3     		bcc	.L11
 403              		.loc 1 80 0 is_stmt 0 discriminator 1
 404 0244 0E23     		movs	r3, #14
 405 0246 FA18     		adds	r2, r7, r3
 406 0248 0C23     		movs	r3, #12
 407 024a FB18     		adds	r3, r7, r3
 408 024c 1278     		ldrb	r2, [r2]
 409 024e 1B78     		ldrb	r3, [r3]
 410 0250 9A42     		cmp	r2, r3
 411 0252 03D8     		bhi	.L11
  81:C:/github/pongTest/ver1\game_logic.c **** 		value = 1;
 412              		.loc 1 81 0 is_stmt 1
 413 0254 0F23     		movs	r3, #15
 414 0256 FB18     		adds	r3, r7, r3
 415 0258 0122     		movs	r2, #1
 416 025a 1A70     		strb	r2, [r3]
 417              	.L11:
  82:C:/github/pongTest/ver1\game_logic.c **** 	}
  83:C:/github/pongTest/ver1\game_logic.c **** 	
  84:C:/github/pongTest/ver1\game_logic.c **** 	return value;
 418              		.loc 1 84 0
 419 025c 0F23     		movs	r3, #15
 420 025e FB18     		adds	r3, r7, r3
 421 0260 1B78     		ldrb	r3, [r3]
  85:C:/github/pongTest/ver1\game_logic.c **** }
 422              		.loc 1 85 0
 423 0262 1800     		movs	r0, r3
 424 0264 BD46     		mov	sp, r7
 425 0266 04B0     		add	sp, sp, #16
 426              		@ sp needed
 427 0268 80BD     		pop	{r7, pc}
 428              		.cfi_endproc
 429              	.LFE3:
 431 026a C046     		.align	2
 432              		.global	start_new_ball
 433              		.code	16
 434              		.thumb_func
 436              	start_new_ball:
 437              	.LFB4:
  86:C:/github/pongTest/ver1\game_logic.c **** 
  87:C:/github/pongTest/ver1\game_logic.c **** // Pass the ball 
  88:C:/github/pongTest/ver1\game_logic.c **** // And if toTheRight is 
  89:C:/github/pongTest/ver1\game_logic.c **** //						0:		start the ball to the left direction			
  90:C:/github/pongTest/ver1\game_logic.c **** //						1:		start the ball to the right direction
  91:C:/github/pongTest/ver1\game_logic.c **** void start_new_ball(P_OBJECT b, uint8 toTheRight)
  92:C:/github/pongTest/ver1\game_logic.c **** {
 438              		.loc 1 92 0
 439              		.cfi_startproc
 440 026c 90B5     		push	{r4, r7, lr}
 441              		.cfi_def_cfa_offset 12
 442              		.cfi_offset 4, -12
 443              		.cfi_offset 7, -8
 444              		.cfi_offset 14, -4
 445 026e 83B0     		sub	sp, sp, #12
 446              		.cfi_def_cfa_offset 24
 447 0270 00AF     		add	r7, sp, #0
 448              		.cfi_def_cfa_register 7
 449 0272 7860     		str	r0, [r7, #4]
 450 0274 0A00     		movs	r2, r1
 451 0276 FB1C     		adds	r3, r7, #3
 452 0278 1A70     		strb	r2, [r3]
  93:C:/github/pongTest/ver1\game_logic.c **** 	b->posx = 64;
 453              		.loc 1 93 0
 454 027a 7B68     		ldr	r3, [r7, #4]
 455 027c 4022     		movs	r2, #64
 456 027e DA60     		str	r2, [r3, #12]
  94:C:/github/pongTest/ver1\game_logic.c **** 	b->posy = 20;
 457              		.loc 1 94 0
 458 0280 7B68     		ldr	r3, [r7, #4]
 459 0282 1422     		movs	r2, #20
 460 0284 1A61     		str	r2, [r3, #16]
  95:C:/github/pongTest/ver1\game_logic.c **** 	
  96:C:/github/pongTest/ver1\game_logic.c **** 	b->set_speed(b	,	   -1	,	b->diry);
 461              		.loc 1 96 0
 462 0286 7B68     		ldr	r3, [r7, #4]
 463 0288 1C6A     		ldr	r4, [r3, #32]
 464 028a 7B68     		ldr	r3, [r7, #4]
 465 028c 9A68     		ldr	r2, [r3, #8]
 466 028e 0123     		movs	r3, #1
 467 0290 5942     		rsbs	r1, r3, #0
 468 0292 7B68     		ldr	r3, [r7, #4]
 469 0294 1800     		movs	r0, r3
 470 0296 A047     		blx	r4
  97:C:/github/pongTest/ver1\game_logic.c **** 	
  98:C:/github/pongTest/ver1\game_logic.c **** 	if (toTheRight != 0) 
 471              		.loc 1 98 0
 472 0298 FB1C     		adds	r3, r7, #3
 473 029a 1B78     		ldrb	r3, [r3]
 474 029c 002B     		cmp	r3, #0
 475 029e 07D0     		beq	.L15
  99:C:/github/pongTest/ver1\game_logic.c **** 	{
 100:C:/github/pongTest/ver1\game_logic.c **** 		b->set_speed(b	,	1	,	b->diry);
 476              		.loc 1 100 0
 477 02a0 7B68     		ldr	r3, [r7, #4]
 478 02a2 1C6A     		ldr	r4, [r3, #32]
 479 02a4 7B68     		ldr	r3, [r7, #4]
 480 02a6 9A68     		ldr	r2, [r3, #8]
 481 02a8 7B68     		ldr	r3, [r7, #4]
 482 02aa 0121     		movs	r1, #1
 483 02ac 1800     		movs	r0, r3
 484 02ae A047     		blx	r4
 485              	.L15:
 101:C:/github/pongTest/ver1\game_logic.c **** 	}
 102:C:/github/pongTest/ver1\game_logic.c **** }
 486              		.loc 1 102 0
 487 02b0 C046     		nop
 488 02b2 BD46     		mov	sp, r7
 489 02b4 03B0     		add	sp, sp, #12
 490              		@ sp needed
 491 02b6 90BD     		pop	{r4, r7, pc}
 492              		.cfi_endproc
 493              	.LFE4:
 495              		.align	2
 496              		.global	check_ball
 497              		.code	16
 498              		.thumb_func
 500              	check_ball:
 501              	.LFB5:
 103:C:/github/pongTest/ver1\game_logic.c **** 
 104:C:/github/pongTest/ver1\game_logic.c **** /*
 105:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES PLAYER_LEFT / PLAYER_RIGHT 
 106:C:/github/pongTest/ver1\game_logic.c ****  * 
 107:C:/github/pongTest/ver1\game_logic.c ****  * IF SO:		change direction of the ball in X
 108:C:/github/pongTest/ver1\game_logic.c ****  * ELSE:		do nothing
 109:C:/github/pongTest/ver1\game_logic.c ****  * 
 110:C:/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES THE WALL TO THE LEFT / RIGHT  
 111:C:/github/pongTest/ver1\game_logic.c ****  */ 
 112:C:/github/pongTest/ver1\game_logic.c **** void check_ball(P_PLAYER playerLeft, P_PLAYER playerRight, P_OBJECT ball)
 113:C:/github/pongTest/ver1\game_logic.c **** {
 502              		.loc 1 113 0
 503              		.cfi_startproc
 504 02b8 90B5     		push	{r4, r7, lr}
 505              		.cfi_def_cfa_offset 12
 506              		.cfi_offset 4, -12
 507              		.cfi_offset 7, -8
 508              		.cfi_offset 14, -4
 509 02ba 87B0     		sub	sp, sp, #28
 510              		.cfi_def_cfa_offset 40
 511 02bc 00AF     		add	r7, sp, #0
 512              		.cfi_def_cfa_register 7
 513 02be F860     		str	r0, [r7, #12]
 514 02c0 B960     		str	r1, [r7, #8]
 515 02c2 7A60     		str	r2, [r7, #4]
 114:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_left = get_wall_player(playerLeft->p_obj, 1);
 516              		.loc 1 114 0
 517 02c4 FB68     		ldr	r3, [r7, #12]
 518 02c6 1B68     		ldr	r3, [r3]
 519 02c8 1722     		movs	r2, #23
 520 02ca BC18     		adds	r4, r7, r2
 521 02cc 0121     		movs	r1, #1
 522 02ce 1800     		movs	r0, r3
 523 02d0 FFF7FEFF 		bl	get_wall_player
 524 02d4 0300     		movs	r3, r0
 525 02d6 2370     		strb	r3, [r4]
 115:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 526              		.loc 1 115 0
 527 02d8 FFF7FEFF 		bl	delay_250ns
 116:C:/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_right = get_wall_player(playerRight->p_obj, 0);
 528              		.loc 1 116 0
 529 02dc BB68     		ldr	r3, [r7, #8]
 530 02de 1B68     		ldr	r3, [r3]
 531 02e0 1622     		movs	r2, #22
 532 02e2 BC18     		adds	r4, r7, r2
 533 02e4 0021     		movs	r1, #0
 534 02e6 1800     		movs	r0, r3
 535 02e8 FFF7FEFF 		bl	get_wall_player
 536 02ec 0300     		movs	r3, r0
 537 02ee 2370     		strb	r3, [r4]
 117:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 538              		.loc 1 117 0
 539 02f0 FFF7FEFF 		bl	delay_250ns
 118:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_right_side_coord = (ball->posx + ball->geo->sizex);
 540              		.loc 1 118 0
 541 02f4 7B68     		ldr	r3, [r7, #4]
 542 02f6 DB68     		ldr	r3, [r3, #12]
 543 02f8 D9B2     		uxtb	r1, r3
 544 02fa 7B68     		ldr	r3, [r7, #4]
 545 02fc 1B68     		ldr	r3, [r3]
 546 02fe 5B68     		ldr	r3, [r3, #4]
 547 0300 DAB2     		uxtb	r2, r3
 548 0302 1523     		movs	r3, #21
 549 0304 FB18     		adds	r3, r7, r3
 550 0306 8A18     		adds	r2, r1, r2
 551 0308 1A70     		strb	r2, [r3]
 119:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_left_side_coord = ball->posx;
 552              		.loc 1 119 0
 553 030a 7B68     		ldr	r3, [r7, #4]
 554 030c DA68     		ldr	r2, [r3, #12]
 555 030e 1423     		movs	r3, #20
 556 0310 FB18     		adds	r3, r7, r3
 557 0312 1A70     		strb	r2, [r3]
 120:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 558              		.loc 1 120 0
 559 0314 FFF7FEFF 		bl	delay_250ns
 121:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_top_coord = ball->posy;
 560              		.loc 1 121 0
 561 0318 7B68     		ldr	r3, [r7, #4]
 562 031a 1A69     		ldr	r2, [r3, #16]
 563 031c 1323     		movs	r3, #19
 564 031e FB18     		adds	r3, r7, r3
 565 0320 1A70     		strb	r2, [r3]
 122:C:/github/pongTest/ver1\game_logic.c **** 	uint8 ball_bottom_coord = ball->posy + ball->geo->sizey;
 566              		.loc 1 122 0
 567 0322 7B68     		ldr	r3, [r7, #4]
 568 0324 1B69     		ldr	r3, [r3, #16]
 569 0326 D9B2     		uxtb	r1, r3
 570 0328 7B68     		ldr	r3, [r7, #4]
 571 032a 1B68     		ldr	r3, [r3]
 572 032c 9B68     		ldr	r3, [r3, #8]
 573 032e DAB2     		uxtb	r2, r3
 574 0330 1223     		movs	r3, #18
 575 0332 FB18     		adds	r3, r7, r3
 576 0334 8A18     		adds	r2, r1, r2
 577 0336 1A70     		strb	r2, [r3]
 123:C:/github/pongTest/ver1\game_logic.c **** 	
 124:C:/github/pongTest/ver1\game_logic.c **** // CHECK IF GOAL!!!
 125:C:/github/pongTest/ver1\game_logic.c **** 	
 126:C:/github/pongTest/ver1\game_logic.c **** 	if ( ball_right_side_coord >= 126) {
 578              		.loc 1 126 0
 579 0338 1523     		movs	r3, #21
 580 033a FB18     		adds	r3, r7, r3
 581 033c 1B78     		ldrb	r3, [r3]
 582 033e 7D2B     		cmp	r3, #125
 583 0340 0FD9     		bls	.L17
 127:C:/github/pongTest/ver1\game_logic.c **** 		// player left gets a point
 128:C:/github/pongTest/ver1\game_logic.c **** 		increaseScore(playerLeft);
 584              		.loc 1 128 0
 585 0342 FB68     		ldr	r3, [r7, #12]
 586 0344 1800     		movs	r0, r3
 587 0346 FFF7FEFF 		bl	increaseScore
 129:C:/github/pongTest/ver1\game_logic.c **** 		// update ascii-display	
 130:C:/github/pongTest/ver1\game_logic.c **** 		update_score(playerLeft, playerRight);
 588              		.loc 1 130 0
 589 034a BA68     		ldr	r2, [r7, #8]
 590 034c FB68     		ldr	r3, [r7, #12]
 591 034e 1100     		movs	r1, r2
 592 0350 1800     		movs	r0, r3
 593 0352 FFF7FEFF 		bl	update_score
 131:C:/github/pongTest/ver1\game_logic.c **** 		// start a new ball
 132:C:/github/pongTest/ver1\game_logic.c **** 		start_new_ball(ball, 0);
 594              		.loc 1 132 0
 595 0356 7B68     		ldr	r3, [r7, #4]
 596 0358 0021     		movs	r1, #0
 597 035a 1800     		movs	r0, r3
 598 035c FFF7FEFF 		bl	start_new_ball
 599 0360 13E0     		b	.L18
 600              	.L17:
 133:C:/github/pongTest/ver1\game_logic.c **** 	} else if (ball_left_side_coord <= 3) {
 601              		.loc 1 133 0
 602 0362 1423     		movs	r3, #20
 603 0364 FB18     		adds	r3, r7, r3
 604 0366 1B78     		ldrb	r3, [r3]
 605 0368 032B     		cmp	r3, #3
 606 036a 0ED8     		bhi	.L18
 134:C:/github/pongTest/ver1\game_logic.c **** 		// player right gets a point
 135:C:/github/pongTest/ver1\game_logic.c **** 		increaseScore(playerRight);
 607              		.loc 1 135 0
 608 036c BB68     		ldr	r3, [r7, #8]
 609 036e 1800     		movs	r0, r3
 610 0370 FFF7FEFF 		bl	increaseScore
 136:C:/github/pongTest/ver1\game_logic.c **** 		// update ascii-display
 137:C:/github/pongTest/ver1\game_logic.c **** 		update_score(playerLeft, playerRight);
 611              		.loc 1 137 0
 612 0374 BA68     		ldr	r2, [r7, #8]
 613 0376 FB68     		ldr	r3, [r7, #12]
 614 0378 1100     		movs	r1, r2
 615 037a 1800     		movs	r0, r3
 616 037c FFF7FEFF 		bl	update_score
 138:C:/github/pongTest/ver1\game_logic.c **** 		// start a new ball
 139:C:/github/pongTest/ver1\game_logic.c **** 		start_new_ball(ball, 1);
 617              		.loc 1 139 0
 618 0380 7B68     		ldr	r3, [r7, #4]
 619 0382 0121     		movs	r1, #1
 620 0384 1800     		movs	r0, r3
 621 0386 FFF7FEFF 		bl	start_new_ball
 622              	.L18:
 140:C:/github/pongTest/ver1\game_logic.c **** 	} 
 141:C:/github/pongTest/ver1\game_logic.c **** 	
 142:C:/github/pongTest/ver1\game_logic.c **** // END CHECK GOAL
 143:C:/github/pongTest/ver1\game_logic.c **** 
 144:C:/github/pongTest/ver1\game_logic.c **** 
 145:C:/github/pongTest/ver1\game_logic.c **** // CHECK WALLS PLAYERS
 146:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 623              		.loc 1 146 0
 624 038a FFF7FEFF 		bl	delay_250ns
 147:C:/github/pongTest/ver1\game_logic.c **** 	if (   ( ball_right_side_coord + 1)  == wall_player_right  ) 
 625              		.loc 1 147 0
 626 038e 1523     		movs	r3, #21
 627 0390 FB18     		adds	r3, r7, r3
 628 0392 1B78     		ldrb	r3, [r3]
 629 0394 5A1C     		adds	r2, r3, #1
 630 0396 1623     		movs	r3, #22
 631 0398 FB18     		adds	r3, r7, r3
 632 039a 1B78     		ldrb	r3, [r3]
 633 039c 9A42     		cmp	r2, r3
 634 039e 1AD1     		bne	.L19
 148:C:/github/pongTest/ver1\game_logic.c **** 	{ // playerRight
 149:C:/github/pongTest/ver1\game_logic.c **** 	
 150:C:/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerRight->p_obj)) 
 635              		.loc 1 150 0
 636 03a0 BB68     		ldr	r3, [r7, #8]
 637 03a2 1A68     		ldr	r2, [r3]
 638 03a4 7B68     		ldr	r3, [r7, #4]
 639 03a6 1100     		movs	r1, r2
 640 03a8 1800     		movs	r0, r3
 641 03aa FFF7FEFF 		bl	inside_y_wise
 642 03ae 031E     		subs	r3, r0, #0
 643 03b0 31D0     		beq	.L21
 151:C:/github/pongTest/ver1\game_logic.c **** 		{
 152:C:/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 644              		.loc 1 152 0
 645 03b2 7B68     		ldr	r3, [r7, #4]
 646 03b4 5B68     		ldr	r3, [r3, #4]
 647 03b6 5A42     		rsbs	r2, r3, #0
 648 03b8 7B68     		ldr	r3, [r7, #4]
 649 03ba 5A60     		str	r2, [r3, #4]
 153:C:/github/pongTest/ver1\game_logic.c **** 			delay_250ns();
 650              		.loc 1 153 0
 651 03bc FFF7FEFF 		bl	delay_250ns
 154:C:/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_right - ball->geo->sizex - 1;
 652              		.loc 1 154 0
 653 03c0 1623     		movs	r3, #22
 654 03c2 FB18     		adds	r3, r7, r3
 655 03c4 1A78     		ldrb	r2, [r3]
 656 03c6 7B68     		ldr	r3, [r7, #4]
 657 03c8 1B68     		ldr	r3, [r3]
 658 03ca 5B68     		ldr	r3, [r3, #4]
 659 03cc D31A     		subs	r3, r2, r3
 660 03ce 5A1E     		subs	r2, r3, #1
 661 03d0 7B68     		ldr	r3, [r7, #4]
 662 03d2 DA60     		str	r2, [r3, #12]
 663 03d4 1FE0     		b	.L21
 664              	.L19:
 155:C:/github/pongTest/ver1\game_logic.c **** 		}
 156:C:/github/pongTest/ver1\game_logic.c **** 		
 157:C:/github/pongTest/ver1\game_logic.c **** 	} 
 158:C:/github/pongTest/ver1\game_logic.c **** 	else if (    (ball_left_side_coord - 1) == wall_player_left ) 
 665              		.loc 1 158 0
 666 03d6 1423     		movs	r3, #20
 667 03d8 FB18     		adds	r3, r7, r3
 668 03da 1B78     		ldrb	r3, [r3]
 669 03dc 5A1E     		subs	r2, r3, #1
 670 03de 1723     		movs	r3, #23
 671 03e0 FB18     		adds	r3, r7, r3
 672 03e2 1B78     		ldrb	r3, [r3]
 673 03e4 9A42     		cmp	r2, r3
 674 03e6 16D1     		bne	.L21
 159:C:/github/pongTest/ver1\game_logic.c **** 	{ // playerLeft
 160:C:/github/pongTest/ver1\game_logic.c **** 		
 161:C:/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerLeft->p_obj)) 
 675              		.loc 1 161 0
 676 03e8 FB68     		ldr	r3, [r7, #12]
 677 03ea 1A68     		ldr	r2, [r3]
 678 03ec 7B68     		ldr	r3, [r7, #4]
 679 03ee 1100     		movs	r1, r2
 680 03f0 1800     		movs	r0, r3
 681 03f2 FFF7FEFF 		bl	inside_y_wise
 682 03f6 031E     		subs	r3, r0, #0
 683 03f8 0DD0     		beq	.L21
 162:C:/github/pongTest/ver1\game_logic.c **** 		{
 163:C:/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 684              		.loc 1 163 0
 685 03fa 7B68     		ldr	r3, [r7, #4]
 686 03fc 5B68     		ldr	r3, [r3, #4]
 687 03fe 5A42     		rsbs	r2, r3, #0
 688 0400 7B68     		ldr	r3, [r7, #4]
 689 0402 5A60     		str	r2, [r3, #4]
 164:C:/github/pongTest/ver1\game_logic.c **** 			delay_250ns();
 690              		.loc 1 164 0
 691 0404 FFF7FEFF 		bl	delay_250ns
 165:C:/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_left + 1;
 692              		.loc 1 165 0
 693 0408 1723     		movs	r3, #23
 694 040a FB18     		adds	r3, r7, r3
 695 040c 1B78     		ldrb	r3, [r3]
 696 040e 0133     		adds	r3, r3, #1
 697 0410 1A00     		movs	r2, r3
 698 0412 7B68     		ldr	r3, [r7, #4]
 699 0414 DA60     		str	r2, [r3, #12]
 700              	.L21:
 166:C:/github/pongTest/ver1\game_logic.c **** 		}
 167:C:/github/pongTest/ver1\game_logic.c **** 		
 168:C:/github/pongTest/ver1\game_logic.c **** 	}
 169:C:/github/pongTest/ver1\game_logic.c **** // END CHECK WALLS PLAYERS
 170:C:/github/pongTest/ver1\game_logic.c **** 	
 171:C:/github/pongTest/ver1\game_logic.c **** 	
 172:C:/github/pongTest/ver1\game_logic.c **** // CHECK FLOOR / BOTTOM
 173:C:/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 701              		.loc 1 173 0
 702 0416 FFF7FEFF 		bl	delay_250ns
 174:C:/github/pongTest/ver1\game_logic.c **** 	if (ball_top_coord <= 2) 
 703              		.loc 1 174 0
 704 041a 1323     		movs	r3, #19
 705 041c FB18     		adds	r3, r7, r3
 706 041e 1B78     		ldrb	r3, [r3]
 707 0420 022B     		cmp	r3, #2
 708 0422 05D8     		bhi	.L22
 175:C:/github/pongTest/ver1\game_logic.c **** 	{
 176:C:/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 709              		.loc 1 176 0
 710 0424 7B68     		ldr	r3, [r7, #4]
 711 0426 9B68     		ldr	r3, [r3, #8]
 712 0428 5A42     		rsbs	r2, r3, #0
 713 042a 7B68     		ldr	r3, [r7, #4]
 714 042c 9A60     		str	r2, [r3, #8]
 177:C:/github/pongTest/ver1\game_logic.c **** 	} 
 178:C:/github/pongTest/ver1\game_logic.c **** 	else if( ball_bottom_coord >= 62) 
 179:C:/github/pongTest/ver1\game_logic.c **** 	{
 180:C:/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 181:C:/github/pongTest/ver1\game_logic.c **** 	}
 182:C:/github/pongTest/ver1\game_logic.c **** // END CHECK FLOOR / BOTTOM	
 183:C:/github/pongTest/ver1\game_logic.c **** 	
 184:C:/github/pongTest/ver1\game_logic.c **** 
 185:C:/github/pongTest/ver1\game_logic.c **** }
 715              		.loc 1 185 0
 716 042e 09E0     		b	.L24
 717              	.L22:
 178:C:/github/pongTest/ver1\game_logic.c **** 	{
 718              		.loc 1 178 0
 719 0430 1223     		movs	r3, #18
 720 0432 FB18     		adds	r3, r7, r3
 721 0434 1B78     		ldrb	r3, [r3]
 722 0436 3D2B     		cmp	r3, #61
 723 0438 04D9     		bls	.L24
 180:C:/github/pongTest/ver1\game_logic.c **** 	}
 724              		.loc 1 180 0
 725 043a 7B68     		ldr	r3, [r7, #4]
 726 043c 9B68     		ldr	r3, [r3, #8]
 727 043e 5A42     		rsbs	r2, r3, #0
 728 0440 7B68     		ldr	r3, [r7, #4]
 729 0442 9A60     		str	r2, [r3, #8]
 730              	.L24:
 731              		.loc 1 185 0
 732 0444 C046     		nop
 733 0446 BD46     		mov	sp, r7
 734 0448 07B0     		add	sp, sp, #28
 735              		@ sp needed
 736 044a 90BD     		pop	{r4, r7, pc}
 737              		.cfi_endproc
 738              	.LFE5:
 740              		.align	2
 741              		.global	update_player_pos
 742              		.code	16
 743              		.thumb_func
 745              	update_player_pos:
 746              	.LFB6:
 186:C:/github/pongTest/ver1\game_logic.c **** // read keyboard right
 187:C:/github/pongTest/ver1\game_logic.c **** 	// if:		2_IS_PRESSED 
 188:C:/github/pongTest/ver1\game_logic.c **** 	//					playerXX->set_speed(0,1);
 189:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 190:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 191:C:/github/pongTest/ver1\game_logic.c **** 	// else if:	 8_IS_PRESSED 
 192:C:/github/pongTest/ver1\game_logic.c **** 	//					plauerXX->set_speed(0,-1);
 193:C:/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 194:C:/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 195:C:/github/pongTest/ver1\game_logic.c **** 
 196:C:/github/pongTest/ver1\game_logic.c **** void update_player_pos(P_PLAYER playerLeft, P_PLAYER playerRight) 
 197:C:/github/pongTest/ver1\game_logic.c **** {	
 747              		.loc 1 197 0
 748              		.cfi_startproc
 749 044c 90B5     		push	{r4, r7, lr}
 750              		.cfi_def_cfa_offset 12
 751              		.cfi_offset 4, -12
 752              		.cfi_offset 7, -8
 753              		.cfi_offset 14, -4
 754 044e 85B0     		sub	sp, sp, #20
 755              		.cfi_def_cfa_offset 32
 756 0450 00AF     		add	r7, sp, #0
 757              		.cfi_def_cfa_register 7
 758 0452 7860     		str	r0, [r7, #4]
 759 0454 3960     		str	r1, [r7]
 198:C:/github/pongTest/ver1\game_logic.c **** 	
 199:C:/github/pongTest/ver1\game_logic.c **** // Player to The LEFT
 200:C:/github/pongTest/ver1\game_logic.c **** 	playerLeft->key_pressed = get_key(1);
 760              		.loc 1 200 0
 761 0456 0120     		movs	r0, #1
 762 0458 FFF7FEFF 		bl	get_key
 763 045c 0300     		movs	r3, r0
 764 045e 1A00     		movs	r2, r3
 765 0460 7B68     		ldr	r3, [r7, #4]
 766 0462 5A71     		strb	r2, [r3, #5]
 201:C:/github/pongTest/ver1\game_logic.c **** 	
 202:C:/github/pongTest/ver1\game_logic.c **** 	volatile uint8 pressed = playerLeft->key_pressed;
 767              		.loc 1 202 0
 768 0464 7B68     		ldr	r3, [r7, #4]
 769 0466 5A79     		ldrb	r2, [r3, #5]
 770 0468 0F23     		movs	r3, #15
 771 046a FB18     		adds	r3, r7, r3
 772 046c 1A70     		strb	r2, [r3]
 203:C:/github/pongTest/ver1\game_logic.c **** 	
 204:C:/github/pongTest/ver1\game_logic.c **** 	if ((pressed == 2) && (playerLeft->p_obj->posy >= 2)) 
 773              		.loc 1 204 0
 774 046e 0F23     		movs	r3, #15
 775 0470 FB18     		adds	r3, r7, r3
 776 0472 1B78     		ldrb	r3, [r3]
 777 0474 DBB2     		uxtb	r3, r3
 778 0476 022B     		cmp	r3, #2
 779 0478 15D1     		bne	.L26
 780              		.loc 1 204 0 is_stmt 0 discriminator 1
 781 047a 7B68     		ldr	r3, [r7, #4]
 782 047c 1B68     		ldr	r3, [r3]
 783 047e 1B69     		ldr	r3, [r3, #16]
 784 0480 012B     		cmp	r3, #1
 785 0482 10D9     		bls	.L26
 205:C:/github/pongTest/ver1\game_logic.c **** 	{
 206:C:/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->set_speed(playerLeft->p_obj,0,1);
 786              		.loc 1 206 0 is_stmt 1
 787 0484 7B68     		ldr	r3, [r7, #4]
 788 0486 1B68     		ldr	r3, [r3]
 789 0488 1C6A     		ldr	r4, [r3, #32]
 790 048a 7B68     		ldr	r3, [r7, #4]
 791 048c 1B68     		ldr	r3, [r3]
 792 048e 0122     		movs	r2, #1
 793 0490 0021     		movs	r1, #0
 794 0492 1800     		movs	r0, r3
 795 0494 A047     		blx	r4
 207:C:/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->move(playerLeft->p_obj);
 796              		.loc 1 207 0
 797 0496 7B68     		ldr	r3, [r7, #4]
 798 0498 1B68     		ldr	r3, [r3]
 799 049a DA69     		ldr	r2, [r3, #28]
 800 049c 7B68     		ldr	r3, [r7, #4]
 801 049e 1B68     		ldr	r3, [r3]
 802 04a0 1800     		movs	r0, r3
 803 04a2 9047     		blx	r2
 804 04a4 20E0     		b	.L27
 805              	.L26:
 208:C:/github/pongTest/ver1\game_logic.c **** 	} 
 209:C:/github/pongTest/ver1\game_logic.c **** 	else if(  (pressed == 8)    && (  (playerLeft->p_obj->posy + playerLeft->p_obj->geo->sizey)   <=  
 806              		.loc 1 209 0
 807 04a6 0F23     		movs	r3, #15
 808 04a8 FB18     		adds	r3, r7, r3
 809 04aa 1B78     		ldrb	r3, [r3]
 810 04ac DBB2     		uxtb	r3, r3
 811 04ae 082B     		cmp	r3, #8
 812 04b0 1AD1     		bne	.L27
 813              		.loc 1 209 0 is_stmt 0 discriminator 1
 814 04b2 7B68     		ldr	r3, [r7, #4]
 815 04b4 1B68     		ldr	r3, [r3]
 816 04b6 1A69     		ldr	r2, [r3, #16]
 817 04b8 7B68     		ldr	r3, [r7, #4]
 818 04ba 1B68     		ldr	r3, [r3]
 819 04bc 1B68     		ldr	r3, [r3]
 820 04be 9B68     		ldr	r3, [r3, #8]
 821 04c0 D318     		adds	r3, r2, r3
 822 04c2 402B     		cmp	r3, #64
 823 04c4 10D8     		bhi	.L27
 210:C:/github/pongTest/ver1\game_logic.c **** 	{
 211:C:/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->set_speed(playerLeft->p_obj,0,-1);
 824              		.loc 1 211 0 is_stmt 1
 825 04c6 7B68     		ldr	r3, [r7, #4]
 826 04c8 1B68     		ldr	r3, [r3]
 827 04ca 1C6A     		ldr	r4, [r3, #32]
 828 04cc 7B68     		ldr	r3, [r7, #4]
 829 04ce 1868     		ldr	r0, [r3]
 830 04d0 0123     		movs	r3, #1
 831 04d2 5B42     		rsbs	r3, r3, #0
 832 04d4 1A00     		movs	r2, r3
 833 04d6 0021     		movs	r1, #0
 834 04d8 A047     		blx	r4
 212:C:/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->move(playerLeft->p_obj);
 835              		.loc 1 212 0
 836 04da 7B68     		ldr	r3, [r7, #4]
 837 04dc 1B68     		ldr	r3, [r3]
 838 04de DA69     		ldr	r2, [r3, #28]
 839 04e0 7B68     		ldr	r3, [r7, #4]
 840 04e2 1B68     		ldr	r3, [r3]
 841 04e4 1800     		movs	r0, r3
 842 04e6 9047     		blx	r2
 843              	.L27:
 213:C:/github/pongTest/ver1\game_logic.c **** 	}
 214:C:/github/pongTest/ver1\game_logic.c **** 	
 215:C:/github/pongTest/ver1\game_logic.c **** 	
 216:C:/github/pongTest/ver1\game_logic.c **** // Player to The Right	
 217:C:/github/pongTest/ver1\game_logic.c **** 	playerRight->key_pressed = get_key(0);
 844              		.loc 1 217 0
 845 04e8 0020     		movs	r0, #0
 846 04ea FFF7FEFF 		bl	get_key
 847 04ee 0300     		movs	r3, r0
 848 04f0 1A00     		movs	r2, r3
 849 04f2 3B68     		ldr	r3, [r7]
 850 04f4 5A71     		strb	r2, [r3, #5]
 218:C:/github/pongTest/ver1\game_logic.c **** 	pressed = playerRight->key_pressed;
 851              		.loc 1 218 0
 852 04f6 3B68     		ldr	r3, [r7]
 853 04f8 5A79     		ldrb	r2, [r3, #5]
 854 04fa 0F23     		movs	r3, #15
 855 04fc FB18     		adds	r3, r7, r3
 856 04fe 1A70     		strb	r2, [r3]
 219:C:/github/pongTest/ver1\game_logic.c **** 	
 220:C:/github/pongTest/ver1\game_logic.c **** 	if ((pressed == 2) && (playerRight->p_obj->posy >= 2)) 
 857              		.loc 1 220 0
 858 0500 0F23     		movs	r3, #15
 859 0502 FB18     		adds	r3, r7, r3
 860 0504 1B78     		ldrb	r3, [r3]
 861 0506 DBB2     		uxtb	r3, r3
 862 0508 022B     		cmp	r3, #2
 863 050a 15D1     		bne	.L28
 864              		.loc 1 220 0 is_stmt 0 discriminator 1
 865 050c 3B68     		ldr	r3, [r7]
 866 050e 1B68     		ldr	r3, [r3]
 867 0510 1B69     		ldr	r3, [r3, #16]
 868 0512 012B     		cmp	r3, #1
 869 0514 10D9     		bls	.L28
 221:C:/github/pongTest/ver1\game_logic.c **** 	{
 222:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->set_speed(playerRight->p_obj,0,1);
 870              		.loc 1 222 0 is_stmt 1
 871 0516 3B68     		ldr	r3, [r7]
 872 0518 1B68     		ldr	r3, [r3]
 873 051a 1C6A     		ldr	r4, [r3, #32]
 874 051c 3B68     		ldr	r3, [r7]
 875 051e 1B68     		ldr	r3, [r3]
 876 0520 0122     		movs	r2, #1
 877 0522 0021     		movs	r1, #0
 878 0524 1800     		movs	r0, r3
 879 0526 A047     		blx	r4
 223:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 880              		.loc 1 223 0
 881 0528 3B68     		ldr	r3, [r7]
 882 052a 1B68     		ldr	r3, [r3]
 883 052c DA69     		ldr	r2, [r3, #28]
 884 052e 3B68     		ldr	r3, [r7]
 885 0530 1B68     		ldr	r3, [r3]
 886 0532 1800     		movs	r0, r3
 887 0534 9047     		blx	r2
 224:C:/github/pongTest/ver1\game_logic.c **** 	}
 225:C:/github/pongTest/ver1\game_logic.c **** 	else if ((pressed == 8)    && (  (playerRight->p_obj->posy + playerRight->p_obj->geo->sizey)   <= 
 226:C:/github/pongTest/ver1\game_logic.c **** 	{
 227:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->set_speed(playerRight->p_obj,0,-1);
 228:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 229:C:/github/pongTest/ver1\game_logic.c **** 	}
 230:C:/github/pongTest/ver1\game_logic.c **** }
 888              		.loc 1 230 0
 889 0536 20E0     		b	.L30
 890              	.L28:
 225:C:/github/pongTest/ver1\game_logic.c **** 	{
 891              		.loc 1 225 0
 892 0538 0F23     		movs	r3, #15
 893 053a FB18     		adds	r3, r7, r3
 894 053c 1B78     		ldrb	r3, [r3]
 895 053e DBB2     		uxtb	r3, r3
 896 0540 082B     		cmp	r3, #8
 897 0542 1AD1     		bne	.L30
 225:C:/github/pongTest/ver1\game_logic.c **** 	{
 898              		.loc 1 225 0 is_stmt 0 discriminator 1
 899 0544 3B68     		ldr	r3, [r7]
 900 0546 1B68     		ldr	r3, [r3]
 901 0548 1A69     		ldr	r2, [r3, #16]
 902 054a 3B68     		ldr	r3, [r7]
 903 054c 1B68     		ldr	r3, [r3]
 904 054e 1B68     		ldr	r3, [r3]
 905 0550 9B68     		ldr	r3, [r3, #8]
 906 0552 D318     		adds	r3, r2, r3
 907 0554 402B     		cmp	r3, #64
 908 0556 10D8     		bhi	.L30
 227:C:/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 909              		.loc 1 227 0 is_stmt 1
 910 0558 3B68     		ldr	r3, [r7]
 911 055a 1B68     		ldr	r3, [r3]
 912 055c 1C6A     		ldr	r4, [r3, #32]
 913 055e 3B68     		ldr	r3, [r7]
 914 0560 1868     		ldr	r0, [r3]
 915 0562 0123     		movs	r3, #1
 916 0564 5B42     		rsbs	r3, r3, #0
 917 0566 1A00     		movs	r2, r3
 918 0568 0021     		movs	r1, #0
 919 056a A047     		blx	r4
 228:C:/github/pongTest/ver1\game_logic.c **** 	}
 920              		.loc 1 228 0
 921 056c 3B68     		ldr	r3, [r7]
 922 056e 1B68     		ldr	r3, [r3]
 923 0570 DA69     		ldr	r2, [r3, #28]
 924 0572 3B68     		ldr	r3, [r7]
 925 0574 1B68     		ldr	r3, [r3]
 926 0576 1800     		movs	r0, r3
 927 0578 9047     		blx	r2
 928              	.L30:
 929              		.loc 1 230 0
 930 057a C046     		nop
 931 057c BD46     		mov	sp, r7
 932 057e 05B0     		add	sp, sp, #20
 933              		@ sp needed
 934 0580 90BD     		pop	{r4, r7, pc}
 935              		.cfi_endproc
 936              	.LFE6:
 938 0582 C046     		.align	2
 939              		.global	ping
 940              		.code	16
 941              		.thumb_func
 943              	ping:
 944              	.LFB7:
 231:C:/github/pongTest/ver1\game_logic.c **** 
 232:C:/github/pongTest/ver1\game_logic.c **** /* 
 233:C:/github/pongTest/ver1\game_logic.c ****  * UPDATE THE POSITION OF THE BALL
 234:C:/github/pongTest/ver1\game_logic.c ****  * IF GOAL, 
 235:C:/github/pongTest/ver1\game_logic.c ****  * 						PRINT SCORE TO THE PLAYER 
 236:C:/github/pongTest/ver1\game_logic.c ****  * IF KEYBOARD_PRESSED, 
 237:C:/github/pongTest/ver1\game_logic.c ****  * 						MOVE THE PLAYER
 238:C:/github/pongTest/ver1\game_logic.c ****  * RENDER THE SCREEN
 239:C:/github/pongTest/ver1\game_logic.c ****  */ 
 240:C:/github/pongTest/ver1\game_logic.c **** void ping(P_PLAYER playerLeft, P_PLAYER playerRight, P_OBJECT ball) {
 945              		.loc 1 240 0
 946              		.cfi_startproc
 947 0584 80B5     		push	{r7, lr}
 948              		.cfi_def_cfa_offset 8
 949              		.cfi_offset 7, -8
 950              		.cfi_offset 14, -4
 951 0586 84B0     		sub	sp, sp, #16
 952              		.cfi_def_cfa_offset 24
 953 0588 00AF     		add	r7, sp, #0
 954              		.cfi_def_cfa_register 7
 955 058a F860     		str	r0, [r7, #12]
 956 058c B960     		str	r1, [r7, #8]
 957 058e 7A60     		str	r2, [r7, #4]
 241:C:/github/pongTest/ver1\game_logic.c **** 	// check the postion of the ball related to the players / walls -> change direction if collision /
 242:C:/github/pongTest/ver1\game_logic.c **** 	check_ball(playerLeft, playerRight, ball);				
 958              		.loc 1 242 0
 959 0590 7A68     		ldr	r2, [r7, #4]
 960 0592 B968     		ldr	r1, [r7, #8]
 961 0594 FB68     		ldr	r3, [r7, #12]
 962 0596 1800     		movs	r0, r3
 963 0598 FFF7FEFF 		bl	check_ball
 243:C:/github/pongTest/ver1\game_logic.c **** 	delay_micro(5);
 964              		.loc 1 243 0
 965 059c 0520     		movs	r0, #5
 966 059e FFF7FEFF 		bl	delay_micro
 244:C:/github/pongTest/ver1\game_logic.c **** 	//ball->move(ball);
 245:C:/github/pongTest/ver1\game_logic.c **** 	delay_micro(5);
 967              		.loc 1 245 0
 968 05a2 0520     		movs	r0, #5
 969 05a4 FFF7FEFF 		bl	delay_micro
 246:C:/github/pongTest/ver1\game_logic.c **** 	update_player_pos(playerLeft,playerRight);
 970              		.loc 1 246 0
 971 05a8 BA68     		ldr	r2, [r7, #8]
 972 05aa FB68     		ldr	r3, [r7, #12]
 973 05ac 1100     		movs	r1, r2
 974 05ae 1800     		movs	r0, r3
 975 05b0 FFF7FEFF 		bl	update_player_pos
 247:C:/github/pongTest/ver1\game_logic.c **** }
 976              		.loc 1 247 0
 977 05b4 C046     		nop
 978 05b6 BD46     		mov	sp, r7
 979 05b8 04B0     		add	sp, sp, #16
 980              		@ sp needed
 981 05ba 80BD     		pop	{r7, pc}
 982              		.cfi_endproc
 983              	.LFE7:
 985              		.section	.rodata
 986              		.align	2
 987              	.LC0:
 988 0000 57656C63 		.ascii	"Welcome To The\000"
 988      6F6D6520 
 988      546F2054 
 988      686500
 989 000f 00       		.align	2
 990              	.LC2:
 991 0010 47726561 		.ascii	"Greatest Game Ever?\000"
 991      74657374 
 991      2047616D 
 991      65204576 
 991      65723F00 
 992              		.text
 993              		.align	2
 994              		.global	welcome
 995              		.code	16
 996              		.thumb_func
 998              	welcome:
 999              	.LFB8:
 248:C:/github/pongTest/ver1\game_logic.c **** 
 249:C:/github/pongTest/ver1\game_logic.c **** void welcome(void) {
 1000              		.loc 1 249 0
 1001              		.cfi_startproc
 1002 05bc 90B5     		push	{r4, r7, lr}
 1003              		.cfi_def_cfa_offset 12
 1004              		.cfi_offset 4, -12
 1005              		.cfi_offset 7, -8
 1006              		.cfi_offset 14, -4
 1007 05be 8BB0     		sub	sp, sp, #44
 1008              		.cfi_def_cfa_offset 56
 1009 05c0 00AF     		add	r7, sp, #0
 1010              		.cfi_def_cfa_register 7
 250:C:/github/pongTest/ver1\game_logic.c **** 	char welcoming[] = "Welcome To The";
 1011              		.loc 1 250 0
 1012 05c2 1823     		movs	r3, #24
 1013 05c4 FB18     		adds	r3, r7, r3
 1014 05c6 0C4A     		ldr	r2, .L33
 1015 05c8 13CA     		ldmia	r2!, {r0, r1, r4}
 1016 05ca 13C3     		stmia	r3!, {r0, r1, r4}
 1017 05cc 1188     		ldrh	r1, [r2]
 1018 05ce 1980     		strh	r1, [r3]
 1019 05d0 9278     		ldrb	r2, [r2, #2]
 1020 05d2 9A70     		strb	r2, [r3, #2]
 251:C:/github/pongTest/ver1\game_logic.c **** 	char game[] = "Greatest Game Ever?";
 1021              		.loc 1 251 0
 1022 05d4 3B1D     		adds	r3, r7, #4
 1023 05d6 094A     		ldr	r2, .L33+4
 1024 05d8 13CA     		ldmia	r2!, {r0, r1, r4}
 1025 05da 13C3     		stmia	r3!, {r0, r1, r4}
 1026 05dc 03CA     		ldmia	r2!, {r0, r1}
 1027 05de 03C3     		stmia	r3!, {r0, r1}
 252:C:/github/pongTest/ver1\game_logic.c **** 	
 253:C:/github/pongTest/ver1\game_logic.c **** 	update_ascii_display(welcoming, game);
 1028              		.loc 1 253 0
 1029 05e0 3A1D     		adds	r2, r7, #4
 1030 05e2 1823     		movs	r3, #24
 1031 05e4 FB18     		adds	r3, r7, r3
 1032 05e6 1100     		movs	r1, r2
 1033 05e8 1800     		movs	r0, r3
 1034 05ea FFF7FEFF 		bl	update_ascii_display
 254:C:/github/pongTest/ver1\game_logic.c **** }...
 1035              		.loc 1 254 0
 1036 05ee C046     		nop
 1037 05f0 BD46     		mov	sp, r7
 1038 05f2 0BB0     		add	sp, sp, #44
 1039              		@ sp needed
 1040 05f4 90BD     		pop	{r4, r7, pc}
 1041              	.L34:
 1042 05f6 C046     		.align	2
 1043              	.L33:
 1044 05f8 00000000 		.word	.LC0
 1045 05fc 10000000 		.word	.LC2
 1046              		.cfi_endproc
 1047              	.LFE8:
 1049              	.Letext0:
 1050              		.file 2 "C:/github/pongTest/ver1/standard_types.h"
 1051              		.file 3 "C:/github/pongTest/ver1/geometry.h"
 1052              		.file 4 "C:/github/pongTest/ver1/player_logic.h"
