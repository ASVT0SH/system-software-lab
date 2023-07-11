%{
    #include<stdio.h>
%}
%x ml sl
%%

"/*" {BEGIN ml;}
<ml>. ;
<ml>\n ;
<ml>"*/" {BEGIN 0;}
"//" {BEGIN sl;}
<sl>. ;
<sl>\n {BEGIN 0;}   
%%

int yywrap(){
    return 1;
}

void main(int argc, char **argv){
    if(argc!=3){
        exit(0);
    }
    yyin = fopen(argv[1],"r");
    yyout = fopen(argv[2],"w");
    yylex();
}