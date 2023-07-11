%{
    #include "y.tab.h"
%}

%%

[a-zA-Z0-9][a-zA-Z0-9]* { printf("Shift\n"); ECHO; return id;}
[*+] {printf("SHIFT\n"); ECHO; return yytext[0];}
[()] {printf("SHIFT\n"); ECHO; return yytext[0];}
. ;
\n return 0;

%%

