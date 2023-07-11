%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex();
int yyerror();
extern FILE *yyin;

int idCount=0, digitCount=0, keyCount=0, opCount=0;

    %}

%token IDENTIFIER DIGIT KEYWORD OPERATOR

%%
input : DIGIT input {digitCount++;}
    | KEYWORD input {keyCount++;}
    | IDENTIFIER input {idCount++;}
    | OPERATOR input {opCount++;}
    | DIGIT {digitCount++;}
    | OPERATOR {opCount++;}
    |KEYWORD {keyCount++;}
    |IDENTIFIER {idCount++;}
    ;
%%

int yyerror(){
    exit(0);
}



void main(int argc, char** argv){
     if(argc != 2)
    {
        printf("usage: %s <src file>\n",argv[0]);
        return;
    }

    FILE *myfile = fopen(argv[1], "r");

    yyin = myfile;
    do
    {
        yyparse();
    } while (!feof(yyin));
    printf("Numbers = %d\nKeywords = %d\nIdentifiers = %d\nOperators = %d\n", digitCount, keyCount,idCount, opCount);
}