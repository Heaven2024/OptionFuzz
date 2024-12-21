(set-logic QF_LIA)

(set-option :smt.arith.branch_cut_ratio 3)
(set-option :smt.arith.propagate_eqs true)

(declare-fun a () Int)
(declare-fun b () Int)
(declare-fun c () Int)

(assert (= (+ a (* 2 b)) 10))
(assert (>= c (- a b)))

(check-sat)
(get-model)