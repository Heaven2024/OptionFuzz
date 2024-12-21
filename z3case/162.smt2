(set-logic QF_FP)
(set-option :datalog.all_or_nothing_deltas true)
(set-option :datalog.compile_with_widening true)

(declare-fun p (Real Real) Real)
(declare-fun q (Real Real) Bool)

(assert (forall ((x Real) (y Real)) (=> (q x y) (= (p x y) (+ x y)))))
(assert (exists ((x Real)) (and (q x 2.0) (= (p x 2.0) 5.0))))
(check-sat)
