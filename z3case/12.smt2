
(set-option :smt.arith.eager_eq_axioms true)
(set-option :smt.arith.nl true)
(set-option :smt.string_solver "seq")
(set-option :smt.auto_config false)

(declare-fun x () Int)
(declare-fun y () Int)
(declare-fun str1 () String)
(declare-fun str2 () String)

(assert (> x 10))
(assert (< y 5))

(assert (= (str.++ str1 str2) "hello_world"))

(check-sat)
(get-model)