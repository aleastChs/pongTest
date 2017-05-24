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
  26              		.file 1 "C:/Users/aleast/github/pongTest/ver1/game_logic.c"
   1:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** /*
   2:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 
   3:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * GAME_LOGIC.C
   4:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 
   5:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  */ 
   6:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
   7:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** #include <string.h>
   8:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** #include "standard_types.h"
   9:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** #include "keyboard_logic.h"
  10:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** #include "geometry.h"
  11:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** #include "game_logic.h"
  12:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** #include "delay.h"
  13:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** #include "ascii_logic.h"
  14:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** #include "player_logic.h"
  15:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
  16:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
  17:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // updating the ascii display with new outputs
  18:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // Parameters : 
  19:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // 				char textTop[] 		- Array of chars (ex = "Hello")		- Prints out on the LCD - TOP -LINE		
  20:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // 				char textBottom[] 	- Array of chars (ex = "Hello")		- Prints out on the LCD - BOTTOM -LINE
  21:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void update_ascii_display(char textTop[], char textBottom[], uint8 delayMs) 
  22:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** {
  27              		.loc 1 22 0
  28              		.cfi_startproc
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 86B0     		sub	sp, sp, #24
  34              		.cfi_def_cfa_offset 32
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 F860     		str	r0, [r7, #12]
  38 0008 B960     		str	r1, [r7, #8]
  39 000a FB1D     		adds	r3, r7, #7
  40 000c 1A70     		strb	r2, [r3]
  23:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char *str;
  24:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  25:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	ascii_gotoxt(1,1);
  41              		.loc 1 25 0
  42 000e 0121     		movs	r1, #1
  43 0010 0120     		movs	r0, #1
  44 0012 FFF7FEFF 		bl	ascii_gotoxt
  26:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  27:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	str = textTop;
  45              		.loc 1 27 0
  46 0016 FB68     		ldr	r3, [r7, #12]
  47 0018 7B61     		str	r3, [r7, #20]
  28:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  29:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	while(*str) {
  48              		.loc 1 29 0
  49 001a 0BE0     		b	.L2
  50              	.L3:
  30:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  51              		.loc 1 30 0
  52 001c 7B69     		ldr	r3, [r7, #20]
  53 001e 5A1C     		adds	r2, r3, #1
  54 0020 7A61     		str	r2, [r7, #20]
  55 0022 1B78     		ldrb	r3, [r3]
  56 0024 1800     		movs	r0, r3
  57 0026 FFF7FEFF 		bl	ascii_write_char
  31:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		delay_micro(delayMs);
  58              		.loc 1 31 0
  59 002a FB1D     		adds	r3, r7, #7
  60 002c 1B78     		ldrb	r3, [r3]
  61 002e 1800     		movs	r0, r3
  62 0030 FFF7FEFF 		bl	delay_micro
  63              	.L2:
  29:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  64              		.loc 1 29 0
  65 0034 7B69     		ldr	r3, [r7, #20]
  66 0036 1B78     		ldrb	r3, [r3]
  67 0038 002B     		cmp	r3, #0
  68 003a EFD1     		bne	.L3
  32:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
  33:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	ascii_gotoxt(1,2);
  69              		.loc 1 33 0
  70 003c 0221     		movs	r1, #2
  71 003e 0120     		movs	r0, #1
  72 0040 FFF7FEFF 		bl	ascii_gotoxt
  34:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	str = textBottom;
  73              		.loc 1 34 0
  74 0044 BB68     		ldr	r3, [r7, #8]
  75 0046 7B61     		str	r3, [r7, #20]
  35:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  36:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	while(*str) {
  76              		.loc 1 36 0
  77 0048 0BE0     		b	.L4
  78              	.L5:
  37:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  79              		.loc 1 37 0
  80 004a 7B69     		ldr	r3, [r7, #20]
  81 004c 5A1C     		adds	r2, r3, #1
  82 004e 7A61     		str	r2, [r7, #20]
  83 0050 1B78     		ldrb	r3, [r3]
  84 0052 1800     		movs	r0, r3
  85 0054 FFF7FEFF 		bl	ascii_write_char
  38:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		delay_micro(delayMs);
  86              		.loc 1 38 0
  87 0058 FB1D     		adds	r3, r7, #7
  88 005a 1B78     		ldrb	r3, [r3]
  89 005c 1800     		movs	r0, r3
  90 005e FFF7FEFF 		bl	delay_micro
  91              	.L4:
  36:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		ascii_write_char(*str++);
  92              		.loc 1 36 0
  93 0062 7B69     		ldr	r3, [r7, #20]
  94 0064 1B78     		ldrb	r3, [r3]
  95 0066 002B     		cmp	r3, #0
  96 0068 EFD1     		bne	.L5
  39:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
  40:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
  97              		.loc 1 40 0
  98 006a C046     		nop
  99 006c BD46     		mov	sp, r7
 100 006e 06B0     		add	sp, sp, #24
 101              		@ sp needed
 102 0070 80BD     		pop	{r7, pc}
 103              		.cfi_endproc
 104              	.LFE0:
 106 0072 C046     		.align	2
 107              		.global	append
 108              		.code	16
 109              		.thumb_func
 111              	append:
 112              	.LFB1:
  41:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
  42:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void append(char *s, char c) {
 113              		.loc 1 42 0
 114              		.cfi_startproc
 115 0074 80B5     		push	{r7, lr}
 116              		.cfi_def_cfa_offset 8
 117              		.cfi_offset 7, -8
 118              		.cfi_offset 14, -4
 119 0076 84B0     		sub	sp, sp, #16
 120              		.cfi_def_cfa_offset 24
 121 0078 00AF     		add	r7, sp, #0
 122              		.cfi_def_cfa_register 7
 123 007a 7860     		str	r0, [r7, #4]
 124 007c 0A00     		movs	r2, r1
 125 007e FB1C     		adds	r3, r7, #3
 126 0080 1A70     		strb	r2, [r3]
  43:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	int len = strlen(s);
 127              		.loc 1 43 0
 128 0082 7B68     		ldr	r3, [r7, #4]
 129 0084 1800     		movs	r0, r3
 130 0086 FFF7FEFF 		bl	strlen
 131 008a 0300     		movs	r3, r0
 132 008c FB60     		str	r3, [r7, #12]
  44:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	s[len] = c,
 133              		.loc 1 44 0
 134 008e FB68     		ldr	r3, [r7, #12]
 135 0090 7A68     		ldr	r2, [r7, #4]
 136 0092 D318     		adds	r3, r2, r3
 137 0094 FA1C     		adds	r2, r7, #3
 138 0096 1278     		ldrb	r2, [r2]
 139 0098 1A70     		strb	r2, [r3]
  45:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	s[len+1] = '\0';
 140              		.loc 1 45 0
 141 009a FB68     		ldr	r3, [r7, #12]
 142 009c 0133     		adds	r3, r3, #1
 143 009e 7A68     		ldr	r2, [r7, #4]
 144 00a0 D318     		adds	r3, r2, r3
 145 00a2 0022     		movs	r2, #0
 146 00a4 1A70     		strb	r2, [r3]
  46:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 147              		.loc 1 46 0
 148 00a6 C046     		nop
 149 00a8 BD46     		mov	sp, r7
 150 00aa 04B0     		add	sp, sp, #16
 151              		@ sp needed
 152 00ac 80BD     		pop	{r7, pc}
 153              		.cfi_endproc
 154              	.LFE1:
 156              		.section	.rodata
 157              		.align	2
 158              	.LC1:
 159 0000 53636F72 		.ascii	"Score Left is:   \000"
 159      65204C65 
 159      66742069 
 159      733A2020 
 159      2000
 160 0012 0000     		.align	2
 161              	.LC3:
 162 0014 53636F72 		.ascii	"Score Right is:  \000"
 162      65205269 
 162      67687420 
 162      69733A20 
 162      2000
 163 0026 0000     		.align	2
 164              	.LC0:
 165 0028 53       		.byte	83
 166 0029 63       		.byte	99
 167 002a 6F       		.byte	111
 168 002b 72       		.byte	114
 169 002c 65       		.byte	101
 170 002d 20       		.byte	32
 171 002e 6C       		.byte	108
 172 002f 65       		.byte	101
 173 0030 66       		.byte	102
 174 0031 74       		.byte	116
 175 0032 20       		.byte	32
 176 0033 69       		.byte	105
 177 0034 73       		.byte	115
 178 0035 3A       		.byte	58
 179 0036 20       		.byte	32
 180 0037 20       		.byte	32
 181 0038 20       		.byte	32
 182 0039 00       		.byte	0
 183              		.text
 184 00ae C046     		.align	2
 185              		.global	update_score
 186              		.code	16
 187              		.thumb_func
 189              	update_score:
 190              	.LFB2:
  47:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
  48:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void update_score(P_PLAYER p1, P_PLAYER p2) 
  49:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** {
 191              		.loc 1 49 0
 192              		.cfi_startproc
 193 00b0 80B5     		push	{r7, lr}
 194              		.cfi_def_cfa_offset 8
 195              		.cfi_offset 7, -8
 196              		.cfi_offset 14, -4
 197 00b2 90B0     		sub	sp, sp, #64
 198              		.cfi_def_cfa_offset 72
 199 00b4 00AF     		add	r7, sp, #0
 200              		.cfi_def_cfa_register 7
 201 00b6 7860     		str	r0, [r7, #4]
 202 00b8 3960     		str	r1, [r7]
  50:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint32 score1 = (int) (p1->score);
 203              		.loc 1 50 0
 204 00ba 7B68     		ldr	r3, [r7, #4]
 205 00bc 1B79     		ldrb	r3, [r3, #4]
 206 00be FB63     		str	r3, [r7, #60]
  51:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint32 score2 = (int) (p2->score);
 207              		.loc 1 51 0
 208 00c0 3B68     		ldr	r3, [r7]
 209 00c2 1B79     		ldrb	r3, [r3, #4]
 210 00c4 BB63     		str	r3, [r7, #56]
  52:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  53:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char *p1_text_ptr = "Score Left is:   ";
 211              		.loc 1 53 0
 212 00c6 384B     		ldr	r3, .L8
 213 00c8 7B63     		str	r3, [r7, #52]
  54:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char *p2_text_ptr = "Score Right is:  ";
 214              		.loc 1 54 0
 215 00ca 384B     		ldr	r3, .L8+4
 216 00cc 3B63     		str	r3, [r7, #48]
  55:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  56:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	append(p1_text_ptr, score1);
 217              		.loc 1 56 0
 218 00ce FB6B     		ldr	r3, [r7, #60]
 219 00d0 DAB2     		uxtb	r2, r3
 220 00d2 7B6B     		ldr	r3, [r7, #52]
 221 00d4 1100     		movs	r1, r2
 222 00d6 1800     		movs	r0, r3
 223 00d8 FFF7FEFF 		bl	append
  57:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	append(p2_text_ptr, score2);
 224              		.loc 1 57 0
 225 00dc BB6B     		ldr	r3, [r7, #56]
 226 00de DAB2     		uxtb	r2, r3
 227 00e0 3B6B     		ldr	r3, [r7, #48]
 228 00e2 1100     		movs	r1, r2
 229 00e4 1800     		movs	r0, r3
 230 00e6 FFF7FEFF 		bl	append
  58:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  59:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char p1_text[] = {'S','c','o','r','e',' ','l','e','f','t',' ','i','s',':',' ',' ',' ','\0'};	
 231              		.loc 1 59 0
 232 00ea 1C23     		movs	r3, #28
 233 00ec FA18     		adds	r2, r7, r3
 234 00ee 304B     		ldr	r3, .L8+8
 235 00f0 1000     		movs	r0, r2
 236 00f2 1900     		movs	r1, r3
 237 00f4 1223     		movs	r3, #18
 238 00f6 1A00     		movs	r2, r3
 239 00f8 FFF7FEFF 		bl	memcpy
  60:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char p2_text[] = {'S','c','o','r','e',' ','r','i','g','h','t',' ','i','s',':',' ',score2,'\0'};
 240              		.loc 1 60 0
 241 00fc 0823     		movs	r3, #8
 242 00fe FB18     		adds	r3, r7, r3
 243 0100 5322     		movs	r2, #83
 244 0102 1A70     		strb	r2, [r3]
 245 0104 0823     		movs	r3, #8
 246 0106 FB18     		adds	r3, r7, r3
 247 0108 6322     		movs	r2, #99
 248 010a 5A70     		strb	r2, [r3, #1]
 249 010c 0823     		movs	r3, #8
 250 010e FB18     		adds	r3, r7, r3
 251 0110 6F22     		movs	r2, #111
 252 0112 9A70     		strb	r2, [r3, #2]
 253 0114 0823     		movs	r3, #8
 254 0116 FB18     		adds	r3, r7, r3
 255 0118 7222     		movs	r2, #114
 256 011a DA70     		strb	r2, [r3, #3]
 257 011c 0823     		movs	r3, #8
 258 011e FB18     		adds	r3, r7, r3
 259 0120 6522     		movs	r2, #101
 260 0122 1A71     		strb	r2, [r3, #4]
 261 0124 0823     		movs	r3, #8
 262 0126 FB18     		adds	r3, r7, r3
 263 0128 2022     		movs	r2, #32
 264 012a 5A71     		strb	r2, [r3, #5]
 265 012c 0823     		movs	r3, #8
 266 012e FB18     		adds	r3, r7, r3
 267 0130 7222     		movs	r2, #114
 268 0132 9A71     		strb	r2, [r3, #6]
 269 0134 0823     		movs	r3, #8
 270 0136 FB18     		adds	r3, r7, r3
 271 0138 6922     		movs	r2, #105
 272 013a DA71     		strb	r2, [r3, #7]
 273 013c 0823     		movs	r3, #8
 274 013e FB18     		adds	r3, r7, r3
 275 0140 6722     		movs	r2, #103
 276 0142 1A72     		strb	r2, [r3, #8]
 277 0144 0823     		movs	r3, #8
 278 0146 FB18     		adds	r3, r7, r3
 279 0148 6822     		movs	r2, #104
 280 014a 5A72     		strb	r2, [r3, #9]
 281 014c 0823     		movs	r3, #8
 282 014e FB18     		adds	r3, r7, r3
 283 0150 7422     		movs	r2, #116
 284 0152 9A72     		strb	r2, [r3, #10]
 285 0154 0823     		movs	r3, #8
 286 0156 FB18     		adds	r3, r7, r3
 287 0158 2022     		movs	r2, #32
 288 015a DA72     		strb	r2, [r3, #11]
 289 015c 0823     		movs	r3, #8
 290 015e FB18     		adds	r3, r7, r3
 291 0160 6922     		movs	r2, #105
 292 0162 1A73     		strb	r2, [r3, #12]
 293 0164 0823     		movs	r3, #8
 294 0166 FB18     		adds	r3, r7, r3
 295 0168 7322     		movs	r2, #115
 296 016a 5A73     		strb	r2, [r3, #13]
 297 016c 0823     		movs	r3, #8
 298 016e FB18     		adds	r3, r7, r3
 299 0170 3A22     		movs	r2, #58
 300 0172 9A73     		strb	r2, [r3, #14]
 301 0174 0823     		movs	r3, #8
 302 0176 FB18     		adds	r3, r7, r3
 303 0178 2022     		movs	r2, #32
 304 017a DA73     		strb	r2, [r3, #15]
 305 017c BB6B     		ldr	r3, [r7, #56]
 306 017e DAB2     		uxtb	r2, r3
 307 0180 0823     		movs	r3, #8
 308 0182 FB18     		adds	r3, r7, r3
 309 0184 1A74     		strb	r2, [r3, #16]
 310 0186 0823     		movs	r3, #8
 311 0188 FB18     		adds	r3, r7, r3
 312 018a 0022     		movs	r2, #0
 313 018c 5A74     		strb	r2, [r3, #17]
  61:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  62:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	ascii_clear_display();
 314              		.loc 1 62 0
 315 018e FFF7FEFF 		bl	ascii_clear_display
  63:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  64:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	update_ascii_display(p1_text_ptr, p2_text_ptr, 0);
 316              		.loc 1 64 0
 317 0192 396B     		ldr	r1, [r7, #48]
 318 0194 7B6B     		ldr	r3, [r7, #52]
 319 0196 0022     		movs	r2, #0
 320 0198 1800     		movs	r0, r3
 321 019a FFF7FEFF 		bl	update_ascii_display
  65:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 322              		.loc 1 65 0
 323 019e C046     		nop
 324 01a0 BD46     		mov	sp, r7
 325 01a2 10B0     		add	sp, sp, #64
 326              		@ sp needed
 327 01a4 80BD     		pop	{r7, pc}
 328              	.L9:
 329 01a6 C046     		.align	2
 330              	.L8:
 331 01a8 00000000 		.word	.LC1
 332 01ac 14000000 		.word	.LC3
 333 01b0 28000000 		.word	.LC0
 334              		.cfi_endproc
 335              	.LFE2:
 337              		.align	2
 338              		.global	get_wall_player
 339              		.code	16
 340              		.thumb_func
 342              	get_wall_player:
 343              	.LFB3:
  66:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
  67:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** /*
  68:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * GET THE POSITION OF THE PLAYER
  69:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 
  70:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * IF isLeftWall == 0:			do nothing 
  71:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * ELSE IF isLeft == 1:			add the size of x to the position
  72:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 
  73:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * RETURN THE POSITION IN X
  74:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  */ 
  75:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** uint8 get_wall_player(P_OBJECT player, uint8 isLeftWall) {
 344              		.loc 1 75 0
 345              		.cfi_startproc
 346 01b4 80B5     		push	{r7, lr}
 347              		.cfi_def_cfa_offset 8
 348              		.cfi_offset 7, -8
 349              		.cfi_offset 14, -4
 350 01b6 84B0     		sub	sp, sp, #16
 351              		.cfi_def_cfa_offset 24
 352 01b8 00AF     		add	r7, sp, #0
 353              		.cfi_def_cfa_register 7
 354 01ba 7860     		str	r0, [r7, #4]
 355 01bc 0A00     		movs	r2, r1
 356 01be FB1C     		adds	r3, r7, #3
 357 01c0 1A70     		strb	r2, [r3]
  76:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint32 x;
  77:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  78:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	x = player->posx;
 358              		.loc 1 78 0
 359 01c2 7B68     		ldr	r3, [r7, #4]
 360 01c4 DB68     		ldr	r3, [r3, #12]
 361 01c6 FB60     		str	r3, [r7, #12]
  79:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
  80:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	if(isLeftWall != 0) {
 362              		.loc 1 80 0
 363 01c8 FB1C     		adds	r3, r7, #3
 364 01ca 1B78     		ldrb	r3, [r3]
 365 01cc 002B     		cmp	r3, #0
 366 01ce 05D0     		beq	.L11
  81:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		// if isLeftWall non-zero add size of player
  82:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		x += player->geo->sizex;
 367              		.loc 1 82 0
 368 01d0 7B68     		ldr	r3, [r7, #4]
 369 01d2 1B68     		ldr	r3, [r3]
 370 01d4 5B68     		ldr	r3, [r3, #4]
 371 01d6 FA68     		ldr	r2, [r7, #12]
 372 01d8 D318     		adds	r3, r2, r3
 373 01da FB60     		str	r3, [r7, #12]
 374              	.L11:
  83:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
  84:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	return x;
 375              		.loc 1 84 0
 376 01dc FB68     		ldr	r3, [r7, #12]
 377 01de DBB2     		uxtb	r3, r3
  85:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 378              		.loc 1 85 0
 379 01e0 1800     		movs	r0, r3
 380 01e2 BD46     		mov	sp, r7
 381 01e4 04B0     		add	sp, sp, #16
 382              		@ sp needed
 383 01e6 80BD     		pop	{r7, pc}
 384              		.cfi_endproc
 385              	.LFE3:
 387              		.align	2
 388              		.global	inside_y_wise
 389              		.code	16
 390              		.thumb_func
 392              	inside_y_wise:
 393              	.LFB4:
  86:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
  87:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** /*
  88:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * CHECK IF OBJECT1 IS INSIDE OBEJCT2 Y - WISE
  89:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 
  90:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * IF SO:		RETURN 1
  91:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * ELSE:		RETURN 0
  92:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 
  93:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  */ 
  94:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** uint8 inside_y_wise(P_OBJECT object1, P_OBJECT object2) {
 394              		.loc 1 94 0
 395              		.cfi_startproc
 396 01e8 80B5     		push	{r7, lr}
 397              		.cfi_def_cfa_offset 8
 398              		.cfi_offset 7, -8
 399              		.cfi_offset 14, -4
 400 01ea 84B0     		sub	sp, sp, #16
 401              		.cfi_def_cfa_offset 24
 402 01ec 00AF     		add	r7, sp, #0
 403              		.cfi_def_cfa_register 7
 404 01ee 7860     		str	r0, [r7, #4]
 405 01f0 3960     		str	r1, [r7]
  95:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 obj1_top_coord = object1->posy;
 406              		.loc 1 95 0
 407 01f2 7B68     		ldr	r3, [r7, #4]
 408 01f4 1A69     		ldr	r2, [r3, #16]
 409 01f6 0E23     		movs	r3, #14
 410 01f8 FB18     		adds	r3, r7, r3
 411 01fa 1A70     		strb	r2, [r3]
  96:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 412              		.loc 1 96 0
 413 01fc FFF7FEFF 		bl	delay_250ns
  97:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_top_coord = object2->posy;
 414              		.loc 1 97 0
 415 0200 3B68     		ldr	r3, [r7]
 416 0202 1A69     		ldr	r2, [r3, #16]
 417 0204 0D23     		movs	r3, #13
 418 0206 FB18     		adds	r3, r7, r3
 419 0208 1A70     		strb	r2, [r3]
  98:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 obj2_bottom_coord = obj2_top_coord + object2->geo->sizey;
 420              		.loc 1 98 0
 421 020a 3B68     		ldr	r3, [r7]
 422 020c 1B68     		ldr	r3, [r3]
 423 020e 9B68     		ldr	r3, [r3, #8]
 424 0210 D9B2     		uxtb	r1, r3
 425 0212 0C23     		movs	r3, #12
 426 0214 FB18     		adds	r3, r7, r3
 427 0216 0D22     		movs	r2, #13
 428 0218 BA18     		adds	r2, r7, r2
 429 021a 1278     		ldrb	r2, [r2]
 430 021c 8A18     		adds	r2, r1, r2
 431 021e 1A70     		strb	r2, [r3]
  99:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 432              		.loc 1 99 0
 433 0220 FFF7FEFF 		bl	delay_250ns
 100:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 value = 0;
 434              		.loc 1 100 0
 435 0224 0F23     		movs	r3, #15
 436 0226 FB18     		adds	r3, r7, r3
 437 0228 0022     		movs	r2, #0
 438 022a 1A70     		strb	r2, [r3]
 101:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	if (obj1_top_coord >= obj2_top_coord && obj1_top_coord <= obj2_bottom_coord) {
 439              		.loc 1 101 0
 440 022c 0E23     		movs	r3, #14
 441 022e FA18     		adds	r2, r7, r3
 442 0230 0D23     		movs	r3, #13
 443 0232 FB18     		adds	r3, r7, r3
 444 0234 1278     		ldrb	r2, [r2]
 445 0236 1B78     		ldrb	r3, [r3]
 446 0238 9A42     		cmp	r2, r3
 447 023a 0BD3     		bcc	.L14
 448              		.loc 1 101 0 is_stmt 0 discriminator 1
 449 023c 0E23     		movs	r3, #14
 450 023e FA18     		adds	r2, r7, r3
 451 0240 0C23     		movs	r3, #12
 452 0242 FB18     		adds	r3, r7, r3
 453 0244 1278     		ldrb	r2, [r2]
 454 0246 1B78     		ldrb	r3, [r3]
 455 0248 9A42     		cmp	r2, r3
 456 024a 03D8     		bhi	.L14
 102:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		value = 1;
 457              		.loc 1 102 0 is_stmt 1
 458 024c 0F23     		movs	r3, #15
 459 024e FB18     		adds	r3, r7, r3
 460 0250 0122     		movs	r2, #1
 461 0252 1A70     		strb	r2, [r3]
 462              	.L14:
 103:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 104:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 105:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	return value;
 463              		.loc 1 105 0
 464 0254 0F23     		movs	r3, #15
 465 0256 FB18     		adds	r3, r7, r3
 466 0258 1B78     		ldrb	r3, [r3]
 106:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 467              		.loc 1 106 0
 468 025a 1800     		movs	r0, r3
 469 025c BD46     		mov	sp, r7
 470 025e 04B0     		add	sp, sp, #16
 471              		@ sp needed
 472 0260 80BD     		pop	{r7, pc}
 473              		.cfi_endproc
 474              	.LFE4:
 476 0262 C046     		.align	2
 477              		.global	start_new_ball
 478              		.code	16
 479              		.thumb_func
 481              	start_new_ball:
 482              	.LFB5:
 107:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 108:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // Pass the ball 
 109:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // And if toTheRight is 
 110:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** //						0:		start the ball to the left direction			
 111:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** //						1:		start the ball to the right direction
 112:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void start_new_ball(P_OBJECT b, uint8 toTheRight)
 113:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** {
 483              		.loc 1 113 0
 484              		.cfi_startproc
 485 0264 90B5     		push	{r4, r7, lr}
 486              		.cfi_def_cfa_offset 12
 487              		.cfi_offset 4, -12
 488              		.cfi_offset 7, -8
 489              		.cfi_offset 14, -4
 490 0266 83B0     		sub	sp, sp, #12
 491              		.cfi_def_cfa_offset 24
 492 0268 00AF     		add	r7, sp, #0
 493              		.cfi_def_cfa_register 7
 494 026a 7860     		str	r0, [r7, #4]
 495 026c 0A00     		movs	r2, r1
 496 026e FB1C     		adds	r3, r7, #3
 497 0270 1A70     		strb	r2, [r3]
 114:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	b->posx = 64;
 498              		.loc 1 114 0
 499 0272 7B68     		ldr	r3, [r7, #4]
 500 0274 4022     		movs	r2, #64
 501 0276 DA60     		str	r2, [r3, #12]
 115:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	b->posy = 20;
 502              		.loc 1 115 0
 503 0278 7B68     		ldr	r3, [r7, #4]
 504 027a 1422     		movs	r2, #20
 505 027c 1A61     		str	r2, [r3, #16]
 116:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 117:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	b->set_speed(b	,	   -1	,	b->diry);
 506              		.loc 1 117 0
 507 027e 7B68     		ldr	r3, [r7, #4]
 508 0280 1C6A     		ldr	r4, [r3, #32]
 509 0282 7B68     		ldr	r3, [r7, #4]
 510 0284 9A68     		ldr	r2, [r3, #8]
 511 0286 0123     		movs	r3, #1
 512 0288 5942     		rsbs	r1, r3, #0
 513 028a 7B68     		ldr	r3, [r7, #4]
 514 028c 1800     		movs	r0, r3
 515 028e A047     		blx	r4
 118:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 119:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	if (toTheRight != 0) 
 516              		.loc 1 119 0
 517 0290 FB1C     		adds	r3, r7, #3
 518 0292 1B78     		ldrb	r3, [r3]
 519 0294 002B     		cmp	r3, #0
 520 0296 07D0     		beq	.L18
 120:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 121:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		b->set_speed(b	,	1	,	b->diry);
 521              		.loc 1 121 0
 522 0298 7B68     		ldr	r3, [r7, #4]
 523 029a 1C6A     		ldr	r4, [r3, #32]
 524 029c 7B68     		ldr	r3, [r7, #4]
 525 029e 9A68     		ldr	r2, [r3, #8]
 526 02a0 7B68     		ldr	r3, [r7, #4]
 527 02a2 0121     		movs	r1, #1
 528 02a4 1800     		movs	r0, r3
 529 02a6 A047     		blx	r4
 530              	.L18:
 122:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 123:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 531              		.loc 1 123 0
 532 02a8 C046     		nop
 533 02aa BD46     		mov	sp, r7
 534 02ac 03B0     		add	sp, sp, #12
 535              		@ sp needed
 536 02ae 90BD     		pop	{r4, r7, pc}
 537              		.cfi_endproc
 538              	.LFE5:
 540              		.align	2
 541              		.global	check_ball
 542              		.code	16
 543              		.thumb_func
 545              	check_ball:
 546              	.LFB6:
 124:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 125:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** /*
 126:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES PLAYER_LEFT / PLAYER_RIGHT 
 127:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 
 128:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * IF SO:		change direction of the ball in X
 129:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * ELSE:		do nothing
 130:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 
 131:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * CHECK IF THE BALL TOUCHES THE WALL TO THE LEFT / RIGHT  
 132:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  */ 
 133:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void check_ball(P_PLAYER playerLeft, P_PLAYER playerRight, P_OBJECT ball)
 134:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** {
 547              		.loc 1 134 0
 548              		.cfi_startproc
 549 02b0 90B5     		push	{r4, r7, lr}
 550              		.cfi_def_cfa_offset 12
 551              		.cfi_offset 4, -12
 552              		.cfi_offset 7, -8
 553              		.cfi_offset 14, -4
 554 02b2 87B0     		sub	sp, sp, #28
 555              		.cfi_def_cfa_offset 40
 556 02b4 00AF     		add	r7, sp, #0
 557              		.cfi_def_cfa_register 7
 558 02b6 F860     		str	r0, [r7, #12]
 559 02b8 B960     		str	r1, [r7, #8]
 560 02ba 7A60     		str	r2, [r7, #4]
 135:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_left = get_wall_player(playerLeft->p_obj, 1);
 561              		.loc 1 135 0
 562 02bc FB68     		ldr	r3, [r7, #12]
 563 02be 1B68     		ldr	r3, [r3]
 564 02c0 1722     		movs	r2, #23
 565 02c2 BC18     		adds	r4, r7, r2
 566 02c4 0121     		movs	r1, #1
 567 02c6 1800     		movs	r0, r3
 568 02c8 FFF7FEFF 		bl	get_wall_player
 569 02cc 0300     		movs	r3, r0
 570 02ce 2370     		strb	r3, [r4]
 136:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 571              		.loc 1 136 0
 572 02d0 FFF7FEFF 		bl	delay_250ns
 137:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 wall_player_right = get_wall_player(playerRight->p_obj, 0);
 573              		.loc 1 137 0
 574 02d4 BB68     		ldr	r3, [r7, #8]
 575 02d6 1B68     		ldr	r3, [r3]
 576 02d8 1622     		movs	r2, #22
 577 02da BC18     		adds	r4, r7, r2
 578 02dc 0021     		movs	r1, #0
 579 02de 1800     		movs	r0, r3
 580 02e0 FFF7FEFF 		bl	get_wall_player
 581 02e4 0300     		movs	r3, r0
 582 02e6 2370     		strb	r3, [r4]
 138:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 583              		.loc 1 138 0
 584 02e8 FFF7FEFF 		bl	delay_250ns
 139:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 ball_right_side_coord = (ball->posx + ball->geo->sizex);
 585              		.loc 1 139 0
 586 02ec 7B68     		ldr	r3, [r7, #4]
 587 02ee DB68     		ldr	r3, [r3, #12]
 588 02f0 D9B2     		uxtb	r1, r3
 589 02f2 7B68     		ldr	r3, [r7, #4]
 590 02f4 1B68     		ldr	r3, [r3]
 591 02f6 5B68     		ldr	r3, [r3, #4]
 592 02f8 DAB2     		uxtb	r2, r3
 593 02fa 1523     		movs	r3, #21
 594 02fc FB18     		adds	r3, r7, r3
 595 02fe 8A18     		adds	r2, r1, r2
 596 0300 1A70     		strb	r2, [r3]
 140:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 ball_left_side_coord = ball->posx;
 597              		.loc 1 140 0
 598 0302 7B68     		ldr	r3, [r7, #4]
 599 0304 DA68     		ldr	r2, [r3, #12]
 600 0306 1423     		movs	r3, #20
 601 0308 FB18     		adds	r3, r7, r3
 602 030a 1A70     		strb	r2, [r3]
 141:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 603              		.loc 1 141 0
 604 030c FFF7FEFF 		bl	delay_250ns
 142:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 ball_top_coord = ball->posy;
 605              		.loc 1 142 0
 606 0310 7B68     		ldr	r3, [r7, #4]
 607 0312 1A69     		ldr	r2, [r3, #16]
 608 0314 1323     		movs	r3, #19
 609 0316 FB18     		adds	r3, r7, r3
 610 0318 1A70     		strb	r2, [r3]
 143:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	uint8 ball_bottom_coord = ball->posy + ball->geo->sizey;
 611              		.loc 1 143 0
 612 031a 7B68     		ldr	r3, [r7, #4]
 613 031c 1B69     		ldr	r3, [r3, #16]
 614 031e D9B2     		uxtb	r1, r3
 615 0320 7B68     		ldr	r3, [r7, #4]
 616 0322 1B68     		ldr	r3, [r3]
 617 0324 9B68     		ldr	r3, [r3, #8]
 618 0326 DAB2     		uxtb	r2, r3
 619 0328 1223     		movs	r3, #18
 620 032a FB18     		adds	r3, r7, r3
 621 032c 8A18     		adds	r2, r1, r2
 622 032e 1A70     		strb	r2, [r3]
 144:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 145:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // CHECK IF GOAL!!!
 146:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 147:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	if ( ball_right_side_coord >= 126) {
 623              		.loc 1 147 0
 624 0330 1523     		movs	r3, #21
 625 0332 FB18     		adds	r3, r7, r3
 626 0334 1B78     		ldrb	r3, [r3]
 627 0336 7D2B     		cmp	r3, #125
 628 0338 0FD9     		bls	.L20
 148:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		// player left gets a point
 149:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		increaseScore(playerLeft);
 629              		.loc 1 149 0
 630 033a FB68     		ldr	r3, [r7, #12]
 631 033c 1800     		movs	r0, r3
 632 033e FFF7FEFF 		bl	increaseScore
 150:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		// update ascii-display	
 151:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		update_score(playerLeft, playerRight);
 633              		.loc 1 151 0
 634 0342 BA68     		ldr	r2, [r7, #8]
 635 0344 FB68     		ldr	r3, [r7, #12]
 636 0346 1100     		movs	r1, r2
 637 0348 1800     		movs	r0, r3
 638 034a FFF7FEFF 		bl	update_score
 152:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		// start a new ball
 153:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		start_new_ball(ball, 0);
 639              		.loc 1 153 0
 640 034e 7B68     		ldr	r3, [r7, #4]
 641 0350 0021     		movs	r1, #0
 642 0352 1800     		movs	r0, r3
 643 0354 FFF7FEFF 		bl	start_new_ball
 644 0358 13E0     		b	.L21
 645              	.L20:
 154:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	} else if (ball_left_side_coord <= 3) {
 646              		.loc 1 154 0
 647 035a 1423     		movs	r3, #20
 648 035c FB18     		adds	r3, r7, r3
 649 035e 1B78     		ldrb	r3, [r3]
 650 0360 032B     		cmp	r3, #3
 651 0362 0ED8     		bhi	.L21
 155:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		// player right gets a point
 156:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		increaseScore(playerRight);
 652              		.loc 1 156 0
 653 0364 BB68     		ldr	r3, [r7, #8]
 654 0366 1800     		movs	r0, r3
 655 0368 FFF7FEFF 		bl	increaseScore
 157:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		// update ascii-display
 158:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		update_score(playerLeft, playerRight);
 656              		.loc 1 158 0
 657 036c BA68     		ldr	r2, [r7, #8]
 658 036e FB68     		ldr	r3, [r7, #12]
 659 0370 1100     		movs	r1, r2
 660 0372 1800     		movs	r0, r3
 661 0374 FFF7FEFF 		bl	update_score
 159:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		// start a new ball
 160:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		start_new_ball(ball, 1);
 662              		.loc 1 160 0
 663 0378 7B68     		ldr	r3, [r7, #4]
 664 037a 0121     		movs	r1, #1
 665 037c 1800     		movs	r0, r3
 666 037e FFF7FEFF 		bl	start_new_ball
 667              	.L21:
 161:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	} 
 162:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 163:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // END CHECK GOAL
 164:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 165:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 166:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // CHECK WALLS PLAYERS
 167:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 668              		.loc 1 167 0
 669 0382 FFF7FEFF 		bl	delay_250ns
 168:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	if (   ( ball_right_side_coord + 1)  == wall_player_right  ) 
 670              		.loc 1 168 0
 671 0386 1523     		movs	r3, #21
 672 0388 FB18     		adds	r3, r7, r3
 673 038a 1B78     		ldrb	r3, [r3]
 674 038c 5A1C     		adds	r2, r3, #1
 675 038e 1623     		movs	r3, #22
 676 0390 FB18     		adds	r3, r7, r3
 677 0392 1B78     		ldrb	r3, [r3]
 678 0394 9A42     		cmp	r2, r3
 679 0396 1AD1     		bne	.L22
 169:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{ // playerRight
 170:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 171:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerRight->p_obj)) 
 680              		.loc 1 171 0
 681 0398 BB68     		ldr	r3, [r7, #8]
 682 039a 1A68     		ldr	r2, [r3]
 683 039c 7B68     		ldr	r3, [r7, #4]
 684 039e 1100     		movs	r1, r2
 685 03a0 1800     		movs	r0, r3
 686 03a2 FFF7FEFF 		bl	inside_y_wise
 687 03a6 031E     		subs	r3, r0, #0
 688 03a8 31D0     		beq	.L24
 172:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		{
 173:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 689              		.loc 1 173 0
 690 03aa 7B68     		ldr	r3, [r7, #4]
 691 03ac 5B68     		ldr	r3, [r3, #4]
 692 03ae 5A42     		rsbs	r2, r3, #0
 693 03b0 7B68     		ldr	r3, [r7, #4]
 694 03b2 5A60     		str	r2, [r3, #4]
 174:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 			delay_250ns();
 695              		.loc 1 174 0
 696 03b4 FFF7FEFF 		bl	delay_250ns
 175:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_right - ball->geo->sizex - 1;
 697              		.loc 1 175 0
 698 03b8 1623     		movs	r3, #22
 699 03ba FB18     		adds	r3, r7, r3
 700 03bc 1A78     		ldrb	r2, [r3]
 701 03be 7B68     		ldr	r3, [r7, #4]
 702 03c0 1B68     		ldr	r3, [r3]
 703 03c2 5B68     		ldr	r3, [r3, #4]
 704 03c4 D31A     		subs	r3, r2, r3
 705 03c6 5A1E     		subs	r2, r3, #1
 706 03c8 7B68     		ldr	r3, [r7, #4]
 707 03ca DA60     		str	r2, [r3, #12]
 708 03cc 1FE0     		b	.L24
 709              	.L22:
 176:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		}
 177:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		
 178:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	} 
 179:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	else if (    (ball_left_side_coord - 1) == wall_player_left ) 
 710              		.loc 1 179 0
 711 03ce 1423     		movs	r3, #20
 712 03d0 FB18     		adds	r3, r7, r3
 713 03d2 1B78     		ldrb	r3, [r3]
 714 03d4 5A1E     		subs	r2, r3, #1
 715 03d6 1723     		movs	r3, #23
 716 03d8 FB18     		adds	r3, r7, r3
 717 03da 1B78     		ldrb	r3, [r3]
 718 03dc 9A42     		cmp	r2, r3
 719 03de 16D1     		bne	.L24
 180:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{ // playerLeft
 181:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		
 182:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		if (inside_y_wise(ball, playerLeft->p_obj)) 
 720              		.loc 1 182 0
 721 03e0 FB68     		ldr	r3, [r7, #12]
 722 03e2 1A68     		ldr	r2, [r3]
 723 03e4 7B68     		ldr	r3, [r7, #4]
 724 03e6 1100     		movs	r1, r2
 725 03e8 1800     		movs	r0, r3
 726 03ea FFF7FEFF 		bl	inside_y_wise
 727 03ee 031E     		subs	r3, r0, #0
 728 03f0 0DD0     		beq	.L24
 183:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		{
 184:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 			ball->dirx = -(ball->dirx);
 729              		.loc 1 184 0
 730 03f2 7B68     		ldr	r3, [r7, #4]
 731 03f4 5B68     		ldr	r3, [r3, #4]
 732 03f6 5A42     		rsbs	r2, r3, #0
 733 03f8 7B68     		ldr	r3, [r7, #4]
 734 03fa 5A60     		str	r2, [r3, #4]
 185:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 			delay_250ns();
 735              		.loc 1 185 0
 736 03fc FFF7FEFF 		bl	delay_250ns
 186:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 			ball->posx = wall_player_left + 1;
 737              		.loc 1 186 0
 738 0400 1723     		movs	r3, #23
 739 0402 FB18     		adds	r3, r7, r3
 740 0404 1B78     		ldrb	r3, [r3]
 741 0406 0133     		adds	r3, r3, #1
 742 0408 1A00     		movs	r2, r3
 743 040a 7B68     		ldr	r3, [r7, #4]
 744 040c DA60     		str	r2, [r3, #12]
 745              	.L24:
 187:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		}
 188:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		
 189:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 190:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // END CHECK WALLS PLAYERS
 191:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 192:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 193:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // CHECK FLOOR / BOTTOM
 194:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_250ns();
 746              		.loc 1 194 0
 747 040e FFF7FEFF 		bl	delay_250ns
 195:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	if (ball_top_coord <= 2) 
 748              		.loc 1 195 0
 749 0412 1323     		movs	r3, #19
 750 0414 FB18     		adds	r3, r7, r3
 751 0416 1B78     		ldrb	r3, [r3]
 752 0418 022B     		cmp	r3, #2
 753 041a 05D8     		bhi	.L25
 196:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 197:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 754              		.loc 1 197 0
 755 041c 7B68     		ldr	r3, [r7, #4]
 756 041e 9B68     		ldr	r3, [r3, #8]
 757 0420 5A42     		rsbs	r2, r3, #0
 758 0422 7B68     		ldr	r3, [r7, #4]
 759 0424 9A60     		str	r2, [r3, #8]
 198:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	} 
 199:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	else if( ball_bottom_coord >= 62) 
 200:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 201:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		ball->diry = -(ball->diry);
 202:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 203:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // END CHECK FLOOR / BOTTOM	
 204:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 205:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 206:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 760              		.loc 1 206 0
 761 0426 09E0     		b	.L27
 762              	.L25:
 199:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 763              		.loc 1 199 0
 764 0428 1223     		movs	r3, #18
 765 042a FB18     		adds	r3, r7, r3
 766 042c 1B78     		ldrb	r3, [r3]
 767 042e 3D2B     		cmp	r3, #61
 768 0430 04D9     		bls	.L27
 201:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 769              		.loc 1 201 0
 770 0432 7B68     		ldr	r3, [r7, #4]
 771 0434 9B68     		ldr	r3, [r3, #8]
 772 0436 5A42     		rsbs	r2, r3, #0
 773 0438 7B68     		ldr	r3, [r7, #4]
 774 043a 9A60     		str	r2, [r3, #8]
 775              	.L27:
 776              		.loc 1 206 0
 777 043c C046     		nop
 778 043e BD46     		mov	sp, r7
 779 0440 07B0     		add	sp, sp, #28
 780              		@ sp needed
 781 0442 90BD     		pop	{r4, r7, pc}
 782              		.cfi_endproc
 783              	.LFE6:
 785              		.align	2
 786              		.global	update_player_pos
 787              		.code	16
 788              		.thumb_func
 790              	update_player_pos:
 791              	.LFB7:
 207:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // read keyboard right
 208:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	// if:		2_IS_PRESSED 
 209:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	//					playerXX->set_speed(0,1);
 210:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 211:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 212:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	// else if:	 8_IS_PRESSED 
 213:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	//					plauerXX->set_speed(0,-1);
 214:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	//			CHECK IF ENABLE TO MOVE
 215:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	//									THEN DRAW
 216:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 217:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void update_player_pos(P_PLAYER playerLeft, P_PLAYER playerRight) 
 218:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** {	
 792              		.loc 1 218 0
 793              		.cfi_startproc
 794 0444 90B5     		push	{r4, r7, lr}
 795              		.cfi_def_cfa_offset 12
 796              		.cfi_offset 4, -12
 797              		.cfi_offset 7, -8
 798              		.cfi_offset 14, -4
 799 0446 85B0     		sub	sp, sp, #20
 800              		.cfi_def_cfa_offset 32
 801 0448 00AF     		add	r7, sp, #0
 802              		.cfi_def_cfa_register 7
 803 044a 7860     		str	r0, [r7, #4]
 804 044c 3960     		str	r1, [r7]
 219:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 220:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // Player to The LEFT
 221:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	playerLeft->key_pressed = get_key(1);
 805              		.loc 1 221 0
 806 044e 0120     		movs	r0, #1
 807 0450 FFF7FEFF 		bl	get_key
 808 0454 0300     		movs	r3, r0
 809 0456 1A00     		movs	r2, r3
 810 0458 7B68     		ldr	r3, [r7, #4]
 811 045a 5A71     		strb	r2, [r3, #5]
 222:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 223:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	volatile uint8 pressed = playerLeft->key_pressed;
 812              		.loc 1 223 0
 813 045c 7B68     		ldr	r3, [r7, #4]
 814 045e 5A79     		ldrb	r2, [r3, #5]
 815 0460 0F23     		movs	r3, #15
 816 0462 FB18     		adds	r3, r7, r3
 817 0464 1A70     		strb	r2, [r3]
 224:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 225:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	if ((pressed == 2) && (playerLeft->p_obj->posy >= 2)) 
 818              		.loc 1 225 0
 819 0466 0F23     		movs	r3, #15
 820 0468 FB18     		adds	r3, r7, r3
 821 046a 1B78     		ldrb	r3, [r3]
 822 046c DBB2     		uxtb	r3, r3
 823 046e 022B     		cmp	r3, #2
 824 0470 15D1     		bne	.L29
 825              		.loc 1 225 0 is_stmt 0 discriminator 1
 826 0472 7B68     		ldr	r3, [r7, #4]
 827 0474 1B68     		ldr	r3, [r3]
 828 0476 1B69     		ldr	r3, [r3, #16]
 829 0478 012B     		cmp	r3, #1
 830 047a 10D9     		bls	.L29
 226:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 227:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->set_speed(playerLeft->p_obj,0,1);
 831              		.loc 1 227 0 is_stmt 1
 832 047c 7B68     		ldr	r3, [r7, #4]
 833 047e 1B68     		ldr	r3, [r3]
 834 0480 1C6A     		ldr	r4, [r3, #32]
 835 0482 7B68     		ldr	r3, [r7, #4]
 836 0484 1B68     		ldr	r3, [r3]
 837 0486 0122     		movs	r2, #1
 838 0488 0021     		movs	r1, #0
 839 048a 1800     		movs	r0, r3
 840 048c A047     		blx	r4
 228:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->move(playerLeft->p_obj);
 841              		.loc 1 228 0
 842 048e 7B68     		ldr	r3, [r7, #4]
 843 0490 1B68     		ldr	r3, [r3]
 844 0492 DA69     		ldr	r2, [r3, #28]
 845 0494 7B68     		ldr	r3, [r7, #4]
 846 0496 1B68     		ldr	r3, [r3]
 847 0498 1800     		movs	r0, r3
 848 049a 9047     		blx	r2
 849 049c 20E0     		b	.L30
 850              	.L29:
 229:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	} 
 230:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	else if(  (pressed == 8)    && (  (playerLeft->p_obj->posy + playerLeft->p_obj->geo->sizey)   <=  
 851              		.loc 1 230 0
 852 049e 0F23     		movs	r3, #15
 853 04a0 FB18     		adds	r3, r7, r3
 854 04a2 1B78     		ldrb	r3, [r3]
 855 04a4 DBB2     		uxtb	r3, r3
 856 04a6 082B     		cmp	r3, #8
 857 04a8 1AD1     		bne	.L30
 858              		.loc 1 230 0 is_stmt 0 discriminator 1
 859 04aa 7B68     		ldr	r3, [r7, #4]
 860 04ac 1B68     		ldr	r3, [r3]
 861 04ae 1A69     		ldr	r2, [r3, #16]
 862 04b0 7B68     		ldr	r3, [r7, #4]
 863 04b2 1B68     		ldr	r3, [r3]
 864 04b4 1B68     		ldr	r3, [r3]
 865 04b6 9B68     		ldr	r3, [r3, #8]
 866 04b8 D318     		adds	r3, r2, r3
 867 04ba 402B     		cmp	r3, #64
 868 04bc 10D8     		bhi	.L30
 231:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 232:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->set_speed(playerLeft->p_obj,0,-1);
 869              		.loc 1 232 0 is_stmt 1
 870 04be 7B68     		ldr	r3, [r7, #4]
 871 04c0 1B68     		ldr	r3, [r3]
 872 04c2 1C6A     		ldr	r4, [r3, #32]
 873 04c4 7B68     		ldr	r3, [r7, #4]
 874 04c6 1868     		ldr	r0, [r3]
 875 04c8 0123     		movs	r3, #1
 876 04ca 5B42     		rsbs	r3, r3, #0
 877 04cc 1A00     		movs	r2, r3
 878 04ce 0021     		movs	r1, #0
 879 04d0 A047     		blx	r4
 233:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerLeft->p_obj->move(playerLeft->p_obj);
 880              		.loc 1 233 0
 881 04d2 7B68     		ldr	r3, [r7, #4]
 882 04d4 1B68     		ldr	r3, [r3]
 883 04d6 DA69     		ldr	r2, [r3, #28]
 884 04d8 7B68     		ldr	r3, [r7, #4]
 885 04da 1B68     		ldr	r3, [r3]
 886 04dc 1800     		movs	r0, r3
 887 04de 9047     		blx	r2
 888              	.L30:
 234:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 235:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 236:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 237:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** // Player to The Right	
 238:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	playerRight->key_pressed = get_key(0);
 889              		.loc 1 238 0
 890 04e0 0020     		movs	r0, #0
 891 04e2 FFF7FEFF 		bl	get_key
 892 04e6 0300     		movs	r3, r0
 893 04e8 1A00     		movs	r2, r3
 894 04ea 3B68     		ldr	r3, [r7]
 895 04ec 5A71     		strb	r2, [r3, #5]
 239:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	pressed = playerRight->key_pressed;
 896              		.loc 1 239 0
 897 04ee 3B68     		ldr	r3, [r7]
 898 04f0 5A79     		ldrb	r2, [r3, #5]
 899 04f2 0F23     		movs	r3, #15
 900 04f4 FB18     		adds	r3, r7, r3
 901 04f6 1A70     		strb	r2, [r3]
 240:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 241:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	if ((pressed == 2) && (playerRight->p_obj->posy >= 2)) 
 902              		.loc 1 241 0
 903 04f8 0F23     		movs	r3, #15
 904 04fa FB18     		adds	r3, r7, r3
 905 04fc 1B78     		ldrb	r3, [r3]
 906 04fe DBB2     		uxtb	r3, r3
 907 0500 022B     		cmp	r3, #2
 908 0502 15D1     		bne	.L31
 909              		.loc 1 241 0 is_stmt 0 discriminator 1
 910 0504 3B68     		ldr	r3, [r7]
 911 0506 1B68     		ldr	r3, [r3]
 912 0508 1B69     		ldr	r3, [r3, #16]
 913 050a 012B     		cmp	r3, #1
 914 050c 10D9     		bls	.L31
 242:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 243:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->set_speed(playerRight->p_obj,0,1);
 915              		.loc 1 243 0 is_stmt 1
 916 050e 3B68     		ldr	r3, [r7]
 917 0510 1B68     		ldr	r3, [r3]
 918 0512 1C6A     		ldr	r4, [r3, #32]
 919 0514 3B68     		ldr	r3, [r7]
 920 0516 1B68     		ldr	r3, [r3]
 921 0518 0122     		movs	r2, #1
 922 051a 0021     		movs	r1, #0
 923 051c 1800     		movs	r0, r3
 924 051e A047     		blx	r4
 244:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 925              		.loc 1 244 0
 926 0520 3B68     		ldr	r3, [r7]
 927 0522 1B68     		ldr	r3, [r3]
 928 0524 DA69     		ldr	r2, [r3, #28]
 929 0526 3B68     		ldr	r3, [r7]
 930 0528 1B68     		ldr	r3, [r3]
 931 052a 1800     		movs	r0, r3
 932 052c 9047     		blx	r2
 245:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 246:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	else if ((pressed == 8)    && (  (playerRight->p_obj->posy + playerRight->p_obj->geo->sizey)   <= 
 247:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 248:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->set_speed(playerRight->p_obj,0,-1);
 249:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 250:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 251:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 933              		.loc 1 251 0
 934 052e 20E0     		b	.L33
 935              	.L31:
 246:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 936              		.loc 1 246 0
 937 0530 0F23     		movs	r3, #15
 938 0532 FB18     		adds	r3, r7, r3
 939 0534 1B78     		ldrb	r3, [r3]
 940 0536 DBB2     		uxtb	r3, r3
 941 0538 082B     		cmp	r3, #8
 942 053a 1AD1     		bne	.L33
 246:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	{
 943              		.loc 1 246 0 is_stmt 0 discriminator 1
 944 053c 3B68     		ldr	r3, [r7]
 945 053e 1B68     		ldr	r3, [r3]
 946 0540 1A69     		ldr	r2, [r3, #16]
 947 0542 3B68     		ldr	r3, [r7]
 948 0544 1B68     		ldr	r3, [r3]
 949 0546 1B68     		ldr	r3, [r3]
 950 0548 9B68     		ldr	r3, [r3, #8]
 951 054a D318     		adds	r3, r2, r3
 952 054c 402B     		cmp	r3, #64
 953 054e 10D8     		bhi	.L33
 248:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 		playerRight->p_obj->move(playerRight->p_obj);
 954              		.loc 1 248 0 is_stmt 1
 955 0550 3B68     		ldr	r3, [r7]
 956 0552 1B68     		ldr	r3, [r3]
 957 0554 1C6A     		ldr	r4, [r3, #32]
 958 0556 3B68     		ldr	r3, [r7]
 959 0558 1868     		ldr	r0, [r3]
 960 055a 0123     		movs	r3, #1
 961 055c 5B42     		rsbs	r3, r3, #0
 962 055e 1A00     		movs	r2, r3
 963 0560 0021     		movs	r1, #0
 964 0562 A047     		blx	r4
 249:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	}
 965              		.loc 1 249 0
 966 0564 3B68     		ldr	r3, [r7]
 967 0566 1B68     		ldr	r3, [r3]
 968 0568 DA69     		ldr	r2, [r3, #28]
 969 056a 3B68     		ldr	r3, [r7]
 970 056c 1B68     		ldr	r3, [r3]
 971 056e 1800     		movs	r0, r3
 972 0570 9047     		blx	r2
 973              	.L33:
 974              		.loc 1 251 0
 975 0572 C046     		nop
 976 0574 BD46     		mov	sp, r7
 977 0576 05B0     		add	sp, sp, #20
 978              		@ sp needed
 979 0578 90BD     		pop	{r4, r7, pc}
 980              		.cfi_endproc
 981              	.LFE7:
 983 057a C046     		.align	2
 984              		.global	ping
 985              		.code	16
 986              		.thumb_func
 988              	ping:
 989              	.LFB8:
 252:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 253:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** /* 
 254:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * UPDATE THE POSITION OF THE BALL
 255:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * IF GOAL, 
 256:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 						PRINT SCORE TO THE PLAYER 
 257:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * IF KEYBOARD_PRESSED, 
 258:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * 						MOVE THE PLAYER
 259:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  * RENDER THE SCREEN
 260:C:/Users/aleast/github/pongTest/ver1\game_logic.c ****  */ 
 261:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void ping(P_PLAYER playerLeft, P_PLAYER playerRight, P_OBJECT ball) {
 990              		.loc 1 261 0
 991              		.cfi_startproc
 992 057c 80B5     		push	{r7, lr}
 993              		.cfi_def_cfa_offset 8
 994              		.cfi_offset 7, -8
 995              		.cfi_offset 14, -4
 996 057e 84B0     		sub	sp, sp, #16
 997              		.cfi_def_cfa_offset 24
 998 0580 00AF     		add	r7, sp, #0
 999              		.cfi_def_cfa_register 7
 1000 0582 F860     		str	r0, [r7, #12]
 1001 0584 B960     		str	r1, [r7, #8]
 1002 0586 7A60     		str	r2, [r7, #4]
 262:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	// check the postion of the ball related to the players / walls -> change direction if collision /
 263:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	check_ball(playerLeft, playerRight, ball);				
 1003              		.loc 1 263 0
 1004 0588 7A68     		ldr	r2, [r7, #4]
 1005 058a B968     		ldr	r1, [r7, #8]
 1006 058c FB68     		ldr	r3, [r7, #12]
 1007 058e 1800     		movs	r0, r3
 1008 0590 FFF7FEFF 		bl	check_ball
 264:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_micro(5);
 1009              		.loc 1 264 0
 1010 0594 0520     		movs	r0, #5
 1011 0596 FFF7FEFF 		bl	delay_micro
 265:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	ball->move(ball);
 1012              		.loc 1 265 0
 1013 059a 7B68     		ldr	r3, [r7, #4]
 1014 059c DB69     		ldr	r3, [r3, #28]
 1015 059e 7A68     		ldr	r2, [r7, #4]
 1016 05a0 1000     		movs	r0, r2
 1017 05a2 9847     		blx	r3
 266:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_micro(5);
 1018              		.loc 1 266 0
 1019 05a4 0520     		movs	r0, #5
 1020 05a6 FFF7FEFF 		bl	delay_micro
 267:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	update_player_pos(playerLeft,playerRight);
 1021              		.loc 1 267 0
 1022 05aa BA68     		ldr	r2, [r7, #8]
 1023 05ac FB68     		ldr	r3, [r7, #12]
 1024 05ae 1100     		movs	r1, r2
 1025 05b0 1800     		movs	r0, r3
 1026 05b2 FFF7FEFF 		bl	update_player_pos
 268:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 1027              		.loc 1 268 0
 1028 05b6 C046     		nop
 1029 05b8 BD46     		mov	sp, r7
 1030 05ba 04B0     		add	sp, sp, #16
 1031              		@ sp needed
 1032 05bc 80BD     		pop	{r7, pc}
 1033              		.cfi_endproc
 1034              	.LFE8:
 1036              		.section	.rodata
 1037 003a 0000     		.align	2
 1038              	.LC6:
 1039 003c 20205765 		.ascii	"  Welcome To The\000"
 1039      6C636F6D 
 1039      6520546F 
 1039      20546865 
 1039      00
 1040 004d 000000   		.align	2
 1041              	.LC8:
 1042 0050 47726561 		.ascii	"Greatest Game Ever?\000"
 1042      74657374 
 1042      2047616D 
 1042      65204576 
 1042      65723F00 
 1043              		.text
 1044 05be C046     		.align	2
 1045              		.global	welcome
 1046              		.code	16
 1047              		.thumb_func
 1049              	welcome:
 1050              	.LFB9:
 269:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 270:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void welcome(void) {
 1051              		.loc 1 270 0
 1052              		.cfi_startproc
 1053 05c0 90B5     		push	{r4, r7, lr}
 1054              		.cfi_def_cfa_offset 12
 1055              		.cfi_offset 4, -12
 1056              		.cfi_offset 7, -8
 1057              		.cfi_offset 14, -4
 1058 05c2 8BB0     		sub	sp, sp, #44
 1059              		.cfi_def_cfa_offset 56
 1060 05c4 00AF     		add	r7, sp, #0
 1061              		.cfi_def_cfa_register 7
 271:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	ascii_init();
 1062              		.loc 1 271 0
 1063 05c6 FFF7FEFF 		bl	ascii_init
 272:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 273:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	ascii_display_controll(8);
 1064              		.loc 1 273 0
 1065 05ca 0820     		movs	r0, #8
 1066 05cc FFF7FEFF 		bl	ascii_display_controll
 274:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char welcoming[] = "  Welcome To The";
 1067              		.loc 1 274 0
 1068 05d0 1423     		movs	r3, #20
 1069 05d2 FB18     		adds	r3, r7, r3
 1070 05d4 0F4A     		ldr	r2, .L36
 1071 05d6 13CA     		ldmia	r2!, {r0, r1, r4}
 1072 05d8 13C3     		stmia	r3!, {r0, r1, r4}
 1073 05da 1168     		ldr	r1, [r2]
 1074 05dc 1960     		str	r1, [r3]
 1075 05de 1279     		ldrb	r2, [r2, #4]
 1076 05e0 1A71     		strb	r2, [r3, #4]
 275:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char game[] = "Greatest Game Ever?";
 1077              		.loc 1 275 0
 1078 05e2 3B00     		movs	r3, r7
 1079 05e4 0C4A     		ldr	r2, .L36+4
 1080 05e6 13CA     		ldmia	r2!, {r0, r1, r4}
 1081 05e8 13C3     		stmia	r3!, {r0, r1, r4}
 1082 05ea 03CA     		ldmia	r2!, {r0, r1}
 1083 05ec 03C3     		stmia	r3!, {r0, r1}
 276:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 277:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	update_ascii_display(welcoming, game,4);
 1084              		.loc 1 277 0
 1085 05ee 3900     		movs	r1, r7
 1086 05f0 1423     		movs	r3, #20
 1087 05f2 FB18     		adds	r3, r7, r3
 1088 05f4 0422     		movs	r2, #4
 1089 05f6 1800     		movs	r0, r3
 1090 05f8 FFF7FEFF 		bl	update_ascii_display
 278:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 279:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	delay_micro(400);
 1091              		.loc 1 279 0
 1092 05fc C823     		movs	r3, #200
 1093 05fe 5B00     		lsls	r3, r3, #1
 1094 0600 1800     		movs	r0, r3
 1095 0602 FFF7FEFF 		bl	delay_micro
 280:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 281:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	get_ready();
 1096              		.loc 1 281 0
 1097 0606 FFF7FEFF 		bl	get_ready
 282:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }
 1098              		.loc 1 282 0
 1099 060a C046     		nop
 1100 060c BD46     		mov	sp, r7
 1101 060e 0BB0     		add	sp, sp, #44
 1102              		@ sp needed
 1103 0610 90BD     		pop	{r4, r7, pc}
 1104              	.L37:
 1105 0612 C046     		.align	2
 1106              	.L36:
 1107 0614 3C000000 		.word	.LC6
 1108 0618 50000000 		.word	.LC8
 1109              		.cfi_endproc
 1110              	.LFE9:
 1112              		.section	.rodata
 1113              		.align	2
 1114              	.LC10:
 1115 0064 20202020 		.ascii	"     ARE YOU\000"
 1115      20415245 
 1115      20594F55 
 1115      00
 1116 0071 000000   		.align	2
 1117              	.LC12:
 1118 0074 20202020 		.ascii	"       READY?\000"
 1118      20202052 
 1118      45414459 
 1118      3F00
 1119              		.text
 1120              		.align	2
 1121              		.global	get_ready
 1122              		.code	16
 1123              		.thumb_func
 1125              	get_ready:
 1126              	.LFB10:
 283:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 
 284:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** void get_ready(void) {	
 1127              		.loc 1 284 0
 1128              		.cfi_startproc
 1129 061c 90B5     		push	{r4, r7, lr}
 1130              		.cfi_def_cfa_offset 12
 1131              		.cfi_offset 4, -12
 1132              		.cfi_offset 7, -8
 1133              		.cfi_offset 14, -4
 1134 061e 89B0     		sub	sp, sp, #36
 1135              		.cfi_def_cfa_offset 48
 1136 0620 00AF     		add	r7, sp, #0
 1137              		.cfi_def_cfa_register 7
 285:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char are[] 	= "     ARE YOU";
 1138              		.loc 1 285 0
 1139 0622 1023     		movs	r3, #16
 1140 0624 FB18     		adds	r3, r7, r3
 1141 0626 0B4A     		ldr	r2, .L39
 1142 0628 13CA     		ldmia	r2!, {r0, r1, r4}
 1143 062a 13C3     		stmia	r3!, {r0, r1, r4}
 1144 062c 1278     		ldrb	r2, [r2]
 1145 062e 1A70     		strb	r2, [r3]
 286:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	char ready[] 		= "       READY?";
 1146              		.loc 1 286 0
 1147 0630 3B00     		movs	r3, r7
 1148 0632 094A     		ldr	r2, .L39+4
 1149 0634 13CA     		ldmia	r2!, {r0, r1, r4}
 1150 0636 13C3     		stmia	r3!, {r0, r1, r4}
 1151 0638 1288     		ldrh	r2, [r2]
 1152 063a 1A80     		strh	r2, [r3]
 287:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	
 288:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** 	update_ascii_display(are, ready, 50);	
 1153              		.loc 1 288 0
 1154 063c 3900     		movs	r1, r7
 1155 063e 1023     		movs	r3, #16
 1156 0640 FB18     		adds	r3, r7, r3
 1157 0642 3222     		movs	r2, #50
 1158 0644 1800     		movs	r0, r3
 1159 0646 FFF7FEFF 		bl	update_ascii_display
 289:C:/Users/aleast/github/pongTest/ver1\game_logic.c **** }...
 1160              		.loc 1 289 0
 1161 064a C046     		nop
 1162 064c BD46     		mov	sp, r7
 1163 064e 09B0     		add	sp, sp, #36
 1164              		@ sp needed
 1165 0650 90BD     		pop	{r4, r7, pc}
 1166              	.L40:
 1167 0652 C046     		.align	2
 1168              	.L39:
 1169 0654 64000000 		.word	.LC10
 1170 0658 74000000 		.word	.LC12
 1171              		.cfi_endproc
 1172              	.LFE10:
 1174              	.Letext0:
 1175              		.file 2 "C:/Users/aleast/github/pongTest/ver1/standard_types.h"
 1176              		.file 3 "C:/Users/aleast/github/pongTest/ver1/geometry.h"
 1177              		.file 4 "C:/Users/aleast/github/pongTest/ver1/player_logic.h"
