(set-logic QF_NIA)
(set-option :nlsat.check-lemmas true)
(set-option :factor true)
(set-option :simplify-conflicts true)
(set-option :max_conflicts 200)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (> a 0))
(assert (> b 0))
(assert (= c (+ a b)))
(assert (= c 10))

(check-sat)
(get-model)
