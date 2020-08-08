FILENAME := calc
LIB := ./lib/functions.c
all: clear calc

clear: 
	rm -f ${FILENAME} lex.yy.c ${FILENAME}.tab.c ${FILENAME}.tab.h

calc: $(FILENAME).l $(FILENAME).y
	bison -d $(FILENAME).y
	flex $(FILENAME).l
	gcc -o $(FILENAME) lex.yy.c $(FILENAME).tab.c $(LIB) -lm
