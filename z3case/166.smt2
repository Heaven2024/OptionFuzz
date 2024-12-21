(set-logic QF_FP)
(set-option :bmc.linear_unrolling_depth 10)
(set-option :datalog.compile_with_widening false)
(set-option :datalog.dbg_fpr_nonempty_relation_signature false)

(declare-fun a (Real Real) Real)
(declare-fun b (Real Real) Real)

(assert (= (a 3.0 4.0) (+ (b 2.0 3.0) 6.0)))
(assert (exists ((x Real)) (and (> x 0.0) (= (a x 3.0) 7.0))))
(check-sat)
