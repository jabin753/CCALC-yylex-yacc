CCALC: CCALC.y CCALC.l
	bison -d CCALC.y
	flex -o CCALC.l.c CCALC.l
	gcc -o CCALC CCALC.l.c CCALC.tab.c -lfl -lm
