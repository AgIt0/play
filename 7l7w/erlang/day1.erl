-module(day1).
-export([recursive_word_count/1]).
-export([count_to_ten/0]).
-export([error_or_success/1]).

%% Write a function that uses recursion to return the number of words in a string.
recursive_word_count([]) -> 0;
recursive_word_count(String) -> recursive_word_count(String, 1).

recursive_word_count([], Count) -> Count;
%% 32 is the value for space
recursive_word_count([32|Tail], Count) -> recursive_word_count(Tail, Count + 1);
recursive_word_count([_|Tail], Count) -> recursive_word_count(Tail, Count).


%% Write a function that uses recursion to count to ten.
count_to_ten() -> count_to_ten(1).
count_to_ten(10) -> io:write(10), io:nl();
count_to_ten(Num) -> io:write(Num), io:nl(),
                     count_to_ten(Num + 1).

%% Write a function that uses matching to selectively print “success” or 
%% “error: message” given input of the form {error, Message} or success.
error_or_success(success) -> io:fwrite("success~n");
error_or_success({error, Message}) -> io:fwrite("error " ++ Message), io:nl().
