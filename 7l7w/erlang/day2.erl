-module(day2).
-export([find_by_key/2]).
-export([total_price/1]).

%% Consider a list of keyword-value tuples, such as [{erlang, "a func- tional language"}, {ruby, "an OO language"}]. 
%% Write a function that ac- cepts the list and a keyword and returns the associated value for the keyword.
find_by_key(_, []) -> false;
find_by_key(Key, [{Key, Val}|_]) -> Val;
find_by_key(Key, [_|Tail]) -> find_by_key(Key, Tail).


%% Consider a shopping list that looks like [{item quantity price}, ...]. 
%% Write a list comprehension that builds a list of items of the form [{item total_price}, ...], 
%% where total_price is quantity times price.
total_price(Items) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- Items].
