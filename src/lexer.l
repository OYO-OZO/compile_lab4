%option noyywrap
%{
    /*
    * You will need to comment this line in lab5.
    */
    #define ONLY_FOR_LEX

    #ifdef ONLY_FOR_LEX
    #else
    #define YYSTYPE void *
    #include "parser.h"
    #endif

    #define YY_NO_UNPUT
    #define YY_NO_INPUT
    #include <string>

    #ifdef ONLY_FOR_LEX
    #include <ostream>
    #include <fstream>
    #include <vector>
    using namespace std;
    extern FILE *yyin;
    extern FILE *yyout;

    int offset = 0;

    class IDnode
    {
    public:
        string str_name;
        int str_Area;
    };
    IDnode table[1000];
    int id_count=0;
    int l_scope=0;
    int r_scope=0;
    int scopes;
    int IDcount=0;
    vector <int>a;

    void DEBUG_FOR_LAB4(std::string s,bool boolflag=0){
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\t" + to_string(yylineno)+"\t" + to_string(offset) ;
        if (boolflag){
        DEBUG_INFO = DEBUG_INFO + "\t" + yytext;
        }
        DEBUG_INFO = DEBUG_INFO + "\n";
        offset += strlen(yytext);
        fputs(DEBUG_INFO.c_str(), yyout);
    }
    #endif
%}


INT_DEC (0|[1-9][0-9]*)
INT_OCT (0[0-7]+)
INT_HEX (0[xX][0-9a-fA-F]+)
FLOATP   ([0-9]+"."[0-9]+)
FLOATE   ([0-9]+("."[0-9]+)?[eE]("+"|"-")?[0-9]*)
ID ([[:alpha:]_][[:alpha:][:digit:]_]*)

EOL (\r\n|\n|\r)
WHITE [\t ]
NEWID (int(WHITE)(ID))

BLOCKCOMMENTBEGIN   \/\*
BLOCKCOMMENTELEMENT [^ \r\n]
BLOCKCOMMENTEOL (\r\n|\n|\r)
BLOCKCOMMENTEND \*\/
%x BLOCKCOMMENT

COMMENT \/\/[^\n]*

%%

"int" {
    /*
    * Questions:
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("INT\tint");
    #else
        return INT;
    #endif
}
"void" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("VOID\tvoid");
    #else
        return VOID;
    #endif
}
"float" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("FLOAT\tfloat");
    #else
        return FLOAT;
    #endif
}

"const" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONST\tconst");
    #else
        return CONST;
    #endif
}
"if" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("IF\tif");
    #else
        return IF;
    #endif
};
"else" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ELSE\telse");

    #else
        return ELSE;
    #endif
};
"do" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DO\tdo");

    #else
        return DO;
    #endif
}
"while" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("WHILE\twhile");

    #else
        return WHILE;
    #endif
}
"for" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("FOR\tfor");

    #else
        return FOR;
    #endif
}
"switch" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SWITCH\tswitch");

    #else
        return SWITCH;
    #endif
}
"case" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CASE\tcase");

    #else
        return CASE;
    #endif
}
"default" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DEFAULT\tdefault");

    #else
        return DEFAULT;
    #endif
}
"break" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("BREAK\tbreak");

    #else
        return BREAK;
    #endif
}
"continue" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONTINUE\tcontinue");

    #else
        return CONTINUE;
    #endif
}

"return" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RETURN\treturn");

    #else
        return RETURN;
    #endif
}

"=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ASSIGN\t=");

    #else
        return ASSIGN;
    #endif
}
"==" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("EQUAL\t==");

    #else
        return EQUAL;
    #endif
}
"!=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NOTEQUAL\t!=");

    #else
        return NOTEQUAL;
    #endif
}
"<=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESSEQUAL\t<=");

    #else
        return LESSEQUAL;
    #endif
}
">=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GREATEREQUAL\t<=");

    #else
        return GREATEREQUAL;
    #endif
}
"<" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESS\t<");

    #else
        return LESS;
    #endif
}
">" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GREATER\t>");

    #else
        return GREATER;
    #endif
}

"+" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ADD\t+");

    #else
        return ADD;
    #endif
}
"-" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SUB\t-");

    #else
        return SUB;
    #endif
}
"*" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MUL\t*");

    #else
        return MUL;
    #endif
}
"/" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DIV\t/");

    #else
        return DIV;
    #endif
}
"%" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MOD\t%");

    #else
        return MOD;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("AND\t&&");

    #else
        return AND;
    #endif
}
"||" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("OR\t||");

    #else
        return OR;
    #endif
}
"!" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("NOT\t!");

    #else
        return NOT;
    #endif
}
"++" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("INC\t!");

    #else
        return INC;
    #endif
}
"--" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DEC\t!");

    #else
        return DEC;
    #endif
}

";" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SEMICOLON\t;");

    #else
        return SEMICOLON;
    #endif
}
"," {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("COMMA\t,");

    #else
        return COMMA;
    #endif
}

"(" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LP\t(");

    #else
        return LP;
    #endif
}
")" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RP\t)");

    #else
    return RP;
    #endif
}
"{" {
    #ifdef ONLY_FOR_LEX
        scopes++;
        a.push_back(scopes);
        l_scope++;

        DEBUG_FOR_LAB4("LC\t{");

    #else
        return LC;
    #endif
}
"}" {
    #ifdef ONLY_FOR_LEX
        a.pop_back();
        r_scope++;
      DEBUG_FOR_LAB4("RC\t}");
    #else
        return RC;
    #endif
}

"[" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LB\t}");

    #else
        return LB;
    #endif
}
"]" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RB\t}");

    #else
        return RB;
    #endif
}

{EOL} {
offset += strlen(yytext);
yylineno++;
offset = 0;}
{WHITE} {offset += strlen(yytext);}
{COMMENT}
{BLOCKCOMMENTBEGIN} {BEGIN BLOCKCOMMENT;}
<BLOCKCOMMENT>{BLOCKCOMMENTELEMENT}
<BLOCKCOMMENT>{BLOCKCOMMENTEOL} {yylineno++;}
<BLOCKCOMMENT>{BLOCKCOMMENTEND} {BEGIN INITIAL;}

{FLOATP} {
    #ifdef ONLY_FOR_LEX
     DEBUG_FOR_LAB4("FLOATNUMBER\t}",1);
    #else
        return FLOATNUMBER;
    #endif
}

{FLOATE} {
    #ifdef ONLY_FOR_LEX

    DEBUG_FOR_LAB4("FLOATNUMBER\t}",1);
    #else
        return FLOATNUMBER;
    #endif
}

{INT_DEC} {
    #ifdef ONLY_FOR_LEX
    DEBUG_FOR_LAB4("NUMBER\t}",1);
    #else
        return INTEGER;
    #endif
}

{INT_OCT} {
      #ifdef ONLY_FOR_LEX
        int res=0,res1=0;
        char str[10];
           char len=0;
           int i;
           int j;
           strcpy(str,yytext);
           for(i=0;i<10;i++)
           {
              if(str[i] == '\0')
              {
                 break;
              }
              len++;
           }
           for(i=0;i<len;i++)
           {
              res1 += (str[i]-'0')*1;
              for(j=0;j<len-i-1;j++)
              {
                 res1 *= 8;
              }
              res+=res1;
              res1=0;

           }
        string str1="NUMBER\t"+to_string(res);
fprintf(yyout,"%s\t%d\t%d\t%s\n","[DEBUG LAB4]: \tNUMBER",yylineno,offset,str1.c_str());
                   offset += strlen(yytext);
    #else
        return INTEGER;
    #endif
}

{INT_HEX} {
    #ifdef ONLY_FOR_LEX
        int temp;
        sscanf(yytext, "%x", &temp);
fprintf(yyout,"%s\t%d\t%d\t%s\n","[DEBUG LAB4]: \tNUMBER",yylineno,offset,to_string(temp).c_str());
                   offset += strlen(yytext);

    #else
        return INTEGER;
    #endif
}
{ID} {
    #ifdef ONLY_FOR_LEX
        string m = yytext;
        int idnum = 0;
        bool flag = 0;
        for(int i = 0; i < id_count; i++)
        {
            if(table[i].str_name == yytext && table[i].str_Area == a.back())//如果已经存在且相同域
            {
                idnum = i + 1;
                flag = 1;
                break;
            }
        }
        if(flag == 0)
        {
            table[id_count].str_name = yytext;
            if(a.size() != 0)
            {
                table[id_count].str_Area = a.back();
            }
            id_count++;
            idnum = id_count;
        }

           fprintf(yyout,"%s\t%d\t%d\t%s\t%d\n","[DEBUG LAB4]: \tID",yylineno,offset,yytext,idnum);
                   offset += strlen(yytext);

    #else
        return ID;
    #endif
}


%%

#ifdef ONLY_FOR_LEX
int main(int argc, char **argv){
    if(argc != 5){
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }

    if(!(yyin = fopen(argv[1], "r"))){
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }

    if(!(yyout = fopen(argv[3], "w"))){
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }

    yylex();
    return 0;
}
#endif
