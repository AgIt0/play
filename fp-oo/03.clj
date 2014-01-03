;Question: How do assoc and merge handle duplicate keys? Try it and see!
;
;user=> (assoc {:a 1} :a 2222)
;replaces the previous value that :a pointed to
;user=> (merge {:a 1, :b 2, :c 3} {:a 111, :b 222, :d 4} {:b "two"})
;same as assoc

(def Point
  (fn [x y]
    {:x x,
     :y y,
     :__class_symbol__ 'Point}))

(def x :x)
(def y :y)
(def class-of :__class_symbol__)

(def shift
  (fn [this xinc yinc]
    (Point (+ (x this) xinc)
           (+ (y this) yinc))))

(def Triangle
     (fn [point1 point2 point3]
       {:point1 point1, :point2 point2, :point3 point3
        :__class_symbol__ 'Triangle}))


(def right-triangle (Triangle (Point 0 0)
                              (Point 0 1)
                              (Point 1 0)))

(def equal-right-triangle (Triangle (Point 0 0)
                                    (Point 0 1)
                                    (Point 1 0)))

(def different-triangle (Triangle (Point 0 0)
                                  (Point 0 10)
                                  (Point 10 0)))

;Exercise 1: Implement add.

(def add
  (fn [first second]
    (Point (+ (x first) (x second))
           (+ (y first) (y second)))))

(def add_shift
  (fn [first second]
    (shift first (x second) (y second))))


;Exercise 2: A new operator
(def make
  (fn [klass x y]
    (klass x y)))

;make that works with Triangle
(def make1
  (fn [klass & stuff]
    (apply klass stuff)))

;Exercise 3: Write a function equal-triangles?
(def equal-triangles?
  (fn [& args]
    (= args)))
;(def equal-triangles? =)

;Exercise 4: Change equal-triangles? so that it can compare more than two trianges
;prevous solution already works since I grab all the arguments

;Exercise 5: Start to write a function valid-triangle? that takes three Points and returns either true or false. In this exercise, only check to see whether any of the points are duplicates.
(def valid-triangle?
  (fn [point1 point2 point3]
    (= (distinct [point1 point2 point3])
       [point1 point2 point3])))

(def valid-triangle1?
     (fn [& points]
       (= (distinct points) points)))
