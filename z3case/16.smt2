(set-logic QF_NIA)

(set-option :smt.arith.nl.grobner true)
(set-option :smt.arith.nl.branching true)

(declare-fun x () Int)
(declare-fun y () Int)

(assert (> (* x x) y))
(assert (= (* y y) x))

(check-sat)
(get-model)
