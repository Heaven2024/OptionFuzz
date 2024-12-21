(set-logic QF_LIA)
(set-option :max_conflicts 500)
(set-option :randomize true)
(set-option :simplify-conflicts true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (> a 0))
(assert (> b 0))
(assert (= c (+ a b)))
(assert (= c 20))
(assert (< a b))

(check-sat)
(get-model)
