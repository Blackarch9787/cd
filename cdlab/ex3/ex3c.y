%{
/* YACC program for recognizing anb (n >= 10) */
#include <stdio.h>
%}
%token A B
%%
stmt: A A A A A A A A A A anb '\n' {
printf("\nValid string\n");
}
;
anb: A anb | A B ;
%%
int main() {
10
printf("\nEnter some valid string:\n");
yyparse();
return 0;
}
void yyerror(char *s) {
printf("\nInvalid string\n");
}