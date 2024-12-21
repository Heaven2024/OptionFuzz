
(set-option :smt.array.extensional false)
(set-option :smt.array.weak true)

(declare-fun arr () (Array Int Int))

(assert (select arr  1))
(assert (= (store arr 1 2) arr))

(check-sat)