%{
    int opnd = 0,ac=0,sc=0,mc=0,dc=0,valid=0;
    void ext();
%}
%x OPER

%%
[a-zA-Z0-9]+ {valid=1;opnd++; BEGIN OPER;}
<OPER>"+" {if(valid){valid=0;ac++;} else ext();}
<OPER>"-" {if(valid){valid=0;sc++;} else ext();}
<OPER>"*" {if(valid){valid=0;mc++;} else ext();}
<OPER>"/" {if(valid){valid=0;dc++;} else ext();}
<OPER>[a-zA-Z0-9]+ {if(!valid){valid=1;opnd++;} else ext();}

%%

int yywrap(){
    return 1;
}

void ext(){
    printf("Invalid\n");
    exit(0);
}

void main(){
    printf("Enter expression\n");
    yylex();
    printf("Valid expression\n");
    printf("Operand count: %d\n",opnd);
    printf("'+' count: %d\n",ac);
    printf("'-' count: %d\n",sc);
    printf("'*' count: %d\n",mc);
    printf("'/' count: %d\n",dc);   
}