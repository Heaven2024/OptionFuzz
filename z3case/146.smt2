(set-logic QF_UF)
(set-option :nnf.mode skolem)
(set-option :nnf.sk_hack false)

(declare-fun f (Bool Bool) Bool)
(declare-fun g (Int Int) Int)

(assert (forall ((x Bool)) (=> (f x x) (g 1 2))))
(assert (exists ((x Int)) (and (= (g x x) 10) (> x 5))))
(assert (forall ((x Int)) (=> (> x 0) (exists ((y Int)) (g x y)))))
(assert (= (f true false) true))

(check-sat)
(get-model)
