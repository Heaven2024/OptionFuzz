(set-logic QF_LIA) ; Quantifier-Free Linear Integer Arithmetic
(set-option :pp.bounded false)
(set-option :pp.max_depth 7)

(declare-fun m () Int)
(declare-fun n () Int)
(declare-fun o () Int)
(assert (= (+ m n) o))
(assert (or (> o 50) (< m 10)))
(assert (and (>= n 5) (<= o 100)))
(check-sat)