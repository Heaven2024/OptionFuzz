(declare-fun v () Int)
(assert (= 1 (mod 0 (str.len (str.from_int (ite (= v 0) 0 (div 0 v)))))))
(check-sat)