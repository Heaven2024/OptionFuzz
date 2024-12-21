(set-logic QF_NIA)
(set-option :nlsat.check-lemmas true)
(set-option :factor true)
(set-option :simplify-conflicts true)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert (> x 0))
(assert (> y 0))
(assert (= z (+ x y)))
(assert (= z 15))
(assert (not (= z (* x y))))

(check-sat)
(get-model)
