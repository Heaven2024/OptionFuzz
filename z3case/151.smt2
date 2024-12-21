(set-logic QF_NIA)
(set-option :factor true)
(set-option :randomize true)
(set-option :max_conflicts 500)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (and (> a 1) (= b (+ a 2)) (> c b)))
(assert (or (= a 3) (= b 5)))

(check-sat)
(get-model)
