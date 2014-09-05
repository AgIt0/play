module Day1 where

-- Write a function that takes a list and returns the same list in reverse.
my_reverse [] = []
my_reverse (h:t) = my_reverse t ++ [h]


--Write a function that builds two-tuples with all possible combinations of two 
--of the colors black, white, blue, yellow, and red. 
--Note that you should include only one of (black, blue) and (blue, black).
let colours = ["black", "white", "blue", "yellow", "red"]
[(x, y) | x <- colours, y <- colours, x <= y]


--Write a list comprehension to build a childhood multiplication table.
--The table would be a list of three-tuples where the first two are integers 
--from 1–12 and the third is the product of the first two.
[(x, y, x*y) | x <- [1..12], y <- [1..12]]


--Solve the map-coloring problem using Haskell.
let colours = ["red", "green", "blue"]
[(alabama, mississippi, georgia, tennessee, florida) |
  alabama <- colours,
  mississippi <- colours,
  georgia <- colours,
  tennessee <- colours,
  florida <- colours,
  mississippi /= tennessee,
  mississippi /= alabama,
  alabama /= tennessee,
  alabama /= mississippi,
  alabama /= georgia,
  alabama /= florida,
  georgia /= florida,
  georgia /= tennessee]
