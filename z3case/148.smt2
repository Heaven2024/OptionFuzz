(set-logic QF_LIA)
(set-option :check-lemmas true)
(set-option :log-lemmas true)
(set-option :max_memory 4096)

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(assert (> a 10))
(assert (< b 5))
(assert (= c (+ a b)))

(check-sat)
(get-model)
