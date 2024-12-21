(set-logic QF_UF)
(set-option :nnf.mode skolem)
(set-option :nnf.sk_hack false)

(declare-fun f (Bool Bool) Bool)
(declare-fun g (Int Int) Int)

(assert (forall ((x Bool)) (=> (f x x) (g (ite x 1 0) 2))))
(assert (exists ((y Bool)) (not (f y y))))
(assert (forall ((z Int)) (> (g z 0) 0)))
(check-sat)
