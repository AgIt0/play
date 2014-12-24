# I defined our sum function to carry a partial total as a second parameter
# so I could illustrate how to use accumulators to build values. The sum
# function can also be written without an accumulator. Can you do it?

defmodule MyList do
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)
end

IO.puts(MyList.sum([1,2,3]))

# Write a mapsum function that takes a list and a function. It applies the
# function to each element of the list and then sums the result

defmodule MyList do
  def mapsum([], _func), do: 0
  def mapsum([ head | tail], func), do: func.(head) + mapsum(tail, func)
end

IO.puts MyList.mapsum([1, 2, 3], &(&1 * &1))

# Write a max(list) that returns the element with the maximum value in the
# list. (This is slightly trickier than it sounds.)

defmodule MyList do
  def max([ max | []]), do: max
  def max([ current_max | [ head | tail ]]) do
    if current_max > head do
      max([ current_max | tail ])
    else
      max([ head | tail ])
    end
  end
end

IO.puts(MyList.max([6,12,3]))

# An Elixir single-quoted string is actually a list of individual character
# codes. Write a caesar(list, n) function that adds n to each list element,
# wrapping if the addition results in a character greater than z.

defmodule MyList do
  def caesar([], _), do: []
  def caesar([ head | tail ], n)
    when head + n <= ?z,
    do: [ head + n | caesar(tail, n) ]

  def caesar([ head | tail], n) do
    width = ?z - ?a + 1
    rotated_char = ?a + rem(head - ?a + n, width)

    [rotated_char | caesar(tail, n)]
  end
end

IO.puts MyList.caesar('ryvkve', 13)  #=> elixir

# Write a function MyList.span(from, to) that returns a list
# of the numbers from from up to to.
defmodule MyList do
  def span(from, to) when from > to , do: []
  def span(from, to) do
    [from | span(from + 1, to)]
  end
end

# use inspect or it will try to print as a string
IO.inspect MyList.span(1, 20)
