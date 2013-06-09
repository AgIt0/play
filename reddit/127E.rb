# The McCarthy 91 Function is a recursive function which, given an integer
# N, returns the integer 91 if N is equal to or smaller than 100, or simply
# N-10 if N is greater than 100. Sounds simple, but look at the function
# definition in the linked Wikipedia article! How could such a function
# work to always return a constant (for N <= 100) that isn't in the function
# body? Well, that's your task: write out each step that McCarthy's function
# does for a given integer N.
#
# Input Description
#
# You will be given a single integer N on standard console input. This
# integer will range between 0 and 2,147,483,647 (without commas).
#
# Output Description
#
# You must output what the function does on each recursion: first you must
# print the function the expression that is being computed, and then print
# which condition it took. Simply put, you must print each recursion event
# in the following string format:
# "<Expression being executed> since <is greater than | is equal to or less
# than> 100". Note that for the first line you do not need to print the
# "since" string (see example below). You should also print the final
# expression, which is the result (which should always be 91).
#
#
# Sample Input
#
# Note: Take from Wikipedia for the sake of keeping things as simple and
# clear as possible.
#
# 99
#
# Sample Output
#
# M(99)
# M(M(110)) since 99 is equal to or less than 100
# M(100) since 110 is greater than 100
# M(M(111)) since 100 is equal to or less than 100
# M(101) since 111 is greater than 100
# 91 since 101 is greater than 100
# 91



def m(n)
    if n > 100
        puts "M(#{n -= 10}) since #{n + 10} is greater than 100"
        n
    else
        puts "M(M(#{n += 11})) since #{n - 11} equal to or less than 100"
        m(m(n))
    end
end

m(99)



