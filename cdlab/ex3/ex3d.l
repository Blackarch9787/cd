%{
#include "y.tab.h" #include <stdlib.h>
void yyerror(const char *s);
%}
%%
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
"+" { return PLUS; }
"-" { return MINUS; }
"*" { return MULTIPLY; }
"/" { return DIVIDE; }
11
"(" { return LPAREN; }
")" { return RPAREN; }
[ \t]+ { /* ignore whitespace */ }
\n { return 0; } // Handle new lines
. { yyerror("Unrecognized character"); }
%%
// Define yywrap function
int yywrap() {
return 1;
}