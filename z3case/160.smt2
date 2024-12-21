(set-logic QF_FP)
(set-option :bmc.linear_unrolling_depth 10)
(set-option :datalog.all_or_nothing_deltas true)
(set-option :datalog.check_relation "default_relation")
(set-option :datalog.compile_with_widening true)

(declare-fun f (Real Real) Real)
(declare-fun g (Real Real) Real)

(assert (= (f 2.0 3.0) (+ (g 1.0 1.0) 4.0)))
(assert (exists ((x Real)) (and (> x 0.0) (= (f x 2.0) 5.0))))
(check-sat)
