%{
#include "y.tab.h" #include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
%}
%%
"=" { printf("\nOperator is EQUAL\n"); return '='; }
"+" { printf("\nOperator is ADDITION\n"); return '+'; }
"-" { printf("\nOperator is SUBTRACTION\n"); return '-'; }
"*" { printf("\nOperator is MULTIPLICATION\n"); return '*'; }
"/" { printf("\nOperator is DIVISION\n"); return '/'; }
[0-9]+ { printf("Number is %s\n", yytext); return NUMBER; }
[a-zA-Z]+[0-9]* {
printf("Identifier is %s\n", yytext);
return ID;
6
}
\n { /* ignore newlines */ }
[ \t]+ { /* ignore whitespace */ }
. { fprintf(stderr, "Unexpected character: %c\n", yytext[0]); exit(1); }
%%
int yywrap() {
return 1;
}