%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex();
int t = 0;
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
%}
%union {
char *sval;
int ival;
}
%token <sval> IDENT NUM
%token PLUS MUL ASSIGN EOL
%type <sval> expr term factor
%%
stmt: IDENT ASSIGN expr EOL { printf("%s = %s\n", $1, $3); }
expr: term { $$ = $1; } | expr PLUS term { printf("t%d = %s + %s\n", t++, $1, $3); $$ = strdup("t0"); }
term: factor { $$ = $1; } | term MUL factor { printf("t%d = %s * %s\n", t++, $1, $3); $$ = strdup("t0"); }
factor: IDENT { $$ = $1; } | NUM { $$ = $1; }
%%
int main() { return yyparse(); }