%{
#include "y.tab.h" #include <stdlib.h>
#include <string.h>
%}
%%
[a-z]+ { yylval.sval = strdup(yytext); return IDENT; }
[0-9]+ { yylval.sval = strdup(yytext); return NUM; }
"+" { return PLUS; }
"*" { return MUL; }
"=" { return ASSIGN; }
\n { return EOL; }
%%