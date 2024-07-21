%{
#include <stdio.h>
void yyerror(char *);
%}

%locations
%error-verbose 
%token INT_LITERAL
%token T_IDENT
%token T_INT
%token T_FUNCDEF
%token T_RETURN
%token T_PRINT
%token T_IF
%token T_ELSE
%token T_PLUS_SIGN
%token T_MINUS_SIGN
%token T_ASTERISK_SIGN
%token T_SLASH_SIGN
%token T_EQUALS_SIGN
%token T_GREATER_THAN
%token T_LESSER_THAN
%token T_SEMICOLON
%token T_COMMA
%token T_OPEN_PAREN
%token T_CLOSE_PAREN
%token T_OPEN_BRACE
%token T_CLOSE_BRACE
%union {
  int intval;
  char *strval;
};

%%

program: 
  stmtlist
  | funclist
  |
  ;

funclist: 
  funcdef funclist 
  | funcdef
  ;

funcdef: 
  T_FUNCDEF T_IDENT T_OPEN_PAREN parlist T_CLOSE_PAREN T_OPEN_BRACE stmtlist T_CLOSE_BRACE;

parlist:
  T_INT T_IDENT T_COMMA parlist
  | T_INT T_IDENT
  |
  ;

stmt: 
  T_INT T_IDENT T_SEMICOLON
  | atribstmt T_SEMICOLON
  | printstmt T_SEMICOLON
  | T_RETURN T_SEMICOLON
  | ifstmt
  | T_OPEN_BRACE stmtlist T_CLOSE_BRACE
  | T_SEMICOLON
  ;

atribstmt: 
  T_IDENT  T_EQUALS_SIGN expr 
  | T_IDENT T_EQUALS_SIGN fcall
  ;

fcall: 
  T_IDENT T_OPEN_PAREN parlistcall T_CLOSE_PAREN;

parlistcall:
  T_IDENT T_COMMA parlistcall
  | T_IDENT
  |
  ;

printstmt: T_PRINT expr;

ifstmt: 
  T_IF T_OPEN_PAREN expr T_CLOSE_PAREN stmt T_ELSE stmt
  | T_IF T_OPEN_PAREN expr T_CLOSE_PAREN stmt
  ;

stmtlist: 
  stmt stmtlist
  | stmt
  ;

expr: 
  numexpr T_LESSER_THAN numexpr
  | numexpr T_GREATER_THAN numexpr
  | numexpr assertion numexpr
  | numexpr
  ;

numexpr: 
  numexpr T_PLUS_SIGN term
  | numexpr T_MINUS_SIGN term
  | term
  ;

term: 
  term T_ASTERISK_SIGN factor
  | factor
  ;

assertion: 
  T_EQUALS_SIGN T_EQUALS_SIGN;

factor: 
  INT_LITERAL
  | T_OPEN_PAREN numexpr T_CLOSE_PAREN
  | T_IDENT
  ;

%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main(void) {
  yyparse();
  return 0;
}
