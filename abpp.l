digit [0-9]
letter [A-Za-z]
sign [+-]
space [ |\t]
semicolon ;
colon :
comma ,
constant CONST
comment #
int_type INT
rat_type RAT
str_type STR
bool_type BOOL
func_type FUNC
identifier {letter}({letter}|{digit}|_)*
assignment_op :=
assign_add \+=
assign_diff \-=
assign_multiply \*=
assign_divide \/=
assign_power \^=
or_op OR
and_op AND
bigger_than >
bigger_or_equal >=
less_than <
less_or_equal <=
is_equal \?=
not_equal !=
sum_op \+
diff_op \-
multiply_op \*
divide_op \/
modulo_op %
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
get_inclination GET_INCLINATION
get_altitude GET_ALTITUDE
get_temperature GET_TEMPERATURE
get_acceleration GET_ACCELERATION
get_time GET_TIME
turn_camera TURN_CAMERA
take_picture TAKE_PICTURE
connect_base CONNECT_BASE
if IF
else ELSE
while WHILE
for FOR
return RETURN
input INPUT
output OUTPUT
%%
{semicolon} return (SEMICOLON);
{constant} return (CONST);
{int_type} return (INT_TYPE);
{rat_type} return (RAT_TYPE);
{str_type} return (STR_TYPE);
{bool_type} return (BOOL_TYPE);
{func_type} return (FUNC_TYPE);
{assignment_op} return (ASSIGNMENT_OP);
{assign_add} return (ASSIGN_ADD);
{assign_diff} return (ASSIGN_DIFF);
{assign_multiply} return (ASSIGN_MULTIPLY);
{assign_divide} return (ASSIGN_DIVIDE);
{assign_power} return (ASSIGN_POWER);
{or_op} return (OR_OP);
{and_op} return (AND_OP);
{bigger_than} return (BIGGER_THAN);
{bigger_or_equal} return (BIGGER_OR_EQUAL);
{less_than} return (LESS_THAN);
{less_or_equal} return (LESS_OR_EQUAL);
{is_equal} return (IS_EQUAL);
{not_equal} return (NOT_EQUAL);
{sum_op} return (SUM_OP);
{diff_op} return (DIFF_OP);
{multiply_op} return (MULTIPLY_OP);
{divide_op} return (DIVIDE_OP);
{modulo_op} return (MODULO_OP);
{power_op} return (POWER_OP);
{lp} return (LP);
{rp} return (RP);
{lcb} return (LCB);
{rcb} return (RCB);
{int} return (INT);
{rational} return (RAT);
{bool} return (BOOL);
{string} return (STR);
{not} return (NOT);
{comma} return (COMMA);
{get_inclination} return (GET_INCLINATION);
{get_altitude} return (GET_ALTITUDE);
{get_temperature} return (GET_TEMPERATURE);
{get_acceleration} return (GET_ACCELERATION);
{get_time} return (GET_TIME);
{turn_camera} return (TURN_CAMERA);
{take_picture} return (TAKE_PICTURE);
{connect_base} return (CONNECT_BASE);
{if} return (IF);
{colon} return (COLON);
{else} return (ELSE);
{while} return (WHILE);
{for} return (FOR);
{return} return (RETURN);
{input} return (INPUT);
{output} return (OUTPUT);
{comment} return (COMMENT);
{identifier} return (IDENT);
%%
int yywrap() {return 1; }