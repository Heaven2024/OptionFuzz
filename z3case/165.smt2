(set-logic QF_FP)
(set-option :bmc.linear_unrolling_depth 15)
(set-option :datalog.all_or_nothing_deltas true)
(set-option :datalog.check_relation "test_relation")
(set-option :datalog.default_relation "pentagon")
(set-option :datalog.default_table "interval")

(declare-fun f (Real Real) Real)
(declare-fun g (Real Real) Real)

(assert (= (f 3.0 4.0) (+ (g 1.0 1.0) 5.0)))
(assert (exists ((x Real)) (and (> x 0.0) (= (f x 2.0) 6.0))))
(check-sat)
(get-model)
