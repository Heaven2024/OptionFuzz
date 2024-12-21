(set-logic QF_NIA)
(set-option :nlsat.check-lemmas true)
(set-option :inline-vars true)
(set-option :seed 12345)

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

(assert (=> (> x 0) (< y x)))
(assert (and (= z (+ x y)) (< z 10)))

(check-sat)
(get-model)
