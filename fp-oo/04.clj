(def make
  (fn [type & args]
    (apply type args)))

(def send-to
  (fn [object message & args]
    (apply (message (:__methods__ object)) object args)))


(def Point
  (fn [x y]
    {;; initializing instance variables
     :x x
     :y y

     ;; Metadata
     :__class_symbol__ 'Point
     :__methods__ {
       :x :x
       :y :y
       :class :__class_symbol__

       :shift (fn [this xinc yinc]
                (make Point (+ (:x this) xinc)
                            (+ (:y this) yinc)))
       :add (fn [first second]
              (send-to first :shift (send-to second :x)
                                    (send-to second :y)))}}))

(def point
  (make Point 1 2))

(prn (send-to point :x))
(prn (send-to point :y))
(prn (send-to point :shift -1 -100))
(prn (send-to point :add (make Point -1 -100)))
