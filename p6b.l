%{
    #include<stdio.h>
    #include "y.tab.h"
    extern int yylval;
%}

%%

[ \t] ;
[+\-*/=<>] {printf("%s is an operator\n",yytext); return OPERATOR;}
[0-9]+ {yylval = atoi(yytext);printf("%d is a digit\n",yylval); return DIGIT;}
char|float|bool|void|int|if|while|double {printf("%s is an keyword\n",yytext); return KEYWORD;}
[a-zA-Z0-9]+ {printf("%s is an identifier\n",yytext); return IDENTIFIER;}
(#include<stdio\.h>) ;
. ;


%%