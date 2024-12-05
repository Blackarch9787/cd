%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s) {
fprintf(stderr, "Error: %s\n", s);
}
int yylex(void); // Declare yylex
%}
%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN
%%
// Grammar rules
expr:
expr PLUS expr { printf("Result: %g\n", (double)($1 + $3)); }
| expr MINUS expr { printf("Result: %g\n", (double)($1 - $3)); }
| expr MULTIPLY expr { printf("Result: %g\n", (double)($1 * $3)); }
| expr DIVIDE expr {
if ($3 == 0) {
yyerror("divide by zero");
$$ = 0; // Avoid division by zero
} else {
printf("Result: %g\n", (double)($1 / $3));
}
}
| LPAREN expr RPAREN { $$ = $2; }
| NUMBER { $$ = $1; }
;
%%
int main() {
printf("Simple Calculator:\n");
while (yyparse() == 0); // Loop until an error or EOF
return 0;
}