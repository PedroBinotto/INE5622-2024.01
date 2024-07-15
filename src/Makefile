all: compile

bison:	parser.y
	bison -t -v -d parser.y

flex: lexer.l bison
	flex lexer.l

compile: flex bison
	gcc -o xpp.out parser.tab.c lex.yy.c

clean:
	rm xpp.out parser.tab.c lex.yy.c parser.tab.h parser.output
