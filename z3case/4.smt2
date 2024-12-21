(set-option :produce-models true)

(declare-fun f (Int) Int)
(define-fun-rec fact ((n Int)) Int
  (ite (<= n 1) 1 (* n (fact (- n 1)))))
(assert (= (f 5) (fact 5)))
(check-sat)
(get-model)