%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
%}
%token ID NUMBER
%%
statement:
ID '=' E { printf("\nValid arithmetic expression\n"); }
| E { printf("\nValid arithmetic expression\n"); }
;
E:
E '+' E { printf("Addition\n"); }
| E '-' E { printf("Subtraction\n"); }
| E '*' E { printf("Multiplication\n"); }
| E '/' E { printf("Division\n"); }
| ID { printf("Identifier\n"); }
| NUMBER { printf("Number\n"); }
;
%%
void yyerror(const char *s) {
fprintf(stderr, "Error: %s\n", s);
}
int main() {
printf("Enter an expression:\n");
yyparse();
return 0;
}