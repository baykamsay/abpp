%{
  #include <stdio.h>
  #include <stdlib.h>
  int yylex(void);
  void yyerror(char* s);
  extern int yylineno;
%}
%token SEMICOLON
%token CONST
%token INT_TYPE
%token RAT_TYPE
%token STR_TYPE
%token BOOL_TYPE
%token FUNC_TYPE
%token ASSIGNMENT_OP
%token ASSIGN_ADD
%token ASSIGN_DIFF
%token ASSIGN_MULTIPLY
%token ASSIGN_DIVIDE
%token ASSIGN_POWER
%token OR_OP
%token AND_OP
%token GREATER_THAN
%token GREATER_OR_EQUAL
%token LESS_THAN
%token LESS_OR_EQUAL
%token IS_EQUAL
%token NOT_EQUAL
%token SUM_OP
%token DIFF_OP
%token MULTIPLY_OP
%token DIVIDE_OP
%token MODULO_OP
%token POWER_OP
%token LP
%token RP
%token LCB
%token RCB
%token INT
%token RAT
%token BOOL
%token STR
%token NOT
%token COMMA
%token GET_INCLINATION
%token GET_ALTITUDE
%token GET_TEMPERATURE
%token GET_ACCELERATION
%token GET_TIME
%token TURN_CAMERA
%token TAKE_PICTURE
%token CONNECT_BASE
%token IF
%token COLON
%token ELSE
%token WHILE
%token FOR
%token RETURN
%token INPUT
%token OUTPUT
%token START
%token END
%token COMMENT
%token IDENT

%right ASSIGNMENT_OP ASSIGN_ADD ASSIGN_DIFF ASSIGN_DIVIDE ASSIGN_MULTIPLY ASSIGN_POWER
%start program

%%
program: START stmts END ;
stmts: stmt | stmt stmts ;
stmt: matched | unmatched ;
matched: IF expression COLON matched ELSE matched | non_if_stmt ;
unmatched: IF expression COLON stmt | IF expression COLON matched ELSE unmatched ;
non_if_stmt: single_stmt | loop_stmt | stmt_group ;
single_stmt: single_stmt_options SEMICOLON ;
single_stmt_options: declaration | assignment | declaration_assignment | expression | return_stmt ;
declaration: type IDENT | CONST type IDENT ;
type: INT_TYPE | RAT_TYPE | STR_TYPE | BOOL_TYPE | FUNC_TYPE ;
assignment: IDENT assignment_ops expression ;
assignment_ops: ASSIGNMENT_OP | ASSIGN_ADD | ASSIGN_DIFF | ASSIGN_DIVIDE | ASSIGN_MULTIPLY | ASSIGN_POWER ;
declaration_assignment: declaration assignment_ops expression ;
expression: or_exp ;
or_exp: or_exp OR_OP and_exp | and_exp ;
and_exp: and_exp AND_OP relational_exp | relational_exp ;
relational_exp: relational_exp relational_op sum_diff_exp | sum_diff_exp ;
relational_op: GREATER_THAN | GREATER_OR_EQUAL | LESS_THAN | LESS_OR_EQUAL | IS_EQUAL |NOT_EQUAL ;
sum_diff_exp: sum_diff_exp sum_diff_op factor | factor ;
sum_diff_op: SUM_OP | DIFF_OP ;
factor: factor factor_op power | power ;
factor_op: MULTIPLY_OP | DIVIDE_OP | MODULO_OP ;
power: power POWER_OP not_exp | not_exp;
not_exp: term | NOT term ;
term: LP expression RP | IDENT | literal | function_exp ;
literal: INT | RAT | BOOL | STR | func ;
func: type func_dec | func_dec ;
func_dec: LP param_decs RP stmt | LP RP stmt ;
param_decs: declaration | declaration COMMA param_decs ;
function_exp: IDENT LP params RP | IDENT LP RP | primitive_funcs ;
primitive_funcs: CONNECT_BASE LP RP | GET_ACCELERATION LP RP | GET_ALTITUDE LP RP | GET_INCLINATION LP RP | GET_TEMPERATURE LP RP | GET_TIME LP RP | TAKE_PICTURE LP RP | TURN_CAMERA LP params RP | INPUT LP RP | OUTPUT LP params RP ;
params: expression | expression COMMA params ;
loop_stmt: while_stmt | for_stmt ;
while_stmt: WHILE expression COLON stmt ;
for_stmt: FOR for_dec SEMICOLON expression SEMICOLON assignment COLON stmt | FOR SEMICOLON expression SEMICOLON assignment COLON stmt ;
for_dec: assignment | declaration_assignment ;
stmt_group: LCB stmts RCB ;
return_stmt: RETURN | RETURN expression ;

%%
#include "lex.yy.c"
void yyerror(char *s) {
  printf("Syntax error on line %d: %s.\n", yylineno, s);
}
int main() {
  yyparse();
  if (yynerrs < 1) {
    printf("Input program is valid.\n");
  }
  return 0;
}