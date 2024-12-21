(set-logic QF_BV)

(set-option :smt.bv.size_reduce true)

(declare-fun x () (_ BitVec 8))
(declare-fun y () (_ BitVec 8))

(assert (= (bvadd x y) #x10))
(assert (bvslt x y))

(check-sat)
(get-model)