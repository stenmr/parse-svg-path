:- [parse].

:- set_prolog_flag(double_quotes, chars).

test_coordinate_pair :-
  phrase(coordinate_pair, "200-100"),
  phrase(coordinate_pair, "200.4.5"),
  \+ phrase(coordinate_pair, "200"),
  \+ phrase(coordinate_pair, "200.4"),
  \+ phrase(coordinate_pair, "200.4.4.5"),
  \+ phrase(coordinate_pair, "200-10-10").

test_smooth_curveto :-
  phrase(smooth_curveto, "s1.735-9.64.184-12.786").

test_svg_path :-
  phrase(svg_path, "M8.81 5.056a7.224 7.224 0 0 0-2.057 8.987c1.552 3.147 6.861 8.023 9.55 6.207s1.735-9.64.184-12.786"),
  phrase(svg_path, "m-118.77,81.262s-0.55,1.816-1.32,1.517c-0.77-0.298,0.11-51.104-19.95-55.978,0,0,19.22-0.864,21.27,54.461z"),
  phrase(svg_path, "M 10 20 L 10 30 Z Z Z").