# Given a well-formed (non-empty, fully valid) string of digits,
# let the integer N be the sum of digits. Then, given this integer N,
# turn it into a string of digits. Repeat this process until you only
# have one digit left. Simple, clean, and easy: focus on writing this
# as cleanly as possible in your preferred programming language.
#
# Author: nint22. This challenge is particularly easy, so don't worry
# about looking for crazy corner-cases or weird exceptions. This challenge
# is as up-front as it gets :-) Good luck, have fun!
#
#
#Input Description
#
# On standard console input, you will be given a string of digits. This
# string will not be of zero-length and will be guaranteed well-formed
# (will always have digits, and nothing else, in the string).
# Output Description
#
# You must take the given string, sum the digits, and then convert this
# sum to a string and print it out onto standard console. Then, you must
# repeat this process again and again until you only have one digit left.
#
#
# Sample Input
# Note: Take from Wikipedia for the sake of keeping things as simple and clear as possible.
#
# 12345
#
# Sample Output
#
# 12345
# 15
# 6

def sum_string(number)
  puts number
  sum = number.to_s.split("").map(&:to_i).inject(:+)
  if sum > 9
    sum_string(sum)
  else
    puts sum
  end
end


