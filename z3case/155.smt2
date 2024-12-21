(set-logic QF_NIA)
(set-option :seed 42)
(set-option :max_memory 512)

(declare-const p Int)
(declare-const q Int)
(declare-const r Int)

(assert (and (> p 0) (> q 0)))
(assert (=> (and (< p q) (> r p)) (= r (+ p q))))
(assert (> r 5))

(check-sat)
