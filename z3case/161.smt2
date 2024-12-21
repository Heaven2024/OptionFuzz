(set-logic QF_FP)
(set-option :datalog.dbg_fpr_nonempty_relation_signature true)
(set-option :bmc.linear_unrolling_depth 20)

(declare-fun r (Real Real) Bool)
(declare-fun s (Real Real) Real)

(assert (forall ((x Real) (y Real)) (=> (r x y) (= (s x y) (* x y)))))
(assert (exists ((x Real)) (and (r x 1.0) (> (s x 1.0) 10.0))))
(check-sat)
