# Fintd nth fibonacci number.
# recursive
fib_r := method(n, 
  if(n <= 1, n, fib_r(n - 1) + fib_r(n - 2))
)

# Change / to return 0 if denominator is zero
Number originalDiv := Number getSlot("/")
Number / := method(denominator,
  if(denominator == 0, 0, self originalDiv(denominator))
)

# Add up all of the numbers in a 2-dimensional array
add2dArr := method(arr,
  arr flatten sum
)

add2dArr(list(1, 2, list(3, 4, 5))) println

# Add a slot called myAverage to a list 
# that computes the average of all the numbers in a list.
List myAverage := method(
  #if(select(x, x type != "Number") size > 0, Exception raise("NaN"), "")
  
  self reduce(+) / self size
)


#Write a program that gives you ten tries to guess a random number from 1–100.
random := (Random value(99) + 1) floor();

10 repeat (
  "Guess a number from 1 to 100" println();

  guess := File standardInput readLine("Guess: ") asNumber();

  if((guess == random), "Good Job" println(); break;);
);
