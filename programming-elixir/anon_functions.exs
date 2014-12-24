# Write a function that takes three arguments. If the first two are zero,
# return “FizzBuzz”. If the first is zero, return “Fizz”. If the second
# is zero return “Buzz”. Otherwise return the third argument. Do not use
# any lan- guage features that we haven’t yet covered in this booki.

fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, arg) -> arg
end

IO.puts fizz_buzz.(1, 2, 3)
IO.puts fizz_buzz.(0, 2, 3)
IO.puts fizz_buzz.(1, 0, 3)
IO.puts fizz_buzz.(0, 0, 3)

# The operator rem(a, b) returns the remainder after dividing a by b. Write
# a function that takes a single integer (n) and which calls the function
# in the previous exercise, passing it rem(n,3), rem(n,5), and n. Call it
# 7 times with the arguments 10, 11, 12, etc. You should get
# “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16”.

buzz_caller = fn (n) -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end
IO.puts buzz_caller.(10)
IO.puts buzz_caller.(11)
IO.puts buzz_caller.(12)
IO.puts buzz_caller.(13)
IO.puts buzz_caller.(14)
IO.puts buzz_caller.(15)
IO.puts buzz_caller.(16)

# Write a function prefix that takes a string. It should return a new function
# that takes a second string. When that second function is called, it will
# return a string containing the first string, a space, and the second string.

preffix = fn (string) ->
  fn other_string ->
    string <> " " <> other_string
  end
end

IO.puts preffix.("Elixir").("Rocks")

# Use the &... notation to rewrite the following.
#  – Enum.map [1,2,3,4], fn x -> x + 2 end
#  – Enum.each [1,2,3,4], fn x -> IO.inspect x end
first = Enum.map [1, 2, 3, 4], &(&1 + 2)
second = Enum.map [1, 2, 3, 4], &(IO.inspect(&1))

IO.puts(first)
IO.puts(second)
