(set-logic QF_UF)
(set-option :nnf.mode skolem)
(set-option :nnf.sk_hack true)

(declare-fun f (Bool) Bool)
(declare-fun g (Int) Int)

(assert (forall ((x Bool)) (f x)))
(assert (exists ((y Int)) (g y)))
(assert (= (g 2) 5))

(check-sat)
(get-model)
