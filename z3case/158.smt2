(set-logic QF_LIA)
(set-option :max_conflicts 1000)
(set-option :randomize true)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert (> x 0))
(assert (> y 0))
(assert (= z (+ x y)))
(assert (= z 30))
(assert (not (= z (* x y))))

(check-sat)
