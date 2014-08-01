/* Reverse the elements of a list. */
myrev(List, Reversed) :-
  reverse_helper(List, [], Reversed).

reverse_helper([], Reversed, Reversed).

reverse_helper([Head|Tail], Acc, Reversed) :-
  reverse_helper(Tail, [Head|Acc], Reversed).


/* Find the smallest element of a list. */
find_min([Min], Min).

find_min([H, K|Tail], Min) :-
  H =< K,
  find_min([H|Tail], Min).

find_min([H, K|Tail], Min) :-
  H > K,
  find_min([K|Tail], Min).

