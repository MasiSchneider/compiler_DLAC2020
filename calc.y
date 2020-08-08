//first part: headers, declerations & tokens 
%code requires{
    #define YYSTYPE double
    }
    
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "./lib/functions.h"

void yyerror(char const *s);
extern int yylex(void);
extern FILE * yyin;
%}

%token INTEGER DOUBLE
%token PLUS MINUS MUL DIV
%token SQRT POW MOD ABS CTOF FTOC FIB
%token B_OPEN B_CLOSE
%token END
%token EXIT

%start line



%% // second part: grammar

line: expr END { printf("Result: %f\n",$1);} line
| FIB B_OPEN factor B_CLOSE {printFib($3);} line
| END line
| EXIT {exit(0);}
;

expr: term 
| expr PLUS term {$$ = $1+$3;} 
| expr MINUS term {$$ = $1-$3;}
;

term: factor 
| term MUL factor {$$ = $1*$3;}
| term DIV factor {$$ = $1/$3;}
| term MOD factor {$$ = fmod($1,$3);}
;

factor: B_OPEN expr B_CLOSE {$$ = $2;}
| INTEGER
| MINUS INTEGER {$$ = -$2;}
| DOUBLE
| MINUS DOUBLE {$$ = -$2;}
| function
;

function: sqrt_func
| power_func
| abs_func
| CtoF_func
| FtoC_func
;
sqrt_func: SQRT B_OPEN factor B_CLOSE {$$ = sqrt($3);}
;
power_func: factor POW factor {$$ = pow($1,$3);}
;
abs_func : ABS B_OPEN factor B_CLOSE {$$ = absolute($3);}
;
CtoF_func : CTOF B_OPEN factor B_CLOSE {$$ = CtoF($3);}
;
FtoC_func : FTOC B_OPEN factor B_CLOSE {$$ = FtoC($3);}
;


%% // third part: functions

void yyerror(char const *s) {
  printf("\n%s\n", s);
  exit(100);
}

int main(int argc, char** argv)
{
   printf("Entered calcutor. You can press 'E' to exit\n");
   ++argv, --argc; /* skip over program name */ 
   if ( argc > 0 ) 
     yyin = fopen( argv[0], "r" ); /*Is the input file given?*/
  else
     yyin = stdin;
  yyparse();
}
