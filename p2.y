%{
    #include<stdio.h>
    #include<stdlib.h>
    int yyerror();
    int count=0;
    int yylex();
    %}

%token A B

%%
stmt : T B
    ;
T : A T {++count;}
    | 
    ;
%%

int yyerror(){
    printf("INVALUD\n");
    exit(0);
}
void main(){
    int n;
    printf("Enter n value\n");
    scanf("%d\n",&n);
    

    if(yyparse()==0 && n==count){
        printf("Valid\n");
    }
    else{
        yyerror();
    }
}