%{
#include "parser.tab.h" %}
%%
int { return INT; }
float { return FLOAT; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[0-9]+"."[0-9]+ { yylval = atof(yytext); return FNUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; } // Variable names (identifiers) "=" { return ASSIGN; } // Assignment operator "+" { return PLUS; }
"-" { return MINUS; }
"*" { return MUL; }
"/" { return DIV; }
";" { return SEMI; }
[ \t\n] { /* Ignore whitespaces */ }
. { printf("Unexpected character: %s\n", yytext); }
%%
int yywrap(void) {
return 1;
}