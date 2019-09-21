%{
#define YYSTYPE double
#include "CCALC.tab.h"
#include <stdlib.h>
%}

blanco [ \t]+
digito [0-9]
entero {digito}+
exponente [eE][+-]?{entero}
real {entero}("."{entero})?{exponente}?

%%
{blanco} { }
{real} {yylval=atof(yytext);
	return NUMERO;
}

"+" return MAS;
"-" return MENOS;
"*" return MULT;
"/" return DIV;
"^" return POT;
"(" return IZQ;
")" return DER;
"\n" return FIN;
