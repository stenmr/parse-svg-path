% https://www.w3.org/TR/css-syntax-3/#typedef-number-token
%
% https://www.metalevel.at/prolog/dcg

:- set_prolog_flag(double_quotes, chars).

num --> sign, digits, dot, digits, exponent.
num --> sign, digits, exponent.
num --> sign, dot, digits, exponent.

digit --> [D], { member(D, ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) }.
digits --> digit.
digits --> digit, digits.
sign --> [].
sign --> ['-'].
sign --> ['+'].
dot --> ['.'].
e --> [e].
e --> ['E'].

exponent --> [].
exponent --> e, sign, digits.