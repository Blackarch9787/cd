%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char* s);
int yylex(void);
enum { TYPE_INT, TYPE_FLOAT }; // For type checking
int current_type = TYPE_INT;
%}
%token INT FLOAT NUMBER FNUMBER IDENTIFIER
%token PLUS MINUS MUL DIV ASSIGN SEMI
%%
program:
program stmt SEMI
| /* empty */
;
stmt:
type var ASSIGN expr
{
if ($4 == current_type) {
printf("Valid assignment.\n");
} else {
printf("Type error: Mismatched types in assignment.\n");
}
}
;
type:
INT
{
current_type = TYPE_INT;
}
| FLOAT
{
current_type = TYPE_FLOAT;
}
;
var:
IDENTIFIER
{
// You can add variable tracking here
}
;
16
expr:
NUMBER
{
$$ = TYPE_INT;
}
| FNUMBER
{
$$ = TYPE_FLOAT;
}
| expr PLUS expr
| expr MINUS expr
| expr MUL expr
| expr DIV expr
;
%%
void yyerror(const char* s) {
printf("Error: %s\n", s);
}
int main(void) {
return yyparse();
}