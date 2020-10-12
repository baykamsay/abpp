%option main
/* add backslash */
digit [0-9]
letter [A-Za-z]
sign [+-]
semicolon ;
constant CONST
/* maybe make types single statement */
int_type INT
rat_type RAT
str_type STR
bool_type BOOL
list_type LIST
func_type FUNC
type INT|RAT|STR|BOOL|LIST|FUNC
var {letter}({letter}|{digit}|_)*
assignment_op :=|\+=|\-=|\*=|\/=|\^=
or_op OR
and_op AND
relational_op >|>=|<|<=|\?=|\^=
sum_diff_op \+|\-
factor_op \*|\/|%
power_op \^
lp \(
rp \)
int {sign}?{digit}+
rational {sign}?{digit}*(\.)?{digit}+
bool TRUE|FALSE
string '[^']*'
/* fix lists in lists */
element {int}|{rational}|{bool}|{string}|{var}
list \[(({element},[ |\t]*)*({element}))*\]
declaration {constant}?[ |\t]*{type}[ |\t]*{var}
func {type}?[ |\t]*{lp}((({declaration},[ |\t]*)*{declaration})*){rp}
comment #[^\n]*\n

%%
{semicolon} printf("SEMICOLON ");
{constant} printf("CONST ");
{int_type} printf("INT_TYPE ");
{rat_type} printf("RAT_TYPE ");
{str_type} printf("STR_TYPE ");
{bool_type} printf("BOOL_TYPE ");
{list_type} printf("LIST_TYPE ");
{func_type} printf("FUNC_TYPE ");
{assignment_op} printf("ASSIGNMENT_OP ");
{or_op} printf("OR_OP ");
{and_op} printf("AND_OP ");
{relational_op} printf("RELATIONAL_OP ");
{sum_diff_op} printf("SUM_DIFF_OP ");
{factor_op} printf("FACTOR_OP ");
{power_op} printf("POWER_OP ");
{lp} printf("LP ");
{rp} printf("RP ");
{int} printf("INT ");
{rational} printf("RAT ");
{bool} printf("BOOL ");
{string} printf("STR ");
{list} printf("LIST ");
{func} printf("FUNC ");

{comment} printf("COMMENT ");
{var} printf("VAR ");
%%