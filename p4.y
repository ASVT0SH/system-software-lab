%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
    int yyerror();
%}

%token id
%left '+' '-'
%left '*' '/'

%%
expr : E {printf("Accepted\n");}
    ;
E : E'+'T{printf("Reduce E->E+E\n");}
    | T {printf("Reduce E->T\n");}
    ;
T : T'*'F{printf("Reduce T->T*F\n");}
    | F {printf("Reduce T->F\n");}
    ;
F : '('E')' {printf("Reduce F-> (E)\n");}
    | id {printf("Reduce F-> id\n");}
    ;
%%

int yyerror(){
    exit(0);
}

void main(){
    printf("Enter string\n");
    yyparse();
}