(set-logic QF_NIA)
(set-option :nlsat.check-lemmas true)
(set-option :factor true)
(set-option :max_memory 1000)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (<= a 10))
(assert (> b 0))
(assert (= c (+ a b)))
(assert (> c 15))

(check-sat)
(get-model)
