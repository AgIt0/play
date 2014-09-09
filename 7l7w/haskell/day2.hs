
module Day2 where

import Data.List(sortBy)

-- Write a sort that takes a list and returns a sorted list.
my_sort [] = []
my_sort list = sortBy compare list

--Write a sort that takes a list and a function that compares 
--its two arguments and then returns a sorted list.
your_sort comparator list = sortBy comparator list

--Write a Haskell function to convert a string to a number.
--The string should be in the form of $2,345,678.99 and can possibly have leading zeros.
strip_but_nums string = filter (`elem` '.':['0'..'9']) string
str_to_i string = read (strip_but_nums string)::Float

--Write a function that takes an argument x and returns a lazy sequence that 
--has every third number, starting with x. Then, write a function that includes 
--every fifth number, beginning with y. Combine these functions through 
--composition to return every eighth number, beginning with x + y.
every_third x = [x, x + 3..]
every_fifth y = [y, y + 5..]
every_eight x y = zipWith (+) (every_third x) (every_fifth y)

--Use a partially applied function to define a function that will return
--half of a number and another that will append \n to the end of any string.
half_num = (/ 2)
new_line = (++ "\n")
