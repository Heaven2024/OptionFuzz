(set-logic QF_FP)
(set-option :datalog.check_relation "main_relation")
(set-option :bmc.linear_unrolling_depth 15)

(declare-fun a (Real Real) Real)
(declare-fun b (Real Real) Bool)

(assert (forall ((x Real) (y Real)) (=> (b x y) (= (a x y) (* x y)))))
(assert (exists ((x Real)) (and (b 2.0 3.0) (> (a 2.0 3.0) 6.0))))
(check-sat)
