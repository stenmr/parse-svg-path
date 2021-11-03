:- [parse].

:- set_prolog_flag(double_quotes, chars).

test_coordinate_pair :-
  phrase(coordinate_pair, "200-100"),
  phrase(coordinate_pair, "200.4.5"),
  \+ phrase(coordinate_pair, "200"),
  \+ phrase(coordinate_pair, "200.4"),
  \+ phrase(coordinate_pair, "200.4.4.5"),
  \+ phrase(coordinate_pair, "200-10-10").