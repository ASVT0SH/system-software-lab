%{
    #include<stdio.h>
    #include<stdlib.h>
    int yyerror();
    int yylex();
    %}
%token NUM
%left '+' '-'
%left '*' '/'

%%
expr: stmt {printf("Result: %d\n",$1);}
    ;
stmt : stmt '+' stmt {$$ = $1 + $3;}
    | stmt '-' stmt {$$ = $1 - $3;}
    | stmt '*' stmt {$$ = $1 * $3;}
    | stmt '/' stmt {if($3!=0)$$ = $1 / $3;}
    | NUM {$$= $1;}
    ;

%%

int yyerror(){
    printf("INVALID\n");
    exit(0);
}

void main(){
    if(yyparse()==0){}
    else{yyerror();}
}