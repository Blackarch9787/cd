%{
#include "y.tab.h" #include <stdio.h>
%}
%%
"int" { return INT; }
"float" { return FLOAT; }
"double" { return DOUBLE; }
[a-zA-Z][a-zA-Z0-9]* {
printf("Identifier is %s\n", yytext);
return ID;
}
[ \t]+ ; /* Ignore whitespace */
\n { return '\n'; }
. { return yytext[0]; }
%%
int yywrap() {
return 1;
}