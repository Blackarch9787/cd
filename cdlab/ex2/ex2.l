%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}
%%
[0-9]+ { printf("NUMBER: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER: %s\n", yytext); }
"+" { printf("PLUS\n"); }
"-" { printf("MINUS\n"); }
"*" { printf("MULTIPLY\n"); }
"/" { printf("DIVIDE\n"); }
\n { /* Ignore newline */ }
[ \t]+ { /* Ignore whitespace */ }
. { printf("UNKNOWN CHARACTER: %c\n", yytext[0]); }
%%
int main(void) {
yylex();
return 0;
}
void yyerror(const char *s)
{fprintf(stderr, "Error: %s\n", s);
}