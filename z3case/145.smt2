(set-logic QF_LRA)
(set-option :nnf.ignore_labels false)
(set-option :nnf.mode full)
(set-option :max_memory 1024)

(declare-fun p () Real)
(declare-fun q () Real)
(declare-fun r () Real)
(declare-fun s () Real)

(assert (=> (and (< p q) (> r q)) (or (> p r) (= r (+ p q)))))
(assert (not (exists ((s Real)) (and (= s p) (= s q)))))
(assert (forall ((t Real)) (=> (> t 0) (exists ((u Real)) (> u t)))))
(assert (= s (+ p r)))

(check-sat)
(get-model)
