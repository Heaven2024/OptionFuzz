(set-logic QF_LRA)
(set-option :nnf.ignore_labels true)
(set-option :nnf.mode full)

(declare-fun p () Real)
(declare-fun q () Real)
(declare-fun r () Real)

(assert (and (< p q) (> r p)))
(assert (=> (and (< p q) (> r q)) (or (> p r) (= r (+ p q)))))
(assert (not (exists ((s Real)) (and (= s p) (= s q)))))
(check-sat)
