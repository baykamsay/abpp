%option main
digit [0-9]
letter [A-Za-z]
sign [+-]
space [ |\t]
semicolon ;
colon :
comma ,
constant CONST
comment #[^\n]*\n
int_type INT
rat_type RAT
str_type STR
bool_type BOOL
func_type FUNC
var {letter}({letter}|{digit}|_)*
assignment_op :=|\+=|\-=|\*=|\/=|\^=
or_op OR
and_op AND
relational_op >|>=|<|<=|\?=|\!=
sum_diff_op \+|\-
factor_op \*|\/|%
power_op \^
lp \(
rp \)
lcb \{
rcb \}
int {sign}?{digit}+
rational {sign}?{digit}*(\.)?{digit}+
bool TRUE|FALSE
string '[^']*'
not NOT
primitive_func_id GET_INCLINATION\(\)|GET_ALTITUDE\(\)|GET_TEMPERATURE\(\)|GET_ACCELERATION\(\)|GET_TIME\(\)|TURN_CAMERA\(\)|TAKE_PICTURE\(\)|CONNECT_BASE\(\)
if IF
else ELSE
while WHILE
for FOR
return RETURN
input INPUT
output OUTPUT
%%
{semicolon} printf("SEMICOLON ");
{constant} printf("CONST ");
{int_type} printf("INT_TYPE ");
{rat_type} printf("RAT_TYPE ");
{str_type} printf("STR_TYPE ");
{bool_type} printf("BOOL_TYPE ");
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
{lcb} printf("LCB ");
{rcb} printf("RCB ");
{int} printf("INT ");
{rational} printf("RAT ");
{bool} printf("BOOL ");
{string} printf("STR ");
{not} printf("NOT ");
{comma} printf("COMMA ");
{primitive_func_id} printf("PRIMITIVE_FUNC_ID");
{if} printf("IF ");
{colon} printf("COLON ");
{else} printf("ELSE ");
{while} printf("WHILE ");
{for} printf("FOR ");
{return} printf("RETURN ");
{input} printf("INPUT ");
{output} printf("OUTPUT ");
{comment} printf("COMMENT \n");
{var} printf("VAR ");
%%