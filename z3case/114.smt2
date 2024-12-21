(set-logic QF_NRA) ; Quantifier-Free Nonlinear Real Arithmetic
(set-option :algebraic.factor true)
(set-option :algebraic.factor_max_prime 29)
(set-option :algebraic.min_mag 20)

(declare-fun x () Real)
(declare-fun y () Real)
(declare-fun z () Real)
(assert (= (* x x) y))
(assert (= (+ (* y y) (* 2.5 z)) (* 3 x)))
(assert (< (* 2 z) y))
(check-sat)