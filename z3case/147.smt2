(set-logic QF_NIA)
(set-option :nlsat.check-lemmas true)
(set-option :factor true)
(set-option :max_conflicts 2000)
(set-option :simplify-conflicts true)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)

(assert (and (> a 0) (< b 0) (= c (+ a b)) (> d c)))
(assert (or (= a 5) (= b -3)))
(assert (not (= c 0)))

(check-sat)
(get-model)
