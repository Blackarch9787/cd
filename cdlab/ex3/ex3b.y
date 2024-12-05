%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern char* yytext;
void yyerror(const char *s);
%}
%token ID INT FLOAT DOUBLE
%%
program: declarations
;
declarations: declarations declaration
| declaration
;
declaration: type IDs
;
type: INT
| FLOAT
| DOUBLE
;
IDs: ID
| ID ',' IDs
;
%%
int main() {
yyparse();
return 0;
}
void yyerror(const char *s) {
fprintf(stderr, "Error: %s\n", s);
}