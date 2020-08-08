%option noyywrap 

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "calc.tab.h"
#include "./lib/functions.h"

extern int yyerror (char const *s);
%}

DIGIT [0-9]
NONZERO [1-9]
ZERO [0]



%%
{ZERO}"."{DIGIT}+|{NONZERO}{DIGIT}*"."{DIGIT}+ { yylval=atof(yytext); return DOUBLE;}
{ZERO}|{NONZERO}{DIGIT}* {yylval=atoi(yytext); return INTEGER;}

"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}

"sqrt" {return SQRT;}
"^" {return POW;}
"%" {return MOD;}
"abs" {return ABS;}
"CtoF" {return CTOF;}
"FtoC" {return FTOC;}
"printFib" {return FIB;}

"(" {return B_OPEN;}
")" {return B_CLOSE;}

[\n] {return END;}
[ \t]+ {/* Do nothing at whitespace*/}
"E" {printf("Exiting the calculator.\n"); return EXIT;}
. {yyerror("Unrecognized token \n");   /* Is there anything else? Fail on it! */}  
%%
