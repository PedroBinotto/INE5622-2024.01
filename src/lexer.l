%option noyywrap noinput nounput yylineno

%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

void yyerror(char *s);

void lexical_error(char *msg, char *text, int ln) {
  char *s;
  sprintf(s, "lexical error, %s: '%s', l%d\n", msg, text, ln);
  yyerror(s);
}
%}

%x COMMENT

%%

[ \t\n]+                                 {}
"int"                                    { printf("T_INT ");           return T_INT; }
"def"                                    { printf("T_FUNCDEF ");       return T_FUNCDEF; }
"return"                                 { printf("T_RETURN ");        return T_RETURN; }
"print"                                  { printf("T_PRINT ");         return T_PRINT; }
"if"                                     { printf("T_IF ");            return T_IF; }
"else"                                   { printf("T_ELSE ");          return T_ELSE; }
"+"                                      { printf("T_PLUS_SIGN ");     return T_PLUS_SIGN; }
"-"                                      { printf("T_MINUS_SIGN ");    return T_MINUS_SIGN; }
"*"                                      { printf("T_ASTERISK_SIGN "); return T_ASTERISK_SIGN; }
"/"                                      { printf("T_SLASH_SIGN ");    return T_SLASH_SIGN; }
"="                                      { printf("T_EQUALS_SIGN ");   return T_EQUALS_SIGN; }
">"                                      { printf("T_GREATER_THAN ");  return T_GREATER_THAN; }
"<"                                      { printf("T_LESSER_THAN ");   return T_LESSER_THAN; }
";"                                      { printf("T_SEMICOLON ");     return T_SEMICOLON; }
","                                      { printf("T_COMMA ");         return T_COMMA; }
"("                                      { printf("T_OPEN_PAREN ");    return T_OPEN_PAREN; }
 ")"                                     { printf("T_CLOSE_PAREN ");   return T_CLOSE_PAREN; }
"{"                                      { printf("T_OPEN_BRACE ");    return T_OPEN_BRACE; }
"}"                                      { printf("T_CLOSE_BRACE ");   return T_CLOSE_BRACE; }
[[:digit:]]+                             { printf("INT_LITERAL "); yylval.intval = atoi(yytext); return INT_LITERAL; }
[[:alpha:]]([[:alnum:]_]){0,29}          { printf("T_IDENT "); yylval.strval = strdup(yytext); return T_IDENT; }
"/*"                                     { BEGIN(COMMENT); }
<COMMENT>"*/"                            { BEGIN(INITIAL); }
<COMMENT>\n                              {}
<COMMENT>.                               {}
[[:alnum:]_]+                            { lexical_error("Invalid sequence", yytext, yylineno); yyterminate(); }
.                                        { lexical_error("Unrecognized character", yytext, yylineno); yyterminate(); }

%%
