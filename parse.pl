% https://www.w3.org/TR/css-syntax-3/#typedef-number-token
% https://svgwg.org/svg2-draft/single-page.html#paths-PathDataBNF
%
% https://www.metalevel.at/prolog/dcg

:- set_prolog_flag(double_quotes, chars).

svg_path --> wsps_opt.
svg_path --> wsps_opt, moveto.
svg_path --> wsps_opt, moveto, drawto_commands.

drawto_commands --> drawto_command.
drawto_commands --> drawto_command, drawto_commands.

drawto_command --> moveto.
drawto_command --> closepath.
drawto_command --> lineto.
drawto_command --> horizontal_lineto.
drawto_command --> vertical_lineto.
drawto_command --> curveto.
drawto_command --> smooth_curveto.
drawto_command --> quadratic_bezier_curveto.
drawto_command --> smooth_quadratic_bezier_curveto.
drawto_command --> elliptical_arc.
drawto_command --> wsps.

moveto --> "m", wsps_opt, coordinate_pair_sequence.
moveto --> "M", wsps_opt, coordinate_pair_sequence.

closepath --> "z".
closepath --> "Z".

lineto --> "l", wsps_opt, coordinate_sequence.
lineto --> "L", wsps_opt, coordinate_sequence.

horizontal_lineto --> "h", wsps_opt, coordinate_sequence.
horizontal_lineto --> "H", wsps_opt, coordinate_sequence.

vertical_lineto --> "v", wsps_opt, coordinate_sequence.
vertical_lineto --> "V", wsps_opt, coordinate_sequence.

curveto --> "c", wsps_opt, curveto_coordinate_sequence.
curveto --> "C", wsps_opt, curveto_coordinate_sequence.

curveto_coordinate_sequence --> coordinate_pair_triplet.
curveto_coordinate_sequence --> coordinate_pair_triplet, comma_wsp, curveto_coordinate_sequence.
% curveto_coordinate_sequence --> coordinate_pair_triplet, curveto_coordinate_sequence.

smooth_curveto --> "s", wsps_opt, smooth_curveto_coordinate_sequence.
smooth_curveto --> "S", wsps_opt, smooth_curveto_coordinate_sequence.

smooth_curveto_coordinate_sequence --> coordinate_pair_double.
smooth_curveto_coordinate_sequence --> coordinate_pair_double, comma_wsp, smooth_curveto_coordinate_sequence.
% smooth_curveto_coordinate_sequence --> coordinate_pair_double, smooth_curveto_coordinate_sequence.

quadratic_bezier_curveto --> "q", wsps_opt, quadratic_bezier_curveto_coordinate_sequence.
quadratic_bezier_curveto --> "Q", wsps_opt, quadratic_bezier_curveto_coordinate_sequence.

quadratic_bezier_curveto_coordinate_sequence --> coordinate_pair_double.
quadratic_bezier_curveto_coordinate_sequence --> coordinate_pair_double, comma_wsp, quadratic_bezier_curveto_coordinate_sequence.
% quadratic_bezier_curveto_coordinate_sequence --> coordinate_pair_double, quadratic_bezier_curveto_coordinate_sequence.

smooth_quadratic_bezier_curveto --> "t", wsps_opt, coordinate_pair_sequence.
smooth_quadratic_bezier_curveto --> "T", wsps_opt, coordinate_pair_sequence.

elliptical_arc --> "a", wsps_opt, elliptical_arc_argument_sequence.
elliptical_arc --> "A", wsps_opt, elliptical_arc_argument_sequence.

elliptical_arc_argument_sequence --> elliptical_arc_argument.
elliptical_arc_argument_sequence --> elliptical_arc_argument, comma_wsp, elliptical_arc_argument_sequence.
% elliptical_arc_argument_sequence --> elliptical_arc_argument, elliptical_arc_argument_sequence.

elliptical_arc_argument --> number, comma_wsp, number, comma_wsp, number, comma_wsp, flag, comma_wsp, flag, comma_wsp, coordinate_pair.

coordinate_pair_double --> coordinate_pair, comma_wsp, coordinate_pair.
coordinate_pair_double --> coordinate_pair, coordinate_pair.

coordinate_pair_triplet --> coordinate_pair, comma_wsp, coordinate_pair, comma_wsp, coordinate_pair.
coordinate_pair_triplet --> coordinate_pair, comma_wsp, coordinate_pair, coordinate_pair.
coordinate_pair_triplet --> coordinate_pair, coordinate_pair, comma_wsp, coordinate_pair.
coordinate_pair_triplet --> coordinate_pair, coordinate_pair, coordinate_pair.

coordinate_pair_sequence --> coordinate_pair.
coordinate_pair_sequence --> coordinate_pair, comma_wsp, coordinate_pair_sequence.
coordinate_pair_sequence --> coordinate_pair, coordinate_pair_sequence.

coordinate_sequence --> coordinate.
coordinate_sequence --> coordinate, comma_wsp, coordinate_sequence.
coordinate_sequence --> fractional_coordinate, coordinate_sequence_r.

coordinate_sequence_r --> coordinate.
coordinate_sequence_r --> coordinate, comma_wsp, coordinate_sequence_r.
coordinate_sequence_r --> implicit_fractional_coordinate, coordinate_sequence_r.
coordinate_sequence_r --> signed_coordinate, coordinate_sequence.

coordinate_pair --> coordinate, comma_wsp, coordinate.
coordinate_pair --> fractional_coordinate, implicit_fractional_coordinate.
coordinate_pair --> coordinate, signed_coordinate.

coordinate --> number.
coordinate --> sign, number.

implicit_fractional_coordinate --> implicit_number.
implicit_fractional_coordinate --> sign, implicit_number.
signed_coordinate --> sign, number.
fractional_coordinate --> fractional_number.
fractional_coordinate --> sign, fractional_number.

implicit_number --> implicit_fractional_constant.
implicit_number --> implicit_fractional_constant, exponent.
fractional_number --> explicit_fractional_constant.
fractional_number --> explicit_fractional_constant, exponent.

implicit_fractional_constant --> ".", digits.
explicit_fractional_constant --> ".", digits.
explicit_fractional_constant --> digits, ".", digits.

number --> fractional_constant.
number --> fractional_constant, exponent.

fractional_constant --> digits, ".", !, digits.
fractional_constant --> ".", digits.
fractional_constant --> digits.

exponent --> e, digits.
exponent --> e, sign, digits.

digit --> [D], { member(D, ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) }.
digits --> digit.
digits --> digit, digits.

sign --> ['-'].
sign --> ['+'].
e --> [e].
e --> ['E'].

% Should include more chars
wsp --> [W], { member(W, [' ', '	', '\n']) }.

wsps --> wsp.
wsps --> wsp, wsps.

wsps_opt --> [].
wsps_opt --> wsp.
wsps_opt --> wsp, wsps.

comma_wsp_opt --> [].
comma_wsp_opt --> ",".
comma_wsp_opt --> ",", wsps.
comma_wsp_opt --> wsps.
comma_wsp_opt --> wsps, ",".
comma_wsp_opt --> wsps, ",", wsps.

comma_wsp --> ",".
comma_wsp --> ",", wsps.
comma_wsp --> wsps.
comma_wsp --> wsps, ",".
comma_wsp --> wsps, ",", wsps.

flag --> [F], { member(F, ['0', '1']) }.