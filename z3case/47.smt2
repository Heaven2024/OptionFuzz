
(set-option :sat.lookahead.cube.fraction 0.6)
(set-logic QF_LIA)
(declare-fun a () Int)
(declare-fun b () Int)
(assert (> (+ a b) 100))
(assert (< (- a b) 50))
(check-sat)