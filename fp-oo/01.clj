;;Exercise 1: define a function second that returns the second element of a list
(def second (fn [list] (nth list 1)))
(def second (fn [list] (first (rest list))))

;;Exercise 2: Give two implementations of third, which returns the third element of a list.
(def third (fn [list] (nth list 2)))
(def third (fn [list] (first (rest (rest list)))))
(def third (fn [list] (second (rest list))))

;;my-apply
(def my-apply
  (fn [function sequence]
    (eval (cons function sequence))))

;;first odd element of a list
(first (filter odd? [1 2 3 4]))

;;Exercise 3: Impletent add-squares.
(def add-squares
  (fn [& numbers]
    (apply + (map * numbers numbers))))

;;Exercise 4: The range function produces a sequence of numbers:
;;
;;user=> (range 1 5)
;;(1 2 3 4)
;;
;;Using it and apply, implement a bizarre version of factorial that uses neither iteration nor recursion.
;;Hint: The factorial of 5 is 1*2*3*4*5.
(def factorial
  (fn [n]
    (apply * (range 2 (inc n)))))

;;Exercise 5: Think of a problem the functions below could solve and solve it.
;;
;;get the first 5 elements of a list and remove the duplicates
(distinct (take 5 [1 1 2 2 3]))
;;concatanate 2 sequences
(concat [5 4] [3 5])
;;from a sequence create infinite sequence
(repeat [5 4])
;;from two sequences create one by getting the first item in each col then the second and etc.
(interleave [5 3] [4 2])
;;drop and drop-last
(drop [1 2 3])
;;flatten
(flatten [1 2 [3 4]])
;;partition
(partition 3 [1 2 3 4 5 6 7 8 9])
;;every?
(every? odd? [1 3 5])
;;remove
(remove odd? [1 2 3 4])
