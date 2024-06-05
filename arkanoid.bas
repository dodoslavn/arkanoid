CLS
SCREEN 12
new:
CLS
o = 0
ss = 0
zivoty = 3
sh$ = "ON"

LOCATE 10, 14: COLOR 4: PRINT "Do you want a sound?"


LINE (100, 185)-(200, 215), 4, B
LINE (300, 185)-(400, 215), 4, B

LOCATE 13, 15: PRINT "YES"
LOCATE 13, 41: PRINT "NO"


sounds:

IF sh$ = "ON" THEN LINE (95, 180)-(205, 220), 4, B
IF sh$ = "ON" THEN LINE (295, 180)-(405, 220), 0, B
IF sh$ = "OFF" THEN LINE (295, 180)-(405, 220), 4, B
IF sh$ = "OFF" THEN LINE (95, 180)-(205, 220), 0, B


shs$ = INKEY$
IF shs$ = "d" AND sh$ = "ON" THEN sh$ = "OFF"
IF shs$ = "a" AND sh$ = "OFF" THEN sh$ = "ON"
IF shs$ = CHR$(13) THEN GOTO pakooo



GOTO sounds

pakooo:
CLS

LOCATE 20, 14: COLOR 4: PRINT "Enter your name:"
LOCATE 23, 14: PRINT "max. 8 symbols"
LOCATE 21, 14: COLOR 4: INPUT name$
CLS
LOCATE 20, 15: COLOR 4: PRINT "PRESS ENTER TO START";
LOCATE 21, 15: COLOR 4: PRINT "PLAYER NAME: "; name$
SLEEP

res:
x = 1
y = 1
w = 251
smer$ = "JV"
SCREEN 12

pakoo:
u$ = INKEY$

IF u$ = CHR$(13) THEN CLS : GOTO start
GOTO pakoo

start:
FOR k = 0 TO 1
qq$ = INKEY$
IF w < 451 AND qq$ = "d" OR qq$ = "D" THEN w = w + 50
IF w > 1 AND qq$ = "a" OR qq$ = "A" THEN w = w - 50
LINE (w, 400)-(100 + w, 410), 4, BF
LINE (101 + w, 400)-(150 + w, 410), 0, BF
LINE (w - 50, 400)-(w - 1, 410), 0, BF
NEXT k
IF x >= 430 THEN GOTO koniec

ss = ss + 1: IF ss = 1 THEN SLEEP 1

FOR gg = 0 TO o


IF x >= 390 AND smer$ = "JV" AND y >= w AND y <= w + 100 THEN smer$ = "SV": o = o + 1: IF sh$ = "ON" THEN SOUND 1000, 5
IF x >= 390 AND smer$ = "JZ" AND y >= w AND y <= w + 100 THEN smer$ = "SZ": o = o + 1: IF sh$ = "ON" THEN SOUND 1000, 5

IF x = 2 AND smer$ = "SV" THEN smer$ = "JV"
IF x = 2 AND smer$ = "SZ" THEN smer$ = "JZ"

IF y = 500 AND smer$ = "SV" THEN smer$ = "SZ"
IF y = 500 AND smer$ = "JV" THEN smer$ = "JZ"

IF y = 2 AND smer$ = "SZ" THEN smer$ = "SV"
IF y = 2 AND smer$ = "JZ" THEN smer$ = "JV"




IF smer$ = "JV" THEN x = x + 1: y = y + 1
IF smer$ = "JZ" THEN x = x + 1: y = y - 1
IF smer$ = "SV" THEN x = x - 1: y = y + 1
IF smer$ = "SZ" THEN x = x - 1: y = y - 1


LINE (510, 0)-(630, 399), 4, B

CIRCLE (y, x), 7, 4
CIRCLE (y, x), 8, 4
CIRCLE (y, x), 9, 4
CIRCLE (y, x), 10, 4
CIRCLE (y, x), 11, 0
CIRCLE (y, x), 12, 0
CIRCLE (y, x), 13, 0
CIRCLE (y, x), 6, 0
CIRCLE (y, x), 5, 0

NEXT gg


LOCATE 2, 67: COLOR 4: PRINT "OS X: "; x,
LOCATE 4, 67: COLOR 4: PRINT "OS Y: "; y,
LOCATE 6, 67: COLOR 4: PRINT "SMER:   "; smer$
LOCATE 8, 67: COLOR 4: PRINT "ZIVOTY: "; zivoty
LOCATE 10, 67: COLOR 4: PRINT "SCORE: "; o
LOCATE 12, 67: COLOR 4: PRINT "HRAC: "; name$
LOCATE 14, 67: COLOR 4: PRINT "ZVUK: "; sh$

GOTO start


koniec:
zivoty = zivoty - 1
IF sh$ = "on" THEN SOUND 2000, 20
IF zivoty > 0 THEN LOCATE 12, 33: PRINT "Oops! PRESS ENTER": GOTO res
COLOR 4: LOCATE 20, 20: PRINT "YOU ARE LOOSER": LOCATE 21, 20: PRINT "Score": LOCATE 21, 30: PRINT o:
IF sh$ = "on" THEN SOUND 1000, 30:

SLEEP
SLEEP
SLEEP


OPEN name$ + ".txt" FOR OUTPUT AS #1
PRINT #1, "SCORE: "; o; CHR$(13); CHR$(10); "PLAYER NAME: "; name$; " TIME: "; TIME$; " DATE: "; DATE$; "  ARKANOID BY DODO"; CHR$(13); CHR$(10): CLOSE
GOTO new
