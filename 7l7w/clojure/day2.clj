; Implement an unless with an else condition using macros.

(defmacro unless [test body]
  (list 'if (list 'not test) body))

(defmacro unless 
  ([test body] (list 'if (list 'not test) body))
  ([test unless-body else-body] (list 'if (list 'not test) unless-body else-body)))

; Write a type using defrecord that implements a protocol.

(defprotocol Student
  (study [s hours])
  (play [s hours]))

(defrecord LazyStudent []
  Student
  (study [_ hours]
    (if (< 2 hours)
      (println "No more studying for today!")
      (println "Well, I guess I can study a bit more")))
  (play [_ hours]
    (if (> 2 hours)
      (println "I wanna play more!")
      (println "Could do that"))))



