%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE double
%}
// El número que se va a definir [0-9]
%token NUMERO
// Los diferentes símbolos aritméticos 
%token MAS MENOS MULT DIV POT
// Las LLaves que abren y cierran las consultas
%token IZQ DER
// El fin de línea
%token FIN

// A continuación va el orden de la jerarquía de operaciones:
%left MAS MENOS
%left MULT DIV
%left NEG
%right POT

// El simbolo de inicio
%start Entrada
%%

Entrada:
    
     | Entrada Linea
;

Linea:
     FIN
     | Expresion FIN { printf("= %f\n", $1); }
;

Expresion:
     NUMERO { $$=$1; }
| Expresion MAS Expresion { $$=$1+$3; }
| Expresion MENOS Expresion { $$=$1-$3; }
| Expresion MULT Expresion { $$=$1*$3; }
| Expresion DIV Expresion { $$=$1/$3; }
| MENOS Expresion %prec NEG { $$=-$2; }
| Expresion POT Expresion { $$=pow($1,$3); }
| IZQ Expresion DER { $$=$2; }
;

%%

int yyerror(char *s) {
  printf("%s\n", s);
}

int main() {
  if (yyparse())
     fprintf(stderr, "Error.\n");
  else
     fprintf(stderr, "error encontrado.\n");
}
