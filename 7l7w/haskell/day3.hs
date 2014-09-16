module Day3 where

--Write a function that looks up a hash table value that uses the Maybe monad.
--Write a hash that stores other hashes, several levels deep.
my_lookup key [] = Nothing
my_lookup key ((k,val):tail) = 
  if (key == k) 
  then Just val 
  else my_lookup key tail 

hash = [(1, []), (2, [("3", [("4", "smth")])])]
-- my_lookup 2 hash >>= my_lookup "3" >>= my_lookup "4"
