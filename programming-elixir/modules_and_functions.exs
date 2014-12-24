defmodule Times do
  def double(n), do: n * 2
  def triple(n), do: n * 3
  def quadriple(n), do: double(n) * double(n)
end

IO.puts Times.double(2)

# Extend the Times module with a triple function that multiplies its
# parameter by three.

IO.puts Times.triple(2)

# Add a quadruple function. (Maybe it could call the double function....)

IO.puts Times.quadriple(2)

# Implement and run a function sum(n) that uses recursion to calculate the
# sum of the integers from 1 to n

defmodule Mathy do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)
end

IO.puts Mathy.sum(5)

# Write a function gcd(x,y) that finds the greatest common divisor between
# two nonnegative integers. Algebraically, gcd(x,y) is x if y is zero; it’s
# gcd(y, rem(x,y)) otherwise.

defmodule Mathy do
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end

IO.puts Mathy.gcd(9, 5)


# I’m thinking of a number between 1 and 1000....
# The most efficient way to find the number is to guess halfway between
# the low and high numbers of the range. If our guess is too big, then
# the answer lies between the bottom of the range and one less than our guess.
# If our guess is too small, then the answer lies between one more than our
# guess and the end of the range.
# Your API will be guess(actual, range), where range is an Elixir range.

defmodule Chop do
  def guess(answer, low..high) do
    guess = div(low + high, 2)
    IO.puts "Is it #{guess}"
    _guess_helper(answer, guess, low..high)
  end

  def _guess_helper(answer, answer, _), do: IO.puts "Yes, it's #{answer}"

  def _guess_helper(answer, guess, _..high) when guess < answer,
    do: guess(answer, (guess + 1)..high)

  def _guess_helper(answer, guess, low.._) when guess > answer,
    do: guess(answer, low..(guess - 1))
end

Chop.guess(273, 1..1000)
