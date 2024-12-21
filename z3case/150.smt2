(set-logic QF_LRA)
(set-option :nnf.ignore_labels true)
(set-option :nnf.mode full)

(declare-fun x () Real)
(declare-fun y () Real)
(declare-fun z () Real)

(assert (>= x 0))
(assert (<= y 10))
(assert (= z (* x y)))

(check-sat)
(get-model)
