(set-logic QF_NRA) ; Quantifier-Free Nonlinear Real Arithmetic
(set-option :rcf.clean_denominators false)
(set-option :rcf.inf_precision 20)
(set-option :rcf.lazy_algebraic_normalization true)

(declare-fun x () Real)
(declare-fun y () Real)
(declare-fun z () Real)
(assert (= (+ x (* 1.5 y)) z))
(assert (< (* x x) (+ y z)))
(assert (<= (exp x) (log z)))
(check-sat)