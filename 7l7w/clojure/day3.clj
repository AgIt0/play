;Use refs to create a vector of accounts in memory.
;Create debit and credit functions to change the balance of an account.

(defn create 
  [] 
  (ref (vector)))

(defn add
  [accounts value]
  (dosync 
    (alter accounts conj value)))

(defn debit
  [accounts key value]
  (dosync (alter accounts assoc key (- (nth @accounts key) value))))

(defn credit
  [accounts key value]
  (dosync 
    (alter accounts assoc key (+ (nth @accounts key) value))))
